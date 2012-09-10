unit uMonitorServicesCtConector;

interface

uses uACS_h, uTsplatfm_h, uCSTADefs_h, uCSTA_h, uATTPDefs_h, uATTPriv_h,
  uStreamerCtConector, uCtEvents, uCtTypes;

type

  { TStreamerCtConector child that implements device/call monitoring and
   unsolicited events }
  TMonitorServicesCtConector = class( TStreamerCtConector )
  private
    { Confirmation fields }
    FOnCSTAMonitorConf         : TCSTAMonitorConfEvent;
    FOnCSTAMonitorStopConf     : TCSTAMonitorStopConfEvent;

    { Unsolicited fields }
    FOnCSTACallCleared         : TCSTACallClearedEvent;
    FOnCSTAConferenced         : TCSTAConferencedEvent;
    FOnCSTAConnectionCleared   : TCSTAConnectionClearedEvent;
    FOnCSTADelivered           : TCSTADeliveredEvent;
    FOnCSTADiverted            : TCSTADivertedEvent;
    FOnCSTAEstablished         : TCSTAEstablishedEvent;
    FOnCSTAFailed              : TCSTAFailedEvent;
    FOnCSTAHeld                : TCSTAHeldEvent;
    FOnCSTANetworkReached      : TCSTANetworkReachedEvent;
    FOnCSTAOriginated          : TCSTAOriginatedEvent;
    FOnCSTAQueued              : TCSTAQueuedEvent;
    FOnCSTARetrieved           : TCSTARetrievedEvent;
    FOnCSTAServiceInitiated    : TCSTAServiceInitiatedEvent;
    FOnCSTATransferred         : TCSTATransferredEvent;
    FOnCSTACallInformation     : TCSTACallInformationEvent;
    FOnCSTADoNotDisturb        : TCSTADoNotDisturbEvent;
    FOnCSTAForwarding          : TCSTAForwardingEvent;
    FOnCSTAMessageWaiting      : TCSTAMessageWaitingEvent;
    FOnCSTALoggedOn            : TCSTALoggedOnEvent;
    FOnCSTALoggedOff           : TCSTALoggedOffEvent;
    FOnCSTANotReady            : TCSTANotReadyEvent;
    FOnCSTAReady               : TCSTAReadyEvent;
    FOnCSTAWorkNotReady        : TCSTAWorkNotReadyEvent;
    FOnCSTAWorkReady           : TCSTAWorkNotReadyEvent;
    FOnCSTABackInService       : TCSTABackInServiceEvent;
    FOnCSTAOutOfService        : TCSTAOutOfServiceEvent;
    FOnCSTAPrivateStatus       : TCSTAPrivateStatusEvent;
    FOnCSTAMonitorEnded        : TCSTAMonitorEndedEvent;

    { Confirmation raisers }
    procedure RaiseCSTAMonitorConfEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAMonitorStopConfEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );

    { Unsolicited raisers }
    procedure RaiseCSTACallClearedEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAConferencedEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAConnectionClearedEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTADeliveredEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTADivertedEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAEstablishedEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAFailedEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAHeldEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTANetworkReachedEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAOriginatedEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAQueuedEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTARetrievedEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAServiceInitiatedEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTATransferredEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTACallInformationEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTADoNotDisturbEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAForwardingEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAMessageWaitingEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTALoggedOnEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTALoggedOffEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTANotReadyEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAReadyEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAWorkNotReadyEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAWorkReadyEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTABackInServiceEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAOutOfServiceEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAPrivateStatusEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAMonitorEndedEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );

  protected
    { Overrided method that implements the chain of decision }
    procedure HandleCtEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );override;

    { Generic function that check PrivateData length. If empty, raises an error. }
    function CheckPrivateDataLength( const MyPrivateData : ATTPrivateData_t; const FunctionName : ShortString  ) : Boolean;

    { Checks if PrivateData Event matches the provided type }
    function CheckPrivateDataEventType( const MyATTEvent : ATTEvent_t;
      const eventType : ATTEventType_t; const FunctionName : ShortString ) : Boolean;

    { Consists the privatedata fields and fills the ATTEvent for furter handling }
    function ConsistAndExtractReceivedPrivateEvent( const MyPrivateData : ATTPrivateData_t;
      const eventType : ATTEventType_t; var ATTEvent : ATTEvent_t;
      const EventName : ShortString) : Boolean;
  public

    { Calls cstaMonitorDevice service }
    function MonitorDevice( deviceID : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    { Calls cstaMonitorCall service }
    function MonitorCall( call : TCallID; device : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    { Calls cstaMonitorCallsViaDevice service }
    function MonitorCallsViaDevice( deviceID : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    { Stops a monitor session, calling cstaMonitorStop service }
    function MonitorStop( monitorCrossRefID : CSTAMonitorCrossRefID_t;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

  published
    { Confirmation events }
    property OnCSTAMonitorConf        : TCSTAMonitorConfEvent       read FOnCSTAMonitorConf         write FOnCSTAMonitorConf;
    property OnCSTAMonitorStopConf    : TCSTAMonitorStopConfEvent   read FOnCSTAMonitorStopConf     write FOnCSTAMonitorStopConf;

    { Unsolicited events }
    property OnCSTACallCleared        : TCSTACallClearedEvent       read FOnCSTACallCleared         write FOnCSTACallCleared;
    property OnCSTAConferenced        : TCSTAConferencedEvent       read FOnCSTAConferenced         write FOnCSTAConferenced;
    property OnCSTAConnectionCleared  : TCSTAConnectionClearedEvent read FOnCSTAConnectionCleared   write FOnCSTAConnectionCleared;
    property OnCSTADelivered          : TCSTADeliveredEvent         read FOnCSTADelivered           write FOnCSTADelivered;
    property OnCSTADiverted           : TCSTADivertedEvent          read FOnCSTADiverted            write FOnCSTADiverted;
    property OnCSTAEstablished        : TCSTAEstablishedEvent       read FOnCSTAEstablished         write FOnCSTAEstablished;
    property OnCSTAFailed             : TCSTAFailedEvent            read FOnCSTAFailed              write FOnCSTAFailed;
    property OnCSTAHeld               : TCSTAHeldEvent              read FOnCSTAHeld                write FOnCSTAHeld;
    property OnCSTANetworkReached     : TCSTANetworkReachedEvent    read FOnCSTANetworkReached      write FOnCSTANetworkReached;
    property OnCSTAOriginated         : TCSTAOriginatedEvent        read FOnCSTAOriginated          write FOnCSTAOriginated;
    property OnCSTAQueued             : TCSTAQueuedEvent            read FOnCSTAQueued              write FOnCSTAQueued;
    property OnCSTARetrieved          : TCSTARetrievedEvent         read FOnCSTARetrieved           write FOnCSTARetrieved;
    property OnCSTAServiceInitiated   : TCSTAServiceInitiatedEvent  read FOnCSTAServiceInitiated    write FOnCSTAServiceInitiated;
    property OnCSTATransferred        : TCSTATransferredEvent       read FOnCSTATransferred         write FOnCSTATransferred;
    property OnCSTACallInformation    : TCSTACallInformationEvent   read FOnCSTACallInformation     write FOnCSTACallInformation;
    property OnCSTADoNotDisturb       : TCSTADoNotDisturbEvent      read FOnCSTADoNotDisturb        write FOnCSTADoNotDisturb;
    property OnCSTAForwarding         : TCSTAForwardingEvent        read FOnCSTAForwarding          write FOnCSTAForwarding;
    property OnCSTAMessageWaiting     : TCSTAMessageWaitingEvent    read FOnCSTAMessageWaiting      write FOnCSTAMessageWaiting;
    property OnCSTALoggedOn           : TCSTALoggedOnEvent          read FOnCSTALoggedOn            write FOnCSTALoggedOn;
    property OnCSTALoggedOff          : TCSTALoggedOffEvent         read FOnCSTALoggedOff           write FOnCSTALoggedOff;
    property OnCSTANotReady           : TCSTANotReadyEvent          read FOnCSTANotReady            write FOnCSTANotReady;
    property OnCSTAReady              : TCSTAReadyEvent             read FOnCSTAReady               write FOnCSTAReady;
    property OnCSTAWorkNotReady       : TCSTAWorkNotReadyEvent      read FOnCSTAWorkNotReady        write FOnCSTAWorkNotReady;
    property OnCSTAWorkReady          : TCSTAWorkReadyEvent         read FOnCSTAWorkReady           write FOnCSTAWorkReady;
    property OnCSTABackInService      : TCSTABackInServiceEvent     read FOnCSTABackInService       write FOnCSTABackInService;
    property OnCSTAOutOfService       : TCSTAOutOfServiceEvent      read FOnCSTAOutOfService        write FOnCSTAOutOfService;
    property OnCSTAPrivateStatus      : TCSTAPrivateStatusEvent     read FOnCSTAPrivateStatus       write FOnCSTAPrivateStatus;
    property OnCSTAMonitorEnded       : TCSTAMonitorEndedEvent      read FOnCSTAMonitorEnded        write FOnCSTAMonitorEnded;
  end;

implementation

uses SysUtils, uTranslations;

{ TMonitoredCtConector }

function TMonitorServicesCtConector.CheckPrivateDataEventType(
  const MyATTEvent: ATTEvent_t; const eventType: ATTEventType_t;
  const FunctionName: ShortString): Boolean;
begin
Result := MyATTEvent.eventType = eventType;

if not Result then
  begin

  RaiseThreadErrorEvent( Format( 'Wrong ATTEventType. Expected %s but got %s.',
    [ ATTEventTypeToStr( eventType ), ATTEventTypeToStr( MyATTEvent.eventType ) ] ) );
  end;
end;

function TMonitorServicesCtConector.CheckPrivateDataLength(
  const MyPrivateData: ATTPrivateData_t;
  const FunctionName: ShortString): Boolean;
begin
Result := MyPrivateData.length > 0;

if not Result then
  begin
  RaiseThreadErrorEvent( Format( 'Empty PrivateData in %s', [ FunctionName ] ) );
  end;
end;

procedure TMonitorServicesCtConector.HandleCtEvent(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
begin
inherited;
case Event.eventHeader.eventClass of

  CSTACONFIRMATION :
    begin

    case Event.eventHeader.eventType of

      CSTA_MONITOR_CONF :
        begin
        RaiseCSTAMonitorConfEvent( Event, PrivateData );
        end;

      CSTA_MONITOR_STOP_CONF :
        begin
        RaiseCSTAMonitorStopConfEvent( Event, PrivateData );
        end;

      end;

    end;

  CSTAUNSOLICITED :
    begin

    case Event.eventHeader.eventType of

      CSTA_CALL_CLEARED :
        begin
        RaiseCSTACallClearedEvent( Event, PrivateData );
        end;

      CSTA_CONFERENCED :
        begin
        RaiseCSTAConferencedEvent( Event, PrivateData );
        end;

      CSTA_CONNECTION_CLEARED :
        begin
        RaiseCSTAConnectionClearedEvent( Event, PrivateData );
        end;

      CSTA_DELIVERED :
        begin
        RaiseCSTADeliveredEvent( Event, PrivateData );
        end;

      CSTA_DIVERTED :
        begin
        RaiseCSTADivertedEvent( Event, PrivateData );
        end;

      CSTA_ESTABLISHED :
        begin
        RaiseCSTAEstablishedEvent( Event, PrivateData );
        end;

      CSTA_FAILED :
        begin
        RaiseCSTAFailedEvent( Event, PrivateData );
        end;

      CSTA_HELD :
        begin
        RaiseCSTAHeldEvent( Event, PrivateData );
        end;

      CSTA_NETWORK_REACHED :
        begin
        RaiseCSTANetworkReachedEvent( Event, PrivateData );
        end;

      CSTA_ORIGINATED :
        begin
        RaiseCSTAOriginatedEvent( Event, PrivateData );
        end;

      CSTA_QUEUED :
        begin
        RaiseCSTAQueuedEvent( Event, PrivateData );
        end;

      CSTA_RETRIEVED :
        begin
        RaiseCSTARetrievedEvent( Event, PrivateData );
        end;

      CSTA_SERVICE_INITIATED :
        begin
        RaiseCSTAServiceInitiatedEvent( Event, PrivateData );
        end;

      CSTA_TRANSFERRED :
        begin
        RaiseCSTATransferredEvent( Event, PrivateData );
        end;

      CSTA_CALL_INFORMATION :
        begin
        RaiseCSTACallInformationEvent( Event, PrivateData );
        end;

      CSTA_DO_NOT_DISTURB :
        begin
        RaiseCSTADoNotDisturbEvent( Event, PrivateData );
        end;

      CSTA_FORWARDING :
        begin
        RaiseCSTAForwardingEvent( Event, PrivateData );
        end;

      CSTA_MESSAGE_WAITING :
        begin
        RaiseCSTAMessageWaitingEvent( Event, PrivateData );
        end;

      CSTA_LOGGED_ON :
        begin
        RaiseCSTALoggedOnEvent( Event, PrivateData );
        end;

      CSTA_LOGGED_OFF :
        begin
        RaiseCSTALoggedOffEvent( Event, PrivateData );
        end;

      CSTA_NOT_READY :
        begin
        RaiseCSTANotReadyEvent( Event, PrivateData );
        end;

      CSTA_READY :
        begin
        RaiseCSTAReadyEvent( Event, PrivateData );
        end;

      CSTA_WORK_NOT_READY :
        begin
        RaiseCSTAWorkNotReadyEvent( Event, PrivateData );
        end;

      CSTA_WORK_READY :
        begin
        RaiseCSTAWorkReadyEvent( Event, PrivateData );
        end;

      CSTA_BACK_IN_SERVICE :
        begin
        RaiseCSTABackInServiceEvent( Event, PrivateData );
        end;

      CSTA_OUT_OF_SERVICE :
        begin
        RaiseCSTAOutOfServiceEvent( Event, PrivateData );
        end;

      CSTA_PRIVATE_STATUS :
        begin
        RaiseCSTAPrivateStatusEvent( Event, PrivateData );
        end;

      CSTA_MONITOR_ENDED :
        begin
        RaiseCSTAMonitorEndedEvent( Event, PrivateData );
        end;

      end;

    end;

  end;
end;

function TMonitorServicesCtConector.MonitorCall(call: TCallID; device : TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var
  monitorFilter: CSTAMonitorFilter_t;
  _connection : ConnectionID_t;
begin
PrepareConnectionID_t( _connection, call, device );
FillChar( monitorFilter, SizeOf( CSTAMonitorFilter_t ), 0 );

Result := cstaMonitorCall( FacsHandle, InvokeID, @_connection, @monitorFilter, nil );

CheckForGoodCtResult( Result, 'cstaMonitorCall' );
end;

function TMonitorServicesCtConector.MonitorDevice(deviceID: TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var
  monitorFilter: CSTAMonitorFilter_t;
  FDeviceID_t : DeviceID_t;
begin
FillChar( monitorFilter, SizeOf( CSTAMonitorFilter_t ), 0 );

PrepareDeviceID_t( FDeviceID_t, deviceID );

Result := cstaMonitorDevice( FacsHandle, InvokeID, @FDeviceID_t, @monitorFilter, nil );

CheckForGoodCtResult( Result, 'cstaMonitorDevice' );
end;

function TMonitorServicesCtConector.MonitorStop(
  monitorCrossRefID: CSTAMonitorCrossRefID_t; const InvokeID : TInvokeID): TSAPI;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( monitorCrossRefID > 0, 'MonitorStop' ) then
  begin
  Result := cstaMonitorStop( FAcsHandle, InvokeID, monitorCrossRefID, nil );
  CheckForGoodCtResult( Result, 'cstaMonitorStop' );
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAConnectionClearedEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
  userInfo : ATTUserToUserInfo_t;
begin
if Assigned( FOnCSTAConnectionCleared ) then
  begin
  if PrivateData.length > 0 then
    begin
    if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_CONNECTION_CLEARED,
      ATTEvent, 'FOnCSTAConnectionCleared' ) then
      begin
      try
        FOnCSTAConnectionCleared( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
          Event._event.cstaUnsolicited.connectionCleared.droppedConnection,
          Event._event.cstaUnsolicited.connectionCleared.releasingDevice,
          Event._event.cstaUnsolicited.connectionCleared.localConnectionInfo,
          Event._event.cstaUnsolicited.connectionCleared.cause,
          ATTEvent.u.connectionClearedEvent.userInfo );
      except
        on E : Exception do
          begin
          CatchEventException( 'FOnCSTAConnectionCleared', E.Message );
          end;
      end;
      end
    end
  else
    begin
    FillChar( userInfo, SizeOf( userInfo ), 0 );
    try
      FOnCSTAConnectionCleared( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
        Event._event.cstaUnsolicited.connectionCleared.droppedConnection,
        Event._event.cstaUnsolicited.connectionCleared.releasingDevice,
        Event._event.cstaUnsolicited.connectionCleared.localConnectionInfo,
        Event._event.cstaUnsolicited.connectionCleared.cause,
        userInfo );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTAConnectionCleared', E.Message );
        end;
    end;
    end;

  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTADeliveredEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
  EmptyDeliveredType : ATTDeliveredType_t;
  EmptyDevice : DeviceID_t;
  EmptyLookAheadInfo : ATTLookaheadInfo_t;
  EmptyUserEnteredCode : ATTUserEnteredCode_t;
  EmptyUserToUserInfo : ATTUserToUserInfo_t;
  EmptyOriginalCallInfo : ATTOriginalCallInfo_t;
  EmptyCalledDeviceID : CalledDeviceID_t;
  EmptyUcid : ATTUCID_t;
  EmptyCallOriginatorInfo : ATTCallOriginatorInfo_t;
begin
if Assigned( FOnCSTADelivered ) then
  begin
  if PrivateData.length > 0 then
    begin
    if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_DELIVERED,
      ATTEvent, 'FOnCSTADelivered' ) then
      begin
      try
        FOnCSTADelivered( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
          Event._event.cstaUnsolicited.delivered.connection,
          Event._event.cstaUnsolicited.delivered.alertingDevice,
          Event._event.cstaUnsolicited.delivered.callingDevice,
          Event._event.cstaUnsolicited.delivered.calledDevice,
          Event._event.cstaUnsolicited.delivered.lastRedirectionDevice,
          Event._event.cstaUnsolicited.delivered.localConnectionInfo,
          Event._event.cstaUnsolicited.delivered.cause,
          ATTEvent.u.deliveredEvent.deliveredType,
          ATTEvent.u.deliveredEvent.trunkGroup,
          ATTEvent.u.deliveredEvent.trunkMember,
          ATTEvent.u.deliveredEvent.split,
          ATTEvent.u.deliveredEvent.lookaheadInfo,
          ATTEvent.u.deliveredEvent.userEnteredCode,
          ATTEvent.u.deliveredEvent.userInfo,
          ATTEvent.u.deliveredEvent.reason,
          ATTEvent.u.deliveredEvent.originalCallInfo,
          ATTEvent.u.deliveredEvent.distributingDevice,
          ATTEvent.u.deliveredEvent.ucid,
          ATTEvent.u.deliveredEvent.callOriginatorInfo,
          ATTEvent.u.deliveredEvent.flexibleBilling );
      except
        on E : Exception do
          begin
          CatchEventException( 'FOnCSTADelivered', E.Message );
          end;
      end;
      end;
    end
  else
    begin
    FillChar( EmptyDeliveredType, SizeOf( EmptyDeliveredType ), 0 );
    FillChar( EmptyDevice, SizeOf( EmptyDevice ), 0 );
    FillChar( EmptyLookAheadInfo, SizeOf( EmptyLookAheadInfo ), 0 );
    FillChar( EmptyUserEnteredCode, SizeOf( EmptyUserEnteredCode ), 0 );
    FillChar( EmptyUserToUserInfo, SizeOf( EmptyUserToUserInfo ), 0 );
    FillChar( EmptyOriginalCallInfo, SizeOf( EmptyOriginalCallInfo ), 0 );
    FillChar( EmptyCalledDeviceID, SizeOf( EmptyCalledDeviceID ), 0 );
    FillChar( EmptyUcid, SizeOf( EmptyUcid ), 0 );
    FillChar( EmptyCallOriginatorInfo, SizeOf( EmptyCallOriginatorInfo ), 0 );
    try
      FOnCSTADelivered( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
        Event._event.cstaUnsolicited.delivered.connection,
        Event._event.cstaUnsolicited.delivered.alertingDevice,
        Event._event.cstaUnsolicited.delivered.callingDevice,
        Event._event.cstaUnsolicited.delivered.calledDevice,
        Event._event.cstaUnsolicited.delivered.lastRedirectionDevice,
        Event._event.cstaUnsolicited.delivered.localConnectionInfo,
        Event._event.cstaUnsolicited.delivered.cause,
        EmptyDeliveredType,
        EmptyDevice,
        EmptyDevice,
        EmptyDevice,
        EmptyLookAheadInfo,
        EmptyUserEnteredCode,
        EmptyUserToUserInfo,
        AR_NONE,
        EmptyOriginalCallInfo,
        EmptyCalledDeviceID,
        EmptyUcid,
        EmptyCallOriginatorInfo,
        False );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTADelivered', E.Message );
        end;
    end;
    end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAEstablishedEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
  EmptyDevice : DeviceID_t;
  EmptyLookAheadInfo : ATTLookaheadInfo_t;
  EmptyUserEnteredCode : ATTUserEnteredCode_t;
  EmptyUserToUserInfo : ATTUserToUserInfo_t;
  EmptyOriginalCallInfo : ATTOriginalCallInfo_t;
  EmptyCalledDeviceID : CalledDeviceID_t;
  EmptyUcid : ATTUCID_t;
  EmptyCallOriginatorInfo : ATTCallOriginatorInfo_t;
begin
if Assigned( FOnCSTAEstablished ) then
  begin
  if PrivateData.length > 0 then
    begin
    if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_ESTABLISHED,
      ATTEvent, 'FOnCSTAEstablished' ) then
      begin
      try
        FOnCSTAEstablished( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
          Event._event.cstaUnsolicited.established.establishedConnection,
          Event._event.cstaUnsolicited.established.answeringDevice,
          Event._event.cstaUnsolicited.established.callingDevice,
          Event._event.cstaUnsolicited.established.calledDevice,
          Event._event.cstaUnsolicited.established.lastRedirectionDevice,
          Event._event.cstaUnsolicited.established.localConnectionInfo,
          Event._event.cstaUnsolicited.established.cause,
          ATTEvent.u.establishedEvent.trunkGroup,
          ATTEvent.u.establishedEvent.trunkMember,
          ATTEvent.u.establishedEvent.split,
          ATTEvent.u.establishedEvent.lookaheadInfo,
          ATTEvent.u.establishedEvent.userEnteredCode,
          ATTEvent.u.establishedEvent.userInfo,
          ATTEvent.u.establishedEvent.reason,
          ATTEvent.u.establishedEvent.originalCallInfo,
          ATTEvent.u.establishedEvent.distributingDevice,
          ATTEvent.u.establishedEvent.ucid,
          ATTEvent.u.establishedEvent.callOriginatorInfo,
          ATTEvent.u.establishedEvent.flexibleBilling );
      except
        on E : Exception do
          begin
          CatchEventException( 'FOnCSTAEstablished', E.Message );
          end;
      end;
      end;
    end
  else
    begin
    FillChar( EmptyDevice, SizeOf( EmptyDevice ), 0 );
    FillChar( EmptyLookAheadInfo, SizeOf( EmptyLookAheadInfo ), 0 );
    FillChar( EmptyUserEnteredCode, SizeOf( EmptyUserEnteredCode ), 0 );
    FillChar( EmptyUserToUserInfo, SizeOf( EmptyUserToUserInfo ), 0 );
    FillChar( EmptyOriginalCallInfo, SizeOf( EmptyOriginalCallInfo ), 0 );
    FillChar( EmptyCalledDeviceID, SizeOf( EmptyCalledDeviceID ), 0 );
    FillChar( EmptyUcid, SizeOf( EmptyUcid ), 0 );
    FillChar( EmptyCallOriginatorInfo, SizeOf( EmptyCallOriginatorInfo ), 0 );
    try
      FOnCSTAEstablished( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
        Event._event.cstaUnsolicited.established.establishedConnection,
        Event._event.cstaUnsolicited.established.answeringDevice,
        Event._event.cstaUnsolicited.established.callingDevice,
        Event._event.cstaUnsolicited.established.calledDevice,
        Event._event.cstaUnsolicited.established.lastRedirectionDevice,
        Event._event.cstaUnsolicited.established.localConnectionInfo,
        Event._event.cstaUnsolicited.established.cause,
        EmptyDevice,
        EmptyDevice,
        EmptyDevice,
        EmptyLookAheadInfo,
        EmptyUserEnteredCode,
        EmptyUserToUserInfo,
        AR_NONE,
        EmptyOriginalCallInfo,
        EmptyCalledDeviceID,
        EmptyUcid,
        EmptyCallOriginatorInfo,
        False );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTAEstablished', E.Message );
        end;
    end;
    end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAMonitorConfEvent(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTAMonitorConf ) then
  begin
  try
    FOnCSTAMonitorConf( Self, Event._event.cstaConfirmation.invokeID,
      Event._event.cstaConfirmation.monitorStart.monitorCrossRefID,
      Event._event.cstaConfirmation.monitorStart.monitorFilter );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTAMonitorConf', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAMonitorStopConfEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
try
  RaiseNullConfEvent( FOnCSTAMonitorStopConf, Event, PrivateData );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAMonitorStopConf', E.Message );
    end;
end;
end;

procedure TMonitorServicesCtConector.RaiseCSTANetworkReachedEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
begin
if Assigned( FOnCSTANetworkReached ) then
  begin
  if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_NETWORK_REACHED,
    ATTEvent, 'FOnCSTANetworkReached' ) then
    begin
    try
      FOnCSTANetworkReached( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
        Event._event.cstaUnsolicited.networkReached.connection,
        Event._event.cstaUnsolicited.networkReached.trunkUsed,
        Event._event.cstaUnsolicited.networkReached.calledDevice,
        Event._event.cstaUnsolicited.networkReached.localConnectionInfo,
        Event._event.cstaUnsolicited.networkReached.cause,
        ATTEvent.u.networkReachedEvent.progressLocation,
        ATTEvent.u.networkReachedEvent.progressDescription,
        ATTEvent.u.networkReachedEvent.trunkGroup,
        ATTEvent.u.networkReachedEvent.trunkMember );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTANetworkReached', E.Message );
        end;
    end;
    end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAOriginatedEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
  EmptyLogicalAgent : DeviceID_t;
  EmptyUserToUserInfo : ATTUserToUserInfo_t;
begin
if Assigned( FOnCSTAOriginated ) then
  begin
  if PrivateData.length > 0 then
    begin
    if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_ORIGINATED,
      ATTEvent, 'FOnCSTAOriginated' ) then
      begin
      try
        FOnCSTAOriginated( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
         Event._event.cstaUnsolicited.originated.originatedConnection,
         Event._event.cstaUnsolicited.originated.callingDevice,
         Event._event.cstaUnsolicited.originated.calledDevice,
         Event._event.cstaUnsolicited.originated.localConnectionInfo,
         Event._event.cstaUnsolicited.originated.cause,
         ATTEvent.u.originatedEvent.logicalAgent,
         ATTEvent.u.originatedEvent.userInfo );
      except
        on E : Exception do
          begin
          CatchEventException( 'FOnCSTAOriginated', E.Message );
          end;
      end;
      end;
    end
  else
    begin
    FillChar( EmptyLogicalAgent, SizeOf( EmptyLogicalAgent ), 0 );
    FillChar( EmptyUserToUserInfo, SizeOf( EmptyUserToUserInfo ), 0 );
    try
      FOnCSTAOriginated( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
       Event._event.cstaUnsolicited.originated.originatedConnection,
       Event._event.cstaUnsolicited.originated.callingDevice,
       Event._event.cstaUnsolicited.originated.calledDevice,
       Event._event.cstaUnsolicited.originated.localConnectionInfo,
       Event._event.cstaUnsolicited.originated.cause,
       EmptyLogicalAgent,
       EmptyUserToUserInfo );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTAOriginated', E.Message );
        end;
    end;
    end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAServiceInitiatedEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
begin
if Assigned( FOnCSTAServiceInitiated ) then
  begin
  if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_SERVICE_INITIATED,
    ATTEvent, 'FOnCSTAServiceInitiated' ) then
    begin
    try
      FOnCSTAServiceInitiated( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
        Event._event.cstaUnsolicited.serviceInitiated.initiatedConnection,
        Event._event.cstaUnsolicited.serviceInitiated.localConnectionInfo,
        Event._event.cstaUnsolicited.serviceInitiated.cause,
        ATTEvent.u.serviceInitiated.ucid );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTAServiceInitiated', E.Message );
        end;
    end;
    end;
  end;
end;

function TMonitorServicesCtConector.MonitorCallsViaDevice(
  deviceID: TDeviceID; const InvokeID : TInvokeID): TSAPI;
var
  monitorFilter: CSTAMonitorFilter_t;
  FDeviceID_t : DeviceID_t;
begin
FillChar( monitorFilter, SizeOf( CSTAMonitorFilter_t ), 0 );

PrepareDeviceID_t( FDeviceID_t, deviceID );

Result := cstaMonitorCallsViaDevice( FacsHandle, InvokeID, @FDeviceID_t, @monitorFilter, nil );

CheckForGoodCtResult( Result, 'cstaMonitorDevice' );
end;

procedure TMonitorServicesCtConector.RaiseCSTAMonitorEndedEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTAMonitorEnded ) then
  begin
  try
    FOnCSTAMonitorEnded( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.monitorEnded.cause );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTAMonitorEnded', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTACallClearedEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
