using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Constants;
using AVStaffing.Models.Entities;
using AVStaffing.Models.ViewModels;
using Microsoft.AspNet.Identity;

namespace AVStaffing.Controllers
{
    public class ClientController : BaseController
    {
        #region CLIENTS
        [HttpGet]
        [Permission("Clients => Client List")]
        public async Task<ActionResult> Clients()
        {
            var owners = await DbContext.Owner.AsNoTracking().ToListAsync();
            return View(owners);
        }
        [HttpGet]
        [Permission("Corporations => Corporation List")]
        public async Task<ActionResult> Corporations()
        {
            var corps = await DbContext.Corporation.AsNoTracking().ToListAsync();
            return View(corps);
        }

        [HttpGet]
        [Permission("Clients => Add/Edit Client")]
        public async Task<ActionResult> AddClient(int id = 0)
        {
            if (id != 0)
            {
                var owner = await DbContext.Owner.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id);
                if (owner != null)
                {

                    var corpOwners = await DbContext.CorporationOwner.AsNoTracking().Where(n => n.OwnerId == owner.Id).ToListAsync();
                    var corporations = new List<Corporation>();
                    if (corpOwners.Any())
                    {
                        foreach (var item in corpOwners)
                        {
                            var corp = await DbContext.Corporation.AsNoTracking().FirstOrDefaultAsync(x => x.Id == item.CorporationId);
                            if (corp != null)
                            {
                                corporations.Add(corp);
                            }
                        }
                    }

                    OwnerViewModel userVm = MapOwnerToOwnerViewModel(owner);
                    corporations.ForEach(n =>
                    {
                        userVm.Corporations.Add(MapToCorporationViewModel(n));
                    });
                    return View(userVm);
                }

            }
            return View(new OwnerViewModel
            {
                DateOfBirth= DateTime.Today
            });
        }

        [HttpPost]
        [Permission("Clients => Add/Edit Client")]
        public async Task<ActionResult> AddClient(OwnerViewModel userVm)
        {
            int userId = 0;
            if (!ClientValidations(userVm))
            {
                Notify("Error", "Validation Error", "Please see the validations", isRedirectMessage: true);
                return View(userVm);
            }
            using (var dbContextTransaction = DbContext.Database.BeginTransaction())
            {
                try
                {
                    if (userVm.Id == 0)
                    {
                        var owner = MapOwnerViewModelToOwner(userVm);
                        DbContext.Owner.Add(owner);
                        await DbContext.SaveChangesAsync();

                        if (userVm.Corporations != null && userVm.Corporations.Count > 0)
                        {
                            foreach (var corpVm in userVm.Corporations)
                            {
                                if (corpVm.Id > 0)
                                {
                                    var corpOwner = new CorporationOwner { CorporationId = corpVm.Id, OwnerId = owner.Id };
                                    DbContext.CorporationOwner.Add(corpOwner);
                                }
                                else
                                {
                                    var corporation = MapToCorporation(corpVm);
                                    DbContext.Corporation.Add(corporation);
                                }
                            }
                            await DbContext.SaveChangesAsync();

                            foreach (var corporation in DbContext.Corporation.Local)
                            {
                                var corpOwner = new CorporationOwner { CorporationId = corporation.Id, OwnerId = owner.Id };
                                DbContext.CorporationOwner.Add(corpOwner);
                            }
                            await DbContext.SaveChangesAsync();
                        }

                        dbContextTransaction.Commit();
                        Notify("Success", "Successfully Added", "Client Added Successfully", isRedirectMessage: true);
                    }


                    else
                    {
                        var owner = await DbContext.Owner.FirstOrDefaultAsync(x => x.Id == userVm.Id);
                        if (owner != null)
                        {
                            owner.FirstName = userVm.FirstName;
                            owner.MiddleName = userVm.MiddleName;
                            owner.LastName = userVm.LastName;
                            owner.SIN = userVm.SIN;
                            owner.DateOfBirth = userVm.DateOfBirth;
                            owner.Address = userVm.Address;
                            owner.Phone = userVm.Phone;
                            owner.Email = userVm.Email;
                            owner.IsPersonalHST = userVm.IsPersonalHST;
                            owner.HSTNumber = userVm.HSTNumber;
                            owner.AuthorizationType = userVm.AuthorizationType;
                            if (userVm.Corporations != null && userVm.Corporations.Count > 0)
                            {
                                foreach (var corpVm in userVm.Corporations)
                                {
                                    if (corpVm.Id > 0)
                                    {
                                        var corpOwner = new CorporationOwner { CorporationId = corpVm.Id, OwnerId = owner.Id };
                                        DbContext.CorporationOwner.Add(corpOwner);
                                    }
                                    else
                                    {
                                        var corporation = MapToCorporation(corpVm);
                                        DbContext.Corporation.Add(corporation);
                                    }
                                }
                                await DbContext.SaveChangesAsync();

                                foreach (var corporation in DbContext.Corporation.Local)
                                {
                                    var corpOwner = new CorporationOwner { CorporationId = corporation.Id, OwnerId = owner.Id };
                                    DbContext.CorporationOwner.Add(corpOwner);
                                }

                            }
                            await DbContext.SaveChangesAsync();
                            dbContextTransaction.Commit();
                            Notify("Success", "Successfully Updated", "Client Updated Successfully", isRedirectMessage: true);

                        }

                    }
                    return RedirectToAction("Clients", "Client");
                }
                catch
                {
                    dbContextTransaction.Rollback();
                    Notify("Error", "Exception", "Found an exception while saving owner", isRedirectMessage: true);
                    if(userVm.Id>0)
                        userVm.Corporations = null;
                    return View(userVm);
                }
            }
        }


