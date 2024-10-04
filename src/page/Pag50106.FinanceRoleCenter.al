namespace FinanceManagement.FinanceManagement;

using System.Visualization;
using Microsoft.Purchases.Vendor;
using Microsoft.Sales.RoleCenters;
using Microsoft.Finance.GeneralLedger.Reports;
using Microsoft.FixedAssets.Reports;
using Microsoft.Finance.FinancialReports;
using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Sales.Customer;
using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Bank.BankAccount;
using System.Automation;
using Microsoft.FixedAssets.FixedAsset;
using Microsoft.Finance.GeneralLedger.Budget;
using Microsoft.Finance.Analysis;
using Microsoft.Sales.Reports;
using Microsoft.Purchases.Reports;
using Microsoft.Inventory.Reports;
using Microsoft.Sales.History;
using Microsoft.Sales.Document;
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
            part(ApprovalsActivities; "Approvals Activities")
            {
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
                    RunObject = page "Stationery Sales List";
                    RunPageMode = View;
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
                action("Stationery Sales List")
                {
                    ApplicationArea = All;
                    RunObject = page "Stationery Sales List";
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
                }
            }
        }
        area(Embedding)
        {
            action("Chart of Accounts")
            {
                ApplicationArea = All;
                RunObject = page "Chart of Accounts";
            }
            action("Fixed Assets ")
            {
                ApplicationArea = All;
                RunObject=page "Fixed Asset List";
            }
            action(Budgets)
            {
                ApplicationArea = All;
                RunObject = page "G/L Budget Names";
            }
            action("Stationery List")
            {
                ApplicationArea = All;
                RunObject=page "Item List";
            }
            action(Customer)
            {
                ApplicationArea = All;
                Caption = 'Customers';
                RunObject = page "Customer List";
            }
            action(Vendor)
            {
                ApplicationArea = All;
                Caption = 'Vendors';
                RunObject = page "Vendor List";
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
            action("Stationery Sales List ")
            {
                ApplicationArea = All;
                RunObject = page "Stationery Sales List";
                RunPageMode = View;
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
            action("Fixed Asset")
            {
                ApplicationArea = All;
                Image = FixedAssets;
                RunObject = page "Fixed Asset Card";
                RunPageMode = Create;
            }
        }
        area(Reporting)
        {
            group(Reports)
            {
                action(Tenants)
                {
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Tenant Trial Balance";
                }
                action(Members)
                {
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Members Detail Trial Balance";
                }
                action("Stationery ")
                {
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Stationery Trial Balance";
                }
                action("Stationery Cost & Price")
                {
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Inventory Cost and Price List";
                }
                action("All Customers Balance to Date")
                {
                    ApplicationArea = All;
                    Image=Report;
                    RunObject=report "Customer - Balance to Date";
                }
                action("Members Balance to Date")
                {
                    ApplicationArea = All;
                    Image=Report;
                    RunObject=report "Member Balance to Date";
                }
                action("Tenants Balance to Date")
                {
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Tenant Balance to Date";
                }
                action(" Vendors")
                {
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Vendor Detail Trial Balance";
                }
                action("Vendor Balance to Date")
                {
                    ApplicationArea = All;
                    Image=Report;
                    RunObject=report "Vendor - Balance to Date";
                }
                action("Income Statement")
                {
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Income Statement Report";
                }
                action("Balance Sheet")
                {
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Balance Sheet Report";
                }
                action("Fixed Assets")
                {
                    ApplicationArea = All;
                    Image=Report;
                    RunObject = report "Fixed Asset - Details";
                }
                action("G/L Budget")
                {
                    ApplicationArea = All;
                    Image=Report;
                    RunObject = report "Trial Balance/Budget";
                }
            }
        }
    }
}