begin
if Assigned( FOnCSTACallCleared ) then
  begin
  if PrivateData.length > 0 then
    begin
    if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_CALL_CLEARED,
      ATTEvent, 'FOnCSTACallCleared' ) then
      begin
      try
        FOnCSTACallCleared( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
          Event._event.cstaUnsolicited.callCleared.clearedCall,
          Event._event.cstaUnsolicited.callCleared.localConnectionInfo,
          Event._event.cstaUnsolicited.callCleared.cause,
          ATTEvent.u.callClearedEvent.reason );
      except
        on E : Exception do
          begin
          CatchEventException( 'FOnCSTACallCleared', E.Message );
          end;
      end;
      end;
    end
  else
    begin
    FOnCSTACallCleared( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.callCleared.clearedCall,
      Event._event.cstaUnsolicited.callCleared.localConnectionInfo,
      Event._event.cstaUnsolicited.callCleared.cause, AR_NONE );
    end;
  end
end;

function TMonitorServicesCtConector.ConsistAndExtractReceivedPrivateEvent(
  const MyPrivateData: ATTPrivateData_t; const eventType : ATTEventType_t;
  var ATTEvent: ATTEvent_t; const EventName : ShortString): Boolean;
var ret : TSAPI;
begin
Result := CheckPrivateDataLength( MyPrivateData, EventName );

