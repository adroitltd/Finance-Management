namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Customer;

tableextension 50101 "Customer Ext" extends Customer
{
    fields
    {
        field(50100; TIN; Text[20])
        {
            Caption = 'TIN';
            DataClassification = ToBeClassified;
        }
        field(50101; "Room No."; Text[50])
        {
            Caption = 'Room No.';
            DataClassification = ToBeClassified;
        }
        field(50102; "Square Meters"; Text[200])
        {
            Caption = 'Square Meters';
            DataClassification = ToBeClassified;
        }
    }
}
