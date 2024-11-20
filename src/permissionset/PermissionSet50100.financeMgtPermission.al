namespace financeMgtPermissionSets;

using FinanceManagement.FinanceManagement;

permissionset 50100 financeMgtPermission
{
    Assignable = true;
    Permissions = tabledata "ASL.CashSaleSetup"=RIMD,
        tabledata "ASL.PaymentMethod"=RIMD,
        table "ASL.CashSaleSetup"=X,
        table "ASL.PaymentMethod"=X,
        report Advances=X,
        report "Balance Sheet Report"=X,
        report "Bank Acc Trial Bal."=X,
        report "Budget Trial Balance"=X,
        report "Customer Receipt"=X,
        report "Income Statement Report"=X,
        report "LPO Report"=X,
        report "Member Balance to Date"=X,
        report "Members Detail Trial Balance"=X,
        report "Payment Receipt"=X,
        report Receipt=X,
        report "Stationery Trial Balance"=X,
        report "Tax Invoice Report"=X,
        report "Tenant Balance to Date"=X,
        report "Tenant Trial Balance"=X,
        report "Vendor Detail Trial Balance"=X,
        codeunit "ASL.WriteAmountInWords"=X,
        codeunit "Finance Management"=X,
        page "ASL.CashSaleSetup"=X,
        page "ASL.PaymentMethods"=X,
        page "Finance Role Center"=X,
        page "Stationery Card Lines"=X,
        page "Stationery Sales"=X,
        page "Stationery Sales Line FactBox"=X,
        page "Stationery Sales List"=X,
        page "Stationery Sells History"=X;
}