if Result then
  begin

  ret := attPrivateData( @MyPrivateData, @ATTEvent );

  Result := CheckForGoodCtResult( ret, 'attPrivateData' );

  if Result then
    begin

    Result := CheckPrivateDataEventType( ATTEvent, eventType, EventName );

    end;

  end;

end;

procedure TMonitorServicesCtConector.RaiseCSTAConferencedEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var ATTEvent : ATTEvent_t;
begin
if Assigned( FOnCSTAConferenced ) then
  begin
  if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_CONFERENCED,
    ATTEvent, 'FOnCSTAConferenced' ) then
    begin
    try
      FOnCSTAConferenced( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
        Event._event.cstaUnsolicited.conferenced.primaryOldCall,
        Event._event.cstaUnsolicited.conferenced.secondaryOldCall,
        Event._event.cstaUnsolicited.conferenced.confController,
        Event._event.cstaUnsolicited.conferenced.addedParty,
        Event._event.cstaUnsolicited.conferenced.conferenceConnections,
        Event._event.cstaUnsolicited.conferenced.localConnectionInfo,
        Event._event.cstaUnsolicited.conferenced.cause,
        ATTEvent.u.conferencedEvent.originalCallInfo,
        ATTEvent.u.conferencedEvent.distributingDevice,
        ATTEvent.u.conferencedEvent.ucid,
        ATTEvent.u.conferencedEvent.trunkList );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTAConferenced', E.Message );
        end;
    end;
    end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTADivertedEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTADiverted ) then
  begin
  try
    FOnCSTADiverted( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.diverted.connection,
      Event._event.cstaUnsolicited.diverted.divertingDevice,
      Event._event.cstaUnsolicited.diverted.newDestination,
      Event._event.cstaUnsolicited.diverted.localConnectionInfo,
      Event._event.cstaUnsolicited.diverted.cause );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTADiverted', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAFailedEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTAFailed ) then
  begin
  try
    FOnCSTAFailed( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.failed.failedConnection,
      Event._event.cstaUnsolicited.failed.failingDevice,
      Event._event.cstaUnsolicited.failed.calledDevice,
      Event._event.cstaUnsolicited.failed.localConnectionInfo,
      Event._event.cstaUnsolicited.failed.cause );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTAFailed', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAHeldEvent(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTAHeld ) then
  begin
  try
    FOnCSTAHeld( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.held.heldConnection,
      Event._event.cstaUnsolicited.held.holdingDevice,
      Event._event.cstaUnsolicited.held.localConnectionInfo,
      Event._event.cstaUnsolicited.held.cause );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTAHeld', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAQueuedEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTAQueued ) then
  begin
  try
    FOnCSTAQueued( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.queued.queuedConnection,
      Event._event.cstaUnsolicited.queued.queue,
      Event._event.cstaUnsolicited.queued.callingDevice,
      Event._event.cstaUnsolicited.queued.calledDevice,
      Event._event.cstaUnsolicited.queued.lastRedirectionDevice,
      Event._event.cstaUnsolicited.queued.numberQueued,
      Event._event.cstaUnsolicited.queued.localConnectionInfo,
      Event._event.cstaUnsolicited.queued.cause );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTAQueued', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTARetrievedEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTARetrieved ) then
  begin
  try
    FOnCSTARetrieved( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.retrieved.retrievedConnection,
      Event._event.cstaUnsolicited.retrieved.retrievingDevice,
      Event._event.cstaUnsolicited.retrieved.localConnectionInfo,
      Event._event.cstaUnsolicited.retrieved.cause );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTARetrieved', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTATransferredEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var ATTEvent : ATTEvent_t;
