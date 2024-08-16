namespace FinanceManagement.FinanceManagement;

using Microsoft.Foundation.Company;

pageextension 50101 "Company Information Ext" extends "Company Information"
{
    layout
    {
        addafter("Registration No.")
        {
            field("TIN NO."; Rec."TIN NO.")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }
}
