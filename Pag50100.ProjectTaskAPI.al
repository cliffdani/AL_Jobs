page 50100 ProjectTaskAPI
{
    APIGroup = 'powerAutomate';
    APIPublisher = 'cliff';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'projectTaskAPI';
    DelayedInsert = true;
    EntityName = 'projectTask';
    EntitySetName = 'projectTasks';
    PageType = API;
    SourceTable = "Job Task";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(jobNo; Rec."Job No.")
                {
                    Caption = 'Project No.';
                }
                field(jobTaskNo; Rec."Job Task No.")
                {
                    Caption = 'Project Task No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
            }
        }
    }

    procedure GetNextProjectTaskNo(): Code[20]
    var
        NoSeriesMgt: Codeunit "No. Series";
        NextNo: Code[20];
        NoSeriesCode: Code[20];

    begin
        NoSeriesCode := 'A-BLK';
        NextNo := NoseriesMgt.GetNextNo(NoSeriesCode, 0D, true);
        exit(NextNo);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Job Task No." := GetNextProjectTaskNo();
    end;
}
