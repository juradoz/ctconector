unit uRepeatedThread;

interface

uses uGeneralThread;

type
  TRepeatedThread = class( TGeneralThread )
  private
    FLoopEnabled : Boolean;
  protected
    procedure ThreadTask;override;
    procedure RepeatedTask;virtual;abstract;
  public
    constructor Create( CreateSuspended : Boolean );override;
  published
    property LoopEnabled : Boolean read FLoopEnabled write FLoopEnabled;
  end;

implementation

uses SysUtils, Classes;

const IDLE_INTERVAL = 10;

{ TRepeatedThread }

constructor TRepeatedThread.Create( CreateSuspended : Boolean );
begin
inherited Create( True );
FLoopEnabled := True;
if not CreateSuspended then
  begin
  Resume;
  end;
end;

procedure TRepeatedThread.ThreadTask;
begin
repeat
  if FLoopEnabled then
    begin
    // Exceptions are handled in ancestor code
    RepeatedTask;
    end
  else
    begin
    Sleep( IDLE_INTERVAL );
    end;
until Terminated;
end;

end.
