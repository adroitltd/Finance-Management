// namespace FinanceManagement.FinanceManagement;

// using Microsoft.Finance.GeneralLedger.Journal;

// pageextension 50118 "Cash Receipt Journal Ext" extends "Cash Receipt Journal"
// {
//     actions
//     {
//         modify(Post)
//         {
//             trigger OnBeforeAction()
//             begin
//                 CheckDocumentType();
//             end;
//         }
//         modify("Post and &Print")
//         {
//             trigger OnBeforeAction()
//             begin
//                 CheckDocumentType();
//             end;
//         }
//     }

//     local procedure CheckDocumentType()
//     begin
//         if Rec."Account Type" = Rec."Account Type"::Customer then
//             Rec.TestField("Document Type");
//     end;
// }
