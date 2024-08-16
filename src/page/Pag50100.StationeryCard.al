namespace FinanceManagement.FinanceManagement;

using Microsoft.Bank.Setup;
using Microsoft.CRM.Contact;
using Microsoft.Finance.Currency;
using Microsoft.Finance.GeneralLedger.Setup;
using Microsoft.Foundation.Address;
using Microsoft.Foundation.Attachment;
using Microsoft.Foundation.Enums;
using Microsoft.Foundation.Reporting;
using Microsoft.Sales.Document;
using Microsoft.Sales.Customer;
using Microsoft.Sales.History;
using Microsoft.Sales.Posting;
using Microsoft.Sales.Setup;
using Microsoft.Utilities;
using System.Automation;
using System.Environment.Configuration;
using System.Privacy;
using System.Security.User;

page 50100 "Stationery Card"
{
    ApplicationArea = All;
    Caption = 'Stationery Card';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Sales Header";
    SourceTableView = where("Document Type" = filter(Order));
    AdditionalSearchTerms = 'Sta Card, Stationery Card, St Card';
    UsageCategory = Documents;
    AboutTitle = 'About Stationery Card details';
    AboutText = 'Choose the Stationery details and fill in Stationery lines with quantities of what you are selling. Post the Stationery when you are ready to ship or invoice. This creates posted sales shipments and posted sales invoices.';
    PromotedActionCategories = 'New,Process,Report,Posting';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Visible = DocNoVisible;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer No.';
                    Importance = Additional;
                    NotBlank = true;
                    ToolTip = 'Specifies the number of the customer who will receive the products and be billed by default.';

                    trigger OnValidate()
                    begin
                        IsSalesLinesEditable := Rec.SalesLinesEditable();
                        Rec.SelltoCustomerNoOnAfterValidate(Rec, xRec);
                        CurrPage.Update();
                    end;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Customer Name';
                    ShowMandatory = true;
                    ToolTip = 'Specifies the name of the customer who will receive the products and be billed by default.';
                    AboutTitle = 'Who are you selling to?';
                    AboutText = 'You can choose existing customers, or add new customers when you create orders. Orders can automatically choose special prices and discounts that you have set for each customer.';

                    trigger OnValidate()
                    begin
                        Rec.SelltoCustomerNoOnAfterValidate(Rec, xRec);
                        CurrPage.Update();
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(Rec.LookupSellToCustomerName(Text));
                    end;
                }
                group("Sell-to")
                {
                    Caption = 'Sell-to';
                    field("Sell-to Address"; Rec."Sell-to Address")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Address';
                        Importance = Additional;
                        QuickEntry = false;
                        ToolTip = 'Specifies the address where the customer is located.';
                    }
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';

                    trigger OnValidate()
                    begin
                        SaveInvoiceDiscountAmount();
                    end;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    QuickEntry = false;
                    ToolTip = 'Specifies the date the order was created. The order date is also used to determine the prices and discounts on the document.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic, Suite;
                    Importance = Promoted;
                    ToolTip = 'Specifies when the related sales invoice must be paid.';
                    AboutTitle = 'When is payment due?';
                    AboutText = 'When you post an order, the invoice gets it''s due date. You can set default due dates for orders by assigning payment terms to customers.';
                }
                group("Work Description")
                {
                    Caption = 'Work Description';
                    field(WorkDescription; WorkDescription)
                    {
                        ApplicationArea = Basic, Suite;
                        Importance = Additional;
                        MultiLine = true;
                        ShowCaption = false;
                        ToolTip = 'Specifies the products or service being offered.';

                        trigger OnValidate()
                        begin
                            Rec.SetWorkDescription(WorkDescription);
                        end;
                    }
                }
                field(Seller; Rec.Seller)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Payment Method"; Rec."ASL.Payment Method")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Method';
                }
                field("ASL.CashPaymentAccountNo"; Rec."ASL.CashPaymentAccountNo")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payment Account No.';
                }
            }
            part(StationeryLines; "Stationery Card Lines")
            {
                ApplicationArea = Basic, Suite;
                Editable = IsSalesLinesEditable;
                Enabled = IsSalesLinesEditable;
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }
        }
        area(factboxes)
        {
            part(SalesDocCheckFactbox; "Sales Doc. Check Factbox")
            {
                ApplicationArea = All;
                Caption = 'Document Check';
                Visible = SalesDocCheckFactboxVisible;
                SubPageLink = "No." = field("No."), "Document Type" = field("Document Type");
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Sales Header"), "No." = field("No."), "Document Type" = field("Document Type");
            }
            part(Control1903720907; "Stationery Sells History")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("Sell-to Customer No."), "Date Filter" = field("Date Filter");
            }
            part(Control1900316107; "Customer Details FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("Sell-to Customer No."), "Date Filter" = field("Date Filter");
            }
            part(Control1906127307; "Stationery Sales Line FactBox")
            {
                ApplicationArea = Suite;
                Provider = StationeryLines;
                SubPageLink = "Document Type" = field("Document Type"), "Document No." = field("Document No."), "Line No." = field("Line No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Post)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'P&ost';
                Ellipsis = true;
                Image = PostOrder;
                Promoted = true;
                PromotedCategory = Category4;
                ShortCutKey = 'F9';
                ToolTip = 'Finalize the document or journal by posting the amounts and quantities to the related accounts in your company books.';
                AboutTitle = 'Posting the order';
                AboutText = 'Posting will ship or invoice the quantities on the order, or both. **Post** and **Send** can save the order as a file, print it, or attach it to an email, all in one go.';

                trigger OnAction()
                begin
                    PostSalesOrder(CODEUNIT::"Sales-Post (Yes/No)", Enum::"Navigate After Posting"::"Do Nothing");
                end;
            }
            action("Test Report")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Test Report';
                Ellipsis = true;
                Image = TestReport;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'View a test report so that you can find and correct any errors before you perform the actual posting of the journal or document.';

                trigger OnAction()
                begin
                    ReportPrint.PrintSalesHeader(Rec);
                end;
            }
            action(PreviewPosting)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Preview Posting';
                Image = ViewPostedOrder;
                Promoted = true;
                PromotedCategory = Category4;
                ShortCutKey = 'Ctrl+Alt+F9';
                ToolTip = 'Review the different types of entries that will be created when you post the document or journal.';

                trigger OnAction()
                begin
                    ShowPreview();
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        SalesHeader: Record "Sales Header";
        CustCheckCrLimit: Codeunit "Cust-Check Cr. Limit";
        IsHandled: Boolean;
    begin
        if GuiAllowed() then begin
            IsSalesLinesEditable := Rec.SalesLinesEditable();
        end;
        if GuiAllowed() then begin
            UpdatePaymentService();
            if CallNotificationCheck then begin
                SalesHeader := Rec;
                SalesHeader.CalcFields("Amount Including VAT");
                OnOnAfterGetCurrRecordOnBeforeSalesHeaderCheck(SalesHeader);
                CustCheckCrLimit.SalesHeaderCheck(SalesHeader);
                IsHandled := false;
                OnAfterGetCurrRecordOnBeforeCheckItemAvailabilityInLines(Rec, IsHandled);
                if not IsHandled then
                    Rec.CheckItemAvailabilityInLines();
                CallNotificationCheck := false;
            end;
            StatusStyleTxt := Rec.GetStatusStyleText();
            SetControlVisibility();
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        WorkDescription := Rec.GetWorkDescription();
        if GuiAllowed() then begin
            SetControlVisibility();
            UpdateShipToBillToGroupVisibility();
            BillToContact.GetOrClear(Rec."Bill-to Contact No.");
            SellToContact.GetOrClear(Rec."Sell-to Contact No.");
        end;
        OnAfterOnAfterGetRecord(Rec);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord();
        exit(Rec.ConfirmDeletion());
    end;

    trigger OnInit()
    begin
        SetExtDocNoMandatoryCondition();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if DocNoVisible then
            Rec.CheckCreditMaxBeforeInsert();

        if (Rec."Sell-to Customer No." = '') and (Rec.GetFilter("Sell-to Customer No.") <> '') then
            CurrPage.Update(false);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        xRec.Init();
        Rec."Responsibility Center" := UserMgt.GetSalesFilter();
        if (not DocNoVisible) and (Rec."No." = '') then
            Rec.SetSellToCustomerFromFilter();

        Rec.SetDefaultPaymentServices();
        UpdateShipToBillToGroupVisibility();
    end;

    trigger OnOpenPage()
    var
        PaymentServiceSetup: Record "Payment Service Setup";
        ApplicationAreaMgmtFacade: Codeunit "Application Area Mgmt. Facade";
    begin
        Rec.SetSecurityFilterOnRespCenter();

        Rec.SetRange("Date Filter", 0D, WorkDate());

        ActivateFields();

        SetDocNoVisible();

        if (Rec."No." <> '') and (Rec."Sell-to Customer No." = '') then
            DocumentIsPosted := (not Rec.Get(Rec."Document Type", Rec."No."));
        PaymentServiceVisible := PaymentServiceSetup.IsPaymentServiceVisible();

        if GuiAllowed() then
            CheckShowBackgrValidationNotification();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        InstructionMgt: Codeunit "Instruction Mgt.";
        IsHandled: Boolean;
        Result: Boolean;
        DoShowReleaseNotification: Boolean;
    begin
        IsHandled := false;
        DoShowReleaseNotification := ShowReleaseNotification();
        OnBeforeQueryClosePage(DocumentIsScheduledForPosting, Rec, CloseAction, DoShowReleaseNotification, DocumentIsPosted, Result, IsHandled);
        if IsHandled then
            exit(Result);

        if not DocumentIsScheduledForPosting and DoShowReleaseNotification then
            if not InstructionMgt.ShowConfirmUnreleased() then
                exit(false);

        OnQueryClosePageOnBeforeConfirmCloseUnposted(DocumentIsPosted);
        if not DocumentIsPosted then
            exit(Rec.ConfirmCloseUnposted());
    end;

    var
        BillToContact: Record Contact;
        SellToContact: Record Contact;
        SalesSetup: Record "Sales & Receivables Setup";
        GLSetup: Record "General Ledger Setup";
        MoveNegSalesLines: Report "Move Negative Sales Lines";
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        SalesCalcDiscountByType: Codeunit "Sales - Calc Discount By Type";
        UserMgt: Codeunit "User Setup Management";
        CustomerMgt: Codeunit "Customer Mgt.";
        FormatAddress: Codeunit "Format Address";
        PrivacyNotice: Codeunit "Privacy Notice";
        PrivacyNoticeRegistrations: Codeunit "Privacy Notice Registrations";
        ChangeExchangeRate: Page "Change Exchange Rate";
        Usage: Option "Order Confirmation","Work Order","Pick Instruction";
        Text001: Label 'Do you want to change %1 in all related records in the warehouse?';
        Text002: Label 'The update has been interrupted to respect the warning.';
        HasIncomingDocument: Boolean;
        DocNoVisible: Boolean;
        ExternalDocNoMandatory: Boolean;
        ShowWorkflowStatus: Boolean;
        DocumentIsScheduledForPosting: Boolean;
        OpenPostedSalesOrderQst: Label 'The Stationery Order is posted as number %1 and moved to the Posted Sales Invoices window.\\Do you want to open the posted invoice?', Comment = '%1 = posted document number';
        PaymentServiceVisible: Boolean;
        PaymentServiceEnabled: Boolean;
        IsPostingGroupEditable: Boolean;
        EmptyShipToCodeErr: Label 'The Code field can only be empty if you select Custom Address in the Ship-to field.';
        SureToRejectMsg: Label 'Rejecting this order will remove it from your company and send it back to the partner company.\\Do you want to continue?';
        IsCustomerOrContactNotEmpty: Boolean;
        SalesDocCheckFactboxVisible: Boolean;
        WorkDescription: Text;
        StatusStyleTxt: Text;
        IsBillToCountyVisible: Boolean;
        IsSellToCountyVisible: Boolean;
        IsShipToCountyVisible: Boolean;
        IsJournalTemplNameVisible: Boolean;
        IsPaymentMethodCodeVisible: Boolean;
        IsSalesLinesEditable: Boolean;
        ShouldSearchForCustByName: Boolean;
        IsBidirectionalSyncEnabled: Boolean;
        FinanceManagement: Codeunit "Finance Management";

    protected var
        ShipToOptions: Enum "Sales Ship-to Options";
        BillToOptions: Enum "Sales Bill-to Options";
        CallNotificationCheck: Boolean;
        DocumentIsPosted: Boolean;

    local procedure ActivateFields()
    begin
        IsBillToCountyVisible := FormatAddress.UseCounty(Rec."Bill-to Country/Region Code");
        IsSellToCountyVisible := FormatAddress.UseCounty(Rec."Sell-to Country/Region Code");
        IsShipToCountyVisible := FormatAddress.UseCounty(Rec."Ship-to Country/Region Code");
        GLSetup.Get();
        IsJournalTemplNameVisible := GLSetup."Journal Templ. Name Mandatory";
        IsPaymentMethodCodeVisible := not GLSetup."Hide Payment Method Code";
        IsSalesLinesEditable := Rec.SalesLinesEditable();
    end;

    protected procedure PostSalesOrder(PostingCodeunitID: Integer; Navigate: Enum "Navigate After Posting")
    var
        SalesHeader: Record "Sales Header";
        LinesInstructionMgt: Codeunit "Lines Instruction Mgt.";
        InstructionMgt: Codeunit "Instruction Mgt.";
        IsHandled: Boolean;
    begin
        OnBeforePostSalesOrder(Rec, PostingCodeunitID, Navigate);
        LinesInstructionMgt.SalesCheckAllLinesHaveQuantityAssigned(Rec);

        Rec.SendToPosting(PostingCodeunitID);

        DocumentIsScheduledForPosting := Rec."Job Queue Status" = Rec."Job Queue Status"::"Scheduled for Posting";
        DocumentIsPosted := (not SalesHeader.Get(Rec."Document Type", Rec."No.")) or DocumentIsScheduledForPosting;
        OnPostOnAfterSetDocumentIsPosted(SalesHeader, DocumentIsScheduledForPosting, DocumentIsPosted);

        CurrPage.Update(false);

        IsHandled := false;
        OnPostDocumentBeforeNavigateAfterPosting(Rec, PostingCodeunitID, Navigate, DocumentIsPosted, IsHandled);
        if IsHandled then
            exit;

        if PostingCodeunitID <> CODEUNIT::"Sales-Post (Yes/No)" then
            exit;

        case Navigate of
            Enum::"Navigate After Posting"::"Posted Document":
                begin
                    if InstructionMgt.IsEnabled(InstructionMgt.ShowPostedConfirmationMessageCode()) then
                        ShowPostedConfirmationMessage();

                    if DocumentIsScheduledForPosting or DocumentIsPosted then
                        CurrPage.Close();
                end;
            Enum::"Navigate After Posting"::"New Document":
                if DocumentIsPosted then begin
                    Clear(SalesHeader);
                    SalesHeader.Init();
                    SalesHeader.Validate("Document Type", SalesHeader."Document Type"::Order);
                    OnPostOnBeforeSalesHeaderInsert(SalesHeader);
                    SalesHeader.Insert(true);
                    PAGE.Run(PAGE::"Sales Order", SalesHeader);
                end;
        end;
    end;

    local procedure ApproveCalcInvDisc()
    begin
        CurrPage.StationeryLines.PAGE.ApproveCalcInvDisc();
    end;

    local procedure SaveInvoiceDiscountAmount()
    var
        DocumentTotals: Codeunit "Document Totals";
    begin
        CurrPage.SaveRecord();
        DocumentTotals.SalesRedistributeInvoiceDiscountAmountsOnDocument(Rec);
        CurrPage.Update(false);
    end;

    local procedure SalespersonCodeOnAfterValidate()
    begin
        CurrPage.StationeryLines.PAGE.UpdateForm(false);
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.Update();
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.Update();
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.StationeryLines.Page.ForceTotalsCalculation();
        CurrPage.Update();
    end;

    local procedure Prepayment37OnAfterValidate()
    begin
        CurrPage.Update();
    end;

    local procedure SetDocNoVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Reminder,FinChMemo;
    begin
        DocNoVisible := DocumentNoVisibility.SalesDocumentNoIsVisible(DocType::Order, Rec."No.");
    end;

    local procedure SetExtDocNoMandatoryCondition()
    begin
        SalesSetup.GetRecordOnce();
        ExternalDocNoMandatory := SalesSetup."Ext. Doc. No. Mandatory";
    end;

    local procedure ShowPreview()
    var
        SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    begin
        SalesPostYesNo.Preview(Rec);
    end;

    local procedure ShowPrepmtInvoicePreview()
    var
        SalesPostPrepaymentYesNo: Codeunit "Sales-Post Prepayment (Yes/No)";
    begin
        SalesPostPrepaymentYesNo.Preview(Rec, 2);
    end;

    local procedure ShowPrepmtCrMemoPreview()
    var
        SalesPostPrepaymentYesNo: Codeunit "Sales-Post Prepayment (Yes/No)";
    begin
        SalesPostPrepaymentYesNo.Preview(Rec, 3);
    end;

    local procedure SetControlVisibility()
    var
        DocumentErrorsMgt: Codeunit "Document Errors Mgt.";
        WorkflowWebhookMgt: Codeunit "Workflow Webhook Management";
    begin
        HasIncomingDocument := Rec."Incoming Document Entry No." <> 0;
        SetExtDocNoMandatoryCondition();
        SetPostingGroupEditable();

        IsCustomerOrContactNotEmpty := (Rec."Sell-to Customer No." <> '') or (Rec."Sell-to Contact No." <> '');
        SalesDocCheckFactboxVisible := DocumentErrorsMgt.BackgroundValidationEnabled();
        ShouldSearchForCustByName := Rec.ShouldSearchForCustomerByName(Rec."Sell-to Customer No.");
    end;

    local procedure ShowPostedConfirmationMessage()
    var
        OrderSalesHeader: Record "Sales Header";
        SalesInvoiceHeader: Record "Sales Invoice Header";
        InstructionMgt: Codeunit "Instruction Mgt.";
    begin
        if not OrderSalesHeader.Get(Rec."Document Type", Rec."No.") then begin
            SalesInvoiceHeader.SetRange("No.", Rec."Last Posting No.");
            if SalesInvoiceHeader.FindFirst() then begin
                if InstructionMgt.ShowConfirm(StrSubstNo(OpenPostedSalesOrderQst, SalesInvoiceHeader."No."),
                     InstructionMgt.ShowPostedConfirmationMessageCode())
                then
                    InstructionMgt.ShowPostedDocument(SalesInvoiceHeader, Page::"Sales Order");
            end;
        end;
    end;

    procedure RunBackgroundCheck()
    begin
        CurrPage.SalesDocCheckFactbox.Page.CheckErrorsInBackground(Rec);
    end;

    protected procedure UpdatePaymentService()
    var
        PaymentServiceSetup: Record "Payment Service Setup";
    begin
        PaymentServiceVisible := PaymentServiceSetup.IsPaymentServiceVisible();
        PaymentServiceEnabled := PaymentServiceSetup.CanChangePaymentService(Rec);
    end;

    procedure UpdateShipToBillToGroupVisibility()
    begin
        CustomerMgt.CalculateShipBillToOptions(ShipToOptions, BillToOptions, Rec);
    end;

    procedure SetPostingGroupEditable()
    var
        BillToCustomer: Record Customer;
    begin
        if BillToCustomer.Get(Rec."Bill-to Customer No.") then
            IsPostingGroupEditable := BillToCustomer."Allow Multiple Posting Groups";
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeStatisticsAction(var SalesHeader: Record "Sales Header"; var Handled: Boolean)
    begin
    end;

    procedure CheckNotificationsOnce()
    begin
        CallNotificationCheck := true;
    end;

    local procedure CheckShowBackgrValidationNotification()
    var
        DocumentErrorsMgt: Codeunit "Document Errors Mgt.";
    begin
        if DocumentErrorsMgt.CheckShowEnableBackgrValidationNotification() then
            SetControlVisibility();
    end;

    local procedure ShowReleaseNotification() Result: Boolean
    var
        LocationsQuery: Query "Locations from items Sales";
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeShowReleaseNotification(Rec, Result, IsHandled);
        if IsHandled then
            exit;

        if Rec.TestStatusIsNotReleased() then begin
            LocationsQuery.SetRange(Document_No, Rec."No.");
            LocationsQuery.SetRange(Require_Pick, true);
            LocationsQuery.Open();
            if LocationsQuery.Read() then
                exit(true);
            LocationsQuery.SetRange(Require_Pick);
            LocationsQuery.SetRange(Require_Shipment, true);
            LocationsQuery.Open();
            exit(LocationsQuery.Read());
        end;
        exit(false);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterValidateShippingOptions(var SalesHeader: Record "Sales Header"; ShipToOptions: Option "Default (Sell-to Address)","Alternate Shipping Address","Custom Address")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterOnAfterGetRecord(var SalesHeader: Record "Sales Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforePostSalesOrder(var SalesHeader: Record "Sales Header"; PostingCodeunitID: Integer; Navigate: Enum "Navigate After Posting")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeShowReleaseNotification(var SalesHeader: Record "Sales Header"; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateShipToOptions(var SalesHeader: Record "Sales Header"; ShipToOptions: Option "Default (Sell-to Address)","Alternate Shipping Address","Custom Address"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnPostOnAfterSetDocumentIsPosted(SalesHeader: Record "Sales Header"; var IsScheduledPosting: Boolean; var DocumentIsPosted: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnPostOnBeforeSalesHeaderInsert(var SalesHeader: Record "Sales Header")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnAfterGetCurrRecordOnBeforeCheckItemAvailabilityInLines(var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnOnAfterGetCurrRecordOnBeforeSalesHeaderCheck(var SalesHeader: Record "Sales Header")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnValidateShipToOptionsOnAfterShipToAddressListGetRecord(var ShipToAddress: Record "Ship-to Address"; var SalesHeader: Record "Sales Header")
    begin
    end;

    [IntegrationEvent(true, false)]
    local procedure OnPostDocumentBeforeNavigateAfterPosting(var SalesHeader: Record "Sales Header"; var PostingCodeunitID: Integer; var Navigate: Enum "Navigate After Posting"; DocumentIsPosted: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeQueryClosePage(var DocumentIsScheduledForPosting: Boolean; var SalesHeader: Record "Sales Header"; CloseAction: Action; ShowReleaseNotification: Boolean; DocumentIsPosted: Boolean; var Result: Boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnQueryClosePageOnBeforeConfirmCloseUnposted(var DocumentIsPosted: Boolean)
    begin
    end;
}