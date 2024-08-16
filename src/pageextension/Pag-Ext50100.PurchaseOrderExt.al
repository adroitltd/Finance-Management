pageextension 50100 "Purchase Order Ext" extends "Purchase Order"
{
    actions
    {
        modify(AttachAsPDF)
        {
            Visible = false;
        }
    }
}
