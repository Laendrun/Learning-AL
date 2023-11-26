page 50112 StatementsCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Statements Page';

    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';
                field(Difficulty; Difficulty)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        GetSuggestion();
                    end;
                }
            }
            group(Output)
            {
                Caption = 'Output';
                field(Suggestion; Suggestion)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This is the suggestion.';
                    Caption = 'Suggestion';
                }

                field(Level; Level)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'This is the level.';
                    Caption = 'Level';
                }
            }
        }
    }

    local procedure GetSuggestion()
    var
        myInt: Integer;
    begin
        Level := '';
        Suggestion := '';
        case Difficulty of
            1 .. 5:
                begin
                    Level := 'Beginner';
                    Suggestion := 'Take e-Learning or remote training.';
                end;
            6 .. 8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Attend instructor-Led.';
                end;
            9 .. 10:
                begin
                    Level := 'Advanced';
                    Suggestion := 'Attend instructor-Led and self study';
                end;
        end;
    end;

    var
        Level: Text[30];
        Suggestion: Text[80];
        Difficulty: Integer;
}
