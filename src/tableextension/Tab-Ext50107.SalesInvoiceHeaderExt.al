namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.History;

tableextension 50107 "Sales Invoice Header Ext" extends "Sales Invoice Header"
{
    fields
    {
        field(50107; "TIN No."; Text[255])
        {
            Caption = 'TIN No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
