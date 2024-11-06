namespace FinanceManagement.FinanceManagement;

using Microsoft.Finance.GeneralLedger.Journal;

enumextension 50100 "Gen. Journal Document Type Ext" extends "Gen. Journal Document Type"
{
    value(50100; "ASL.PRL.ActivityAdvance")
    {
        Caption = 'Activity Advance';
    }
    value(50101; "ASL.PRL.SalaryAdvance")
    {
        Caption = 'Salary Advance';
    }
    value(50102; "ASL.PRL.GratuityAdvance")
    {
        Caption = 'Gratuity Advance';
    }
    value(50103; "ASL.PRL.AdvancePayment")
    {
        Caption = 'Advance Payment';
    }
}
