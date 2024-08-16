namespace Microsoft.Finance.GeneralLedger.Reports;

using Microsoft.Finance.GeneralLedger.Account;
using Microsoft.Finance.GeneralLedger.Ledger;
using Microsoft.Foundation.Company;
using Microsoft.Bank.Check;
using Microsoft.Purchases.History;

report 50103 "Stationery Receipt"
{
    Caption = 'Stationery Receipt';
    ApplicationArea = Basic, Suite;
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = "StationeryReceipt.docx";
    WordMergeDataItem = "G/L Register";

    dataset
    {
        dataitem("G/L Register"; "G/L Register")
        {
            DataItemTableView = sorting("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(COMPANYNAME; CompanyInfo.Name)
            {
            }
            column(Address; CompanyInfo.Address)
            {
            }
            column(BoxNo; CompanyInfo."Post Code" + ' ' + CompanyInfo.City)
            {
            }
            column(PhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(VATRegNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(TINNO; CompanyInfo."TIN NO.")
            {
            }
            column(ShowLines; ShowDetails)
            {
            }
            column(G_L_Register__TABLECAPTION__________GLRegFilter; TableCaption + ': ' + GLRegFilter)
            {
            }
            column(GLRegFilter; GLRegFilter)
            {
            }
            column(G_L_Register__No__; "No.")
            {
            }
            column(G_L_RegisterCaption; G_L_RegisterCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(G_L_Entry__Posting_Date_Caption; G_L_Entry__Posting_Date_CaptionLbl)
            {
            }
            column(G_L_Entry__Document_Type_Caption; G_L_Entry__Document_Type_CaptionLbl)
            {
            }
            column(G_L_Entry__Document_No__Caption; "G/L Entry".FieldCaption("Document No."))
            {
            }
            column(G_L_Entry__G_L_Account_No__Caption; "G/L Entry".FieldCaption("G/L Account No."))
            {
            }
            column(GLAcc_NameCaption; GLAcc_NameCaptionLbl)
            {
            }
            column(G_L_Entry_DescriptionCaption; "G/L Entry".FieldCaption(Description))
            {
            }
            column(G_L_Entry__VAT_Amount_Caption; "G/L Entry".FieldCaption("VAT Amount"))
            {
            }
            column(G_L_Entry__Gen__Posting_Type_Caption; G_L_Entry__Gen__Posting_Type_CaptionLbl)
            {
            }
            column(G_L_Entry__Gen__Bus__Posting_Group_Caption; G_L_Entry__Gen__Bus__Posting_Group_CaptionLbl)
            {
            }
            column(G_L_Entry__Gen__Prod__Posting_Group_Caption; G_L_Entry__Gen__Prod__Posting_Group_CaptionLbl)
            {
            }
            column(G_L_Entry_AmountCaption; "G/L Entry".FieldCaption(Amount))
            {
            }
            column(G_L_Entry__Entry_No__Caption; "G/L Entry".FieldCaption("Entry No."))
            {
            }
            column(G_L_Register__No__Caption; G_L_Register__No__CaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemTableView = sorting("Entry No.");
                column(G_L_Entry__Posting_Date_; Format("Posting Date"))
                {
                }
                column(G_L_Entry__Document_Type_; "Document Type")
                {
                }
                column(G_L_Entry__Document_No__; "Document No.")
                {
                }
                column(G_L_Entry__G_L_Account_No__; "G/L Account No.")
                {
                }
                column(GLAcc_Name; GLAcc.Name)
                {
                }
                column(G_L_Entry_Description; Description)
                {
                }
                column(G_L_Entry__VAT_Amount_; DetailedVATAmount)
                {
                    AutoCalcField = true;
                }
                column(G_L_Entry__Gen__Posting_Type_; "Gen. Posting Type")
                {
                }
                column(G_L_Entry__Gen__Bus__Posting_Group_; "Gen. Bus. Posting Group")
                {
                }
                column(G_L_Entry__Gen__Prod__Posting_Group_; "Gen. Prod. Posting Group")
                {
                }
                column(G_L_Entry_Amount; Amount)
                {
                }
                column(G_L_Entry__Entry_No__; "Entry No.")
                {
                }
                column(G_L_Entry_Amount_Control41Caption; G_L_Entry_Amount_Control41CaptionLbl)
                {
                }
                column(AmountInWords; AmountInWords[1])
                {
                }
                trigger OnAfterGetRecord()
                begin
                    Check.InitTextVariable();
                    Check.FormatNoText(AmountInWords, Round(Amount, 0.01), '');

                    if not GLAcc.Get("G/L Account No.") then
                        GLAcc.Init();

                    DetailedVATAmount := "VAT Amount";

                    if not ShowDetails then
                        exit;
                end;

                trigger OnPreDataItem()
                begin
                    SetRange("Entry No.", "G/L Register"."From Entry No.", "G/L Register"."To Entry No.");
                end;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
            }
        }

        actions
        {
        }
    }

    rendering
    {
        layout("StationeryReceipt.docx")
        {
            Type = Word;
            LayoutFile = './xLayout/StationeryReceipt.docx';
            Caption = 'Stationery Receipt (WORD)';
            Summary = 'The Stationery Receipt (WORD) provides a basic layout.';
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        GLRegFilter := "G/L Register".GetFilters();
        TempPurchInvLinePrinted.DeleteAll();
    end;

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        GLAcc: Record "G/L Account";
        TempPurchInvLinePrinted: Record "Purch. Inv. Line" temporary;
        GLRegFilter: Text;
        G_L_RegisterCaptionLbl: Label 'G/L Register';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        G_L_Entry__Posting_Date_CaptionLbl: Label 'Posting Date';
        G_L_Entry__Document_Type_CaptionLbl: Label 'Document Type';
        GLAcc_NameCaptionLbl: Label 'Name';
        G_L_Entry__Gen__Posting_Type_CaptionLbl: Label 'Gen. Posting Type';
        G_L_Entry__Gen__Bus__Posting_Group_CaptionLbl: Label 'Gen. Bus. Posting Group';
        G_L_Entry__Gen__Prod__Posting_Group_CaptionLbl: Label 'Gen. Prod. Posting Group';
        G_L_Register__No__CaptionLbl: Label 'Register No.';
        TotalCaptionLbl: Label 'Total';
        G_L_Entry_Amount_Control41CaptionLbl: Label 'Total';
        ShowDetails: Boolean;
        DetailedVATAmount: Decimal;
        AmountInWords: array[1] of Text;
        Check: Report Check;

    local procedure DetailsPrinted(PurchInvLine: Record "Purch. Inv. Line"): Boolean
    begin
        if TempPurchInvLinePrinted.get(PurchInvLine."Document No.", PurchInvLine."Line No.") then
            exit(true);
        TempPurchInvLinePrinted."Document No." := PurchInvLine."Document No.";
        TempPurchInvLinePrinted."Line No." := PurchInvLine."Line No.";
        TempPurchInvLinePrinted.Insert();
    end;

    local procedure SetCurrancyFactor(HeaderCurrancyFactor: Decimal): Decimal
    begin
        if HeaderCurrancyFactor = 0 then
            exit(1);
        exit(HeaderCurrancyFactor);
    end;
}