begin
if Assigned( FOnCSTATransferred ) then
  begin
  if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_TRANSFERRED,
    ATTEvent, 'FOnCSTATransferred' ) then
    begin
    try
      FOnCSTATransferred( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
        Event._event.cstaUnsolicited.transferred.primaryOldCall,
        Event._event.cstaUnsolicited.transferred.secondaryOldCall,
        Event._event.cstaUnsolicited.transferred.transferringDevice,
        Event._event.cstaUnsolicited.transferred.transferredDevice,
        Event._event.cstaUnsolicited.transferred.transferredConnections,
        Event._event.cstaUnsolicited.transferred.localConnectionInfo,
        Event._event.cstaUnsolicited.transferred.cause,
        ATTEvent.u.transferredEvent.originalCallInfo,
        ATTEvent.u.transferredEvent.distributingDevice,
        ATTEvent.u.transferredEvent.ucid,
        ATTEvent.u.transferredEvent.trunkList );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTATransferred', E.Message );
        end;
    end;
    end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTACallInformationEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTACallInformation ) then
  begin
  try
    FOnCSTACallInformation( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.callInformation.connection,
      Event._event.cstaUnsolicited.callInformation.device,
      Event._event.cstaUnsolicited.callInformation.accountInfo,
      Event._event.cstaUnsolicited.callInformation.authorisationCode );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTACallInformation', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTADoNotDisturbEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTADoNotDisturb ) then
  begin
  try
    FOnCSTADoNotDisturb( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.doNotDisturb.device,
      Event._event.cstaUnsolicited.doNotDisturb.doNotDisturbOn );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTADoNotDisturb', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAForwardingEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTAForwarding ) then
  begin
  try
    FOnCSTAForwarding( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.forwarding.device,
      Event._event.cstaUnsolicited.forwarding.forwardingInformation );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTAForwarding', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAMessageWaitingEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTAMessageWaiting ) then
  begin
  try
    FOnCSTAMessageWaiting( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.messageWaiting.deviceForMessage,
      Event._event.cstaUnsolicited.messageWaiting.invokingDevice,
      Event._event.cstaUnsolicited.messageWaiting.messageWaitingOn );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTAMessageWaiting', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTALoggedOnEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var ATTEvent : ATTEvent_t;
