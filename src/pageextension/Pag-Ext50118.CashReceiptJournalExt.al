namespace FinanceManagement.FinanceManagement;

using Microsoft.Finance.GeneralLedger.Journal;

pageextension 50118 "Cash Receipt Journal Ext" extends "Cash Receipt Journal"
{
    
    layout
    {
        addafter("Account No.")
        {
            field("Customer Name"; Rec."Customer Name")
            {
                ApplicationArea = Basic, Suite;
                Visible = false;
            }
        }
    }
    actions
    {
        addfirst(processing)
        {
            action("Print Receipt")
            {
                ApplicationArea=Basic, Suite;
                Promoted=true;
                PromotedCategory=Process;
                trigger OnAction()
                begin
                    Report.Run(50102);
                end;
            }
        }
    }
}
