using AVStaffing.Infrastructure;
using AVStaffing.Models.ViewModels;
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
        public bool IsCorporationAuthorization { get; set; }
        public string CorpName { get; set; }
        public string FederalKey { get; set; }
        public string ProvincialKey { get; set; }
        public string Address { get; set; }
        public string BusinessEmail { get; set; }
        public string BusinessNumber { get; set; }
        public DateTime? CorpFiscalYear { get; set; }
        public string BusinessPhone { get; set; }
        public string City { get; set; }
        public string Province { get; set; }
        public string PostalCode { get; set; }
        public bool IsHSTRegistration { get; set; }
        public string HSTNo { get; set; }
        public string HSTAccessCode { get; set; }
        public bool IsPayroll { get; set; }
        public DateTime? PD7AReportingPeriod { get; set; }
        public string PayrollAccessCode { get; set; }
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
        public string Email { get; set; }
        public string SecondaryEmail { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Province { get; set; }
        public string PostalCode { get; set; }
        public string SINPermanent { get; set; }
        public string SINTemporary { get; set; }
        public string Phone { get; set; }
        public DateTime DateOfBirth { get; set; }
        public bool IsSoleProprietorAuthorization { get; set; }
        public bool IsPersonalAuthorization { get; set; }
        public bool IsSoleHST { get; set; }
        public string HSTNumber { get; set; }
        public string HSTAccessCode { get; set; }
        public bool IsPayroll { get; set; }
        public DateTime? PD7AReportingPeriod { get; set; }
        public string PayrollAccessCode { get; set; }
        public int? AssignedTo { get; set; }
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