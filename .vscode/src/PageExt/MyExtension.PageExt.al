/*
pageextension 50850 "MyExtension" extends "G/L Registesr"
{

    actions
    {
        addafter("Delete Empty Registers")
        {
            action(Fix)
            {
                Image = Debug;
                ToolTip = 'Fix', comment = 'ESP="Arreglar!"';
                Caption = 'Fix!', Comment = 'ESP="Arreglar!"';
                ApplicationArea = All;

                trigger OnAction()
                var
                    Fix: Codeunit Fix;
                begin
                    Fix.Run();
                end;
            }
        }
    }
}
*/