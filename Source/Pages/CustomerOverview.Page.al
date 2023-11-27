page 50120 "Customer Overview List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Overview";
    Caption = 'Customer Overview List';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Source Code field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(LastRunDate; Rec.LastRunDate)
                {
                    ToolTip = 'Specifies the value of the LastRunDate field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Import Records")
            {
                Caption = 'Import Records';
                Image = Import;
                ApplicationArea = All;

                trigger OnAction()
                var
                    UpdateCustomerOverview: Codeunit "Customer Overview Mgmt";
                begin
                    UpdateCustomerOverview.Run();
                end;
            }
        }
    }
}