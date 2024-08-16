table 50101 "ASL.PaymentMethod"
{
    Caption = 'ASL.PaymentMethod';
    DataClassification = ToBeClassified;

    fields
    {
        field(50100; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(50102; Description; Text[100])
        {
            Caption = 'Description';
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
