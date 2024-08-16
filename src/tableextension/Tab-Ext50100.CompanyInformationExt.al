namespace FinanceManagement.FinanceManagement;

using Microsoft.Foundation.Company;

tableextension 50100 "Company Information Ext" extends "Company Information"
{
    fields
    {
        field(50100; "TIN NO."; Text[20])
        {
            Caption = 'TIN No.';
            DataClassification = ToBeClassified;
        }
    }
}
