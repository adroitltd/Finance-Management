namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.History;
using Microsoft.Bank.BankAccount;
using System.Security.User;

tableextension 50104 "ASL.SalesInvoiceHeader" extends "Sales Invoice Header"
{
    // <summary>
    // NB: Make sure these fields have the same ids as in sales order
    // </summary>
    // <param name="ASL.SalesInvoiceHeader"></param>
    fields
    {
        field(50100; "Seller"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
            Editable = false;
        }
        field(50101; "ASL.CashPaymentAccountNo"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Bank Account"."No.";
        }
        field(50102; "ASL.Payment Method"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "ASL.PaymentMethod".Code;
        }
    }
}