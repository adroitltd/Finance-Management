namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.History;

pageextension 50114 "Posted Sales Invoice Ext" extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Other Customer Name";Rec."Other Customer Name")
            {
                ApplicationArea=Basic, Suite;
            }
            field("Cash Sale Cust. Name";Rec."Cash Sale Cust. Name")
            {
                ApplicationArea=Basic, Suite;
            }
            field("TIN No.";Rec."TIN No.")
            {
                ApplicationArea=Basic, Suite;
            }
        }
        modify(Closed)
        {
            Editable=true;
        }
    }
}
