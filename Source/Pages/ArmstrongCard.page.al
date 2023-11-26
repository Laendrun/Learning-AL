page 50113 ArmstrongPageCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Armstrong card.';

    layout
    {
        area(Content)
        {
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                begin
                end;
            }
        }
    }

    trigger OnOpenPage();
    var
        Counter1: Integer;
        CounterText: Text[5];
        Counter2: Integer;
        PowerNumber: Integer;
        Number: Integer;
        Result: Integer;
        ResultList: List of [Integer];
        ArmstrongNumbers: Text;
        Ch10: Char;
        Ch13: Char;
        NewLine: Text;
    begin
        Ch10 := 10;
        Ch13 := 13;
        NewLine := Format(Ch10) + Format(Ch13);
        for Counter1 := 0 to 10000 do begin
            CounterText := Format(Counter1);
            Evaluate(PowerNumber, CopyStr(CounterText, StrLen(CounterText), 1));
            for Counter2 := 1 to StrLen(CounterText) do begin
                Evaluate(Number, CopyStr(CounterText, Counter2, 1));
                Result += Power(Number, PowerNumber);
            end;

            if Result = Counter1 then
                ResultList.Add(Result);
            Clear(Result);
        end;
        foreach Counter1 in ResultList do
            ArmstrongNumbers += NewLine + (Format(Counter1));

        Message(ArmstrongNumbers)
    end;
}