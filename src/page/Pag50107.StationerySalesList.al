namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Document;

page 50107 "Stationery Sales List"
{
    ApplicationArea = All;
    Caption = 'Stationery Sales List';
    AdditionalSearchTerms='Cash Sales, Cash Sale List, Stationery Sales Orders';
    PageType = List;
    SourceTable = "Sales Header";
    UsageCategory = Lists;
    DeleteAllowed=false;
    ModifyAllowed=false;
    InsertAllowed=false;
    LinksAllowed=false;
    CardPageId="Stationery Sales";
    RefreshOnActivate=true;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the number of the customer who will receive the products and be billed by default.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the name of the customer who will receive the products and be billed by default.';
                }
                field(Narration;Rec.Narration)
                {
                    ToolTip = 'Specifies the value of the Narration field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the sum of amounts on all the lines in the document. This will include invoice discounts.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange("Cash Sale", true);
    end;
}
