﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Data.Entity.Migrations;
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
                                var corporation = MapToCorporation(corpVm);
                                DbContext.Corporation.Add(corporation);
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

                            if (userVm.Corporations != null && userVm.Corporations.Count > 0)
                            {
                                foreach (var corpVm in userVm.Corporations)
                                {
                                    var corporation = MapToCorporation(corpVm);
                                    DbContext.Corporation.Add(corporation);
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
                    return View(userVm);
                }
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
                HSTNumber = owner.HSTNumber
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
                HSTNumber = viewModel.HSTNumber
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
                HSTFiscalYear = viewModel.HSTFiscalYear,
                HSTReportingPeriod = viewModel.HSTReportingPeriod,
                IsPayroll = viewModel.IsPayroll,
                PD7AReportingPeriod = viewModel.PD7AReportingPeriod,
                CorpFiscalYear = viewModel.CorpFiscalYear
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
                HSTFiscalYear = corporation.HSTFiscalYear,
                HSTReportingPeriod = corporation.HSTReportingPeriod,
                IsPayroll = corporation.IsPayroll,
                PD7AReportingPeriod = corporation.PD7AReportingPeriod,
                CorpFiscalYear = corporation.CorpFiscalYear
            };

            return viewModel;
        }

        #endregion
    }
}