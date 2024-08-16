namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Customer;

pageextension 50106 "Customer Card Ext" extends "Customer Card"
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
        }
        modify("Payment Terms Code")
        {
            trigger OnAfterValidate()
            begin
                if Rec.TIN = '' then
                    Message('Please enter NIN number for customer %1', Rec."No.");
            end;
        }
    }
}