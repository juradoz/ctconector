unit uGeneralThread;

interface

uses
  Classes;

type

  TThreadEvent = procedure( Sender : TObject ) of object;
  TThreadErrorEvent = procedure( Sender : TObject; Msg : ShortString ) of object;

  TGeneralThread = class( TThread )
  private
    FOnThreadInitiate   : TThreadEvent;
    FOnThreadTerminate  : TThreadEvent;
    FOnThreadError      : TThreadErrorEvent;
  protected
    procedure RaiseThreadEvent( ThreadEvent : TThreadEvent );
    procedure RaiseThreadErrorEvent( Msg : ShortString );overload;
    procedure ThreadTask;virtual;abstract;
    procedure Execute;reintroduce;override;
  public
    constructor Create( CreateSuspended : Boolean );reintroduce;virtual;
  published
    property OnThreadInitiate  : TThreadEvent read FOnThreadInitiate write FOnThreadInitiate;
    property OnThreadTerminate : TThreadEvent read FOnThreadTerminate write FOnThreadTerminate;
    property OnThreadError     : TThreadErrorEvent read FOnThreadError write FOnThreadError;
  end;

implementation

uses SysUtils;

{ TGeneralThread }

constructor TGeneralThread.Create( CreateSuspended : Boolean );
begin
inherited Create( True );
FOnThreadInitiate  := nil;
FOnThreadTerminate := nil;
FOnThreadError     := nil;
FreeOnTerminate    := True;
if not CreateSuspended then
  begin
  Resume;
  end;
end;

procedure TGeneralThread.Execute;
begin
RaiseThreadEvent( FOnThreadInitiate );
try
  try
  ThreadTask;
  except
    on E : Exception do
      begin
      RaiseThreadErrorEvent( E.Message );
      end;
  end;
finally
  // Asserting that the termination event
  // will be raised even if the ThreadTask
  // raises an Exception
  RaiseThreadEvent( FOnThreadTerminate );
end;
end;

procedure TGeneralThread.RaiseThreadErrorEvent(Msg: ShortString);
begin
if Assigned( FOnThreadError ) then
  begin
  try
    FOnThreadError( Self, Msg );
  except
    {$IFDEF DEBUG}
    raise;
    {$ENDIF}
  end;

  end
{$IFDEF DEBUG}
else
  begin
  raise Exception.Create( Format( 'Unassigned error event: %s', [ E.Message ] ) );
  end;
{$ENDIF}
end;

procedure TGeneralThread.RaiseThreadEvent(ThreadEvent: TThreadEvent);
begin
if Assigned( ThreadEvent ) then
  begin
  try
    ThreadEvent( Self );
  except
    on E : Exception do
      begin
      RaiseThreadErrorEvent( E.Message );
      end;
  end;

  end
{$IFDEF DEBUG}
else
  begin
  raise Exception.Create( 'Unassigned event.' );
  end;
{$ENDIF}
end;

end.
