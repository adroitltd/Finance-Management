namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Document;
using Microsoft.Bank.BankAccount;
using System.Security.User;

tableextension 60103 "ASL.SalesHeader" extends "Sales Header"
{
    fields
    {
        field(60100; "Seller"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
            Editable = false;
        }
        field(60101; "ASL.CashPaymentAccountNo"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Bank Account"."No.";
        }
        field(60102; "ASL.Payment Method"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "ASL.PaymentMethod".Code;
        }
    }
    trigger OnInsert()
    begin
        Rec.Seller := UserId;
    end;
}