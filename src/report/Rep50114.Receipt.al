namespace FinanceManagement.FinanceManagement;

using Microsoft.Sales.Receivables;
using Microsoft.Sales.Customer;
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Foundation.Company;

report 50114 Receipt
{
    ApplicationArea = All;
    Caption = 'Receipt';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout=RDLC;
    RDLCLayout='./xLayout/Receipt.rdl';

    dataset
    {
        dataitem(CustLedgerEntry; "Cust. Ledger Entry")
        {
            RequestFilterHeading='Customer Ledger Entries';
            RequestFilterFields="Customer No.", "Customer Name", "Posting Date";

            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyAddress; CompanyInfo.Address)
            {
            }
            column(PostCode; CompanyInfo."Post Code" + ' ' + CompanyInfo.City)
            {
            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyVATRegNo; CompanyInfo."VAT Registration No.")
            {
            }
            column(CompanyTIN; CompanyInfo."TIN NO.")
            {
            }
            column(EntryNo; "Entry No.")
            {
            }
            column(CustomerNo; "Customer No.")
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
            column(CustomerName; CustomerName)
            {
            }
            column(CustomerTIN;CustomerTIN)
            {

            }
            column(YourReference; "Your Reference")
            {
            }
            column(CurrencyCode; "Currency Code")
            {
            }
            column(Amount; Amount)
            {
            }
            column(RemainingAmount; "Remaining Amount")
            {
            }
            column(OriginalAmtLCY; "Original Amt. (LCY)")
            {
            }
            column(RemainingAmtLCY; "Remaining Amt. (LCY)")
            {
            }
            column(AmountLCY; "Amount (LCY)")
            {
            }
            column(SalesLCY; "Sales (LCY)")
            {
            }
            column(ProfitLCY; "Profit (LCY)")
            {
            }
            column(InvDiscountLCY; "Inv. Discount (LCY)")
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(CustomerPostingGroup; "Customer Posting Group")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(SalespersonCode; "Salesperson Code")
            {
            }
            column(UserID; "User ID")
            {
            }
            column(SourceCode; "Source Code")
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
            column(Open; Open)
            {
            }
            column(DueDate; "Due Date")
            {
            }
            column(PmtDiscountDate; "Pmt. Discount Date")
            {
            }
            column(OriginalPmtDiscPossible; "Original Pmt. Disc. Possible")
            {
            }
            column(PmtDiscGivenLCY; "Pmt. Disc. Given (LCY)")
            {
            }
            column(OrigPmtDiscPossibleLCY; "Orig. Pmt. Disc. Possible(LCY)")
            {
            }
            column(Positive; Positive)
            {
            }
            column(ClosedbyEntryNo; "Closed by Entry No.")
            {
            }
            column(ClosedatDate; "Closed at Date")
            {
            }
            column(ClosedbyAmount; "Closed by Amount")
            {
            }
            column(AppliestoID; "Applies-to ID")
            {
            }
            column(JournalTemplName; "Journal Templ. Name")
            {
            }
            column(JournalBatchName; "Journal Batch Name")
            {
            }
            column(ReasonCode; "Reason Code")
            {
            }
            column(BalAccountType; "Bal. Account Type")
            {
            }
            column(BalAccountNo; "Bal. Account No.")
            {
            }
            column(TransactionNo; "Transaction No.")
            {
            }
            column(ClosedbyAmountLCY; "Closed by Amount (LCY)")
            {
            }
            column(DebitAmount; "Debit Amount")
            {
            }
            column(CreditAmount; "Credit Amount")
            {
            }
            column(DebitAmountLCY; "Debit Amount (LCY)")
            {
            }
            column(CreditAmountLCY; "Credit Amount (LCY)")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(ExternalDocumentNo; "External Document No.")
            {
            }
            column(CalculateInterest; "Calculate Interest")
            {
            }
            column(ClosingInterestCalculated; "Closing Interest Calculated")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(ClosedbyCurrencyCode; "Closed by Currency Code")
            {
            }
            column(ClosedbyCurrencyAmount; "Closed by Currency Amount")
            {
            }
            column(AdjustedCurrencyFactor; "Adjusted Currency Factor")
            {
            }
            column(OriginalCurrencyFactor; "Original Currency Factor")
            {
            }
            column(OriginalAmount; "Original Amount")
            {
            }
            column(RemainingPmtDiscPossible; "Remaining Pmt. Disc. Possible")
            {
            }
            column(PmtDiscToleranceDate; "Pmt. Disc. Tolerance Date")
            {
            }
            column(MaxPaymentTolerance; "Max. Payment Tolerance")
            {
            }
            column(LastIssuedReminderLevel; "Last Issued Reminder Level")
            {
            }
            column(AcceptedPaymentTolerance; "Accepted Payment Tolerance")
            {
            }
            column(AcceptedPmtDiscTolerance; "Accepted Pmt. Disc. Tolerance")
            {
            }
            column(PmtToleranceLCY; "Pmt. Tolerance (LCY)")
            {
            }
            column(AmounttoApply; "Amount to Apply")
            {
            }
            column(ICPartnerCode; "IC Partner Code")
            {
            }
            column(ApplyingEntry; "Applying Entry")
            {
            }
            column(Reversed; Reversed)
            {
            }
            column(ReversedbyEntryNo; "Reversed by Entry No.")
            {
            }
            column(ReversedEntryNo; "Reversed Entry No.")
            {
            }
            column(Prepayment; Prepayment)
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
            column(RecipientBankAccount; "Recipient Bank Account")
            {
            }
            column(MessagetoRecipient; "Message to Recipient")
            {
            }
            column(ExportedtoPaymentFile; "Exported to Payment File")
            {
            }
            column(DimensionSetID; "Dimension Set ID")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(ShortcutDimension4Code; "Shortcut Dimension 4 Code")
            {
            }
            column(ShortcutDimension5Code; "Shortcut Dimension 5 Code")
            {
            }
            column(ShortcutDimension6Code; "Shortcut Dimension 6 Code")
            {
            }
            column(ShortcutDimension7Code; "Shortcut Dimension 7 Code")
            {
            }
            column(ShortcutDimension8Code; "Shortcut Dimension 8 Code")
            {
            }
            column(DirectDebitMandateID; "Direct Debit Mandate ID")
            {
            }
            column(DisputeStatus; "Dispute Status")
            {
            }
            column(PromisedPayDate; "Promised Pay Date")
            {
            }
            column(AmountInWords; NoText[1])
            {
            }
            column(Currency_Code; "Currency Code")
            {
            }

            trigger OnAfterGetRecord()
            begin
                WriteAmountInWords.InitTextVariable();
                WriteAmountInWords.FormatNoText(NoText, "Credit Amount", CustLedgerEntry."Currency Code");
           
                Customer.Reset();
                Customer.SetRange("No.", CustLedgerEntry."Customer No.");
                if Customer.FindSet() then begin
                    CustomerName := Customer.Name;
                    CustomerTIN:=Customer.TIN;
                end;

                if "Currency Code" = '' then begin
                    GenLedgerSetup.Get();
                    "Currency Code" := GenLedgerSetup."LCY Code";
                end;
            end;

            trigger OnPreDataItem()
            begin
                // SetRange("Document Type", "Document Type"::Payment);
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

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        NoText: array[1] of Text;
        WriteAmountInWords: Codeunit "ASL.WriteAmountInWords";
        Customer: Record Customer;
        CustomerName: Text;
        CustomerTIN: Text;
        GenLedgerSetup: Record "General Ledger Setup";
}
