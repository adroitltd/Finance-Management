codeunit 60100 "Finance Management"
{
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
}