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
    }
}
