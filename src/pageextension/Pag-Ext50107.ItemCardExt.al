namespace FinanceManagement.FinanceManagement;

using Microsoft.Inventory.Item;

pageextension 50107 "Item Card Ext" extends "Item Card"
{
    Caption = 'Stationery Card';
    layout
    {
        modify(Item)
        {
            Caption = 'Stationery';
        }
        modify(ItemTracking)
        {
            Caption = 'Stationery Tracking';
        }
        modify("Item Category Code")
        {
            Caption = 'Stationery Category Code';
        }
        modify("Item Tracking Code")
        {
            Caption = 'Stationery Tracking Code';
        }
        modify("Common Item No.")
        {
            Caption = 'Common Stationery No.';
        }
    }
    actions
    {
        modify(CopyItem)
        {
            Caption = 'Copy Stationery';
        }
        modify(ItemAvailabilityBy)
        {
            Caption = 'Stationery Availability By';
        }
        modify("Category_Item Availability by")
        {
            Caption = 'Stationery Availability By';
        }
        modify(ItemsByLocation)
        {
            Caption = 'Stationery By Location';
        }
        modify(Category_Category4)
        {
            Caption = 'Stationery';
        }
        modify("Item Re&ferences")
        {
            Caption = 'Stationery References';
        }
    }
}