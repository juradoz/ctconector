unit uBasicCallControlCtConector;

interface

uses uStreamerCtConector, uMonitorServicesCtConector, uCSTADefs_h, uATTPDefs_h,
  uATTPriv_h, uACS_h, uCSTA_h, uCtTypes, uCtEvents;

type

  TBasicCallControlCtConector = class( TMonitorServicesCtConector )
  private

    FOnCSTAAlternateCallConf      : TCSTAAlternateCallConfEvent;
    FOnCSTAAnswerCallConf         : TCSTAAnswerCallConfEvent;
    FOnCSTAConferenceCallConf     : TCSTAConferenceCallConfEvent;
    FOnCSTAConsultationCallConf   : TCSTAConsultationCallConfEvent;
    FOnCSTADeflectCallConf        : TCSTADeflectCallConfEvent;
    FOnCSTAClearCallConf          : TCSTAClearCallConfEvent;
    FOnCSTAClearConnectionConf    : TCSTAClearConnectionConfEvent;
    FOnCSTAGroupPickupCallConf    : TCSTAGroupPickupCallConfEvent;
    FOnCSTAHoldCallConf           : TCSTAHoldCallConfEvent;
    FOnCSTAMakeCallConf           : TCSTAMakeCallConfEvent;
    FOnCSTAMakePredictiveCallConf : TCSTAMakePredictiveCallConfEvent;
    FOnCSTARetrieveCallConf       : TCSTARetrieveCallConfEvent;
    FOnCSTATransferCallConf       : TCSTATransferCallConfEvent;

    procedure RaiseCSTAAlternateCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAAnswerCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAConferenceCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAConsultationCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTADeflectCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAClearCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAClearConnectionConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAGroupPickUpCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAHoldCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAMakeCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTAMakePredictiveCallCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTARetrieveCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    procedure RaiseCSTATransferCallConf( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );

  protected
    procedure HandleCtEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );override;

    procedure PrepareATTPrivateData_t( var MyPrivateData : ATTPrivateData_t );
    procedure PrepareATTUserToUserInfo_t( var MyUserToUserInfo : ATTUserToUserInfo_t;
      const UserToUserInfo : ShortString );

  public

    function AlternateCall( const activeCall, otherCall : TCallID;
      DeviceID : TDeviceID = ''; const InvokeID : TInvokeID = 0 ) : TSAPI;

    function AnswerCall( const alertingCall : TCallID;
      DeviceID : TDeviceID = ''; const InvokeID : TInvokeID = 0 ) : TSAPI;

    function ConferenceCall( const heldCall, activeCall : TCallID;
      const deviceID : TDeviceID; const InvokeID : TInvokeID = 0 ) : TSAPI;

    function ConsultationCall( const activeCall : TCallID;
      const callingDevice, calledDevice : TDeviceID;
      const UserToUserInformation : ShortString = '';
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function DeflectCall( const deflectCall : TCallID;
      const deviceID, calledDevice : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function ClearCall( const call : TCallID; const deviceID : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function ClearConnection( const call : TCallID; const deviceID : TDeviceID;
      const UserToUserInformation : ShortString = '';
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function GroupPickupCall( const deflectCall : TCallID;
      const deviceID, pickupDevice : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function HoldCall( const activeCall : TCallID; const deviceID : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function MakeCall( const callingDevice : TDeviceID;
      const calledDevice : TDeviceID;
      const UserToUserInformation : ShortString = '';
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function MakePredictiveCall( const callingDevice, calledDevice : TDeviceID;
      const allocationState : AllocationState_t; const priorityCalling : Boolean;
      const maxRings : Cardinal; answerTreat : ATTAnswerTreat_t;
      const UserToUserInformation : ShortString = '';
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function RetrieveCall( const heldCall : TCallID; const deviceID : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

    function TransferCall( const heldCall, activeCall : TCallID;
      const deviceID : TDeviceID;
      const InvokeID : TInvokeID = 0 ) : TSAPI;

  published
    property OnCSTAAlternateCallConf      : TCSTAAlternateCallConfEvent      read FOnCSTAAlternateCallConf      write FOnCSTAAlternateCallConf;
    property OnCSTAAnswerCallConf         : TCSTAAnswerCallConfEvent         read FOnCSTAAnswerCallConf         write FOnCSTAAnswerCallConf;
    property OnCSTAConferenceCallConf     : TCSTAConferenceCallConfEvent     read FOnCSTAConferenceCallConf     write FOnCSTAConferenceCallConf;
    property OnCSTAConsultationCallConf   : TCSTAConsultationCallConfEvent   read FOnCSTAConsultationCallConf   write FOnCSTAConsultationCallConf;
    property OnCSTADeflectCallConf        : TCSTADeflectCallConfEvent        read FOnCSTADeflectCallConf        write FOnCSTADeflectCallConf;
    property OnCSTAClearCallConf          : TCSTAClearCallConfEvent          read FOnCSTAClearCallConf          write FOnCSTAClearCallConf;
    property OnCSTAClearConnectionConf    : TCSTAClearConnectionConfEvent    read FOnCSTAClearConnectionConf    write FOnCSTAClearConnectionConf;
    property OnCSTAGroupPickupCallConf    : TCSTAGroupPickupCallConfEvent    read FOnCSTAGroupPickupCallConf    write FOnCSTAGroupPickupCallConf;
    property OnCSTAHoldCallConf           : TCSTAHoldCallConfEvent           read FOnCSTAHoldCallConf           write FOnCSTAHoldCallConf;
    property OnCSTAMakeCallConf           : TCSTAMakeCallConfEvent           read FOnCSTAMakeCallConf           write FOnCSTAMakeCallConf;
    property OnCSTAMakePredictiveCallConf : TCSTAMakePredictiveCallConfEvent read FOnCSTAMakePredictiveCallConf write FOnCSTAMakePredictiveCallConf;
    property OnCSTARetrieveCallConf       : TCSTARetrieveCallConfEvent       read FOnCSTARetrieveCallConf       write FOnCSTARetrieveCallConf;
    property OnCSTATransferCallConf       : TCSTATransferCallConfEvent       read FOnCSTATransferCallConf       write FOnCSTATransferCallConf;
  end;

implementation

uses SysUtils, Math, uGeneralThread, Classes, uTranslations;

{ TSwitchingCtConector }

function TBasicCallControlCtConector.AlternateCall(const activeCall,
  otherCall : TCallID; DeviceID : ShortString; const InvokeID : TInvokeID ): TSAPI;
var
  FactiveCall, FotherCall : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( ( ( activecall > 0 ) and ( otherCall > 0 ) ),
  Format( '%s.AlternateCall', [ ClassName ] ) ) then
  begin

  PrepareConnectionID_t( FactiveCall, activeCall, DeviceID );
  PrepareConnectionID_t( FotherCall, activeCall, DeviceID );

  Result := cstaAlternateCall( FAcsHandle, InvokeID, @FactiveCall, @FotherCall, nil );

  CheckForGoodCtResult( Result, 'cstaAlternateCall' );
  end
end;

function TBasicCallControlCtConector.AnswerCall(const alertingCall: TCallID;
  DeviceID: ShortString; const InvokeID : TInvokeID): TSAPI;
var
  FalertingCall : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( alertingCall > 0, Format( '%s.AnswerCall', [ ClassName ] ) ) then
  begin
  PrepareConnectionID_t( FalertingCall, alertingCall, DeviceID );

  Result := cstaAnswerCall( FAcsHandle, InvokeID, @FalertingCall, nil );

  CheckForGoodCtResult( Result, 'cstaAnswerCall' );
  end;
end;

function TBasicCallControlCtConector.ClearCall(const call: TCallID;
  const deviceID : TDeviceID; const InvokeID : TInvokeID): TSAPI;
var _call : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( call > 0, Format( '%s.ClearCall', [ ClassName ] ) ) then
  begin
  PrepareConnectionID_t( _call, call, deviceID );

  Result := cstaClearCall( FAcsHandle, InvokeID, @_call, nil );

  CheckForGoodCtResult( Result, 'cstaClearCall' );

  end;
end;

function TBasicCallControlCtConector.ClearConnection(const call: TCallID;
  const deviceID : TDeviceID;
  const UserToUserInformation: ShortString;
  const InvokeID : TInvokeID): TSAPI;
var
  _call : ConnectionID_t;
  PrivateData : ATTPrivateData_t;
  UserToUserInfo : ATTUserToUserInfo_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( call > 0, Format( '%s.ClearConnection', [ ClassName ] ) ) then
  begin

  PrepareConnectionID_t( _call, call, deviceID );
  PrepareATTPrivateData_t( PrivateData );
  PrepareATTUserToUserInfo_t( UserToUserInfo, UserToUserInformation );

  Result := attV6ClearConnection( @PrivateData, DR_NONE, @UserToUserInfo );

  if CheckForGoodCtResult( Result, 'attV6ClearConnection' ) then
    begin

    Result := cstaClearConnection( FAcsHandle, InvokeID, @_call, @PrivateData );

    CheckForGoodCtResult( Result, 'cstaClearConnection' );

    end;

  end;
end;

function TBasicCallControlCtConector.ConferenceCall(const heldCall,
  activeCall: TCallID; const deviceID : TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var
  _heldCall,
  _activeCall : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( ( heldCall > 0 ) and ( activeCall > 0 ),
  Format( '%s.ConferenceCall', [ ClassName ] ) ) then
  begin
  PrepareConnectionID_t( _heldCall, heldCall, deviceID );
  PrepareConnectionID_t( _activeCall, activeCall, deviceID );

  Result := cstaConferenceCall( FAcsHandle, InvokeID, @_heldCall, @_activeCall, nil );

  CheckForGoodCtResult( Result, 'cstaConferenceCall' );

  end;
end;

function TBasicCallControlCtConector.ConsultationCall(
  const activeCall : TCallID;
  const callingDevice, calledDevice: TDeviceID;
  const UserToUserInformation: ShortString;
  const InvokeID : TInvokeID): TSAPI;
var
  _activeCall          : ConnectionID_t;
  _calledDevice        : DeviceID_t;
  PrivateData          : ATTPrivateData_t;
  UserToUserInfo       : ATTUserToUserInfo_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( ( activeCall > 0 ) and ( calledDevice <> EmptyStr ),
  Format( '%s.ConsultationCall', [ ClassName ] ) ) then
  begin
  PrepareConnectionID_t( _activeCall, activeCall, callingDevice );
  PrepareDeviceID_t( _calledDevice, calledDevice );
  PrepareATTPrivateData_t( PrivateData );
  PrepareATTUserToUserInfo_t( UserToUserInfo, UserToUserInformation );

  Result := attV6ConsultationCall( @PrivateData, nil, false, @UserToUserInfo );

  if CheckForGoodCtResult( Result, 'attV6ConsultationCall' ) then
    begin

      Result := cstaConsultationCall( FAcsHandle, InvokeID, @_activeCall,
        @_calledDevice, @PrivateData );

      CheckForGoodCtResult( Result, 'cstaConsultationCall' );

    end

  end;
end;

function TBasicCallControlCtConector.DeflectCall(const deflectCall: TCallID;
  const deviceID, calledDevice: TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var
  _deflectCall : ConnectionID_t;
  _calledDevice : DeviceID_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( ( deflectCall > 0 ) and ( calledDevice <> EmptyStr ),
  Format( '%s.DeflectCall', [ ClassName ] ) ) then
  begin

  PrepareConnectionID_t( _deflectCall, deflectCall, deviceID );
  PrepareDeviceID_t( _calledDevice, calledDevice );

  Result := cstaDeflectCall( FAcsHandle, InvokeID, @_deflectCall, @_calledDevice, nil );

  CheckForGoodCtResult( Result, 'cstaDeflectCall' );

  end;
end;

function TBasicCallControlCtConector.GroupPickupCall(const deflectCall: TCallID;
  const deviceID, pickupDevice: TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var
  _deflectCall : ConnectionID_t;
  _pickupDevice : DeviceID_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( deflectCall > 0,
  Format( '%s.GroupPickupCall', [ ClassName ] ) ) then
  begin

  PrepareConnectionID_t( _deflectCall, deflectCall, deviceID );
  PrepareDeviceID_t( _pickupDevice, pickupDevice );

  Result := cstaGroupPickupCall( FAcsHandle, InvokeID, @_deflectCall, @_pickUpDevice, nil );

  CheckForGoodCtResult( Result, 'cstaGroupPickupCall' );

  end;
end;

procedure TBasicCallControlCtConector.HandleCtEvent(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
begin
inherited;
case Event.eventHeader.eventClass of

  CSTACONFIRMATION :
    begin

    case Event.eventHeader.eventType of

      CSTA_ALTERNATE_CALL_CONF :
        begin
        RaiseCSTAAlternateCallConf( Event, PrivateData );
        end;

      CSTA_ANSWER_CALL_CONF :
        begin
        RaiseCSTAAnswerCallConf( Event, PrivateData );
        end;

      CSTA_CONFERENCE_CALL_CONF :
        begin
        RaiseCSTAConferenceCallConf( Event, PrivateData );
        end;

      CSTA_CONSULTATION_CALL_CONF :
        begin
        RaiseCSTAConsultationCallConf( Event, PrivateData );
        end;

      CSTA_DEFLECT_CALL_CONF :
        begin
        RaiseCSTADeflectCallConf( Event, PrivateData );
        end;

      CSTA_CLEAR_CALL_CONF :
        begin
        RaiseCSTAClearCallConf( Event, PrivateData );
        end;

      CSTA_CLEAR_CONNECTION_CONF :
        begin
        RaiseCSTAClearConnectionConf( Event, PrivateData );
        end;

      CSTA_GROUP_PICKUP_CALL_CONF :
        begin
        RaiseCSTAGroupPickUpCallConf( Event, PrivateData );
        end;

      CSTA_HOLD_CALL_CONF :
        begin
        RaiseCSTAHoldCallConf( Event, PrivateData );
        end;

      CSTA_MAKE_PREDICTIVE_CALL_CONF :
        begin
        RaiseCSTAMakePredictiveCallCallConf( Event, PrivateData );
        end;

      CSTA_MAKE_CALL_CONF :
        begin
        RaiseCSTAMakeCallConf( Event, PrivateData );
        end;

      CSTA_RETRIEVE_CALL_CONF :
        begin
        RaiseCSTARetrieveCallConf( Event, PrivateData );
        end;

      CSTA_TRANSFER_CALL_CONF :
        begin
        RaiseCSTATransferCallConf( Event, PrivateData );
        end;

      end;

    end;

  end;
end;

function TBasicCallControlCtConector.HoldCall(
  const activeCall: TCallID; const deviceID : TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var _activeCall : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( activeCall > 0, Format( '%s.HoldCall', [ ClassName ] ) ) then
  begin
  PrepareConnectionID_t( _activeCall, activeCall, deviceID );

  Result := cstaHoldCall( FAcsHandle, InvokeID, @_activeCall, true, nil );

  CheckForGoodCtResult( Result, 'cstaHoldCall' );

  end;
end;

function TBasicCallControlCtConector.MakeCall(const callingDevice: TDeviceID;
  const calledDevice : TDeviceID;
  const UserToUserInformation: ShortString;
  const InvokeID : TInvokeID ): TSAPI;
var
  _calledDevice,
  _callingDevice      : DeviceID_t;
  PrivateData          : ATTPrivateData_t;
  UserToUserInfo       : ATTUserToUserInfo_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( calledDevice <> EmptyStr,
  Format( '%s.MakeCall', [ ClassName ] ) ) then
  begin
  PrepareDeviceID_t( _callingDevice, callingDevice );
  PrepareDeviceID_t( _calledDevice, calledDevice );

  PrepareATTPrivateData_t( PrivateData );
  PrepareATTUserToUserInfo_t( UserToUserInfo, UserToUserInformation );

  Result := attV6MakeCall(@PrivateData, nil, False, @UserToUserInfo );

  if CheckForGoodCtResult( Result, 'attV6MakeCall' ) then
    begin

    Result := cstaMakeCall( FAcsHandle, InvokeID, @_callingDevice, @_calledDevice, @PrivateData );

    CheckForGoodCtResult( Result, 'cstaMakeCall' );

    end;

  end;
end;

function TBasicCallControlCtConector.MakePredictiveCall(
  const callingDevice, calledDevice : TDeviceID;
  const allocationState : AllocationState_t; const priorityCalling : Boolean;
  const maxRings : Cardinal; answerTreat : ATTAnswerTreat_t;
  const UserToUserInformation : ShortString;
  const InvokeID : TInvokeID ) : TSAPI;
var
  _callingDevice, _calledDevice : DeviceID_t;
  PrivateData : ATTPrivateData_t;
  UserToUserInfo : ATTUserToUserInfo_t;
begin
Result := ACSERR_BADPARAMETER;
if CheckParams( ( callingDevice <> EmptyStr ) and
  ( calledDevice <> EmptyStr ), 'MakePredictiveCall' ) then
  begin
  PrepareDeviceID_t( _callingDevice, callingDevice );
  PrepareDeviceID_t( _calledDevice, calledDevice );
  PrepareATTPrivateData_t( PrivateData );
  PrepareATTUserToUserInfo_t( UserToUserInfo, UserToUserInformation );

  Result := attV6MakePredictiveCall( @PrivateData, priorityCalling, maxRings,
    answerTreat, nil, @UserToUserInfo );

  if CheckForGoodCtResult( Result, 'attV6MakePredictiveCall' ) then
    begin

    Result := cstaMakePredictiveCall( FAcsHandle, InvokeID, @_callingDevice,
      @_calledDevice, allocationState, @PrivateData );

    CheckForGoodCtResult( Result, 'cstaMakePredictiveCall' );

    end;

  end;
end;

procedure TBasicCallControlCtConector.PrepareATTPrivateData_t(
  var MyPrivateData: ATTPrivateData_t);
begin
FillChar( MyPrivateData, SizeOf( MyPrivateData ), 0 );
initATTPrivate( @MyPrivateData );
end;

procedure TBasicCallControlCtConector.PrepareATTUserToUserInfo_t(
  var MyUserToUserInfo: ATTUserToUserInfo_t;
  const UserToUserInfo: ShortString);
begin
FillChar( MyUserToUserInfo, SizeOf( MyUserToUserInfo ), 0 );
MyUserToUserInfo._type := UUI_IA5_ASCII;
MyUserToUserInfo.data.length := Min( Length( UserToUserInfo ), ATT_MAX_UUI_SIZE );
StrPLCopy( @MyUserToUserInfo.data.value, UserToUserInfo , Min( Length( UserToUserInfo ), ATT_MAX_UUI_SIZE ) );
end;

procedure TBasicCallControlCtConector.RaiseCSTAAlternateCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
try
  RaiseNullConfEvent( FOnCSTAAlternateCallConf, Event, PrivateData );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAAlternateCallConf', E.Message );
    end;
end;
end;

procedure TBasicCallControlCtConector.RaiseCSTAAnswerCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
try
  RaiseNullConfEvent( FOnCSTAAnswerCallConf, Event, PrivateData );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAAnswerCallConf', E.Message );
    end;
end;
end;

procedure TBasicCallControlCtConector.RaiseCSTAClearCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
try
  RaiseNullConfEvent( FOnCSTAClearCallConf, Event, PrivateData );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAClearCallConf', E.Message );
    end;
end;
end;

procedure TBasicCallControlCtConector.RaiseCSTAClearConnectionConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
try
  RaiseNullConfEvent( FOnCSTAClearConnectionConf, Event, PrivateData );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAClearConnectionConf', E.Message );
    end;
end;
end;

procedure TBasicCallControlCtConector.RaiseCSTAConferenceCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
begin
if Assigned( FOnCSTAConferenceCallConf ) then
  begin

  if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_CONFERENCE_CALL_CONF,
    ATTEvent, 'FOnCSTAConferenceCallConf' ) then
    begin
    try
      FOnCSTAConferenceCallConf( Self, Event._event.cstaConfirmation.invokeID,
        Event._event.cstaConfirmation.conferenceCall.newCall,
        Event._event.cstaConfirmation.conferenceCall.connList,
        ATTEvent.u.conferenceCall.ucid );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTAConferenceCallConf', E.Message );
        end;
    end;
    end;
  end;
end;

procedure TBasicCallControlCtConector.RaiseCSTAConsultationCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
begin
if Assigned( FOnCSTAConsultationCallConf ) then
  begin

  if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_CONSULTATION_CALL_CONF,
    ATTEvent, 'FOnCSTAConsultationCallConf' ) then
    begin
    try
      FOnCSTAConsultationCallConf( Self, Event._event.cstaConfirmation.invokeID,
        Event._event.cstaConfirmation.consultationCall.newCall,
        ATTEvent.u.consultationCall.ucid );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTAConsultationCallConf', E.Message );
        end;
    end;
    end;
  end;
end;

procedure TBasicCallControlCtConector.RaiseCSTADeflectCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
try
  RaiseNullConfEvent( FOnCSTADeflectCallConf, Event, PrivateData );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTADeflectCallConf', E.Message );
    end;
end;
end;

procedure TBasicCallControlCtConector.RaiseCSTAGroupPickupCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
try
  RaiseNullConfEvent( FOnCSTAGroupPickupCallConf, Event, PrivateData );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAGroupPickupCallConf', E.Message );
    end;
end;
end;

procedure TBasicCallControlCtConector.RaiseCSTAHoldCallConf(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
begin
try
  RaiseNullConfEvent( FOnCSTAHoldCallConf, Event, PrivateData );
except
  on E : Exception do
    begin
    CatchEventException( 'FOnCSTAHoldCallConf', E.Message );
    end;
end;
end;

procedure TBasicCallControlCtConector.RaiseCSTAMakeCallConf(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
begin
if Assigned( FOnCSTAMakeCallConf ) then
  begin

  if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_MAKE_CALL_CONF,
    ATTEvent, 'FOnCSTAMakeCallConf' ) then
    begin
    try
      FOnCSTAMakeCallConf( Self, Event._event.cstaConfirmation.invokeID,
        ATTEvent.u.consultationCall.ucid );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTAMakeCallConf', E.Message );
        end;
    end;
    end;
  end;
end;

procedure TBasicCallControlCtConector.RaiseCSTAMakePredictiveCallCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
begin
if Assigned( FOnCSTAMakePredictiveCallConf ) then
  begin

  if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_MAKE_PREDICTIVE_CALL_CONF,
    ATTEvent, 'FOnCSTAMakePredictiveCallConf' ) then
    begin
    try
      FOnCSTAMakePredictiveCallConf( Self, Event._event.cstaConfirmation.invokeID,
       Event._event.cstaConfirmation.makePredictiveCall.newCal,
       ATTEvent.u.makePredictiveCall.ucid );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTAMakePredictiveCallConf', E.Message );
        end;
    end;
    end;
  end;
end;

procedure TBasicCallControlCtConector.RaiseCSTARetrieveCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
RaiseNullConfEvent( FOnCSTARetrieveCallConf, Event, PrivateData );
end;

procedure TBasicCallControlCtConector.RaiseCSTATransferCallConf(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
var
  ATTEvent : ATTEvent_t;
begin
if Assigned( FOnCSTATransferCallConf ) then
  begin

  if ConsistAndExtractReceivedPrivateEvent( PrivateData, ATT_TRANSFER_CALL_CONF,
    ATTEvent, 'FOnCSTATransferCallConf' ) then
    begin
    try
      FOnCSTATransferCallConf( Self, Event._event.cstaConfirmation.invokeID,
        Event._event.cstaConfirmation.conferenceCall.newCall,
        Event._event.cstaConfirmation.conferenceCall.connList,
        ATTEvent.u.conferenceCall.ucid );
    except
      on E : Exception do
        begin
        CatchEventException( 'FOnCSTATransferCallConf', E.Message );
        end;
    end;
    end;
  end;
end;

function TBasicCallControlCtConector.RetrieveCall(
  const heldCall: TCallID; const deviceID : TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var _heldCall : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( heldCall > 0, Format( '%s.RetrieveCall', [ ClassName ] ) ) then
  begin

  PrepareConnectionID_t( _heldCall, heldCall, deviceID );

  Result := cstaRetrieveCall( FAcsHandle, InvokeID, @_heldCall, nil );

  CheckForGoodCtResult( Result, 'cstaRetrieveCall' );

  end;
end;

function TBasicCallControlCtConector.TransferCall(const heldCall,
  activeCall: TCallID; const deviceID : TDeviceID;
  const InvokeID : TInvokeID): TSAPI;
var
  _heldCall,
  _activeCall : ConnectionID_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( ( heldCall > 0 ) and ( activeCall > 0 ),
  Format( '%s.TransferCall', [ ClassName ] ) ) then
  begin

  PrepareConnectionID_t( _heldCall, heldCall, deviceID );
  PrepareConnectionID_t( _activeCall, activeCall, deviceID );

  Result := cstaTransferCall( FAcsHandle, InvokeID, @_heldCall, @_activeCall, nil );

  CheckForGoodCtResult( Result, 'cstaTransferCall' );

  end;
end;

end.
