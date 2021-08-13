reportextension 50850 "EmailBody-Extension" extends "Work Order"
{


    trigger OnPreReport()
    var
        EHS: Record "Report Layout Selection";
    begin

        layout2.SetRange("Report ID", 5703);
        if page.RunModal(50852, Layout2) = Action::LookupOK then
            EHS.SetTempLayoutSelected(Layout2.Code)

        else
            Error('Select Report Layout!');
    end;


    var

        Layout2: Record "Custom Report Layout";

}