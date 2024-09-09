namespace FinanceManagement.FinanceManagement;

using Microsoft.Purchases.Document;

pageextension 50104 "Purchase Order List Ext" extends "Purchase Order List"
{
    actions
    {
        modify(AttachAsPDF)
        {
            Visible = false;
        }
    }
}
