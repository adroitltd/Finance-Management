namespace FinanceManagement.FinanceManagement;

using Microsoft.Finance.GeneralLedger.Journal;

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
    }

    actions
    {
    }
}