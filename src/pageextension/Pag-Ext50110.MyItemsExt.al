namespace FinanceManagement.FinanceManagement;

using Microsoft.Inventory.Item;

pageextension 50110 "My Items Ext" extends "My Items"
{
    Caption = 'My Stationery';
    layout
    {
        modify("Item No.")
        {
            Caption = 'Stationery No.';
        }
    }
}