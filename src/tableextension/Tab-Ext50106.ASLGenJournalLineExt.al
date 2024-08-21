namespace FinanceManagement.FinanceManagement;

using Microsoft.Finance.GeneralLedger.Journal;

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
    }
}