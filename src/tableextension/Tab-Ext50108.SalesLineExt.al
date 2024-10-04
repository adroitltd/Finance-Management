namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Document;
using Microsoft.Inventory.Item;

tableextension 50108 "Sales Line Ext" extends "Sales Line"
{
    fields
    {
       
    }

    trigger OnInsert()
    var
        Item: Record Item;
    begin
        Item.Reset();
        Item.SetFilter(Type, '%1', Item.Type::Inventory);
        if Item.Get(Rec."No.") then begin
            Rec."Description 2" := Item.Description;
        end;
    end;
}
