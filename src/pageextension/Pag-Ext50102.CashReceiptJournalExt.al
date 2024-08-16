namespace FinanceManagement.FinanceManagement;

using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Foundation.Reporting;
using Microsoft.Finance.GeneralLedger.Posting;

pageextension 50102 "Cash Receipt Journal Ext" extends "Cash Receipt Journal"
{
    actions
    {
        modify("P&osting")
        {
            Visible = false;
        }
        addfirst(processing)
        {
            group("Post Cash Receipt Journal")
            {
                ShowAs = SplitButton;
                action("Post ")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Post';
                    Image = PostPrint;
                    ShortCutKey = 'Shift+F9';
                    ToolTip = 'Finalize and prepare to print the document or journal. The values and quantities are posted to the related accounts. A report request window where you can specify what to include on the print-out.';
                    Promoted = true;
                    PromotedCategory = Category6;

                    trigger OnAction()
                    begin
                        Rec.SendToPosting(Codeunit::"Gen. Jnl.-Post+Print");
                        CurrentJnlBatchName := Rec.GetRangeMax("Journal Batch Name");
                        CurrPage.Update(false);
                    end;
                }
                action("Test Report ")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;
                    ToolTip = 'View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.';
                    Promoted = true;
                    PromotedCategory = Category6;

                    trigger OnAction()
                    var
                        TestReportPrint: Codeunit "Test Report-Print";
                    begin
                        TestReportPrint.PrintGenJnlLine(Rec);
                    end;
                }
                action("Preview ")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Preview Posting';
                    Image = ViewPostedOrder;
                    ShortCutKey = 'Ctrl+Alt+F9';
                    ToolTip = 'Review the different types of entries that will be created when you post the document or journal.';
                    Promoted = true;
                    PromotedCategory = Category6;

                    trigger OnAction()
                    var
                        GenJnlPost: Codeunit "Gen. Jnl.-Post";
                    begin
                        GenJnlPost.Preview(Rec);
                    end;
                }
            }
        }
    }
}