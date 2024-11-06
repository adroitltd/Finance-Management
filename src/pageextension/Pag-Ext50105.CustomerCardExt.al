namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Receivables;

pageextension 50105 "Customer Card Ext" extends "Customer Card"
{
    layout
    {
        addafter("Registration Number")
        {
            field(TIN; Rec.TIN)
            {
                ApplicationArea = Basic, Suite;
                ShowMandatory = true;
            }
            field("Room No.";Rec."Room No.")
            {
                ApplicationArea=Basic, Suite;
            }
            field("Square Meters";Rec."Square Meters")
            {
                ApplicationArea=Basic, Suite;
            }
        }
    }
    actions
    {
        addafter("S&ales")
        {
            action("Print Receipt")
            {
                Image=Receipt;
                Promoted=true;
                PromotedCategory=Report;
                ApplicationArea=Basic, Suite;
                trigger OnAction()
                var
                    CustomerLedgerEntry: Record "Cust. Ledger Entry";
                begin
                    CustomerLedgerEntry.Reset();
                    CustomerLedgerEntry.SetRange("Customer No.", Rec."No.");
                    if CustomerLedgerEntry.FindFirst() then
                        Report.Run(50114, true, false, CustomerLedgerEntry);
                end;
            }
        }
    }
}