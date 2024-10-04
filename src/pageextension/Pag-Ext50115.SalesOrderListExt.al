namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Document;

pageextension 50115 "Sales Order List Ext" extends "Sales Order List"
{
    trigger OnOpenPage()
    begin
        Rec.SetRange("Cash Sale", false);
    end;
}
