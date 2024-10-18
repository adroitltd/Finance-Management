pageextension 50100 "Purchase Order Ext" extends "Purchase Order"
{
    layout
    {
        modify("No.")
        {
            Visible=true;
            Editable=false;
        }
    }
    actions
    {
        modify(AttachAsPDF)
        {
            Visible = false;
        }
    }
}
