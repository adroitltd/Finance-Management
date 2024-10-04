namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.History;

pageextension 50114 "Posted Sales Invoice Ext" extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("TIN No.";Rec."TIN No.")
            {
                ApplicationArea=Basic, Suite;
            }
        }
    }
}
