namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Document;

pageextension 50113 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        modify("No.")
        {
            Visible=true;
            Editable=false;
        }
        addafter("Sell-to Customer Name")
        {
            field("Other Customer Name";Rec."Other Customer Name")
            {
                ApplicationArea=Basic, Suite;
                Editable=true;
            }
            field("TIN No.";Rec."TIN No.")
            {
                ApplicationArea=Basic, Suite;
            }
        }
    }
}
