using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Globalization;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Threading.Tasks;
using System.Web.Mvc;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Constants;
using AVStaffing.Models.Entities;
using AVStaffing.Models.ViewModels;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.BuilderProperties;
using static Humanizer.In;

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
            var users = ApplicationUserManager.GetUsers().Select(u => new SelectListItem
            {
                Value = u.Id.ToString(),
                Text = u.FirstName + u.LastName
            }).ToList();
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
                    userVm.Users = users;
                    return View(userVm);
                }

            }
            return View(new OwnerViewModel
            {
                DateOfBirth = DateTime.Today,
                Users = users,
            });
        }

        [HttpPost]
        [Permission("Clients => Add/Edit Client")]
        public async Task<ActionResult> AddClient(OwnerViewModel userVm)
        {
            int userId = 0;
            if (!ClientValidations(userVm))
            {
                var users = ApplicationUserManager.GetUsers().Select(u => new SelectListItem
                {
                    Value = u.Id.ToString(),
                    Text = u.FirstName + u.LastName
                }).ToList();
                userVm.Users = users;
                if (userVm.Id == 0)
                {
                    userVm.Corporations = null;
                }
                else
                {
                    userVm.Corporations = userVm.Corporations.Where(n => n.Id > 0).ToList();
                }
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
                            owner.SINPermanent = userVm.SINPermanent;
                            owner.SINTemporary = userVm.SINTemporary;
                            owner.DateOfBirth = userVm.DateOfBirth;
                            owner.Address = userVm.Address;
                            owner.City = userVm.City;
                            owner.Province = userVm.Province;
                            owner.PostalCode = userVm.PostalCode;
                            owner.Phone = userVm.Phone;
                            owner.Email = userVm.Email;
                            owner.SecondaryEmail = userVm.SecondaryEmail;
                            owner.IsPersonalAuthorization = userVm.IsPersonalAuthorization;
                            owner.IsSoleProprietorAuthorization = userVm.IsSoleProprietorAuthorization;
                            owner.HSTNumber = userVm.HSTNumber;
                            owner.HSTAccessCode = userVm.HSTAccessCode;
                            owner.HSTReportingPeriod = userVm.IsSoleHST? userVm.HSTReportingPeriod:null;
                            owner.IsPayroll = userVm.IsPayroll;
                            owner.PD7AReportingPeriod =owner.IsPayroll? userVm.PD7AReportingPeriod:null;
                            owner.PayrollAccessCode = userVm.PayrollAccessCode;
                            owner.AssignedTo = int.Parse(userVm.AssignedTo ?? "0");
                            owner.IsSoleHST = userVm.IsSoleHST;

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
                    var users = ApplicationUserManager.GetUsers().Select(u => new SelectListItem
                    {
                        Value = u.Id.ToString(),
                        Text = u.FirstName + u.LastName
                    }).ToList();
                    userVm.Users = users;
                    Notify("Error", "Exception", "Found an exception while saving owner", isRedirectMessage: true);
                    if (userVm.Id > 0)
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
                    var corp = MapToCorporationViewModel(corporation);
                    return View(corp);
                }

            }
            return View(new CorporationViewModel
            {
                PD7AReportingPeriod = "",
                CorpFiscalYear = ""
            });
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
                        corp.IsCorporationAuthorization = corpVm.IsCorporationAuthorization;
                        corp.CorpName = corpVm.CorpName;
                        corp.FederalKey = corpVm.FederalKey;
                        corp.ProvincialKey = corpVm.ProvincialKey;
                        corp.Address = corpVm.Address;
                        corp.BusinessEmail = corpVm.BusinessEmail;
                        corp.BusinessNumber = corpVm.BusinessNumber;
                        corp.BusinessPhone = corpVm.BusinessPhone;
                        corp.CorpFiscalYear = DateTime.ParseExact(corpVm.CorpFiscalYear ?? "January-01", "MMMM-dd", new CultureInfo("en-US"));
                        corp.IsHSTRegistration = corpVm.IsHSTRegistration;
                        corp.HSTFiscalYearEnd = DateTime.ParseExact(corpVm.HSTFiscalYearEnd ?? "January-01", "MMMM-dd", new CultureInfo("en-US"));
                        corp.HSTReportingPeriod= corpVm.IsHSTRegistration? corpVm.HSTReportingPeriod:null;
                        corp.HSTAccessCode = corpVm.HSTAccessCode;
                        corp.IsPayroll = corpVm.IsPayroll;
                        corp.PD7AReportingPeriod = corpVm.IsPayroll? corpVm.PD7AReportingPeriod:null;
                        corp.PayrollAccessCode = corpVm.IsPayroll? corpVm.PayrollAccessCode:null;
                        corp.City = corpVm.City;
                        corp.Province = corpVm.Province;
                        corp.PostalCode = corpVm.PostalCode;
                        await DbContext.SaveChangesAsync();
                        Notify("Success", "Successfully Updated", "Corporation Updated Successfully", isRedirectMessage: true);

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
            if (ownerVm.IsSoleHST)
            {

                if (ownerVm.HSTNumber == "" || ownerVm.HSTNumber == null)
                {
                    ModelState.AddModelError("HSTNumber", errorMessage: "Enter Sole-Proprietor HST Number");
                    isValid = false;
                }
                else if (ownerVm.HSTNumber.Length != 15)
                {
                    ModelState.AddModelError("HSTNumber", errorMessage: "Sole-Proprietor HST Number must be exactly 15 characters long");
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
            var corps = await DbContext.Corporation.AsNoTracking().Where(n => n.CorpName.Contains(query) || n.ProvincialKey.StartsWith(query) || n.FederalKey.StartsWith(query)).Take(10).ToListAsync();
            return Json(corps, JsonRequestBehavior.AllowGet);
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
                SINPermanent = owner.SINPermanent,
                SINTemporary = owner.SINTemporary,
                DateOfBirth = owner.DateOfBirth,
                Address = owner.Address,
                City = owner.City,
                Province = owner.Province,
                PostalCode = owner.PostalCode,
                Phone = owner.Phone,
                Email = owner.Email,
                SecondaryEmail = owner.SecondaryEmail,
                IsPersonalAuthorization = owner.IsPersonalAuthorization,
                IsSoleHST = owner.IsSoleHST,
                HSTNumber = owner.HSTNumber,
                HSTAccessCode = owner.HSTAccessCode,
                HSTReportingPeriod = owner.HSTReportingPeriod,
                IsPayroll = owner.IsPayroll,
                PD7AReportingPeriod = owner.PD7AReportingPeriod,
                PayrollAccessCode = owner.PayrollAccessCode,
                AssignedTo = owner.AssignedTo.ToString(),
                IsSoleProprietorAuthorization = owner.IsSoleProprietorAuthorization,

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
                SINPermanent = viewModel.SINPermanent,
                SINTemporary = viewModel.SINTemporary,
                DateOfBirth = viewModel.DateOfBirth,
                Address = viewModel.Address,
                City = viewModel.City,
                Province = viewModel.Province,
                PostalCode = viewModel.PostalCode,
                Phone = viewModel.Phone,
                Email = viewModel.Email,
                SecondaryEmail = viewModel.SecondaryEmail,
                IsPersonalAuthorization = viewModel.IsPersonalAuthorization,
                IsSoleHST = viewModel.IsSoleHST,
                HSTNumber = viewModel.HSTNumber,
                HSTAccessCode = viewModel.HSTAccessCode,
                HSTReportingPeriod = viewModel.IsSoleHST? viewModel.HSTReportingPeriod:null,
                IsPayroll = viewModel.IsPayroll,
                PD7AReportingPeriod = viewModel.IsPayroll? viewModel.PD7AReportingPeriod:null,
                PayrollAccessCode = viewModel.PayrollAccessCode,
                AssignedTo = int.Parse(viewModel.AssignedTo ?? "0"),
                IsSoleProprietorAuthorization = viewModel.IsSoleProprietorAuthorization,

            };

            return owner;
        }

        private static Corporation MapToCorporation(CorporationViewModel viewModel)
        {

            var corporation = new Corporation
            {
                Id = viewModel.Id,
                IsCorporationAuthorization = viewModel.IsCorporationAuthorization,
                CorpName = viewModel.CorpName,
                FederalKey = viewModel.FederalKey,
                ProvincialKey = viewModel.ProvincialKey,
                Address = viewModel.Address,
                BusinessEmail = viewModel.BusinessEmail,
                BusinessNumber = viewModel.BusinessNumber,
                BusinessPhone = viewModel.BusinessPhone,
                CorpFiscalYear = DateTime.ParseExact(viewModel.CorpFiscalYear ?? "January-01", "MMMM-dd", new CultureInfo("en-US")),
                IsHSTRegistration = viewModel.IsHSTRegistration,
                HSTReportingPeriod =viewModel.IsHSTRegistration? viewModel.HSTReportingPeriod:null,
                HSTFiscalYearEnd = DateTime.ParseExact(viewModel.HSTFiscalYearEnd ?? "January-01", "MMMM-dd", new CultureInfo("en-US")),
                HSTAccessCode = viewModel.HSTAccessCode,
                IsPayroll = viewModel.IsPayroll,
                PD7AReportingPeriod = viewModel.IsPayroll? viewModel.PD7AReportingPeriod:null,
                PayrollAccessCode = viewModel.IsPayroll ? viewModel.PayrollAccessCode:null,
                City = viewModel.City,
                Province = viewModel.Province,
                PostalCode = viewModel.PostalCode,
            };

            return corporation;
        }

        private static CorporationViewModel MapToCorporationViewModel(Corporation corporation)
        {
            if (corporation == null) return null;

            var viewModel = new CorporationViewModel
            {
                Id = corporation.Id,
                IsCorporationAuthorization = corporation.IsCorporationAuthorization,
                CorpName = corporation.CorpName,
                FederalKey = corporation.FederalKey,
                ProvincialKey = corporation.ProvincialKey,
                Address = corporation.Address,
                BusinessEmail = corporation.BusinessEmail,
                BusinessNumber = corporation.BusinessNumber,
                BusinessPhone = corporation.BusinessPhone,
                CorpFiscalYear = corporation.CorpFiscalYear?.ToString("MMMM-dd", new CultureInfo("en-US")),
                IsHSTRegistration = corporation.IsHSTRegistration,
                HSTReportingPeriod = corporation.HSTReportingPeriod,
                HSTFiscalYearEnd = corporation.HSTFiscalYearEnd?.ToString("MMMM-dd", new CultureInfo("en-US")),
                HSTAccessCode = corporation.HSTAccessCode,
                IsPayroll = corporation.IsPayroll,
                PD7AReportingPeriod = corporation.PD7AReportingPeriod,
                PayrollAccessCode = corporation.PayrollAccessCode,
                City = corporation.City,
                Province = corporation.Province,
                PostalCode = corporation.PostalCode,
            };

            return viewModel;
        }

        #endregion
    }
}