namespace FinanceManagement.FinanceManagement;

using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Finance.GeneralLedger.Posting;

pageextension 50118 "Cash Receipt Journal Ext" extends "Cash Receipt Journal"
{
    layout
    {
        modify("Currency Code")
        {
            Visible=true;
        }
        addafter(Description)
        {
            field("Customer Name";Rec."Customer Name")
            {
                Caption='Other Customer Name';
                ApplicationArea=Basic, Suite;
                Editable=true;
            }
        }
    }
    actions
    {
        modify("Post and &Print")
        {
            Visible=false;
        }
        addafter(Preview)
        {
            action("Post and &Print ")
            {
                ApplicationArea=Basic, Suite;
                Promoted=true;
                PromotedCategory=Category6;
                trigger OnAction()
                begin
                    Rec.SendToPosting(Codeunit::"Gen. Jnl.-Post");
                    CurrentJnlBatchName := Rec.GetRangeMax("Journal Batch Name");
                    CurrPage.Update(false);
                end;
            }
        }
    }
}
