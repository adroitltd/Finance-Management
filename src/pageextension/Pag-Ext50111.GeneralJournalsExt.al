namespace FinanceManagement.FinanceManagement;

using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.HumanResources.Employee;

pageextension 50111 "General Journals Ext" extends "General Journal"
{
    layout
    {
        modify("VAT Reporting Date")
        {
            Visible = false;
        }
        modify("External Document No.")
        {
            Visible = true;
        }
        modify("Currency Code")
        {
            Visible=true;
        }
        // modify("EU 3-Party Trade")
        // {
        //     Visible = false;
        // }
        modify(Correction)
        {
            Visible = false;
        }
        modify(Comment)
        {
            Visible = false;
        }
        modify("Gen. Posting Type")
        {
            Visible = false;
        }
        modify("Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = false;
        }
        modify("Bal. Gen. Posting Type")
        {
            Visible = false;
        }
        modify("Bal. Gen. Bus. Posting Group")
        {
            Visible = false;
        }
        modify("Bal. Gen. Prod. Posting Group")
        {
            Visible = false;
        }
        modify("Deferral Code")
        {
            Visible = false;
        }
        addbefore(Description)
        {
            field("Employee Posting Group"; Rec."Employee Posting Group")
            {
                ApplicationArea = Basic, Suite;
                trigger OnValidate()
                var
                    Employee: Record Employee;
                begin
                    // Consider the current Employee Posting Group selected but to refresh the page you need to go to the next line
                    if Rec."Account Type" = Rec."Account Type"::Employee then begin
                        if Employee.Get(Rec."Account No.") then begin
                            Employee."Employee Posting Group" := Rec."Employee Posting Group";
                            Employee.Modify();
                        end;
                        Rec."Posting Group" := Rec."Employee Posting Group";
                        Rec.Modify();
                    end;
                end;
            }
            field("Posting Group "; Rec."Posting Group")
            {
                ApplicationArea = All;
                Editable=false;
            }
        }
    }

    actions
    {
        modify(Post)
        {
            trigger OnBeforeAction()
            begin
                "Check if Employee Posting Group and Document Type is Specified"();
            end;
        }
        modify(Preview)
        {
            trigger OnBeforeAction()
            begin
                "Check if Employee Posting Group and Document Type is Specified"();
            end;
        }
        modify(PostAndPrint)
        {
            trigger OnBeforeAction()
            begin
                "Check if Employee Posting Group and Document Type is Specified"();
            end;
        }
    }

    local procedure "Check if Employee Posting Group and Document Type is Specified"()
    var
        GenJournalLine: Record "Gen. Journal Line";
    begin
        GenJournalLine.SetRange("Journal Template Name", Rec."Journal Template Name");
        GenJournalLine.SetRange("Journal Batch Name", Rec."Journal Batch Name");
        if GenJournalLine.FindSet() then
            repeat
                if GenJournalLine."Account Type" = GenJournalLine."Account Type"::Employee then begin
                    GenJournalLine.TestField("Employee Posting Group");
                    if GenJournalLine."Document Type" = GenJournalLine."Document Type"::" " then
                        Error('Please Specify Document Type');
                end;
            until GenJournalLine.Next() = 0;
    end;
}