namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Customer;

tableextension 60101 "Customer Ext" extends Customer
{
    fields
    {
        field(60100; TIN; Text[20])
        {
            Caption = 'TIN';
            DataClassification = ToBeClassified;
        }
    }
}
