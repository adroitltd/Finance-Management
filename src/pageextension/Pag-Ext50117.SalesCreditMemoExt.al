namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Document;

pageextension 50117 "Sales Credit Memo Ext" extends "Sales Credit Memo"
{
    layout
    {
        modify("No.")
        {
            Visible=true;
        }
    }
}
