namespace FinanceManagement.FinanceManagement;

using Microsoft.Foundation.Company;

tableextension 60100 "Company Information Ext" extends "Company Information"
{
    fields
    {
        field(60100; "TIN NO."; Text[20])
        {
            Caption = 'TIN No.';
            DataClassification = ToBeClassified;
        }
    }
}
