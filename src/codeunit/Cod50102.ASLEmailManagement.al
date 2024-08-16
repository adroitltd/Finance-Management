namespace FinanceManagement.FinanceManagement;
using System.EMail;
using System.Utilities;
using Microsoft.Foundation.Attachment;
using System.Environment;
using Microsoft.CRM.Outlook;

codeunit 50102 "ASL.EmailManagement"
{
    var
        TempEmailItem: Record "Email Item" temporary;
        GlobalHideDialog: Boolean;
        GlobalEmailScenario: Enum "Email Scenario";
        GlobalEnqueue: Boolean;

    procedure Send(): Boolean
    var
        OfficeMgt: Codeunit "Office Management";
        EmailScenarioMapping: Codeunit "Email Scenario Mapping";
        Attachments: Codeunit "Temp Blob List";
        Attachment: Codeunit "Temp Blob";
        EmailSentSuccesfully: Boolean;
        IsHandled: Boolean;
        AttachmentStream: Instream;
        AttachmentNames: List of [Text];
        Name: Text[250];
    begin
        TempEmailItem.GetAttachments(Attachments, AttachmentNames);
        if OfficeMgt.AttachAvailable() and (Attachments.Count() > 0) then begin
            Attachments.Get(1, Attachment);
            Attachment.CreateInStream(AttachmentStream);
            OfficeMgt.AttachDocument(AttachmentStream, AttachmentNames.Get(1), TempEmailItem.GetBodyTextFromBlob(), TempEmailItem.Subject);
        end else
            if OfficeMgt.AttachAvailable() then
                OfficeMgt.AttachDocument(TempEmailItem.GetBodyTextFromBlob(), TempEmailItem.Subject);

        if not OfficeMgt.AttachAvailable() then begin
            EmailSentSuccesfully := TempEmailItem.Send(GlobalHideDialog, GlobalEmailScenario, GlobalEnqueue);
            exit(EmailSentSuccesfully);
        end;
    end;

    procedure InitEmail(Body: Text; Subject: Text; MailTo: Text; HideDialog: Boolean): Boolean
    begin
        Clear(TempEmailItem);
        TempEmailItem.Validate("Plaintext Formatted", true);
        TempEmailItem.SetBodyText(Body);
        TempEmailItem."Send to" := CopyStr(MailTo, 1, MaxStrLen(TempEmailItem."Send to"));
        TempEmailItem.Subject := CopyStr(Subject, 1, MaxStrLen(TempEmailItem.Subject));
        GlobalHideDialog := HideDialog;
        GlobalEmailScenario := Enum::"Email Scenario"::Default;
        GlobalEnqueue := false;
    end;

    procedure AddAttachment(AttachmentStream: InStream; AttachmentName: Text)
    begin
        TempEmailItem.AddAttachment(AttachmentStream, AttachmentName);
    end;

    procedure AddAttachment(DocumentAttachment: Record "Document Attachment")
    var
        AttachmentStream: InStream;
        TenantMedia: Record "Tenant Media";
    begin
        if not TenantMedia.get(DocumentAttachment."Document Reference ID".MediaId) then
            exit;
        TenantMedia.CalcFields(Content);
        if not TenantMedia.Content.HasValue then
            exit;
        Clear(AttachmentStream);
        TenantMedia.Content.CreateInStream(AttachmentStream);
        AddAttachment(AttachmentStream, StrSubstNo('%1.%2', DocumentAttachment."File Name", DocumentAttachment."File Extension"));
    end;

    procedure AddAttachments(var DocumentAttachment: Record "Document Attachment")
    begin
        if not DocumentAttachment.FindSet() then
            exit;
        repeat
            AddAttachment(DocumentAttachment);
        until DocumentAttachment.Next() = 0;
    end;

    // procedure TestSendMailWithDocumentAttachments()
    // var
    //     EMailMgt: Codeunit "Email Mgt.";
    //     DocumentAttachment: Record "Document Attachment";
    //     BodyText, Subject, Email : Text;
    // begin
    //     BodyText := 'Dear Sir,<br> <p>This is a <b>test email with document attachments</b>.</p> <hr> tested by <b>NAVUSER</B> <hr><br> Thank You!'; //HTML body
    //     Subject := 'Test Email - Attchments by Document Attachment';
    //     Email := 'ToEmail@gmail.com';

    //     EMailMgt.InitEmail(BodyText, Subject, Email, false); //Init email with showing mail dialog by passing last parameter as false

    //     //Filter Document Attchment for customer: 01121212
    //     DocumentAttachment.SetRange("Table ID", Database::Customer);
    //     DocumentAttachment.SetRange("No.", '01121212');

    //     EMailMgt.AddAttachments(DocumentAttachment);  //Add attachments by the filterd "Document Attachment" table

    //     //Send Email
    //     if EMailMgt.Send() then
    //         Message('Email has been sent.');
    // end;
}