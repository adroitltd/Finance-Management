namespace FinanceManagement.FinanceManagement;

page 50105 "ASL.PaymentMethods"
{
    ApplicationArea = All;
    Caption = 'ASL.PaymentMethods';
    PageType = List;
    SourceTable = "ASL.PaymentMethod";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
