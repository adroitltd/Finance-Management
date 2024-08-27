namespace extensionPermission;

using FinanceManagement.FinanceManagement;

permissionset 50100 extensionPermission
{
    Assignable = true;
    Permissions = tabledata "ASL.CashSaleSetup"=RIMD,
        tabledata "ASL.PaymentMethod"=RIMD,
        table "ASL.CashSaleSetup"=X,
        table "ASL.PaymentMethod"=X,
        report "Customer Receipt"=X,
        report "LPO Report"=X,
        report "Payment Receipt"=X,
        report "Tax Invoice Report"=X,
        codeunit "ASL.WriteAmountInWords"=X,
        codeunit "Finance Management"=X,
        page "ASL.CashSaleSetup"=X,
        page "ASL.PaymentMethods"=X,
        page "Stationery Card Lines"=X,
        page "Stationery Sales"=X,
        page "Stationery Sales Line FactBox"=X,
        page "Stationery Sells History"=X;
}