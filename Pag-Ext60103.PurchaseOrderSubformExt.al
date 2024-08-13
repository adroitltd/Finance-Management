namespace FinanceManagement.FinanceManagement;

using Microsoft.Purchases.Document;

pageextension 60103 "Purchase Order Subform Ext" extends "Purchase Order Subform"
{
    layout
    {
        modify("Location Code")
        {
            ShowMandatory=true;
        }
    }
}
