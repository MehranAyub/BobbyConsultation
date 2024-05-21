using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web;
using System.Web.Mvc;
using AVStaffing.Infrastructure;
using AVStaffing.Models.Entities;

namespace AVStaffing.Models.ViewModels
{
    public class OwnerViewModel
    {
        public int Id { get; set; }
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Display(Name = "Middle Name")]
        public string MiddleName { get; set; }

        [Required]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [EmailAddress]
        [Display(Name = "Secondary Email")]
        public string SecondaryEmail { get; set; } = string.Empty;

        [Required]
        [Display(Name = "Address")]
        [MaxLength]
        public string Address { get; set; }

        [Required]
        [Display(Name = "City/Town")]
        public string City { get; set; }

        [Required]
        [Display(Name = "Province")]
        public string Province { get; set; }

        [Required]
        [Display(Name = "Postal Code")]
        public string PostalCode { get; set; }

        [Required]
        [StringLength(9, ErrorMessage = "The {0} must be exactly {1} characters long.", MinimumLength = 9)]
        [Display(Name = "SIN Permanent")]
        public string SINPermanent { get; set; }

        [StringLength(9, ErrorMessage = "The {0} must be exactly {1} characters long.", MinimumLength = 9)]
        [Display(Name = "SIN Temporary")]
        public string SINTemporary { get; set; }

        [Required]
        [Display(Name = "Phone")]
        public string Phone { get; set; }

        [Required]
        [Display(Name = "Birthday")]
        public DateTime DateOfBirth { get; set; }

        [Display(Name = "Sole-Proprietor Authorization")]
        public bool IsSoleProprietorAuthorization { get; set; }

        [Display(Name = "Personal Authorization")]
        public bool IsPersonalAuthorization { get; set; }
        [Display(Name = "Sole-Proprietor HST")]
        public bool IsSoleHST { get; set; }

        [Display(Name = "Sole-Proprietor HST Number")]
        public string HSTNumber { get; set; }

        [Display(Name = "HST Access Code")]
        public string HSTAccessCode { get; set; }

        [Display(Name = "Reporting Period")]
        public string HSTReportingPeriod { get; set; }

        [Display(Name = "Sole-proprietor Payroll")]
        public bool IsPayroll { get; set; }
        [Display(Name = "PD7A Reporting Period")]
        public string PD7AReportingPeriod { get; set; }

        [Display(Name = "Payroll Web Access Code")]
        public string PayrollAccessCode { get; set; }

        [Display(Name = "Assigned To")]
        public string AssignedTo { get; set; }
        public IEnumerable<SelectListItem> ReportingPeriodOptions { get; set; }
        public List<CorporationViewModel> Corporations { get; set; } = new List<CorporationViewModel>();
        public IEnumerable<SelectListItem> Users { get; set; }
        public OwnerViewModel()
        {
            ReportingPeriodOptions = new List<SelectListItem>
            {
                new SelectListItem { Value = "Monthly", Text = "Monthly" },
                new SelectListItem { Value = "Quarterly", Text = "Quarterly" },
                new SelectListItem { Value = "Annually", Text = "Annually" }
            };
        }
    }
    public class CorporationViewModel
    {
        public int Id { get; set; }
        [Display(Name = "Corporation Authorization")]
        public bool IsCorporationAuthorization { get; set; }
        [Required]
        [Display(Name = "Business Legal Name")]
        public string CorpName { get; set; }
        [Display(Name = "Federal Key")]
        public string FederalKey { get; set; }
        [Display(Name = "Provincial Key")]
        public string ProvincialKey { get; set; }
        [Required]
        [Display(Name = "Business Address")]
        public string Address { get; set; }
        [Required]
        [Display(Name = "Business Email")]
        public string BusinessEmail { get; set; }
        [StringLength(9, ErrorMessage = "The {0} must be exactly {1} characters long.", MinimumLength = 9)]
        [Display(Name = "CRA Business No")]
        public string BusinessNumber { get; set; }
        [Required]
        [Display(Name = "Corporation Fiscal Year")]
        public string CorpFiscalYear { get; set; }
        [Required]
        [Display(Name = "Business Phone")]
        public string BusinessPhone { get; set; }
        [Required]
        [Display(Name = "City")]
        public string City { get; set; }
        [Required]
        [Display(Name = "Province")]
        public string Province { get; set; }
        [Required]
        [Display(Name = "Postal Code")]
        public string PostalCode { get; set; }
        [Display(Name = "HST Registration")]
        public bool IsHSTRegistration { get; set; }
        [Display(Name = "Reporting Period")]
        public string HSTReportingPeriod { get; set; }
        [Display(Name = "Fiscal Year End")]
        public string HSTFiscalYearEnd { get; set; }
        [Display(Name = "HST Access Code")]
        public string HSTAccessCode { get; set; }
        [Display(Name = "Payroll")]
        public bool IsPayroll { get; set; }
        [Display(Name = "PD7A Reporting Period")]
        public string PD7AReportingPeriod { get; set; }
        [Display(Name = "Payroll Web Access Code")]
        public string PayrollAccessCode { get; set; }
        public IEnumerable<SelectListItem> ReportingPeriodOptions { get; set; }
        public CorporationViewModel()
        {
            ReportingPeriodOptions = new List<SelectListItem>
            {
                new SelectListItem { Value = "Monthly", Text = "Monthly" },
                new SelectListItem { Value = "Quarterly", Text = "Quarterly" },
                new SelectListItem { Value = "Annually", Text = "Annually" }
            };
        }

    }



}