pageextension 60100 "Purchase Order Ext" extends "Purchase Order"
{
    actions
    {
        modify(AttachAsPDF)
        {
            Visible=false;
        }
    }
}
