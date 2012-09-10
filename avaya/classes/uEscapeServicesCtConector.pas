unit uEscapeServicesCtConector;

interface

uses uACS_h, uCtTypes, uCtEvents, uStreamerCtConector,
  uSnapShotServicesCtConector, uATTPriv_h, uCSTADefs_h, uCSTA_h;

type
  TEscapeServicesCtConector = class( TSnapShotServicesCtConector )
    private
      FOnCSTAEscapeSvcConf          : TCSTAEscapeSvcConfEvent;
      FOnATTQueryAcdSplitConf       : TATTQueryAcdSplitConfEvent;
      FOnATTQueryAgentLoginConf     : TATTQueryAgentLoginConfEvent;
      FOnATTQueryAgentLoginResp     : TATTQueryAgentLoginResp;
      FOnATTQueryAgentLoginEnd      : TATTQueryAgentLoginEnd;
      FOnATTQueryTgConf             : TATTQueryTgConfEvent;
      FOnCSTAPrivate                : TCSTAPrivateEvent;
      FOnATTQueryCallClassifierConf : TATTQueryCallClassifierConfEvent;

      procedure RaiseCSTAEscapeSvcConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
        procedure RaiseATTQueryAcdSplitConf( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
        procedure RaiseATTQueryAgentLoginConf( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
        procedure RaiseATTQueryAgentLoginResp( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
        procedure RaiseATTQueryAgentLoginEnd( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
        procedure RaiseCSTAPrivateEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
        procedure RaiseATTQueryTgConfEvent( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
        procedure RaiseATTQueryCallClassifierConfEvent( Event : CSTAEvent_t; ATTEvent : ATTEvent_t );
    protected
      procedure HandleCtEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );override;
    public
      function EscapeServices( const PrivateData : ATTPrivateData_t; const InvokeID : TInvokeID = 0 ) : TSAPI;
      function QueryAcdSplit( const device : TDeviceID; const InvokeID : TInvokeID = 0 ) : TSAPI;
      function QueryAgentLogin( const device : TDeviceID; const InvokeID : TInvokeID = 0 ) : TSAPI;
      function QueryTrunkGroup( const device : TDeviceID; const InvokeID : TInvokeID = 0 ) : TSAPI;
      function QueryCallClassifier( const InvokeID : TInvokeID = 0 ) : TSAPI;
    published
      property OnCSTAEscapeSvcConf : TCSTAEscapeSvcConfEvent read FOnCSTAEscapeSvcConf write FOnCSTAEscapeSvcConf;
      property OnATTQueryAcdSplitConf : TATTQueryAcdSplitConfEvent read FOnATTQueryAcdSplitConf write FOnATTQueryAcdSplitConf;
      property OnATTQueryAgentLoginConf : TATTQueryAgentLoginConfEvent read FOnATTQueryAgentLoginConf write FOnATTQueryAgentLoginConf;
      property OnATTQueryAgentLoginResp : TATTQueryAgentLoginResp read FOnATTQueryAgentLoginResp write FOnATTQueryAgentLoginResp;
      property OnATTQueryAgentLoginEnd  : TATTQueryAgentLoginEnd read FOnATTQueryAgentLoginEnd write FOnATTQueryAgentLoginEnd;
      property OnCSTAPrivate            : TCSTAPrivateEvent read FOnCSTAPrivate write FOnCSTAPrivate;
      property OnATTQueryTgConf         : TATTQueryTgConfEvent read FOnATTQueryTgConf write FOnATTQueryTgConf;
      property OnATTQueryCallClassifierConf : TATTQueryCallClassifierConfEvent read FOnATTQueryCallClassifierConf write FOnATTQueryCallClassifierConf;
  end;

implementation

uses SysUtils, uBasicCallControlCtConector, uMonitorServicesCtConector,
  uATTPDefs_h;

{ TEscapeServicesCtConector }

function TEscapeServicesCtConector.EscapeServices(
  const PrivateData: ATTPrivateData_t; const InvokeID : TInvokeID): TSAPI;
begin
Result := cstaEscapeService( FAcsHandle, InvokeID, @PrivateData );
CheckForGoodCtResult( Result, 'cstaEscapeService' );
end;

procedure TEscapeServicesCtConector.HandleCtEvent(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
begin
inherited;
case Event.eventHeader.eventClass of

  CSTACONFIRMATION :
    begin

    case Event.eventHeader.eventType of

      CSTA_ESCAPE_SVC_CONF :
        begin
        RaiseCSTAEscapeSvcConf( Event, PrivateData );
        end;

      end;

    end;

  CSTAEVENTREPORT_ :
    begin
    case Event.eventHeader.eventType of

      CSTA_PRIVATE :
        begin
        RaiseCSTAPrivateEvent( Event, PrivateData );
        end;

      end;
    end;

  end;
end;

function TEscapeServicesCtConector.QueryAcdSplit(
  const device: TDeviceID; const InvokeID : TInvokeID): TSAPI;
var
  _device : DeviceID_t;
  PrivateData : ATTPrivateData_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( device <> EmptyStr, 'QueryAcdSplit' ) then
  begin

  PrepareDeviceID_t( _device, device );
  PrepareATTPrivateData_t( PrivateData );

  Result := attQueryAcdSplit( @PrivateData, @_device );

  if CheckForGoodCtResult( Result, 'attQueryAcdSplit' ) then
    begin
    Result := EscapeServices( PrivateData, InvokeID );
    end;

  end;
end;

function TEscapeServicesCtConector.QueryAgentLogin(
  const device: TDeviceID; const InvokeID : TInvokeID): TSAPI;
var
  _device : DeviceID_t;
  PrivateData : ATTPrivateData_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( device <> EmptyStr, 'QueryAcdSplit' ) then
  begin
  PrepareDeviceID_t( _device, device );
  PrepareATTPrivateData_t( PrivateData );

  Result := attQueryAgentLogin( @PrivateData, @_device );

  if CheckForGoodCtResult( Result, 'attQueryAgentLogin' ) then
    begin
    Result := EscapeServices( PrivateData, InvokeID );
    end;

  end;
end;

function TEscapeServicesCtConector.QueryTrunkGroup(
  const device: TDeviceID; const InvokeID : TInvokeID): TSAPI;
var
  _device : DeviceID_t;
  PrivateData : ATTPrivateData_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( device <> EmptyStr, 'QueryTrunkGroup' ) then
  begin
  PrepareDeviceID_t( _device, device );
  PrepareATTPrivateData_t( PrivateData );

  Result := attQueryTrunkGroup( @PrivateData, @_device );

  if CheckForGoodCtResult( Result, 'attQueryTrunkGroup' ) then
    begin
    Result := EscapeServices( PrivateData, InvokeID );
    end;

  end;
end;

procedure TEscapeServicesCtConector.RaiseATTQueryAcdSplitConf(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
begin
if Assigned( FOnATTQueryAcdSplitConf ) then
  begin
  try
    FOnATTQueryAcdSplitConf( Self, Event._event.cstaConfirmation.invokeID,
      ATTEvent.u.queryAcdSplit.availableAgents,
      ATTEvent.u.queryAcdSplit.callsInQueue,
      ATTEvent.u.queryAcdSplit.agentsLoggedIn );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnATTQueryAcdSplitConf', E.Message );
      end;
  end;
  end;
end;

procedure TEscapeServicesCtConector.RaiseATTQueryAgentLoginConf(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
begin
if Assigned( FOnATTQueryAgentLoginConf ) then
  begin
  try
    FOnATTQueryAgentLoginConf( Self, Event._event.cstaConfirmation.invokeID,
      ATTEvent.u.queryAgentLogin.privEventCrossRefID );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnATTQueryAgentLoginConf', E.Message );
      end;
  end;
  end;
end;

procedure TEscapeServicesCtConector.RaiseATTQueryAgentLoginEnd(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
begin
if Assigned( FOnATTQueryAgentLoginEnd ) then
  begin
  try
    FOnATTQueryAgentLoginEnd( Self, ATTEvent.u.queryAgentLoginResp.privEventCrossRefID );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnATTQueryAgentLoginEnd', E.Message );
      end;
  end;
  end;
end;

procedure TEscapeServicesCtConector.RaiseATTQueryAgentLoginResp(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
var
  I : Integer;
  vec : array of ShortString;
begin
if Assigned( FOnATTQueryAgentLoginResp ) then
  begin

  if ATTEvent.u.queryAgentLoginResp.list.count > 0 then
    begin

    SetLength( vec, ATTEvent.u.queryAgentLoginResp.list.count );

    for I := 0 to ATTEvent.u.queryAgentLoginResp.list.count - 1 do
      begin
      vec[ I ] := ATTEvent.u.queryAgentLoginResp.list.device[ I ];
      end;

    try
      FOnATTQueryAgentLoginResp( Self,
      ATTEvent.u.queryAgentLoginResp.privEventCrossRefID, vec );

    except
      on E : Exception do
        begin
        CatchEventException( 'FOnATTQueryAgentLoginResp', E.Message );
        end;
    end;
    end
  else
    begin
    RaiseATTQueryAgentLoginEnd( Event, ATTEvent );
    end;

  end;
end;

procedure TEscapeServicesCtConector.RaiseCSTAEscapeSvcConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ret : TSAPI;
  ATTEvent : ATTEvent_t;
begin

RaiseNullConfEvent( FOnCSTAEscapeSvcConf, Event, PrivateData );

if CheckPrivateDataLength( PrivateData, 'RaiseCSTAEscapeSvcConf' ) then
  begin

  ret := attPrivateData( @PrivateData, @ATTEvent );

  if CheckForGoodCtResult( ret, 'attPrivateData' ) then
    begin

    case ATTEvent.eventType of

      ATT_QUERY_ACD_SPLIT_CONF :
        begin
        RaiseATTQueryAcdSplitConf( Event, ATTEvent );
        end;

      ATT_QUERY_AGENT_LOGIN_CONF :
        begin
        RaiseATTQueryAgentLoginConf( Event, ATTEvent );
        end;

      ATT_QUERY_TG_CONF :
        begin
        RaiseATTQueryTgConfEvent( Event, ATTEvent );
        end;

      ATT_QUERY_CALL_CLASSIFIER_CONF :
        begin
        RaiseATTQueryCallClassifierConfEvent( Event, ATTEvent );
        end;

      end;

    end;

  end
end;

procedure TEscapeServicesCtConector.RaiseCSTAPrivateEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ret : TSAPI;
  ATTEvent : ATTEvent_t;
begin

if Assigned( FOnCSTAPrivate ) then
  begin
  try
    FOnCSTAPrivate( Self, PrivateData );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTAPrivate', E.Message );
      end;
  end;
  end;

if CheckPrivateDataLength( PrivateData, 'FOnCSTAPrivate' ) then
  begin

  ret := attPrivateData( @PrivateData, @ATTEvent );

  if CheckForGoodCtResult( ret, 'attPrivateData' ) then
    begin

    case ATTEvent.eventType of

      ATT_QUERY_AGENT_LOGIN_RESP :
        begin
        RaiseATTQueryAgentLoginResp( Event, ATTEvent );
        end;

      end;

    end;

  end
end;

procedure TEscapeServicesCtConector.RaiseATTQueryTgConfEvent(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
begin
if Assigned( FOnATTQueryTgConf ) then
  begin
  try
    FOnATTQueryTgConf( Self, Event._event.cstaConfirmation.invokeID,
      ATTEvent.u.queryTg.idleTrunks,
      ATTEvent.u.queryTg.usedTrunks );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnATTQueryTgConf', E.Message );
      end;
  end;
  end;
end;

function TEscapeServicesCtConector.QueryCallClassifier(
  const InvokeID : TInvokeID ): TSAPI;
var PrivateData : ATTPrivateData_t;
begin
PrepareATTPrivateData_t( PrivateData );
Result := attQueryCallClassifier( @PrivateData );
if CheckForGoodCtResult( Result, 'attQueryCallClassifier' ) then
  begin
  EscapeServices( PrivateData, InvokeID );
  end;

end;

procedure TEscapeServicesCtConector.RaiseATTQueryCallClassifierConfEvent(
  Event: CSTAEvent_t; ATTEvent: ATTEvent_t);
begin
if Assigned( FOnATTQueryCallClassifierConf ) then
  begin
  try
    FOnATTQueryCallClassifierConf( Self, Event._event.cstaConfirmation.invokeID,
      ATTEvent.u.queryCallClassifier.numAvailPorts,
      ATTEvent.u.queryCallClassifier.numInUsePorts );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnATTQueryCallClassifierConf', E.Message );
      end;
  end;
  end;
end;

end.
