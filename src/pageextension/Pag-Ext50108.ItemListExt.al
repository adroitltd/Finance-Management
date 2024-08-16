namespace FinanceManagement.FinanceManagement;

using Microsoft.Inventory.Item;

pageextension 50108 "Item List Ext" extends "Item List"
{
    Caption = 'Stationery List';
    AdditionalSearchTerms = 'St, Sta, Stat, Stationery';
    actions
    {
        modify(CopyItem)
        {
            Caption = 'Copy Stationery';
        }
        modify(Category_Category4)
        {
            Caption = 'Stationery';
        }
        modify("&Item Availability by")
        {
            Caption = 'Stationery Availability By';
        }
        modify("Category_Item Availability by")
        {
            Caption = 'Stationery Availability By';
        }
        modify("Items b&y Location")
        {
            Caption = 'Stationery By Location';
        }
        modify("Item Refe&rences")
        {
            Caption = 'Stationery References';
        }
    }
}