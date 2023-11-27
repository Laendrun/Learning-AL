pageextension 50130 CustomerCard extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("F&unctions")
        {
            action(UpdateCreditLimit)
            {
                Caption = 'Update Credit Limit';
                ToolTip = 'Update Credit Limit';
                Image = CalculateCost;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    CallUpdateCreditLimit();
                end;
            }
        }
    }
    var
        AreYouSureQst: Label 'Are you sure you want to set the %1 to %2?', Comment = '%1 is Credit Limit caption and %2 is the new Credit Limit value.';
        CreditLimitRoundedTxt: Label 'The credit limit was rounded to %1 to comply with company policies.', Comment = '%1 is new Credit Limit value';
        CreditLimitUpToDateTxt: Label 'The credit limit is up to date.';

    local procedure CallUpdateCreditLimit()
    var
        CreditLimitCalculated, CreditLimitActual : Decimal;
    begin
        CreditLimitCalculated := Rec.CalculateCreditLimit();
        if CreditLimitCalculated = Rec."Credit Limit (LCY)" then begin
            Message(CreditLimitUpToDateTxt);
            exit;
        end;
        if GuiAllowed() then
            if not Confirm(AreYouSureQst, false, Rec.FieldCaption("Credit Limit (LCY)"), CreditLimitCalculated) then
                exit;
        CreditLimitActual := CreditLimitCalculated;
        Rec.UpdateCreditLimit(CreditLimitActual);
        if CreditLimitActual <> CreditLimitCalculated then
            message(CreditLimitRoundedTxt, CreditLimitActual);
    end;
}