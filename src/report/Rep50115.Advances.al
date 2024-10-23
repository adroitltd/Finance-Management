namespace FinanceManagement.FinanceManagement;

using Microsoft.HumanResources.Payables;
using Microsoft.HumanResources.Employee;
using Microsoft.Foundation.Company;

/// <summary>
/// Not yet focusing on checking if advance was already accounted for. 
/// Just brings entries in Employee Ledger Entry and filters per Employee Posting Group
/// </summary>
report 50115 Advances
{
    ApplicationArea = All;
    Caption = 'Advances';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './xLayout/Advances.rdl';

    dataset
    {
        dataitem(EmployeeLedgerEntry; "Employee Ledger Entry")
        {
            RequestFilterHeading = 'Employee Advances';
            RequestFilterFields = "Employee Posting Group", "Posting Date";
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
            column(TitleLabel; TitleLabel)
            {
            }
            column(EntryNo; "Entry No.")
            {
            }
            column(EmployeeNo; "Employee No.")
            {
            }
            column(EmployeeName; EmployeeName)
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
            column(EmployeePostingGroup; "Employee Posting Group")
            {
            }
            column(GlobalDimension1Code; "Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code; "Global Dimension 2 Code")
            {
            }
            column(SalespersPurchCode; "Salespers./Purch. Code")
            {
            }
            column(UserID; "User ID")
            {
            }
            column(SourceCode; "Source Code")
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
            column(AmounttoApply; "Amount to Apply")
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
            column(CreditorNo; "Creditor No.")
            {
            }
            column(PaymentReference; "Payment Reference")
            {
            }
            column(PaymentMethodCode; "Payment Method Code")
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

            trigger OnAfterGetRecord()
            begin
                Employee.Reset();
                Employee.SetRange("No.", EmployeeLedgerEntry."Employee No.");
                if Employee.FindSet() then
                    EmployeeName := Employee.FullName();
            end;

            trigger OnPreDataItem()
            begin
                if EmployeeLedgerEntry."Employee Posting Group" = 'ACTIV*' then
                    TitleLabel := ActivitiesAdvancesLabel
                else if EmployeeLedgerEntry."Employee Posting Group" = 'GRAT*' then
                    TitleLabel := GratuityAdvancesLabel;
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
        TitleLabel: Text;
        ActivitiesAdvancesLabel: Label 'Activities Advances';
        GratuityAdvancesLabel: Label 'Gratuity Advances';
        Employee: Record Employee;
        EmployeeName: Text;
}
