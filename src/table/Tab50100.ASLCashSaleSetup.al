table 50100 "ASL.CashSaleSetup"
{
    Caption = 'ASL.CashSaleSetup';
    DataClassification = ToBeClassified;

    fields
    {
        field(50100; Seller; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
        }
        field(50101; "Payment Method"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "ASL.PaymentMethod".Code;
        }
        field(50102; "Cash Account No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            var
                GeneralLedgerAccount: Record "G/L Account";
                POSSetup: Record "Sales & Receivables Setup";
            begin
                if ("Cash Account No." <> '') then begin
                    GeneralLedgerAccount.Get("Cash Account No.");
                    "Cash Account Name" := GeneralLedgerAccount.Name;
                end else
                    "Cash Account Name" := '';
            end;
        }
        field(50103; "Cash Account Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
    }

    keys
    {
        key(PK; Seller, "Payment Method")
        {
            Clustered = true;
        }
    }
}