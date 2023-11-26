codeunit 50113 PersonalAddressProvider implements IAddressProvider
{
    procedure GetAddress(): Text;
    begin
        exit('Personal address \ Denmark 2800')
    end;
}
