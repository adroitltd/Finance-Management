codeunit 50100 "Finance Management"
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
        if ReportId=Report::"Standard Purchase - Order" then
            NewReportId:=Report::"LPO Report";
        if ReportId=Report::"Standard Sales - Invoice" then
            NewReportId := Report::"Tax Invoice Report";
        if ReportId = Report::"Bank Acc. - Detail Trial Bal." then
            NewReportId := Report::"Bank Acc Trial Bal.";
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
        // SalesHeader.TestField("ASL.Payment Method");
        // SalesHeader.TestField("ASL.CashPaymentAccountNo");
        // SalesHeader.TestField("Cash Sale Cust. Name");
        // SalesHeader.TestField(Narration);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean)
    var
        SalesInvHeader: Record "Sales Invoice Header";
    begin 
        SalesInvHeader.Get(SalesInvHdrNo);
        // Prevent this when a normal sales order is posted
        if SalesInvHeader."ASL.CashPaymentAccountNo" = '' then exit;
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
        SalesSetup.TestField("Cash Sale Receipt Nos.");
        PostCashSaleReceiptJournalLine(
            SalesInvHeader,
            NoSeriesMgmt.GetNextNo(SalesSetup."Invoice Nos.", SalesInvHeader."Posting Date", true),
            NoSeriesMgmt.GetNextNo(SalesSetup."Cash Sale Receipt Nos.", SalesInvHeader."Posting Date", true),
            SalesInvHeader."ASL.CashPaymentAccountNo"
        );
    end;

    local procedure PostCashSaleReceiptJournalLine(
        var SalesInvHeader: Record "Sales Invoice Header";
        PaymentDocumentNo: Code[20];
        ReceiptNo: Code[20];
        PayToAccNo: Code[20]
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
            ReceiptNo,
            "Gen. Journal Account Type"::Customer,
            SalesInvHeader."Bill-to Customer No.",
            SalesInvHeader."Cash Sale Cust. Name",
            SalesInvHeader."Cash Sale Cust. Telephone No.",
            SalesInvHeader.Narration,
            0,
            SalesInvHeader."Amount Including VAT",
            "Gen. Journal Account Type"::"G/L Account",
            PayToAccNo,
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
        CashSaleReceiptNo: Code[20];
        AccountType: Enum "Gen. Journal Account Type";
        AccountNo: Code[20];
        CustomerName: Text[100];
        CustomerTelephoneNo: Text[15];
        CashSaleNarration: Text;
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
        GenLedgerSetup: Record "General Ledger Setup";
    begin
        GenJournalLine.Init();
        GenJournalLine."Journal Template Name" := TemplateName;
        GenJournalLine."Journal Batch Name" := BatchName;
        GenJournalLine."Line No." := LineNo;
        GenJournalLine."Source Code" := SalesSetup."ASL.CashSalesSourceCode";
        GenJournalLine."Currency Code" := GenLedgerSetup."LCY Code";
        GenJournalLine.Validate("Posting Date", PostingDate);
        GenJournalLine.Validate("Document Type", DocType);
        GenJournalLine.Validate("Document No.", DocNo);
        GenJournalLine.Validate("Cash Sale Receipt No.", CashSaleReceiptNo);
        GenJournalLine.Validate("Account Type", AccountType);
        GenJournalLine.Validate("Account No.", AccountNo);
        GenJournalLine.Validate("Cash Sale Cust. Name", CustomerName);
        GenJournalLine.Validate("Cash Sale Cust. Telephone No.", CustomerTelephoneNo);
        GenJournalLine.Validate(Narration, CashSaleNarration);
        if DebitAmount > 0 then 
            GenJournalLine.Validate("Debit Amount", DebitAmount)
        else
            if CreditAmount > 0 then GenJournalLine.Validate("Credit Amount", CreditAmount);

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
    local procedure PrintCustomerReceipt(var GenJournalLine: Record "Gen. Journal Line")
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
        GenJnlLineFilter.SetRange("Account Type", GenJournalLine."Account Type"::Customer);

        if GenJnlLineFilter.FindSet() then begin
            repeat
                if (GenJnlLineFilter."Cash Sale Receipt No." <> '') or (GenJnlLineFilter."Cash Sale Cust. Name" <> '') or (GenJnlLineFilter.Narration <> '') then begin
                    RecRef.GetTable(GenJnlLineFilter);
                    TempBlob.CreateOutStream(OutStream);
                    // Print Cash Sale Receipt
                    Report.SaveAs(50103, '', ReportFormat::Pdf, OutStream, RecRef);
                end else begin
                    RecRef.GetTable(GenJnlLineFilter);
                    TempBlob.CreateOutStream(OutStream);
                    // Print Normal Receipt from Cash Receipt Journals
                    Report.SaveAs(50102, '', ReportFormat::Pdf, OutStream, RecRef);
                end;

                TempBlob.CreateInStream(InStream);
                FileName := 'CustomerReceipt.pdf';
                DownloadFromStream(InStream, 'Printing Customer Receipt', '', '', FileName);
            until GenJnlLineFilter.Next() = 0;
        end;
    end;

}