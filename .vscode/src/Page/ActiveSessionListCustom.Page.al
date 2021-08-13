page 50850 "Active Session List Custom"
{
    Caption = 'Kill Active Session';
    PageType = List;
    SourceTable = "Active Session";
    UsageCategory = Lists;
    ApplicationArea = All;
    Permissions = TableData "Active Session" = rimd;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User SID"; Rec."User SID")
                {
                    ApplicationArea = All;
                }
                field("Server Instance ID"; Rec."Server Instance ID")
                {
                    ApplicationArea = All;
                }
                field("Session ID"; Rec."Session ID")
                {
                    ApplicationArea = All;
                }
                field("Server Instance Name"; Rec."Server Instance Name")
                {
                    ApplicationArea = All;
                }
                field("Server Computer Name"; Rec."Server Computer Name")
                {
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field("Client Type"; Rec."Client Type")
                {
                    ApplicationArea = All;
                }
                field("Client Computer Name"; Rec."Client Computer Name")
                {
                    ApplicationArea = All;
                }
                field("Login Datetime"; Rec."Login Datetime")
                {
                    ApplicationArea = All;
                }
                field("Database Name"; Rec."Database Name")
                {
                    ApplicationArea = All;
                }
                field("Session Unique ID"; Rec."Session Unique ID")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}