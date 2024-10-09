namespace FinanceManagement.FinanceManagement;

using Microsoft.Finance.GeneralLedger.Journal;

pageextension 50119 "Payment Journal Ext" extends "Payment Journal"
{
    actions
    {
        addfirst(processing)
        {
            action("Print Receipt")
            {
                ApplicationArea = Basic, Suite;
                Promoted = true;
                PromotedCategory = Process;
                Visible=false;
                trigger OnAction()
                begin
                    Report.Run(50112);
                end;
            }
        }
    }
}
