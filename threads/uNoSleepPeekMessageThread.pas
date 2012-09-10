unit uNoSleepPeekMessageThread;

interface

uses uRepeatedThread, uThreadMessageEvent, uGeneralThread, Windows;

type

  TNoSleepPeekMessageThread = class( TRepeatedThread )
  private
    FOnThreadBeforePeekMessage : TThreadEvent;
    FOnThreadMessage : TThreadMessageEvent;
    FOnThreadAfterPeekMessage : TThreadEvent;
  protected
    procedure RepeatedTask;override;
    {$IFDEF COMTAGMSG}
    procedure RaiseThreadMessageEvent( lpMsg : TagMSG );
    {$ELSE}
    procedure RaiseThreadMessageEvent( Message, wParam, lParam : Cardinal );
    {$ENDIF}
  public
    constructor Create( CreateSuspended : Boolean );override;
    procedure PostThreadMessage( const Message, wParam, lParam : Cardinal );overload;
    class procedure PostThreadMessage( const ThreadID, Message, wParam, lParam : Cardinal );overload;    
  published
    property OnThreadBeforePeekMessage : TThreadEvent read FOnThreadBeforePeekMessage write FOnThreadBeforePeekMessage;
    property OnThreadMessage : TThreadMessageEvent read FOnThreadMessage write FOnThreadMessage;
    property OnThreadAfterPeekMessage : TThreadEvent read FOnThreadAfterPeekMessage write FOnThreadAfterPeekMessage;
  end;

implementation

uses SysUtils;

{ TNoSleepPeekMessageThread }

constructor TNoSleepPeekMessageThread.Create(CreateSuspended: Boolean);
begin
inherited Create( True );
FOnThreadBeforePeekMessage := nil;
FOnThreadMessage := nil;
FOnThreadAfterPeekMessage := nil;
if not CreateSuspended then
  begin
  Resume;
  end;
end;

procedure TNoSleepPeekMessageThread.PostThreadMessage(const Message,
  wParam, lParam: Cardinal);
begin
PostThreadMessage( ThreadID, Message, wParam, lParam );
end;

class procedure TNoSleepPeekMessageThread.PostThreadMessage(const ThreadID,
  Message, wParam, lParam: Cardinal);
begin
if not Windows.PostThreadMessage( ThreadID, Message, wParam, lParam ) then
  begin
  raise EPostThreadMessage.Create( Format( 'Error in TPeekMessageThread.PostThreadMessage. GetLastError = %d.',
    [ GetLastError ] ) );
  end;
end;

{$IFDEF COMTAGMSG}
procedure TNoSleepPeekMessageThread.RaiseThreadMessageEvent(lpMsg: TagMSG);
begin
if Assigned( FOnThreadMessage ) then
  begin
  try
    FOnThreadMessage( Self, lpMsg );
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
{$ELSE}
procedure TNoSleepPeekMessageThread.RaiseThreadMessageEvent(Message, wParam,
  lParam: Cardinal);
begin
if Assigned( FOnThreadMessage ) then
  begin
  try
    FOnThreadMessage( Self, Message, wParam, lParam );
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
{$ENDIF}
procedure TNoSleepPeekMessageThread.RepeatedTask;
var lpMsg : TagMsg;
begin

RaiseThreadEvent( FOnThreadBeforePeekMessage );

if PeekMessage( lpMsg, 0, Low( Cardinal ), High( Cardinal ), PM_REMOVE ) then
  begin
  {$IFDEF COMTAGMSG}
  RaiseThreadMessageEvent( lpMsg );
  {$ELSE}
  RaiseThreadMessageEvent( lpMsg.message, lpMsg.wParam, lpMsg.lParam );
  {$ENDIF}
  end;

RaiseThreadEvent( FOnThreadAfterPeekMessage );

end;

end.
