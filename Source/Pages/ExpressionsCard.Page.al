page 50111 ExpressionsCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Expressions Card';

    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';
                field(Value1; Value1)
                {
                    ApplicationArea = All;
                    Caption = 'Value1';
                    ToolTip = 'Enter a value for Value1.';
                }

                field(Value2; Value2)
                {
                    ApplicationArea = All;
                    Caption = 'Value2';
                    ToolTip = 'Enter a value for Value2.';
                }
            }

            group(Output)
            {
                Caption = 'Output';
                field(Result; Result)
                {
                    ApplicationArea = All;
                    Caption = 'Result';
                    ToolTip = 'The result of the operation.';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Execute)
            {
                ApplicationArea = All;
                Caption = 'Execute';
                Image = ExecuteBatch;
                ToolTip = 'Click to calculate the result.';

                trigger OnAction()
                begin
                    Result := Value1 > Value2;
                end;
            }
        }
    }

#if DEV
    trigger OnOpenPage()
    begin
        Message('Only shows up in dev mode.');
    end;
#endif

    var
        Value1: Integer;
        Value2: Integer;
        Result: Boolean;
}