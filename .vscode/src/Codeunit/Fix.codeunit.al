/*
codeunit 50850 "Fix"
{
    trigger OnRun()
    begin
        createSalesPerson(56);
    end;

    local procedure createSalesPerson(salespersonCode: Integer)
    var
        SalesPerson: Record "Salesperson/Purchaser";
    begin
        SalesPerson.Init();
        SalesPerson.Code := FORMAT(salespersonCode);
        SalesPerson."MBC ICG Id" := salespersonCode;
        SalesPerson.Insert();

        Message('Created!');
    end;
}
*/