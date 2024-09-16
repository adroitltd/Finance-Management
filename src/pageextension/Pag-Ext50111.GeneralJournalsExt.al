namespace FinanceManagement.FinanceManagement;

using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.HumanResources.Employee;

pageextension 50111 "General Journals Ext" extends "General Journal"
{
    layout
    {
        modify("External Document No.")
        {
            Visible = true;
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
            field("Posting Group"; Rec."Posting Group")
            {
                ApplicationArea = All;
            }
        }
    }
}
