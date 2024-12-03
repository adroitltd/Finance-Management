namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Document;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Sales.Customer;
using System.Security.User;

tableextension 50103 "ASL.SalesHeader" extends "Sales Header"
{
    fields
    {
        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                Customer: Record Customer;
            begin
                Customer.Reset();
                Customer.SetRange("No.", Rec."Sell-to Customer No.");
                if Customer.FindSet() then begin
                    repeat begin
                        Rec."TIN No." := Customer.TIN;
                        Rec.Modify();
                    end until Customer.Next()=0;
                end;
            end;
        }
        field(50100; "Seller"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
            Editable = false;
        }
        field(50101; "ASL.CashPaymentAccountNo"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "G/L Account"."No.";
        }
        field(50102; "ASL.Payment Method"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "ASL.PaymentMethod".Code;
        }
        field(50103; "Cash Sale Receipt No."; Code[20])
        {
            Caption = 'Cash Sale Receipt No.';
            DataClassification = ToBeClassified;
        }
        field(50104; "Cash Sale Cust. Name"; Text[100])
        {
            Caption = 'Cash Sale Cust. Name';
            DataClassification = ToBeClassified;
        }
        field(50105; "Cash Sale Cust. Telephone No."; Text[15])
        {
            Caption = 'Cash Sale Cust. Telephone No.';
            DataClassification = ToBeClassified;
        }
        field(50106; Narration; Text[255])
        {
            Caption = 'Narration';
            DataClassification = ToBeClassified;
        }
        field(50107; "TIN No."; Text[255])
        {
            Caption = 'TIN No.';
            DataClassification = ToBeClassified;
            Editable=false;
        }
        field(50108; "Cash Sale"; Boolean)
        {
            Caption = 'Cash Sale';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50109; "Other Customer Name"; Text[200])
        {
            Caption = 'Other Customer Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}