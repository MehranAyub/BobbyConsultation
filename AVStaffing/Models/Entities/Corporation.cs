using PuppeteerSharp.Input;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace AVStaffing.Models.Entities
{
    [Table("Corporation")]
    public class Corporation
    {
        [Key]
        public int Id { get; set; }
        public bool IsCorporation { get; set; }
        public string CorpName { get; set; }
        public string CorpKey { get; set; }
        public string Address { get; set; }
        public string BusinessEmail { get; set; }
        public string BusinessNumber { get; set; }
        public bool IsHSTRegistration { get; set; }
        public DateTime HSTFiscalYear { get; set; }
        public string HSTReportingPeriod { get; set; }
        public bool IsPayroll { get; set; }
        public string PD7AReportingPeriod { get; set; }
        public DateTime CorpFiscalYear { get; set; }
        public DateTime? AnniversaryDate { get; set; }

        public List<CorporationOwner> CorporationOwners { get; set; }
    }
    [Table("Owner")]
    public class Owner
    {
        [Key]
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string SIN { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public bool IsPersonalHST { get; set; }
        public string HSTNumber { get; set; }
        public bool IsPayroll { get; set; }
        public string PD7AReportingPeriod { get; set; }
        public string AuthorizationType { get; set; }
        public List<CorporationOwner> CorporationOwners { get; set; }
    }

    [Table("CorporationOwner")]
    public class CorporationOwner
    {
        [Key]
        public int Id { get; set; }
        public int CorporationId { get; set; }
        public int OwnerId { get; set; }
    }
}