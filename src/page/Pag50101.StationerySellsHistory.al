namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;
using Microsoft.Sales.History;

page 50101 "Stationery Sells History"
{
    ApplicationArea = All;
    Caption = 'Sell-to Customer Sales History';
    PageType = CardPart;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'Customer No.';
                ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';

                trigger OnDrillDown()
                begin
                    ShowDetails();
                end;
            }
            cuegroup(Control2)
            {
                ShowCaption = false;
                field(NoofOrdersTile; Rec."No. of Orders")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ongoing Sales Orders';
                    DrillDownPageID = "Sales Order List";
                    ToolTip = 'Specifies the number of sales orders that have been registered for the customer.';
                }
                field(NoofInvoicesTile; Rec."No. of Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Ongoing Sales Invoices';
                    DrillDownPageID = "Sales Invoice List";
                    ToolTip = 'Specifies the number of unposted sales invoices that have been registered for the customer.';
                }
                field(NoofPstdInvoicesTile; Rec."No. of Pstd. Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Sales Invoices';
                    DrillDownPageID = "Posted Sales Invoices";
                    ToolTip = 'Specifies the number of posted sales invoices that have been registered for the customer.';
                }
            }
        }
    }

    actions
    {
    }

    local procedure ShowDetails()
    begin
        PAGE.Run(PAGE::"Customer Card", Rec);
    end;
}