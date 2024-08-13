namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.RoleCenters;

pageextension 60109 "Sales Order Processor Ext" extends "Order Processor Role Center"
{
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
    }
}