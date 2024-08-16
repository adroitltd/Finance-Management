namespace FinanceManagement.FinanceManagement;

using Microsoft.Foundation.Reporting;

pageextension 50104 "Select Sending Options Ext" extends "Select Sending Options"
{
    Caption = 'Send LPO to Vendor/Supplier Email';

    layout
    {
        modify(Printer)
        {
            Visible = false;
        }
        modify(Disk)
        {
            Visible = false;
        }
        modify("Electronic Document")
        {
            Visible = false;
        }
        modify("Combine PDF Documents")
        {
            Visible = false;
        }
    }
}
