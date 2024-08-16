namespace FinanceManagement.FinanceManagement;

page 50104 "ASL.CashSaleSetup"
{
    ApplicationArea = All;
    Caption = 'ASL.CashSaleSetup';
    PageType = List;
    SourceTable = "ASL.CashSaleSetup";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Seller; Rec.Seller)
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Seller';
                }
                field("Payment Method"; Rec."Payment Method")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Payment Method';
                }
                field("Bank/Cash Account No."; Rec."Bank/Cash Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Bank/Cash Account No.';
                }
                field("Bank/Cash Account Name"; Rec."Bank/Cash Account Name")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Bank.Cash Account Name';
                }
            }
        }
    }
}
