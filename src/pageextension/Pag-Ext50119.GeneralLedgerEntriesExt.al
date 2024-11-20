namespace FinanceManagement.FinanceManagement;

using Microsoft.Finance.GeneralLedger.Ledger;
using Microsoft.HumanResources.Employee;

pageextension 50119 "General Ledger Entries Ext" extends "General Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field("Employee Code";Rec."Employee Code")
            {
                ApplicationArea=Basic, Suite;
            }
        }
    }

    trigger OnOpenPage()
    var
        GeneralLedgerEntry: Record "G/L Entry";
        Employee: Record Employee;
    begin
        if GeneralLedgerEntry.FindSet() then begin
            repeat begin
                Employee.Reset();
                Employee.SetRange("No.",GeneralLedgerEntry."Source No.");
                if Employee.FindFirst() then begin
                    GeneralLedgerEntry."Employee Code" := Employee."No.";
                    GeneralLedgerEntry.Modify();
                end;
                Employee.SetRange("No.", GeneralLedgerEntry."Bal. Account No.");
                if Employee.FindFirst() then begin
                    GeneralLedgerEntry."Employee Code" := Employee."No.";
                    GeneralLedgerEntry.Modify();
                end;
            end until GeneralLedgerEntry.Next()=0;
        end;
    end;
}
