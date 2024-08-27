namespace FinanceManagement.FinanceManagement;
using System.Visualization;
using Microsoft.Purchases.Vendor;
using Microsoft.Sales.RoleCenters;
using Microsoft.Foundation.Task;
using Microsoft.Finance.GeneralLedger.Reports;
using Microsoft.FixedAssets.Reports;
using Microsoft.Finance.FinancialReports;
using Microsoft.Purchases.Reports;
using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Sales.Customer;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Sales.History;
using Microsoft.Sales.Document;
using Microsoft.CRM.BusinessRelation;
using Microsoft.Inventory.Location;
using Microsoft.Inventory.Journal;
using Microsoft.Inventory.Item;
using Microsoft.Purchases.History;
using Microsoft.Purchases.Document;

page 50106 "Finance Role Center"
{
    ApplicationArea = All;
    Caption = 'Finance Role Center';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(FinanceHeadLine; "Headline RC Order Processor")
            {
                ApplicationArea = All;
            }
            part(Control1901851508; "SO Processor Activities")
            {
                AccessByPermission = TableData "Sales Shipment Header" = R;
                ApplicationArea = Basic, Suite;
            }
        }
    }

    actions
    {
        area(Sections)
        {
            group(Purchasing)
            {
                action(Vendors)
                {
                    ApplicationArea = All;
                    RunObject = page "Vendor List";
                    RunPageMode = View;
                }
                action("Purchase Orders")
                {
                    ApplicationArea = All;
                    RunObject = page "Purchase Order List";
                    RunPageMode = View;
                }
                action("Purchase Invoices")
                {
                    ApplicationArea = All;
                    RunObject = page "Purchase Invoices";
                    RunPageMode = View;
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = All;
                    RunObject = page "Posted Purchase Invoices";
                    RunPageMode = View;
                }
                action("Purchase Receipts")
                {
                    ApplicationArea = All;
                    RunObject = page "Posted Purchase Receipts";
                    RunPageMode = View;
                }
            }
            group(Sales)
            {
                action(Customers)
                {
                    ApplicationArea = All;
                    RunObject = page "Customer List";
                    RunPageMode = View;
                }
                action("Stationery Sales")
                {
                    ApplicationArea = All;
                    RunObject = page "Stationery Sales";
                    RunPageMode = Create;
                }
                action("Sales Orders")
                {
                    ApplicationArea = All;
                    RunObject = page "Sales Order List";
                    RunPageMode = View;
                }
                action("Sales Invoices")
                {
                    ApplicationArea = All;
                    RunObject = page "Sales Invoice List";
                    RunPageMode = View;
                }
                action("Posted Sales Invoices")
                {
                    ApplicationArea = All;
                    RunObject = page "Posted Sales Invoices";
                    RunPageMode = View;
                }
                action("Posted Sales Shipments")
                {
                    ApplicationArea = All;
                    RunObject = page "Posted Sales Shipments";
                    RunPageMode = View;
                }
            }
            group(Inventory)
            {
                action(Stationery)
                {
                    ApplicationArea = All;
                    RunObject = page "Item List";
                    RunPageMode = View;
                }
                action("Item Journals")
                {
                    ApplicationArea = All;
                    RunObject = page "Item Journal";
                    RunPageMode = Create;
                }
                action(Locations)
                {
                    ApplicationArea = All;
                    RunObject = page "Location List";
                    RunPageMode = View;
                }
            }
        }
        area(Embedding)
        {
            action("Chart of Accounts")
            {
                ApplicationArea = All;
                RunObject = page "Chart of Accounts";
                RunPageMode = View;
            }
            action(Customer)
            {
                ApplicationArea = All;
                Caption = 'Customers';
                RunObject = page "Customer List";
                RunPageMode = View;
            }
            action(Vendor)
            {
                ApplicationArea = All;
                Caption = 'Vendors';
                RunObject = page "Vendor List";
                RunPageMode = View;
            }
            action("General Journals")
            {
                ApplicationArea = All;
                RunObject = page "General Journal";
                RunPageMode = Create;
            }
            action("Cash Receipt Journals")
            {
                ApplicationArea = All;
                RunObject = page "Cash Receipt Journal";
                RunPageMode = Create;
            }
            action("Payment Journals")
            {
                ApplicationArea = All;
                RunObject = page "Payment Journal";
                RunPageMode = Create;
            }
            action("Item Journals ")
            {
                ApplicationArea = All;
                RunObject = page "Item Journal";
                RunPageMode = Create;
            }
        }
        area(Creation)
        {
            action("Purchase Order")
            {
                ApplicationArea = All;
                Image = Purchase;
                RunObject = page "Purchase Order";
                RunPageMode = Create;
            }
            action("Sales Order")
            {
                ApplicationArea = All;
                Image = Sales;
                RunObject = page "Sales Order";
                RunPageMode = Create;
            }
            action("Stationery Sales ")
            {
                ApplicationArea = All;
                Image = Sales;
                RunObject = page "Stationery Sales";
                RunPageMode = Create;
            }
        }
        area(Reporting)
        {
            action(Tenants)
            {
                ApplicationArea = All;
                Image = Report;
            }
            action(Members)
            {
                ApplicationArea = All;
                Image = Report;
            }
            action("Stationery ")
            {
                ApplicationArea = All;
                Image = Report;
                RunObject=report "Stationery Trial Balance";
            }
            action(" Vendors")
            {
                ApplicationArea = All;
                Image = Report;
                RunObject = report "Vendor Detail Trial Balance";
            }
            action("Income Statement")
            {
                ApplicationArea = All;
                Image = Report;
                RunObject = report "Income Statement";
            }
            action("Balance Sheet")
            {
                ApplicationArea = All;
                Image = Report;
                RunObject = report "Balance Sheet";
            }
            action("Fixed Assets")
            {
                ApplicationArea = All;
                RunObject = report "Fixed Asset - List";
            }
            action("G/L Budget")
            {
                ApplicationArea = All;
                RunObject = report Budget;
            }
        }
    }
}