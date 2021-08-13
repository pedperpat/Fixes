page 50851 "Session List Custom"
{
    Caption = 'Kill Session';
    PageType = List;
    SourceTable = "Session";
    UsageCategory = Lists;
    ApplicationArea = All;
    Permissions = TableData "Session" = rimd;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Connection ID"; Rec."Connection ID")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("My Session"; Rec."My Session")
                {
                    ApplicationArea = All;
                }
                field("Login Time"; Rec."Login Time")
                {
                    ApplicationArea = All;
                }
                field("Login Date"; Rec."Login Date")
                {
                    ApplicationArea = All;
                }
                field("Database Name"; Rec."Database Name")
                {
                    ApplicationArea = All;
                }
                field("Application Name"; Rec."Application Name")
                {
                    ApplicationArea = All;
                }
                field("Login Type"; Rec."Login Type")
                {
                    ApplicationArea = All;
                }
                field("Host Name"; Rec."Host Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}