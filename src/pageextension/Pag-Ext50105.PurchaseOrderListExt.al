namespace FinanceManagement.FinanceManagement;

using Microsoft.Purchases.Document;

pageextension 50105 "Purchase Order List Ext" extends "Purchase Order List"
{
    actions
    {
        modify(AttachAsPDF)
        {
            Visible = false;
        }
    }
}
