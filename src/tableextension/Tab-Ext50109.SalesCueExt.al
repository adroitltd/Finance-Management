namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.RoleCenters;
using Microsoft.Sales.History;
using Microsoft.Sales.Document;

tableextension 50109 "Sales Cue Ext" extends "Sales Cue"
{
    fields
    {

        field(50100; "Stationery Sales - Open"; Integer)
        {
            AccessByPermission = TableData "Sales Shipment Header" = R;
            CalcFormula = count("Sales Header" where("Document Type" = const(Order),
                                                      Status = const(Open),
                                                      "Responsibility Center" = field("Responsibility Center Filter"),
                                                      "Cash Sale" = const(true)));
            Caption = 'Stationery Sales - Open';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}
