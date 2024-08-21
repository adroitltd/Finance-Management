namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Setup;
using Microsoft.Foundation.NoSeries;
using Microsoft.Foundation.AuditCodes;

tableextension 50105 "ASL.Sales&ReceivablesSetup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "ASL.CashSalesSourceCode"; Code[10])
        {
            Caption = 'Cash Sales Source Code';
            DataClassification = CustomerContent;
            TableRelation = "Source Code".Code;
        }
        field(50101; "Cash Sale Receipt Nos."; Code[20])
        {
            Caption = 'Cash Sale Receipt Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
    }
}