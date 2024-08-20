namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Document;
using Microsoft.Bank.BankAccount;
using System.Security.User;

tableextension 50103 "ASL.SalesHeader" extends "Sales Header"
{
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