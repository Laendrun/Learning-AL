page 50114 MyAddress
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(WhatsTheAddress)
            {
                ApplicationArea = All;
                Caption = 'What''s the Address';
                ToolTip = 'Select the address.';
                Image = Addresses;

                trigger OnAction()
                var
                    iAddressProvider: Interface IAddressProvider;
                begin
                    AddressproviderFactory(iAddressProvider);
                    Message(iAddressProvider.GetAddress());
                end;
            }

            action(SendToHome)
            {
                ApplicationArea = All;
                Image = Home;
                Caption = 'Send to Home.';
                ToolTip = 'Set the interface implementation to Home.';
                trigger OnAction()
                begin
                    sendTo := sendTo::Private;
                end;
            }

            action(SendToWork)
            {
                ApplicationArea = All;
                Image = WorkCenter;
                Caption = 'Send to Work.';
                ToolTip = 'Set the interface implementation to Work.';

                trigger OnAction()
                begin
                    sendTo := sendTo::Company;
                end;
            }
        }
    }

    local procedure AddressProviderFactory(var iAddressProvider: Interface IAddressProvider)
    var
        CompanyAddressProvider: Codeunit CompanyAddressProvider;
        PersonalAddressProvider: Codeunit PersonalAddressProvider;
    begin
        if sendTo = sendTo::Company then
            iAddressProvider := CompanyAddressProvider;
        if sendTo = sendTo::Private then
            iAddressProvider := PersonalAddressProvider;
    end;

    var
        sendTo: enum SendTo;
}