unit uPeriodicThread;

interface

uses uRepeatedThread;

type
  TPeriodicThread = class( TRepeatedThread )
  private
    FStartCount  : Cardinal;
    FEndCount    : Cardinal;
    FMinInterval : Cardinal;
    procedure SetMinInterval( Value : Cardinal );
  protected
    procedure RepeatedTask;override;
    procedure PeriodicTask;virtual;abstract;
  public
    constructor Create( CreateSuspended : Boolean );override;
  published
    property MinInterval : Cardinal read FMinInterval write SetMinInterval;
  end;

implementation

uses Windows, Math, SysUtils;

const MIN_INTERVAL = 10;

{ TPeriodicThread }

constructor TPeriodicThread.Create;
begin
inherited Create( True );
FStartCount  := 0;
FEndCount    := 0;
FMinInterval := MIN_INTERVAL;
if not CreateSuspended then
  begin
  Resume;
  end;
end;

procedure TPeriodicThread.RepeatedTask;
begin

FStartCount := GetTickCount;
try
// Exceptions are handled in ancestor code.
PeriodicTask;
finally
  // Asserting that even if an exception is raised, the delay will
  // take effect between thread cycles.  
  FEndCount := GetTickCount;
  Sleep( Max( 0, Integer( FMinInterval - FEndCount + FStartCount)));
end;

end;

procedure TPeriodicThread.SetMinInterval(Value: Cardinal);
begin
if Value >= MIN_INTERVAL then
  begin
  FMinInterval := Value;
  end
else
  begin
  raise Exception.Create( Format(
    'The interval must be equal or bigger than %d', [ MIN_INTERVAL ] ) );
  end;
end;

end.
