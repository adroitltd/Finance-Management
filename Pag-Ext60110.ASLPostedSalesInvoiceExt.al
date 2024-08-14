namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.History;

pageextension 60110 "ASL.PostedSalesInvoiceExt" extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Due Date")
        {
            field(Seller;Rec.Seller)
            {
                ApplicationArea=Basic, Suite;
                Caption='Seller';
                Editable=false;
                Visible=false;
            }
            field("ASL.Payment Method";Rec."ASL.Payment Method")
            {
                ApplicationArea=Basic, Suite;
                Caption='Payment Method';
                Editable=false;
            }
            field("ASL.CashPaymentAccountNo";Rec."ASL.CashPaymentAccountNo")
            {
                ApplicationArea=Basic, Suite;
                Caption='Payment Account No.';
                Editable=false;
            }
        }
    }
}