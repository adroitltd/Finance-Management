namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Setup;

pageextension 50111 "ASL.Sales&ReceivablesSetup" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Posted Invoice Nos.")
        {
            field("Cash Sale Receipt Nos.";Rec."Cash Sale Receipt Nos.")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }
}