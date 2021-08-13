pageextension 50851 "MyExtension2" extends "Sales Order"
{
    layout
    {
        addafter("Shipment Date")
        {
            field("Shipping No."; "Shipping No.")
            {
                ApplicationArea = All;
                ToolTip = 'Shipping No.', Comment = 'ESP="Nº albarán"';
                Caption = 'Shipping No.', Comment = 'ESP="Nº albarán"';

            }
        }
    }
    actions
    {
        addafter(AttachAsPDF)
        {
            action(printCustomLayout)
            {
                ApplicationArea = All;
                ToolTip = 'Print custom layout', Comment = 'ESP="Imprimir layout"';
                Caption = 'Print custom layout', Comment = 'ESP"Imprimir layout"';
                Promoted = true;
                PromotedCategory = Category11;
                Image = Print;


                trigger OnAction()
                var
                    ReportLayoutSelection: Record "Report Layout Selection";
                    myReport: Report "Work Order";
                    CustomLayout: Code[20];
                    ReportNo: Integer;
                begin
                    Evaluate(ReportNo, DelChr(myReport.ObjectId(false), '=', DelChr(myReport.ObjectId(false), '=', '1234567890')));
                    CustomLayout := GetCustomLayout(ReportNo);

                    if CustomLayout <> '' then
                        ReportLayoutSelection.SetTempLayoutSelected(CustomLayout);

                    myReport.Run();
                end;
            }
        }
    }
    local procedure GetCustomLayout(ReportNo: Integer) CustomLayout: Code[20]
    var
        CustomReportLayout: Record "Custom Report Layout";
        CustomReportLayouts: Page "Custom Report Layouts";
    begin
        CustomReportLayout.SetRange("Report ID", ReportNo);
        CustomReportLayouts.LookupMode(true);
        CustomReportLayouts.SetTableView(CustomReportLayout);
        if CustomReportLayouts.RunModal() = Action::LookupOK then begin
            CustomReportLayouts.GetRecord(CustomReportLayout);
            CustomLayout := CustomReportLayout.Code;
        end else
            CustomLayout := '';

        exit(CustomLayout)
    end;
}
