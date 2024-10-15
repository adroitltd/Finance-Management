namespace FinanceManagement.FinanceManagement;

using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Purchases.Vendor;
using Microsoft.Sales.Customer;
using Microsoft.HumanResources.Employee;

tableextension 50106 "ASL.GenJournalLineExt" extends "Gen. Journal Line"
{
    fields
    {
        field(50100; "Cash Sale Receipt No."; Code[20])
        {
            Caption = 'Cash Sale Receipt No.';
            DataClassification = ToBeClassified;
        }
        field(50101; "Cash Sale Cust. Name"; Text[100])
        {
            Caption = 'Cash Sale Cust. Name';
            DataClassification = ToBeClassified;
        }
        field(50102; "Cash Sale Cust. Telephone No."; Text[15])
        {
            Caption = 'Cash Sale Cust. Telephone No.';
            DataClassification = ToBeClassified;
        }
        field(50103; Narration; Text[255])
        {
            Caption = 'Narration';
            DataClassification = ToBeClassified;
        }
        field(50104; "Employee Posting Group"; Code[20])
        {
            Caption = 'Employee Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "Employee Posting Group".Code;
        }
        field(50105; "Customer Name"; Text[1028])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
            Editable=false;
        }
    }
}