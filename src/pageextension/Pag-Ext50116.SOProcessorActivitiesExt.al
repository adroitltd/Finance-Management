namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.RoleCenters;

pageextension 50116 "SO Processor Activities Ext" extends "SO Processor Activities"
{
    layout
    {
        addafter("Sales Orders - Open")
        {
            field("Stationery Sales - Open";Rec."Stationery Sales - Open")
            {
                ApplicationArea=Basic, Suite;
                DrillDownPageId = "Stationery Sales List";
            }
        }
    }
}
