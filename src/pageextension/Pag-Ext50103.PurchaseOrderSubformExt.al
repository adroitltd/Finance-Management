namespace FinanceManagement.FinanceManagement;

using Microsoft.Purchases.Document;

pageextension 50103 "Purchase Order Subform Ext" extends "Purchase Order Subform"
{
    layout
    {
        modify("Location Code")
        {
            ShowMandatory = true;
        }
    }
}