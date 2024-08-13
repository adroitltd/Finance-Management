namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Document;

tableextension 60103 "Sales Line Ext" extends "Sales Line"
{
    fields
    {
        modify("No.")
        {
            Caption = 'Stationery No.';
        }
    }
}