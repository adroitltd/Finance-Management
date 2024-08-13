namespace FinanceManagement.FinanceManagement;

using Microsoft.Purchases.Document;

pageextension 60105 "Purchase Order List Ext" extends "Purchase Order List"
{
    actions
    {
        modify(AttachAsPDF)
        {
            Visible = false;
        }
    }
}
