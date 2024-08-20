namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.RoleCenters;

pageextension 50109 "Sales Order Processor Ext" extends "Order Processor Role Center"
{
    layout
    {
        modify("Intercompany Activities")
        {
            Visible = false;
        }
        modify("User Tasks Activities")
        {
            Visible = false;
        }
        modify(Emails)
        {
            Visible = false;
        }
        modify(ApprovalsActivities)
        {
            Visible = false;
        }
        modify(Control14)
        {
            Visible = false;
        }
        modify(Control1907692008)
        {
            Visible = false;
        }
        modify(Control21)
        {
            Visible = false;
        }
        modify(PowerBIEmbeddedReportPart)
        {
            Visible = false;
        }
        modify(Control1901377608)
        {
            Caption = 'My Stationery';
        }
    }
    actions
    {
        addafter("Sales &Order")
        {
            action("Stationery Card")
            {
                ApplicationArea = Basic, Suite;
                RunObject = page "Stationery Card";
                RunPageMode = Create;
            }
        }
        modify("Sales &Quote")
        {
            Visible = false;
        }
        modify("Sales &Invoice")
        {
            Visible = false;
        }
        modify("Sales &Return Order")
        {
            Visible = false;
        }
        modify("Sales &Credit Memo")
        {
            Visible = false;
        }
        modify("Sales &Journal")
        {
            Visible = false;
        }
        modify("Customer/&Item Sales")
        {
            Caption = 'Customer/Stationery Sales';
        }
        modify(Items)
        {
            Caption = 'Stationery';
        }
        modify("Sales Journals")
        {
            Visible = false;
        }
        modify("Transfer Orders")
        {
            Visible = false;
        }
        modify("Sales Quotes")
        {
            Visible = false;
        }
        modify("Sales Orders - Microsoft Dynamics 365 Sales")
        {
            Visible = false;
        }
        modify("Sales Return Orders")
        {
            Visible = false;
        }
        modify("Finance Charge Memos")
        {
            Visible = false;
        }
        modify("Sales Credit Memos")
        {
            Visible = false;
        }
        modify("Posted Sales Credit Memos")
        {
            Visible = false;
        }
        modify("Posted Sales Return Receipts")
        {
            Visible = false;
        }
    }
}