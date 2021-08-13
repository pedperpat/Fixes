page 50852 "Email Body Selection"
{
    PageType = List;
    UsageCategory = None;
    SourceTable = "Custom Report Layout";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Newrep)
            {
                field(Description; rec.Description)
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}