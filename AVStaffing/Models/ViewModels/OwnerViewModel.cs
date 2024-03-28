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
        [Required]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Display(Name = "Middle Name")]
        public string MiddleName { get; set; }

        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [Required]
        [EmailAddress]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Display(Name = "Address")]
        public string Address { get; set; }

        [Required]
        [StringLength(9, ErrorMessage = "The {0} must be exactly {1} characters long.", MinimumLength = 9)]
        [Display(Name = "SIN")]
        public string SIN { get; set; }

        [Required]
        [StringLength(10, ErrorMessage = "The {0} must be exactly {1} characters long.", MinimumLength = 10)]
        [Display(Name = "Phone")]
        public string Phone { get; set; }

        [Required]
        [Display(Name = "Birthday")]
        public DateTime DateOfBirth { get; set; }
        [Display(Name = "Personal HST")]
        public bool IsPersonalHST { get; set; }
        [Display(Name = "Authorization")]
        public string AuthorizationType { get; set; }

        [Display(Name = "HST Number")]
        public string HSTNumber { get; set; }
        public List<CorporationViewModel> Corporations { get; set; } = new List<CorporationViewModel>();
        public IEnumerable<SelectListItem> AuthorizationOptions { get; set; }
        public OwnerViewModel()
        {
            AuthorizationOptions = new List<SelectListItem>
            {
            new SelectListItem { Value = "Personal", Text = "Personal" },
            new SelectListItem { Value = "Business", Text = "Business" },
            new SelectListItem { Value = "Both", Text = "Both" }
            };
        }
    }
    public class CorporationViewModel
    {
        public int Id { get; set; }
        public bool IsCorporation { get; set; }
        [Required]
        [Display(Name = "Corporation Name")]
        public string CorpName { get; set; }
        [Required]
        [Display(Name = "Corporation Key")]
        public string CorpKey { get; set; }
        [Required]
        public string Address { get; set; }
        [Display(Name = "Business Email")]
        public string BusinessEmail { get; set; }
        [Required]
        [StringLength(8, ErrorMessage = "The {0} must be exactly {1} characters long.", MinimumLength = 8)]
        [Display(Name = "Business Number")]
        public string BusinessNumber { get; set; }
        [Display(Name = "HST Registration")]
        public bool IsHSTRegistration { get; set; }

        [Display(Name = "HST Reporting Period")]
        public string HSTReportingPeriod { get; set; }
        [Display(Name = "HST Fiscal Year")]
        public string HSTFiscalYear { get; set; }
        [Display(Name = "Payroll")]
        public bool IsPayroll { get; set; }
        [Display(Name = "PD7A Reporting Period")]
        public string PD7AReportingPeriod { get; set; }
        [Display(Name = "Authorization")]
        public string AuthorizationType { get; set; }
        [Display(Name = "Corporation Fiscal Year")]
        public string CorpFiscalYear { get; set; }

        public IEnumerable<SelectListItem> HSTReportingPeriodOptions { get; set; }
        public IEnumerable<SelectListItem> AuthorizationOptions { get; set; }

        public CorporationViewModel()
        {
            HSTReportingPeriodOptions = new List<SelectListItem>
            {
                new SelectListItem { Value = "Monthly", Text = "Monthly" },
                new SelectListItem { Value = "Quarterly", Text = "Quarterly" },
                new SelectListItem { Value = "Annually", Text = "Annually" }
            };
            AuthorizationOptions = new List<SelectListItem>
            {
                new SelectListItem { Value = "Personal", Text = "Personal" },
                new SelectListItem { Value = "Business", Text = "Business" },
                new SelectListItem { Value = "Both", Text = "Both" }
            };
        }

    }



}