        [HttpGet]
        [Permission("Clients => Add/Edit Corporation")]
        public async Task<ActionResult> AddCorporation(int id = 0)
        {
            
            if (id != 0)
            {
                var corporation = await DbContext.Corporation.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id);
                if (corporation != null)
                {
                    var corp=MapToCorporationViewModel(corporation);
                    return View(corp);
                }

            }
            return View(new CorporationViewModel
            {
                HSTFiscalYear = "",
                CorpFiscalYear=""
            }) ;
        }

        [HttpPost]
        [Permission("Clients => Add/Edit Corporation")]
        public async Task<ActionResult> AddCorporation(CorporationViewModel corpVm)
        {
            if (!CorporationValidations(corpVm))
            {
                Notify("Error", "Validation Error", "Please see the validations", isRedirectMessage: true);
                return View(corpVm);
            }
                try
                {
                    if (corpVm.Id == 0)
                    {
                        var corporation = MapToCorporation(corpVm);
                        DbContext.Corporation.Add(corporation);
                        await DbContext.SaveChangesAsync();
                        Notify("Success", "Successfully Added", "Corporation Added Successfully", isRedirectMessage: true);
                    }


                    else
                    {
                        var corp = await DbContext.Corporation.FirstOrDefaultAsync(x => x.Id == corpVm.Id);
                        if (corp != null)
                        {
                            corp.CorpName = corpVm.CorpName;
                            corp.CorpKey = corpVm.CorpKey;
                            corp.CorpFiscalYear = DateTime.ParseExact(corpVm.CorpFiscalYear,"MMM-dd",CultureInfo.CurrentCulture);
                            corp.BusinessEmail = corpVm.BusinessEmail;
                            corp.BusinessNumber = corpVm.BusinessNumber;
                            corp.Address = corpVm.Address;
                            corp.IsHSTRegistration = corpVm.IsHSTRegistration;
                            corp.HSTReportingPeriod = corpVm.HSTReportingPeriod;
                            corp.HSTFiscalYear = DateTime.ParseExact(corpVm.HSTFiscalYear, "MMM-dd", CultureInfo.CurrentCulture);
                            corp.IsPayroll = corpVm.IsPayroll;
                            corp.PD7AReportingPeriod = corpVm.PD7AReportingPeriod;
                            corp.AuthorizationType = corpVm.AuthorizationType;
                            await DbContext.SaveChangesAsync();
                            Notify("Success", "Successfully Updated", "Client Updated Successfully", isRedirectMessage: true);

                        }

                    }
                    return RedirectToAction("Corporations", "Client");
                }
                catch
                {
                    Notify("Error", "Exception", "Found an exception while saving owner", isRedirectMessage: true);
                    return View(corpVm);
                }
            
        }


        private bool ClientValidations(OwnerViewModel ownerVm)
        {
            var context = new ValidationContext(ownerVm);
            List<ValidationResult> validationResults = new List<ValidationResult>();
            bool isValid = Validator.TryValidateObject(ownerVm, context, validationResults, true);

            if (!isValid)
            {
                foreach (var key in ModelState.Keys)
                {
                    if (ModelState[key].Errors != null)
                    {
                        foreach (var err in ModelState[key].Errors)
                        {
                            ModelState.AddModelError(key, errorMessage: err.ErrorMessage);
                            break;
                        }
                    }
                }

            }
            if (ownerVm.IsPersonalHST)
            {
                if(ownerVm.HSTNumber=="" || ownerVm.HSTNumber ==null)
                {
                    ModelState.AddModelError("HSTNumber", errorMessage: "Enter HST Number");
                    isValid = false;
                }
                else if(ownerVm.HSTNumber.Length!=9)
                {
                    ModelState.AddModelError("HSTNumber", errorMessage: "HST Number must be exactly 9 characters long");
                    isValid = false;
                }
            }
            return isValid;
        }

        private bool CorporationValidations(CorporationViewModel corpVm)
        {
            var context = new ValidationContext(corpVm);
            List<ValidationResult> validationResults = new List<ValidationResult>();
            bool isValid = Validator.TryValidateObject(corpVm, context, validationResults, true);

            if (!isValid)
            {
                foreach (var key in ModelState.Keys)
                {
                    if (ModelState[key].Errors != null)
                    {
                        foreach (var err in ModelState[key].Errors)
                        {
                            ModelState.AddModelError(key, errorMessage: err.ErrorMessage);
                            break;
                        }
                    }
                }

            }
            if (corpVm.IsHSTRegistration)
            {
                if (corpVm.HSTFiscalYear.Equals(DateTime.MinValue))
                {
                    ModelState.AddModelError("HSTFiscalYear", errorMessage: "Enter HST Fiscal Year");
                    isValid = false;
                }
                if (corpVm.HSTReportingPeriod=="")
                {
                    ModelState.AddModelError("HSTReportingPeriod", errorMessage: "Select HST Reporting Period");
                    isValid = false;
                }
            }
            return isValid;
        }

        public async Task<bool> DeleteClient(int clientId)
        {
            var client = await DbContext.Owner.FirstOrDefaultAsync(n => n.Id == clientId);
            if (client != null)
            {
                var records = await DbContext.CorporationOwner.Where(n => n.OwnerId == clientId).ToListAsync();
                DbContext.CorporationOwner.RemoveRange(records);
                DbContext.Owner.Remove(client);
                await DbContext.SaveChangesAsync();
                return true;
            }
            return false;
        }
        public async Task<bool> DeleteCorporation(int corpId)
        {
            var corporation = await DbContext.Corporation.FirstOrDefaultAsync(n => n.Id == corpId);
            if (corporation != null)
            {
                var records = await DbContext.CorporationOwner.Where(n => n.CorporationId == corpId).ToListAsync();
                DbContext.CorporationOwner.RemoveRange(records);
                DbContext.Corporation.Remove(corporation);
                await DbContext.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public async Task<bool> RemoveCorporation(int corpId)
        {
            var corporation = await DbContext.Corporation.FirstOrDefaultAsync(n => n.Id == corpId);
            if (corporation != null)
            {
                var records = await DbContext.CorporationOwner.Where(n => n.CorporationId == corpId).ToListAsync();
                DbContext.CorporationOwner.RemoveRange(records);
                await DbContext.SaveChangesAsync();
                return true;
            }
            return false;
        }
        public async Task<ActionResult> SearchCorporations(string query)
        {
            var corps = await DbContext.Corporation.AsNoTracking().Where(n => n.CorpName.Contains(query) || n.CorpKey.StartsWith(query)).Take(10).ToListAsync();
            return Json(corps,JsonRequestBehavior.AllowGet);
        }

        protected override void Dispose(bool disposing)
        {
            DbContext.Dispose();
            base.Dispose(disposing);
        }

        private OwnerViewModel MapOwnerToOwnerViewModel(Owner owner)
        {

            var viewModel = new OwnerViewModel
            {
                Id = owner.Id,
                FirstName = owner.FirstName,
                MiddleName = owner.MiddleName,
                LastName = owner.LastName,
                SIN = owner.SIN,
                DateOfBirth = owner.DateOfBirth,
                Address = owner.Address,
                Phone = owner.Phone,
                Email = owner.Email,
                IsPersonalHST = owner.IsPersonalHST,
                HSTNumber = owner.HSTNumber,
                AuthorizationType = owner.AuthorizationType,

            };

            return viewModel;
        }

        private Owner MapOwnerViewModelToOwner(OwnerViewModel viewModel)
        {
            var owner = new Owner
            {
                Id = viewModel.Id,
                FirstName = viewModel.FirstName,
                MiddleName = viewModel.MiddleName,
                LastName = viewModel.LastName,
                SIN = viewModel.SIN,
                DateOfBirth = viewModel.DateOfBirth,
                Address = viewModel.Address,
                Phone = viewModel.Phone,
                Email = viewModel.Email,
                IsPersonalHST = viewModel.IsPersonalHST,
                HSTNumber = viewModel.HSTNumber,
                AuthorizationType = viewModel.AuthorizationType,
            };

            return owner;
        }

        private static Corporation MapToCorporation(CorporationViewModel viewModel)
        {

            var corporation = new Corporation
            {
                Id = viewModel.Id,
                IsCorporation = viewModel.IsCorporation,
                CorpName = viewModel.CorpName,
                CorpKey = viewModel.CorpKey,
                Address = viewModel.Address,
                BusinessEmail = viewModel.BusinessEmail,
                BusinessNumber = viewModel.BusinessNumber,
                IsHSTRegistration = viewModel.IsHSTRegistration,
                HSTFiscalYear = DateTime.ParseExact(viewModel.HSTFiscalYear, "MMM-dd", CultureInfo.CurrentCulture),
                HSTReportingPeriod = viewModel.HSTReportingPeriod,
                IsPayroll = viewModel.IsPayroll,
                PD7AReportingPeriod = viewModel.PD7AReportingPeriod,
                CorpFiscalYear = DateTime.ParseExact(viewModel.CorpFiscalYear, "MMM-dd", CultureInfo.CurrentCulture),
                AuthorizationType=viewModel.AuthorizationType,
            };

            return corporation;
        }

        private static CorporationViewModel MapToCorporationViewModel(Corporation corporation)
        {
            if (corporation == null) return null;

            var viewModel = new CorporationViewModel
            {
                Id = corporation.Id,
                IsCorporation = corporation.IsCorporation,
                CorpName = corporation.CorpName,
                CorpKey = corporation.CorpKey,
                Address = corporation.Address,
                BusinessEmail = corporation.BusinessEmail,
                BusinessNumber = corporation.BusinessNumber,
                IsHSTRegistration = corporation.IsHSTRegistration,
                HSTFiscalYear = corporation.HSTFiscalYear.ToString("MMM-dd"),
                HSTReportingPeriod = corporation.HSTReportingPeriod,
                IsPayroll = corporation.IsPayroll,
                PD7AReportingPeriod = corporation.PD7AReportingPeriod,
                CorpFiscalYear = corporation.CorpFiscalYear.ToString("MMM-dd"),
                AuthorizationType=corporation.AuthorizationType,
            };

            return viewModel;
        }

        #endregion
    }
}