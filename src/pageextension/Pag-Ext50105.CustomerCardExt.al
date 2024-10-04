namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Customer;

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