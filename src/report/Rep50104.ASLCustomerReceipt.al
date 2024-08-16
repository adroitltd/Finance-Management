report 50104 "ASL.CustomerReceipt"
{
    ApplicationArea = Basic, Suite;
    Caption = 'ASL.CustomerReceipt';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = "CustomerReceipt.docx";
    WordMergeDataItem = GenJournalLine;

    dataset
    {
        dataitem(GenJournalLine; "Gen. Journal Line")
        {
            RequestFilterHeading = 'Customer Receipt';
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(JournalTemplateName; "Journal Template Name")
            {
            }
            column(LineNo; "Line No.")
            {
            }
            column(AccountType; "Account Type")
            {
            }
            column(AccountNo; "Account No.")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(DocumentType; "Document Type")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(Description; Description)
            {
            }
            column(VAT; "VAT %")
            {
            }
            column(BalAccountNo; "Bal. Account No.")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(Amount; Amount)
            {
            }
            column(DebitAmount; "Debit Amount")
            {
            }
            column(CreditAmount; "Credit Amount")
            {
            }
            column(AmountLCY; "Amount (LCY)")
            {
            }
            column(BalanceLCY; "Balance (LCY)")
            {
            }
            column(CurrencyFactor; "Currency Factor")
            {
            }
            column(SalesPurchLCY; "Sales/Purch. (LCY)")
            {
            }
            column(ProfitLCY; "Profit (LCY)")
            {
            }
            column(InvDiscountLCY; "Inv. Discount (LCY)")
            {
            }
            column(BilltoPaytoNo; "Bill-to/Pay-to No.")
            {
            }
            column(PostingGroup; "Posting Group")
            {
            }
            column(ShortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(SalespersPurchCode; "Salespers./Purch. Code")
            {
            }
            column(PendingApproval; "Pending Approval")
            {
            }
            column(SourceCode; "Source Code")
            {
            }
            column(SystemCreatedEntry; "System-Created Entry")
            {
            }
            column(YourReference; "Your Reference")
            {
            }
            column(OnHold; "On Hold")
            {
            }
            column(AppliestoDocType; "Applies-to Doc. Type")
            {
            }
            column(AppliestoDocNo; "Applies-to Doc. No.")
            {
            }
            column(DueDate; "Due Date")
            {
            }
            column(PmtDiscountDate; "Pmt. Discount Date")
            {
            }
            column(PaymentDiscount; "Payment Discount %")
            {
            }
            column(JobNo; "Job No.")
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(VATAmount; "VAT Amount")
            {
            }
            column(VATPosting; "VAT Posting")
            {
            }
            column(PaymentTermsCode; "Payment Terms Code")
            {
            }
            column(AppliestoID; "Applies-to ID")
            {
            }
            column(BusinessUnitCode; "Business Unit Code")
            {
            }
            column(JournalBatchName; "Journal Batch Name")
            {
            }
            column(ReasonCode; "Reason Code")
            {
            }
            column(RecurringMethod; "Recurring Method")
            {
            }
            column(ExpirationDate; "Expiration Date")
            {
            }
            column(RecurringFrequency; "Recurring Frequency")
            {
            }
            column(AllocatedAmtLCY; "Allocated Amt. (LCY)")
            {
            }
            column(GenPostingType; "Gen. Posting Type")
            {
            }
            column(GenBusPostingGroup; "Gen. Bus. Posting Group")
            {
            }
            column(GenProdPostingGroup; "Gen. Prod. Posting Group")
            {
            }
            column(VATCalculationType; "VAT Calculation Type")
            {
            }
            column(EU3PartyTrade; "EU 3-Party Trade")
            {
            }
            column(AllowApplication; "Allow Application")
            {
            }
            column(BalAccountType; "Bal. Account Type")
            {
            }
            column(BalGenPostingType; "Bal. Gen. Posting Type")
            {
            }
            column(BalGenBusPostingGroup; "Bal. Gen. Bus. Posting Group")
            {
            }
            column(BalGenProdPostingGroup; "Bal. Gen. Prod. Posting Group")
            {
            }
            column(BalVATCalculationType; "Bal. VAT Calculation Type")
            {
            }
            column(BalVAT; "Bal. VAT %")
            {
            }
            column(BalVATAmount; "Bal. VAT Amount")
            {
            }
            column(BankPaymentType; "Bank Payment Type")
            {
            }
            column(VATBaseAmount; "VAT Base Amount")
            {
            }
            column(BalVATBaseAmount; "Bal. VAT Base Amount")
            {
            }
            column(Correction; Correction)
            {
            }
            column(PrintPostedDocuments; "Print Posted Documents")
            {
            }
            column(CheckPrinted; "Check Printed")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(ExternalDocumentNo; "External Document No.")
            {
            }
            column(SourceType; "Source Type")
            {
            }
            column(SourceNo; "Source No.")
            {
            }
            column(PostingNoSeries; "Posting No. Series")
            {
            }
            column(VATBusPostingGroup; "VAT Bus. Posting Group")
            {
            }
            column(VATProdPostingGroup; "VAT Prod. Posting Group")
            {
            }
            column(BalVATBusPostingGroup; "Bal. VAT Bus. Posting Group")
            {
            }
            column(BalVATProdPostingGroup; "Bal. VAT Prod. Posting Group")
            {
            }
            column(AdditionalCurrencyPosting; "Additional-Currency Posting")
            {
            }
            column(FAAddCurrencyFactor; "FA Add.-Currency Factor")
            {
            }
            column(SourceCurrencyCode; "Source Currency Code")
            {
            }
            column(SourceCurrencyAmount; "Source Currency Amount")
            {
            }
            column(SourceCurrVATBaseAmount; "Source Curr. VAT Base Amount")
            {
            }
            column(SourceCurrVATAmount; "Source Curr. VAT Amount")
            {
            }
            column(VATBaseDiscount; "VAT Base Discount %")
            {
            }
            column(VATAmountLCY; "VAT Amount (LCY)")
            {
            }
            column(VATBaseAmountLCY; "VAT Base Amount (LCY)")
            {
            }
            column(BalVATAmountLCY; "Bal. VAT Amount (LCY)")
            {
            }
            column(BalVATBaseAmountLCY; "Bal. VAT Base Amount (LCY)")
            {
            }
            column(ReversingEntry; "Reversing Entry")
            {
            }
            column(AllowZeroAmountPosting; "Allow Zero-Amount Posting")
            {
            }
            column(ShiptoOrderAddressCode; "Ship-to/Order Address Code")
            {
            }
            column(VATDifference; "VAT Difference")
            {
            }
            column(BalVATDifference; "Bal. VAT Difference")
            {
            }
            column(SelltoBuyfromNo; "Sell-to/Buy-from No.")
            {
            }
            column(VATRegistrationNo; "VAT Registration No.")
            {
            }
            column(CountryRegionCode; "Country/Region Code")
            {
            }
            column(Prepayment; Prepayment)
            {
            }
            column(FinancialVoid; "Financial Void")
            {
            }
            column(CopyVATSetuptoJnlLines; "Copy VAT Setup to Jnl. Lines")
            {
            }
            column(VATBaseBeforePmtDisc; "VAT Base Before Pmt. Disc.")
            {
            }
            column(OrigPmtDiscPossible; "Orig. Pmt. Disc. Possible")
            {
            }
            column(OrigPmtDiscPossibleLCY; "Orig. Pmt. Disc. Possible(LCY)")
            {
            }
            column(VATReportingDate; "VAT Reporting Date")
            {
            }
            column(PaymentReference; "Payment Reference")
            {
            }
            column(PaymentMethodCode; "Payment Method Code")
            {
            }
            column(AppliestoExtDocNo; "Applies-to Ext. Doc. No.")
            {
            }
            column(InvoiceReceivedDate; "Invoice Received Date")
            {
            }
            column(KeepDescription; "Keep Description")
            {
            }
            column(RecipientBankAccount; "Recipient Bank Account")
            {
            }
            column(MessagetoRecipient; "Message to Recipient")
            {
            }
            column(ExportedtoPaymentFile; "Exported to Payment File")
            {
            }
            column(HasPaymentExportError; "Has Payment Export Error")
            {
            }
            column(DimensionSetID; "Dimension Set ID")
            {
            }
            column(DirectDebitMandateID; "Direct Debit Mandate ID")
            {
            }
            column(DataExchEntryNo; "Data Exch. Entry No.")
            {
            }
            column(PayerInformation; "Payer Information")
            {
            }
            column(TransactionInformation; "Transaction Information")
            {
            }
            column(DataExchLineNo; "Data Exch. Line No.")
            {
            }
            column(AppliedAutomatically; "Applied Automatically")
            {
            }
            column(LinkedTableID; "Linked Table ID")
            {
            }
            column(LinkedSystemID; "Linked System ID")
            {
            }
            column(DeferralCode; "Deferral Code")
            {
            }
            column(DeferralLineNo; "Deferral Line No.")
            {
            }
            column(SelectedAllocAccountNo; "Selected Alloc. Account No.")
            {
            }
            column(AllocAccModifiedbyUser; "Alloc. Acc. Modified by User")
            {
            }
            column(AllocationAccountNo; "Allocation Account No.")
            {
            }
            column(CampaignNo; "Campaign No.")
            {
            }
            column(ProdOrderNo; "Prod. Order No.")
            {
            }
            column(FAPostingDate; "FA Posting Date")
            {
            }
            column(FAPostingType; "FA Posting Type")
            {
            }
            column(DepreciationBookCode; "Depreciation Book Code")
            {
            }
            column(SalvageValue; "Salvage Value")
            {
            }
            column(NoofDepreciationDays; "No. of Depreciation Days")
            {
            }
            column(DepruntilFAPostingDate; "Depr. until FA Posting Date")
            {
            }
            column(DeprAcquisitionCost; "Depr. Acquisition Cost")
            {
            }
            column(MaintenanceCode; "Maintenance Code")
            {
            }
            column(InsuranceNo; "Insurance No.")
            {
            }
            column(BudgetedFANo; "Budgeted FA No.")
            {
            }
            column(DuplicateinDepreciationBook; "Duplicate in Depreciation Book")
            {
            }
            column(UseDuplicationList; "Use Duplication List")
            {
            }
            column(FAReclassificationEntry; "FA Reclassification Entry")
            {
            }
            column(FAErrorEntryNo; "FA Error Entry No.")
            {
            }
            column(IndexEntry; "Index Entry")
            {
            }
            column(SourceLineNo; "Source Line No.")
            {
            }
            column(Comment; Comment)
            {
            }
            column(CheckExported; "Check Exported")
            {
            }
            column(CheckTransmitted; "Check Transmitted")
            {
            }
            column(ReverseDateCalculation; "Reverse Date Calculation")
            {
            }
            column(NonDeductibleVAT; "Non-Deductible VAT %")
            {
            }
            column(NonDeductibleVATBase; "Non-Deductible VAT Base")
            {
            }
            column(NonDeductibleVATAmount; "Non-Deductible VAT Amount")
            {
            }
            column(NonDeductibleVATBaseLCY; "Non-Deductible VAT Base LCY")
            {
            }
            column(NonDeductibleVATAmountLCY; "Non-Deductible VAT Amount LCY")
            {
            }
            column(NonDeductibleVATBaseACY; "Non-Deductible VAT Base ACY")
            {
            }
            column(NonDeductibleVATAmountACY; "Non-Deductible VAT Amount ACY")
            {
            }
            column(FAGLAccountNo; "FA G/L Account No.")
            {
            }
            column(NonDeductibleVATDiff; "Non-Deductible VAT Diff.")
            {
            }
            column(BalNonDedVAT; "Bal. Non-Ded. VAT %")
            {
            }
            column(BalNonDedVATBase; "Bal. Non-Ded. VAT Base")
            {
            }
            column(BalNonDedVATAmount; "Bal. Non-Ded. VAT Amount")
            {
            }
            column(BalNonDedVATBaseLCY; "Bal. Non-Ded. VAT Base LCY")
            {
            }
            column(BalNonDedVATAmountLCY; "Bal. Non-Ded. VAT Amount LCY")
            {
            }
            column(AccountId; "Account Id")
            {
            }
            column(CustomerId; "Customer Id")
            {
            }
            column(AppliestoInvoiceId; "Applies-to Invoice Id")
            {
            }
            column(ContactGraphId; "Contact Graph Id")
            {
            }
            column(LastModifiedDateTime; "Last Modified DateTime")
            {
            }
            column(JournalBatchId; "Journal Batch Id")
            {
            }
            column(PaymentMethodId; "Payment Method Id")
            {
            }
            column(BalanceAccountId; "Balance Account Id")
            {
            }
            column(VendorId; "Vendor Id")
            {
            }
            column(AmountInWords; NoText[1])
            {
            }

            trigger OnAfterGetRecord()
            begin
                WriteAmountInWords.InitTextVariable();
                WriteAmountInWords.FormatNoText(NoText, "Debit Amount", '');

                // ReportCheck.InitTextVariable();
                // ReportCheck.FormatNoText(NoText, Round(GenJournalLine."Debit Amount", 0.01), '');
                // AmountInWords := NoText[1];
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    rendering
    {
        layout("CustomerReceipt.docx")
        {
            Type = Word;
            LayoutFile = './xLayout/CustomerReceipt.docx';
            Caption = 'Customer Receipt (WORD)';
            Summary = 'The Customer Receipt (WORD) provides a basic layout.';
        }
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        ReportCheck: Report Check;
        NoText: array[1] of Text;
        AmountInWords: Text;
        WriteAmountInWords: Codeunit "ASL.WriteAmountInWords";
}