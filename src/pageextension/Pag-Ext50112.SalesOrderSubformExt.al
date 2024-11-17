namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Document;

pageextension 50112 "Sales Order Subform Ext" extends "Sales Order Subform"
{
    layout
    {
        modify("Reserved Quantity")
        {
            Visible=false;
        }
        modify("Qty. to Assemble to Order")
        {
            Visible=false;
        }
        modify("Tax Area Code")
        {
            Visible=false;
        }
        modify("Tax Group Code")
        {
            Visible=false;
        }
        modify("Qty. to Assign")
        {
            Visible=false;
        }
        modify("Appl.-from Item Entry")
        {
            Visible=false;
        }
        modify("Item Charge Qty. to Handle")
        {
            Visible=false;
        }
        modify("Qty. Assigned")
        {
            Visible=false;
        }
        modify("Description 2")
        {
            Visible=true;
        }
        modify("VAT Prod. Posting Group")
        {
            Visible=true;
        }
    }
}
