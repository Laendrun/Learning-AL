codeunit 50111 Validations
{
    trigger OnRun()
    begin

    end;

    local procedure CheckForPlusSign(TextToVerify: Text)
    begin
        if TextToVerify.Contains('+') then
            Message('A + sign has been found.');
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateEvent', 'Address', false, false)]
    local procedure TableCustomerOnAfterValidateEventAddress(var Rec: Record Customer)
    begin
        CheckForPlusSign(Rec.Address);
    end;
}