begin
if Assigned( FOnCSTALoggedOn ) then
  begin
  if PrivateData.length > 0 then
    begin
    if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_LOGGED_ON,
      ATTEvent, 'FOnCSTALoggedOn' ) then
      begin
      try
        FOnCSTALoggedOn( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
          Event._event.cstaUnsolicited.loggedOn.agentDevice,
          Event._event.cstaUnsolicited.loggedOn.agentID,
          Event._event.cstaUnsolicited.loggedOn.agentGroup,
          Event._event.cstaUnsolicited.loggedOn.password,
          ATTEvent.u.loggedOnEvent.workMode );
      except
        on E : Exception do
          begin
          CatchEventException( 'FOnCSTALoggedOn', E.Message );
          end;
      end;
      end;
    end
  else
    begin
    try
      FOnCSTALoggedOn( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
        Event._event.cstaUnsolicited.loggedOn.agentDevice,
        Event._event.cstaUnsolicited.loggedOn.agentID,
        Event._event.cstaUnsolicited.loggedOn.agentGroup,
        Event._event.cstaUnsolicited.loggedOn.password,
        WM_NONE );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTALoggedOn', E.Message );
        end;
    end;
    end
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTALoggedOffEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var ATTEvent : ATTEvent_t;
begin
if Assigned( FOnCSTALoggedOff ) then
  begin
  if PrivateData.length > 0 then
    begin
    if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_LOGGED_OFF,
      ATTEvent, 'FOnCSTALoggedOff' ) then
      begin
      try
        FOnCSTALoggedOff( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
          Event._event.cstaUnsolicited.loggedOff.agentDevice,
          Event._event.cstaUnsolicited.loggedOff.agentID,
          Event._event.cstaUnsolicited.loggedOff.agentGroup,
          ATTEvent.u.loggedOffEvent.reasonCode );
      except
        on E : Exception do
          begin
          CatchEventException( 'FOnCSTALoggedOff', E.Message );
          end;
      end;
      end;
    end
  else
    begin
    try
      FOnCSTALoggedOff( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
        Event._event.cstaUnsolicited.loggedOff.agentDevice,
        Event._event.cstaUnsolicited.loggedOff.agentID,
        Event._event.cstaUnsolicited.loggedOff.agentGroup,
        0 );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTALoggedOff', E.Message );
        end;
    end;
    end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTANotReadyEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTANotReady ) then
  begin
  try
    FOnCSTANotReady( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.notReady.agentDevice,
      Event._event.cstaUnsolicited.notReady.agentID );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTANotReady', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAReadyEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTAReady ) then
  begin
  try
    FOnCSTAReady( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.Ready.agentDevice,
      Event._event.cstaUnsolicited.Ready.agentID );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTAReady', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAWorkNotReadyEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTAWorkNotReady ) then
  begin
  try
    FOnCSTAWorkNotReady( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.workNotReady.agentDevice,
      Event._event.cstaUnsolicited.workNotReady.agentID );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTAWorkNotReady', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAWorkReadyEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTAWorkReady ) then
  begin
  try
    FOnCSTAWorkReady( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.workReady.agentDevice,
      Event._event.cstaUnsolicited.workReady.agentID );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTAWorkReady', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTABackInServiceEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTABackInService ) then
  begin
  try
    FOnCSTABackInService( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.backInService.device,
      Event._event.cstaUnsolicited.backInService.cause );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTABackInService', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAOutOfServiceEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTAOutOfService ) then
  begin
  try
    FOnCSTAOutOfService( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
      Event._event.cstaUnsolicited.outOfService.device,
      Event._event.cstaUnsolicited.outOfService.cause );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTAOutOfService', E.Message );
      end;
  end;
  end;
end;

procedure TMonitorServicesCtConector.RaiseCSTAPrivateStatusEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var ATTEvent : ATTEvent_t;
begin
if Assigned( FOnCSTAPrivateStatus ) then
  begin
  if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_CHARGE_ADVICE,
    ATTEvent, 'FOnCSTAPrivateStatus' ) then
    begin
    try
      FOnCSTAPrivateStatus( Self, Event._event.cstaUnsolicited.monitorCrossRefId,
        ATTEvent.u.chargeAdviceEvent.connection,
        ATTEvent.u.chargeAdviceEvent.calledDevice,
        ATTEvent.u.chargeAdviceEvent.chargingDevice,
        ATTEvent.u.chargeAdviceEvent.trunkGroup,
        ATTEvent.u.chargeAdviceEvent.trunkMember,
        ATTEvent.u.chargeAdviceEvent.chargeType,
        ATTEvent.u.chargeAdviceEvent.charge,
        ATTEvent.u.chargeAdviceEvent.error );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTAPrivateStatus', E.Message );
        end;
    end;
    end
  end;
end;

end.
