codeunit 60100 "Finance Management"
{
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgmt: Codeunit "No. Series";
        GotSalesSetup: Boolean;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnAfterSubstituteLPOReport(ReportId: Integer; var NewReportId: Integer)
    begin
        if ReportId = Report::Order then
            NewReportId := Report::"LPO Report";

        if ReportId = Report::"Standard Sales - Invoice" then
            NewReportId := Report::"Tax Invoice Report";

        if ReportId = Report::"G/L Register" then
            NewReportId := Report::"Stationery Receipt";
    end;

    local procedure GetSalesSetup()
    begin
        if not GotSalesSetup then
            SalesSetup.Get();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    local procedure ValidateLocationCode(SalesHeader: Record "Sales Header")
    var
        SalesLines: Record "Sales Line";
    begin
        SalesHeader.TestField("ASL.Payment Method");
        SalesHeader.TestField("ASL.CashPaymentAccountNo");
        SalesLines.SetRange("Document Type", SalesLines."Document Type"::Order);
        SalesLines.SetRange("Document No.", SalesHeader."No.");
        SalesLines.SetRange(Type, SalesLines.Type::Item);
        if SalesLines.FindSet() then begin
            repeat
                if SalesLines."Location Code" = '' then begin
                    SalesLines.TestField("Location Code");
                end;
            until SalesLines.Next() = 0;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean)
    var
        SalesInvHeader: Record "Sales Invoice Header";
    begin
        SalesInvHeader.Get(SalesInvHdrNo);
        // check for invoice posted from cash sale 
        if SalesInvHeader."No." <> '' then begin
            SalesInvHeader.Get(SalesInvHeader."No.");
            PostReceipt(SalesInvHeader);
        end;
    end;

    local procedure PostReceipt(var SalesInvHeader: Record "Sales Invoice Header")
    begin
        // post and apply payment 
        GetSalesSetup();
        SalesSetup.TestField("Invoice Nos.");
        PostCashSaleReceiptJournalLine(
            SalesInvHeader,
            NoSeriesMgmt.GetNextNo(SalesSetup."Invoice Nos.", SalesInvHeader."Posting Date", true),
            SalesInvHeader."ASL.CashPaymentAccountNo"
        );
    end;

    local procedure PostCashSaleReceiptJournalLine(
        var SalesInvHeader: Record "Sales Invoice Header";
        PaymentDocumentNo: Code[20];
        PayFromBankAccNo: Code[20]
    )
    var
        GenJnlLine: Record "Gen. Journal Line";
        LineNo: Integer;
    begin
        // clear batch ''
        GenJnlLine.Reset();
        GenJnlLine.SetRange("Journal Template Name", '');
        GenJnlLine.SetRange("Journal Batch Name", '');
        if GenJnlLine.FindSet() then
            GenJnlLine.DeleteAll();

        GetSalesSetup();
        SalesInvHeader.CalcFields("Amount Including VAT");
        LineNo += 10000;
        InsertJournallLine(
            '',
            '',
            LineNo,
            SalesInvHeader."Posting Date",
            "Gen. Journal Document Type"::Payment,
            PaymentDocumentNo,
            "Gen. Journal Account Type"::Customer,
            SalesInvHeader."Bill-to Customer No.",
            SalesInvHeader."Sell-to Customer Name",
            0,
            SalesInvHeader."Amount Including VAT",
            "Gen. Journal Account Type"::"Bank Account",
            PayFromBankAccNo,
            true,
            "Gen. Journal Document Type"::Invoice,
            SalesInvHeader."No.",
            SalesInvHeader."Dimension Set ID",
            true
        );
    end;

    local procedure InsertJournallLine(
        TemplateName: Code[10];
        BatchName: Code[10];
        LineNo: Integer;
        PostingDate: Date;
        DocType: Enum "Gen. Journal Document Type";
        DocNo: Code[20];
        AccountType: Enum "Gen. Journal Account Type";
        AccountNo: Code[20];
        Description: Text[100];
        DebitAmount: Decimal;
        CreditAmount: Decimal;
        BalAccountType: Enum "Gen. Journal Account Type";
        BalAccountNo: Code[20];
        Apply: Boolean;
        AppliesToDocType: Enum "Gen. Journal Document Type";
        AppliesToDocNo: Code[20];
        DimSetID: Integer;
        Post: Boolean
    )
    var
        GenJournalLine: Record "Gen. Journal Line";
        GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
    begin
        GenJournalLine.Init();
        GenJournalLine."Journal Template Name" := TemplateName;
        GenJournalLine."Journal Batch Name" := BatchName;
        GenJournalLine."Line No." := LineNo;
        GenJournalLine."Source Code" := SalesSetup."ASL.CashSalesSourceCode";
        GenJournalLine.Validate("Posting Date", PostingDate);
        GenJournalLine.Validate("Document Type", DocType);
        GenJournalLine.Validate("Document No.", DocNo);
        GenJournalLine.Validate("Account Type", AccountType);
        GenJournalLine.Validate("Account No.", AccountNo);
        GenJournalLine.Validate(Description, Description);
        if DebitAmount > 0 then
            GenJournalLine.Validate("Debit Amount", DebitAmount)
        else
            if CreditAmount > 0 then
                GenJournalLine.Validate("Credit Amount", CreditAmount);

        if BalAccountNo <> '' then begin
            GenJournalLine.Validate(GenJournalLine."Bal. Account Type", BalAccountType);
            GenJournalLine.Validate(GenJournalLine."Bal. Account No.", BalAccountNo);
        end;

        if Apply then begin
            GenJournalLine.Validate("Applies-to Doc. Type", AppliesToDocType);
            GenJournalLine.Validate("Applies-to Doc. No.", AppliesToDocNo);
        end;

        GenJournalLine.Validate("Gen. Posting Type", "General Posting Type"::" ");
        GenJournalLine.Validate("Gen. Bus. Posting Group", '');
        GenJournalLine.Validate("Gen. Prod. Posting Group", '');
        GenJournalLine.Validate("VAT Bus. Posting Group", '');
        GenJournalLine.Validate("Bal. Gen. Posting Type", "General Posting Type"::" ");
        GenJournalLine.Validate("Bal. Gen. Bus. Posting Group", '');
        GenJournalLine.Validate("Bal. Gen. Prod. Posting Group", '');
        GenJournalLine.Validate("Bal. VAT Bus. Posting Group", '');

        GenJournalLine."Dimension Set ID" := DimSetID;

        GenJournalLine.Insert();

        // post and print
        if Post then begin
            GenJnlPostLine.RunWithCheck(GenJournalLine);
            Message('Journal Lines were posted successfully');
        end
        else
            Error('An error has ocurred try again');
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnAfterPostGenJnlLine', '', false, false)]
    local procedure PrintCustomerReceiptAfterPostingPayment(var GenJournalLine: Record "Gen. Journal Line")
    var
        TempBlob: Codeunit "Temp Blob";
        OutStream: OutStream;
        InStream: InStream;
        FileName: Text;
        RecRef: RecordRef;
        GenJnlLineFilter: Record "Gen. Journal Line";
    begin
        GenJnlLineFilter.Reset();
        GenJnlLineFilter.SetRange("Journal Template Name", GenJournalLine."Journal Template Name");
        GenJnlLineFilter.SetRange("Journal Batch Name", GenJournalLine."Journal Batch Name");
        GenJnlLineFilter.SetRange("Document No.", GenJournalLine."Document No.");
        if GenJnlLineFilter.FindSet() then begin
            repeat begin
                RecRef.GetTable(GenJnlLineFilter);
                TempBlob.CreateOutStream(OutStream);
                Report.SaveAs(60104, '', ReportFormat::Pdf, OutStream, RecRef);
                TempBlob.CreateInStream(InStream);
                FileName := 'CustomerReceipt.pdf';
                DownloadFromStream(InStream, 'Printing Customer Receipt', '', '', FileName);
            end until GenJnlLineFilter.Next() = 0;
        end;
    end;
}