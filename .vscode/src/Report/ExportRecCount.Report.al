report 50850 "ExportRecCount"
{
    Caption = 'ExportRecCount';
    DefaultLayout = RDLC;
    RDLCLayout = 'src\Report\ExportRecordCount.rdl';

    dataset
    {
        dataitem(DateDataitem; Date)
        {
            RequestFilterFields = "Period Type", "Period Start";
            column(PeriodStart_DateDataitem; "Period Start")
            {
            }
            column(NoRegistrosMovValor; CountValueEntry)
            {
            }
            column(NoRegistrosMovProducto; CountItemLedgerEntry)
            {
            }
            column(PostingTicktes; TimeTicket) { }
            column(Closing; TimeClose) { }

            trigger OnAfterGetRecord()
            var
            begin
                CountItemLedgerEntry := 0;
                CountValueEntry := 0;
                CLEAR(TimeClose);
                clear(TimeTicket);

                CountItemLedgerEntry := GetItemLedgerEntryCount();
                CountValueEntry := GetValueEntryCount();

                TimeTicket := GetJoQueueElapsedTime(70008);
                TimeClose := GetJoQueueElapsedTime(70015);
            end;

            trigger OnPreDataItem()
            begin
                //DateDataitem.SetRange("Period Type", DateDataitem."Period Type"::Date);
                //DateDataitem.SetFilter("Period Start", '%1..', 0106);
            end;
        }

        /*dataitem("Value Entry"; "Value Entry")
        {
            RequestFilterFields = "Posting Date";
            column(PostingDate_ValueEntry; "Posting Date")
            {
            }

            trigger OnPreDataItem()
            begin
                "Value Entry".SetFilter("Document No.", '%1', '*-*-*');
                //"Value Entry".SetFilter("Posting Date", '%1..%2', Date."Period Start", Date."Period End");
            end;
        }

        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            RequestFilterFields = "Posting Date";
            column(PostingDate_ItemLedgerEntry; "Posting Date")
            {
            }

            trigger OnPreDataItem()
            begin
                "Item Ledger Entry".SetFilter("Document No.", '%1', '*-*');
                //"Item Ledger Entry".SetFilter("Posting Date", '%1..%2', Date."Period Start", Date."Period End");
            end;
        }
        */

    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    procedure GetValueEntryCount(): Integer
    var
        ValueEntry: Record "Value Entry";
    begin
        ValueEntry.Reset();
        ValueEntry.SetRange("Posting Date", DateDataitem."Period Start");
        if not ValueEntry.FindSet() then
            CurrReport.Skip();
        exit(ValueEntry.Count());
    end;

    procedure GetItemLedgerEntryCount(): Integer
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        ItemLedgerEntry.Reset();
        ItemLedgerEntry.SetRange("Posting Date", DateDataitem."Period Start");
        if not ItemLedgerEntry.FindSet() then
            CurrReport.Skip();
        exit(ItemLedgerEntry.Count());
    end;

    procedure GetJoQueueElapsedTime(ObjectID: Integer) ElapsedTime: DURATION
    var
        JobQueueLogEntry: Record "Job Queue Log Entry";
        clearDT: DateTime;
        CutDate, CutDate2 : Date;
    begin
        clear(clearDT);
        Clear(ElapsedTime);
        CutDate := CalcDate('<+1D>', DateDataitem."Period Start");
        CutDate2 := CalcDate('<+2D>', DateDataitem."Period Start");
        JobQueueLogEntry.Reset();
        JobQueueLogEntry.SetFilter("Start Date/Time", '>%1&<%2', CreateDateTime(CutDate, 0T), CreateDateTime(CutDate2, 0T));
        JobQueueLogEntry.SetFilter("End Date/Time", '<>%1', clearDT);
        JobQueueLogEntry.SetRange("Object ID to Run", ObjectID);
        if JobQueueLogEntry.FindSet() then
            repeat
                ElapsedTime += JobQueueLogEntry."End Date/Time" - JobQueueLogEntry."Start Date/Time";

            until JobQueueLogEntry.Next() = 0;
        exit(ElapsedTime)
    end;

    var
        CountValueEntry, CountItemLedgerEntry : Integer;
        TimeClose, TimeTicket : Duration;
}
