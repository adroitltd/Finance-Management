namespace FinanceManagement.FinanceManagement;

using Microsoft.Finance.GeneralLedger.Ledger;

tableextension 50110 "GL Entry Ext" extends "G/L Entry"
{
    fields
    {
        field(50105; "Customer Name"; Text[1028])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }
}
