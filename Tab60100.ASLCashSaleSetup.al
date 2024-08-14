table 60100 "ASL.CashSaleSetup"
{
    Caption = 'ASL.CashSaleSetup';
    DataClassification = ToBeClassified;
    
  fields
    {
        field(1; Seller; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
        }

        field(2; "Payment Method"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "ASL.PaymentMethod".Code;
        }

        field(5; "Bank/Cash Account No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Bank Account"."No.";

            trigger OnValidate()
            var
                BankAccount: Record "Bank Account";
                POSSetup: Record "Sales & Receivables Setup";
            begin
                if ("Bank/Cash Account No." <> '') then begin
                    BankAccount.Get("Bank/Cash Account No.");
                    "Bank/Cash Account Name" := BankAccount.Name;
                end else
                    "Bank/Cash Account Name" := '';
            end;
        }

        field(6; "Bank/Cash Account Name"; Text[100])
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