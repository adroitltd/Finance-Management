namespace FinanceManagement.FinanceManagement;

using Microsoft.Foundation.Attachment;
using Microsoft.Inventory.Availability;
using Microsoft.Sales.Document;

page 50103 "Stationery Sales Line FactBox"
{
    ApplicationArea = All;
    Caption = 'Stationery Line Details';
    PageType = CardPart;
    SourceTable = "Sales Line";

    layout
    {
        area(content)
        {
            field(ItemNo; ShowNo())
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Stationery No.';
                Lookup = false;
                ToolTip = 'Specifies the Stationery that is handled on the sales line.';

                trigger OnDrillDown()
                begin
                    SalesInfoPaneMgt.LookupItem(Rec);
                end;
            }
            field("Required Quantity"; Rec."Outstanding Quantity" - Rec."Reserved Quantity")
            {
                ApplicationArea = Reservation;
                Caption = 'Required Quantity';
                DecimalPlaces = 0 : 5;
                ToolTip = 'Specifies how many units of the item are required on the sales line.';
            }
            group(Attachments)
            {
                Caption = 'Attachments';
                field("Attached Doc Count"; Rec."Attached Doc Count")
                {
                    ApplicationArea = All;
                    Caption = 'Documents';
                    ToolTip = 'Specifies the number of attachments.';

                    trigger OnDrillDown()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal();
                    end;
                }
            }
            group(Availability)
            {
                Caption = 'Availability';
                field("Shipment Date"; SalesInfoPaneMgt.CalcAvailabilityDate(Rec))
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Shipment Date';
                    ToolTip = 'Specifies when the items on the sales line must be shipped.';
                }
                field("Item Availability"; SalesInfoPaneMgt.CalcAvailability(Rec))
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Stationery Availability';
                    DecimalPlaces = 0 : 5;
                    DrillDown = true;
                    ToolTip = 'Specifies how may units of the Stationery on the sales line are available, in inventory or incoming before the shipment date.';

                    trigger OnDrillDown()
                    begin
                        ItemAvailFormsMgt.ShowItemAvailFromSalesLine(Rec, ItemAvailFormsMgt.ByEvent());
                        CurrPage.Update(true);
                    end;
                }
                field("Available Inventory"; SalesInfoPaneMgt.CalcAvailableInventory(Rec))
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Available Inventory';
                    DecimalPlaces = 0 : 5;
                    ToolTip = 'Specifies the quantity of the Stationery that is currently in inventory and not reserved for other demand.';
                }
            }
            group(Item)
            {
                Caption = 'Stationery';
                field(UnitofMeasureCode; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Unit of Measure Code';
                    ToolTip = 'Specifies the unit of measure that is used to determine the value in the Unit Price field on the sales line.';
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Qty. per Unit of Measure';
                    ToolTip = 'Specifies an auto-filled number if you have included Sales Unit of Measure on the Stationery card and a quantity in the Qty. per Unit of Measure field.';
                }
                field(SalesPrices; SalesInfoPaneMgt.CalcNoOfSalesPrices(Rec))
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Prices';
                    DrillDown = true;
                    ToolTip = 'Specifies special sales prices that you grant when certain conditions are met, such as customer, quantity, or ending date. The price agreements can be for individual customers, for a group of customers, for all customers or for a campaign.';

                    trigger OnDrillDown()
                    begin
                        Rec.PickPrice();
                        CurrPage.Update();
                    end;
                }
                field(SalesLineDiscounts; SalesInfoPaneMgt.CalcNoOfSalesLineDisc(Rec))
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Line Discounts';
                    DrillDown = true;
                    ToolTip = 'Specifies how many special discounts you grant for the sales line. Choose the value to see the sales line discounts.';

                    trigger OnDrillDown()
                    begin
                        Rec.PickDiscount();
                        CurrPage.Update();
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        Rec.ClearSalesHeader();
    end;

    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields("Reserved Quantity", "Attached Doc Count");
        SalesInfoPaneMgt.ResetItemNo();
    end;

    protected var
        SalesInfoPaneMgt: Codeunit "Sales Info-Pane Management";
        ItemAvailFormsMgt: Codeunit "Item Availability Forms Mgt";

    local procedure ShowNo(): Code[20]
    begin
        if Rec.Type <> Rec.Type::Item then
            exit('');
        exit(Rec."No.");
    end;
}