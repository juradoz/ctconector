unit CtConectorImpl;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, ActiveX, Classes, Controls, Graphics, Menus, Forms, ExtCtrls,
  ComServ, StdVCL, AXCtrls, CtConectorXControl_TLB, uCtClient, uCtTypes,
  uACSDefs_h, uCSTADefs_h, uCSTA_h, uATTPDefs_h, uATTPriv_h;

type
  TPanelCtConector = class( TPanel )
  private
    FCtConector : TCtClient;
    FImage      : TImage;
    procedure CanotResizePanel(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property CtConector : TCtClient read FCtConector write FCtConector;
  end;

  TCtConectorX = class(TActiveXControl, ICtConectorX)
  private
    { Private declarations }
    FDelphiControl: TPanelCtConector;
    FEvents: ICtConectorXEvents;

    procedure DoOnCtEvent( Sender : TObject; Event : CSTAEvent_t;
      PrivateData : ATTPrivateData_t );
    procedure DoOnACSOpenStreamConf( Sender : TObject; InvokeID : TInvokeID;
    apiVer, libVer, tsrvVer, drvrVer : uACSDefs_h.Version_t );
    procedure DoOnACSCloseStreamConf( Sender : TObject; InvokeID : TInvokeID );
    procedure DoOnACSUniversalFailureConf( Sender : TObject;
      InvokeID : TInvokeID; error : ACSUniversalFailure_t );
    procedure DoOnCSTAUniversalFailureConf( Sender : TObject;
      InvokeID : TInvokeID; error : CSTAUniversalFailure_t );

    procedure DoOnCSTAMonitorConf( Sender : TObject; InvokeID : TInvokeID;
      monitorCrossRefID : CSTAMonitorCrossRefID_t;
      monitorFilter     : CSTAMonitorFilter_t );
    procedure DoOnCSTAMonitorStopConf( Sender : TObject; InvokeID : TInvokeID );
    procedure DoOnCSTACallCleared( Sender : TObject;
      monitorCrossRefId     : CSTAMonitorCrossRefID_t;
      clearedCall           : ConnectionID_t;
      localConnectionInfo   : LocalConnectionState_t;
      cause                 : CSTAEventCause_t;
      reason                : ATTReasonCode_t );
    procedure DoOnCSTAConferenced( Sender : TObject;
      monitorCrossRefId     : CSTAMonitorCrossRefID_t;
      primaryOldCall        : ConnectionID_t;
      secondaryOldCall      : ConnectionID_t;
      confController        : SubjectDeviceID_t;
      addedParty            : SubjectDeviceID_t;
      conferenceConnections : ConnectionList_t;
      localConnectionInfo   : LocalConnectionState_t;
      cause                 : CSTAEventCause_t;
      originalCallInfo      : ATTOriginalCallInfo_t;
      distributingDevice    : CalledDeviceID_t;
      ucid                  : ATTUCID_t;
      trunkList             : ATTTrunkList_t );
    procedure DoOnCSTAConnectionCleared( Sender : TObject;
      monitorCrossRefId     : CSTAMonitorCrossRefID_t;
      droppedConnection     : ConnectionID_t;
      releasingDevice       : SubjectDeviceID_t;
      localConnectionInfo   : LocalConnectionState_t;
      cause                 : CSTAEventCause_t;
      userInfo              : ATTUserToUserInfo_t );
    procedure DoOnCSTADelivered( Sender : TObject;
      monitorCrossRefId     : CSTAMonitorCrossRefID_t;
      connection            : ConnectionID_t;
      alertingDevice        : SubjectDeviceID_t;
      callingDevice         : CallingDeviceID_t;
      calledDevice          : CalledDeviceID_t ;
      lastRedirectionDevice : RedirectionDeviceID_t;
      localConnectionInfo   : LocalConnectionState_t;
      cause                 : CSTAEventCause_t;
      deliveredType         : ATTDeliveredType_t;
      trunkGroup            : DeviceID_t;
      trunkMember           : DeviceID_t;
      split                 : DeviceID_t;
      lookaheadInfo         : ATTLookaheadInfo_t;
      userEnteredCode       : ATTUserEnteredCode_t;
      userInfo              : ATTUserToUserInfo_t;
      reason                : ATTReasonCode_t;
      originalCallInfo      : ATTOriginalCallInfo_t;
      distributingDevice    : CalledDeviceID_t;
      ucid                  : ATTUCID_t;
      callOriginatorInfo    : ATTCallOriginatorInfo_t;
      flexibleBilling       : Boolean );
    procedure DoOnCSTADiverted( Sender : TObject;
      monitorCrossRefId     : CSTAMonitorCrossRefID_t;
      connection            : ConnectionID_t;
      divertingDevice       : SubjectDeviceID_t;
      newDestination        : CalledDeviceID_t;
      localConnectionInfo   : LocalConnectionState_t;
      cause                 : CSTAEventCause_t );
    procedure DoOnCSTAEstablished( Sender : TObject;
      monitorCrossRefId     : CSTAMonitorCrossRefID_t;
      establishedConnection : ConnectionID_t;
      answeringDevice       : SubjectDeviceID_t;
      callingDevice         : CallingDeviceID_t;
      calledDevice          : CalledDeviceID_t;
      lastRedirectionDevice : RedirectionDeviceID_t;
      localConnectionInfo   : LocalConnectionState_t;
      cause                 : CSTAEventCause_t;
      trunkGroup            : DeviceID_t;
      trunkMember           : DeviceID_t;
      split                 : DeviceID_t;
      lookaheadInfo         : ATTLookaheadInfo_t;
      userEnteredCode       : ATTUserEnteredCode_t;
      userInfo              : ATTUserToUserInfo_t;
      reason                : ATTReasonCode_t;
      originalCallInfo      : ATTOriginalCallInfo_t;
      distributingDevice    : CalledDeviceID_t;
      ucid                  : ATTUCID_t;
      callOriginatorInfo    : ATTCallOriginatorInfo_t;
      flexibleBilling       : Boolean );
    procedure DoOnCSTAFailed( Sender : TObject;
      monitorCrossRefId     : CSTAMonitorCrossRefID_t;
      failedConnection      : ConnectionID_t;
      failingDevice         : SubjectDeviceID_t;
      calledDevice          : CalledDeviceID_t;
      localConnectionInfo   : LocalConnectionState_t;
      cause                 : CSTAEventCause_t );
    procedure DoOnCSTAHeld( Sender : TObject;
      monitorCrossRefId     : CSTAMonitorCrossRefID_t;
      heldConnection        : ConnectionID_t;
      holdingDevice         : SubjectDeviceID_t;
      localConnectionInfo   : LocalConnectionState_t;
      cause                 : CSTAEventCause_t );
    procedure DoOnCSTANetworkReached( Sender : TObject;
      monitorCrossRefId     : CSTAMonitorCrossRefID_t;
      connection            : ConnectionID_t;
      trunkUsed             : SubjectDeviceID_t;
      calledDevice          : CalledDeviceID_t;
      localConnectionInfo   : LocalConnectionState_t;
      cause                 : CSTAEventCause_t;
      progressLocation      : ATTProgressLocation_t;
      progressDescription   : ATTProgressDescription_t;
      trunkGroup            : DeviceID_t;
      trunkMember           : DeviceID_t );
    procedure DoOnCSTAOriginated( Sender : TObject;
      monitorCrossRefId   : CSTAMonitorCrossRefID_t;
      originatedConnection : ConnectionID_t;
      callingDevice       : SubjectDeviceID_t;
      calledDevice        : CalledDeviceID_t;
      localConnectionInfo : LocalConnectionState_t;
      cause               : CSTAEventCause_t;
      logicalAgent        : DeviceID_t;
      userInfo            : ATTUserToUserInfo_t );
    procedure DoOnCSTAQueued( Sender : TObject;
      monitorCrossRefId     : CSTAMonitorCrossRefID_t;
      queuedConnection      : ConnectionID_t;
      queue                 : SubjectDeviceID_t;
      callingDevice         : CallingDeviceID_t;
      calledDevice          : CalledDeviceID_t;
      lastRedirectionDevice : RedirectionDeviceID_t;
      numberQueued          : short;
      localConnectionInfo   : LocalConnectionState_t;
      cause                 : CSTAEventCause_t );
    procedure DoOnCSTARetrieved( Sender : TObject;
      monitorCrossRefId     : CSTAMonitorCrossRefID_t;
      retrievedConnection   : ConnectionID_t;
      retrievingDevice      : SubjectDeviceID_t;
      localConnectionInfo   : LocalConnectionState_t;
      cause                 : CSTAEventCause_t );
    procedure DoOnCSTAServiceInitiated( Sender : TObject;
      monitorCrossRefId : CSTAMonitorCrossRefID_t;
      initiatedConnection : ConnectionID_t;
      localConnectionInfo : LocalConnectionState_t;
      cause : CSTAEventCause_t;
      ucid : ATTUCID_t );
    procedure DoOnCSTATransferred( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      primaryOldCall         : ConnectionID_t;
      secondaryOldCall       : ConnectionID_t;
      transferringDevice     : SubjectDeviceID_t;
      transferredDevice      : SubjectDeviceID_t;
      transferredConnections : ConnectionList_t;
      localConnectionInfo    : LocalConnectionState_t;
      cause                  : CSTAEventCause_t;
      originalCallInfo       : ATTOriginalCallInfo_t;
      distributingDevice     : CalledDeviceID_t;
      ucid                   : ATTUCID_t;
      trunkList              : ATTTrunkList_t );
    procedure DoOnCSTACallInformation( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      connection             : ConnectionID_t;
      device                 : SubjectDeviceID_t;
      accountInfo            : AccountInfo_t;
      authorisationCode      : AuthCode_t );
    procedure DoOnCSTADoNotDisturb( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      device                 : SubjectDeviceID_t;
      doNotDisturbOn         : Boolean );
    procedure DoOnCSTAForwarding( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      device                 : SubjectDeviceID_t;
      forwardingInformation  : ForwardingInfo_t );
    procedure DoOnCSTAMessageWaiting( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      deviceForMessage       : CalledDeviceID_t;
      invokingDevice         : SubjectDeviceID_t;
      messageWaitingOn       : Boolean );
    procedure DoOnCSTALoggedOn( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      agentDevice            : SubjectDeviceID_t;
      agentID                : AgentID_t;
      agentGroup             : AgentGroup_t;
      password               : AgentPassword_t;
      workMode               : ATTWorkMode_t );
    procedure DoOnCSTALoggedOff( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      agentDevice            : SubjectDeviceID_t;
      agentID                : AgentID_t;
      agentGroup             : AgentGroup_t;
      reasonCode             : Integer );
    procedure DoOnCSTANotReady( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      agentDevice            : SubjectDeviceID_t;
      agentID                : AgentID_t );
    procedure DoOnCSTAReady( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      agentDevice            : SubjectDeviceID_t;
      agentID                : AgentID_t );
    procedure DoOnCSTAWorkNotReady( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      agentDevice            : SubjectDeviceID_t;
      agentID                : AgentID_t );
    procedure DoOnCSTAWorkReady( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      agentDevice            : SubjectDeviceID_t;
      agentID                : AgentID_t );
    procedure DoOnCSTABackInService( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      device                 : DeviceID_t;
      cause                  : CSTAEventCause_t );
    procedure DoOnCSTAOutOfService( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      device                 : DeviceID_t;
      cause                  : CSTAEventCause_t );
    procedure DoOnCSTAPrivateStatus( Sender : TObject;
      monitorCrossRefId      : CSTAMonitorCrossRefID_t;
      connection             : ConnectionID_t;
      calledDevice           : DeviceID_t;
      chargingDevice         : DeviceID_t;
      trunkGroup             : DeviceID_t;
      trunkMember            : DeviceID_t;
      chargeType             : ATTChargeType_t;
      charge                 : LongInt;
      error                  : ATTChargeError_t );
    procedure DoOnCSTAMonitorEnded( Sender : TObject;
      monitorCrossRefId : CSTAMonitorCrossRefID_t;
      cause : CSTAEventCause_t );

    procedure DoOnCSTAAlternateCallConf( Sender : TObject;
      InvokeID : TInvokeID );
    procedure DoOnCSTAAnswerCallConf( Sender : TObject;
      InvokeID : TInvokeID );
    procedure DoOnCSTAConferenceCallConf( Sender : TObject;
      InvokeID : TInvokeID; newCall : ConnectionID_t; connList : ConnectionList_t;
      ucid : ATTUCID_t );
    procedure DoOnCSTAConsultationCallConf( Sender : TObject;
      InvokeID : TInvokeID; newCall : ConnectionID_t; ucid : ATTUCID_t );
    procedure DoOnCSTADeflectCallConf( Sender : TObject;
      InvokeID : TInvokeID );
    procedure DoOnCSTAClearCallConf( Sender : TObject;
      InvokeID : TInvokeID );
    procedure DoOnCSTAClearConnectionConf( Sender : TObject;
      InvokeID : TInvokeID );
    procedure DoOnCSTAGroupPickupCallConf( Sender : TObject;
      InvokeID : TInvokeID );
    procedure DoOnCSTAHoldCallConf( Sender : TObject;
      InvokeID : TInvokeID );
    procedure DoOnCSTAMakeCallConf( Sender : TObject; InvokeID : TInvokeID;
      ucid : ATTUCID_t );
    procedure DoOnCSTAMakePredictiveCallConf( Sender : TObject;
      InvokeID : TInvokeID; newCall : ConnectionID_t; ucid : ATTUCID_t );
    procedure DoOnCSTARetrieveCallConf( Sender : TObject;
      InvokeID : TInvokeID );
    procedure DoOnCSTATransferCallConf( Sender : TObject; InvokeID : TInvokeID;
      newCall : ConnectionID_t; connList : ConnectionList_t; ucid : ATTUCID_t );

    procedure DoOnCSTASnapshotDeviceConf( Sender : TObject; InvokeID : TInvokeID;
      snapshotData               : CSTASnapshotDeviceData_t );

    procedure DoOnATTQueryAcdSplitConf( Sender : TObject; InvokeID : TInvokeID;
      availableAgents : short;
      callsInQueue    : short;
      agentsLoggedIn  : short );
    procedure DoOnATTQueryAgentLoginConf( Sender : TObject; InvokeID : TInvokeID;
      privEventCrossRefID : ATTPrivEventCrossRefID_t );
    procedure DoOnATTQueryAgentLoginResp( Sender : TObject;
      privEventCrossRefID   : ATTPrivEventCrossRefID_t;
      devices : array of ShortString );
    procedure DoOnATTQueryAgentLoginEnd( Sender : TObject;
      privEventCrossRefID   : ATTPrivEventCrossRefID_t );
    procedure DoOnATTQueryTgConf( Sender : TObject; InvokeID : TInvokeID;
      idleTrunks         : short;
      usedTrunks         : short );
    procedure DoOnATTQueryCallClassifierConf( Sender : TObject; InvokeID : TInvokeID;
      numAvailPorts      : short;
      numInUsePorts      : short );

  protected
    { Protected declarations }
    procedure DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage); override;
    procedure EventSinkChanged(const EventSink: IUnknown); override;
    procedure InitializeControl; override;
    function DrawTextBiDiModeFlagsReadingOnly: Integer; safecall;
    procedure InitiateAction; safecall;        
    function OpenStream(const ServerID, LoginID, Passwd: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function CloseStream(InvokeID: Int64): SYSINT; safecall;
    procedure Shutdown; safecall;
    function MonitorCall(call: SYSINT; const device: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function MonitorCallsViaDevice(const deviceID: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function MonitorDevice(const deviceID: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function MonitorStop(monitorCrossRefID: SYSINT; InvokeID: Int64): SYSINT;
      safecall;
    function AlternateCall(activeCall, otherCall: SYSINT;
      const DeviceID: WideString; InvokeID: Int64): SYSINT; safecall;
    function AnswerCall(alertingCall: SYSINT; const DeviceID: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function ClearCall(call: SYSINT; const deviceID: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function ClearConnection(call: SYSINT; const deviceID,
      UserToUserInformation: WideString; InvokeID: Int64): SYSINT;
      safecall;
    function ConferenceCall(heldCall, activeCall: SYSINT;
      const deviceID: WideString; InvokeID: Int64): SYSINT; safecall;
    function ConsultationCall(activeCall: SYSINT; const callingDevice,
      calledDevice, UserToUserInformation: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function DeflectCall(deflectCall: SYSINT; const deviceID,
      calledDevice: WideString; InvokeID: Int64): SYSINT; safecall;
    function GroupPickupCall(deflectCall: SYSINT; const deviceID,
      pickupDevice: WideString; InvokeID: Int64): SYSINT; safecall;
    function HoldCall(activeCall: SYSINT; const deviceID: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function MakeCall(const callingDevice, calledDevice,
      UserToUserInformation: WideString; InvokeID: Int64): SYSINT;
      safecall;
    function MakePredictiveCall(const callingDevice, calledDevice: WideString;
      allocationState: SYSINT; priorityCalling: WordBool; maxRings,
      answerTreat: SYSINT; const UserToUserInformation: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function RetrieveCall(heldCall: SYSINT; const deviceID: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function TransferCall(heldCall, activeCall: SYSINT;
      const deviceID: WideString; InvokeID: Int64): SYSINT; safecall;
    function QueryAgentState(const device: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function QueryDeviceInfo(const device: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function SetAgentState(const device: WideString; agentMode: SYSINT;
      const agentID, agentGroup, agentPassword: WideString; workMode,
      reasonCode: SYSINT; enablePending: WordBool;
      InvokeID: Int64): SYSINT; safecall;
    function QueryAcdSplit(const device: WideString; InvokeID: Int64): SYSINT;
      safecall;
    function QueryAgentLogin(const device: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function QueryCallClassifier(InvokeID: Int64): SYSINT; safecall;
    function QueryTrunkGroup(const device: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function SnapshotDeviceReq(const snapshotObj: WideString;
      InvokeID: Int64): SYSINT; safecall;
    function EventClassToStr(eventClass: SYSINT): WideString; safecall;
    function EventTypeToStr(eventClass: SYSINT;
      eventType: SYSINT): WideString; safecall;
    function ACSUniversalFailureToStr(error: SYSINT): WideString; safecall;
    function CSTAUniversalFailureToStr(error: SYSINT): WideString; safecall;
    function CtReturnToStr(ctReturn: SYSINT): WideString; safecall;
    function DeviceTypeToStr(deviceType: SYSINT): WideString; safecall;
    function CallStateToStr(callState: SYSINT): WideString; safecall;
    function LocalConnectionStateToStr(
      localConnectionState: SYSINT): WideString; safecall;
    function ATTEventTypeToStr(eventType: SYSINT): WideString; safecall;
    function CSTAEventCauseToStr(eventCause: SYSINT): WideString; safecall;
    function ATTDeliveredTypeToStr(deliveredType: SYSINT): WideString; safecall;
    function ATTReasonCodeToStr(reasonCode: SYSINT): WideString; safecall;
    function ATTProgressLocationToStr(
      progressLocation: SYSINT): WideString; safecall;
    function ATTProgressDescriptionToStr(
      progressDescription: SYSINT): WideString; safecall;
    function AgentStateToStr(agentState: SYSINT): WideString; safecall;
    function AgentModeToStr(agentMode: SYSINT): WideString; safecall;
    function ATTWorkModeToStr(workMode: SYSINT): WideString; safecall;
    function ATTTalkStateToStr(talkState: SYSINT): WideString; safecall;
  end;

implementation

uses ComObj, uMonitorServicesCtConector, uBasicCallControlCtConector,
  uEscapeServicesCtConector, SysUtils, uTranslations, uACS_h;

{ TCtConectorX }

procedure TCtConectorX.DefinePropertyPages(DefinePropertyPage: TDefinePropertyPage);
begin
  {TODO: Define property pages here.  Property pages are defined by calling
    DefinePropertyPage with the class id of the page.  For example,
      DefinePropertyPage(Class_CtConectorXPage); }
end;

procedure TCtConectorX.EventSinkChanged(const EventSink: IUnknown);
begin
  FEvents := EventSink as ICtConectorXEvents;
end;

procedure TCtConectorX.InitializeControl;
begin

FDelphiControl := Control as TPanelCtConector;

FDelphiControl.CtConector.OnCtEvent                  := DoOnCtEvent;
FDelphiControl.CtConector.OnACSOpenStreamConf        := DoOnACSOpenStreamConf;
FDelphiControl.CtConector.OnACSCloseStreamConf       := DoOnACSCloseStreamConf;
FDelphiControl.CtConector.OnACSUniversalFailureConf  := DoOnACSUniversalFailureConf;
FDelphiControl.CtConector.OnCSTAUniversalFailureConf := DoOnCSTAUniversalFailureConf;

FDelphiControl.CtConector.OnCSTAMonitorConf := DoOnCSTAMonitorConf;
FDelphiControl.CtConector.OnCSTAMonitorStopConf := DoOnCSTAMonitorStopConf;
FDelphiControl.CtConector.OnCSTACallCleared := DoOnCSTACallCleared;
FDelphiControl.CtConector.OnCSTAConferenced := DoOnCSTAConferenced;
FDelphiControl.CtConector.OnCSTAConnectionCleared := DoOnCSTAConnectionCleared;
FDelphiControl.CtConector.OnCSTADelivered := DoOnCSTADelivered;
FDelphiControl.CtConector.OnCSTADiverted := DoOnCSTADiverted;
FDelphiControl.CtConector.OnCSTAEstablished  := DoOnCSTAEstablished;
FDelphiControl.CtConector.OnCSTAFailed := DoOnCSTAFailed;
FDelphiControl.CtConector.OnCSTAHeld := DoOnCSTAHeld;
FDelphiControl.CtConector.OnCSTANetworkReached := DoOnCSTANetworkReached;
FDelphiControl.CtConector.OnCSTAOriginated := DoOnCSTAOriginated;
FDelphiControl.CtConector.OnCSTAQueued := DoOnCSTAQueued;
FDelphiControl.CtConector.OnCSTARetrieved := DoOnCSTARetrieved;
FDelphiControl.CtConector.OnCSTAServiceInitiated := DoOnCSTAServiceInitiated;
FDelphiControl.CtConector.OnCSTATransferred := DoOnCSTATransferred;
FDelphiControl.CtConector.OnCSTACallInformation := DoOnCSTACallInformation;
FDelphiControl.CtConector.OnCSTADoNotDisturb := DoOnCSTADoNotDisturb;
FDelphiControl.CtConector.OnCSTAForwarding := DoOnCSTAForwarding;
FDelphiControl.CtConector.OnCSTAMessageWaiting := DoOnCSTAMessageWaiting;
FDelphiControl.CtConector.OnCSTALoggedOn := DoOnCSTALoggedOn;
FDelphiControl.CtConector.OnCSTALoggedOff := DoOnCSTALoggedOff;
FDelphiControl.CtConector.OnCSTANotReady := DoOnCSTANotReady;
FDelphiControl.CtConector.OnCSTAReady := DoOnCSTAReady;
FDelphiControl.CtConector.OnCSTAWorkNotReady := DoOnCSTAWorkNotReady;
FDelphiControl.CtConector.OnCSTAWorkReady := DoOnCSTAWorkReady;
FDelphiControl.CtConector.OnCSTABackInService := DoOnCSTABackInService;
FDelphiControl.CtConector.OnCSTAOutOfService := DoOnCSTAOutOfService;
FDelphiControl.CtConector.OnCSTAPrivateStatus := DoOnCSTAPrivateStatus;
FDelphiControl.CtConector.OnCSTAMonitorEnded := DoOnCSTAMonitorEnded;

FDelphiControl.CtConector.OnCSTAAlternateCallConf := DoOnCSTAAlternateCallConf;
FDelphiControl.CtConector.OnCSTAAnswerCallConf := DoOnCSTAAnswerCallConf;
FDelphiControl.CtConector.OnCSTAConferenceCallConf := DoOnCSTAConferenceCallConf;
FDelphiControl.CtConector.OnCSTAConsultationCallConf := DoOnCSTAConsultationCallConf;
FDelphiControl.CtConector.OnCSTADeflectCallConf := DoOnCSTADeflectCallConf;
FDelphiControl.CtConector.OnCSTAClearCallConf := DoOnCSTAClearCallConf;
FDelphiControl.CtConector.OnCSTAClearConnectionConf := DoOnCSTAClearConnectionConf;
FDelphiControl.CtConector.OnCSTAGroupPickupCallConf := DoOnCSTAGroupPickupCallConf;
FDelphiControl.CtConector.OnCSTAHoldCallConf := DoOnCSTAHoldCallConf;
FDelphiControl.CtConector.OnCSTAMakeCallConf := DoOnCSTAMakeCallConf;
FDelphiControl.CtConector.OnCSTAMakePredictiveCallConf := DoOnCSTAMakePredictiveCallConf;
FDelphiControl.CtConector.OnCSTARetrieveCallConf := DoOnCSTARetrieveCallConf;
FDelphiControl.CtConector.OnCSTATransferCallConf := DoOnCSTATransferCallConf;

FDelphiControl.CtConector.OnCSTASnapshotDeviceConf := DoOnCSTASnapshotDeviceConf;

FDelphiControl.CtConector.OnATTQueryAcdSplitConf := DoOnATTQueryAcdSplitConf;
FDelphiControl.CtConector.OnATTQueryAgentLoginConf := DoOnATTQueryAgentLoginConf;
FDelphiControl.CtConector.OnATTQueryAgentLoginResp := DoOnATTQueryAgentLoginResp;
FDelphiControl.CtConector.OnATTQueryAgentLoginEnd := DoOnATTQueryAgentLoginEnd;
FDelphiControl.CtConector.OnATTQueryTgConf := DoOnATTQueryTgConf;
FDelphiControl.CtConector.OnATTQueryCallClassifierConf := DoOnATTQueryCallClassifierConf;
end;

function TCtConectorX.OpenStream(const ServerID, LoginID,
  Passwd: WideString; InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.OpenStream( ServerID, LoginID, Passwd, InvokeID );
end;

function TCtConectorX.CloseStream(InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.CloseStream( InvokeID );
end;

procedure TCtConectorX.Shutdown;
begin
FDelphiControl.CtConector.ShutDown;
end;

function TCtConectorX.MonitorCall(call: SYSINT; const device: WideString;
  InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.MonitorCall( call, device, InvokeID );
end;

function TCtConectorX.MonitorCallsViaDevice(const deviceID: WideString;
  InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.MonitorCallsViaDevice( deviceID, InvokeID );
end;

function TCtConectorX.MonitorDevice(const deviceID: WideString;
  InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.MonitorDevice( deviceID, InvokeID );
end;

function TCtConectorX.MonitorStop(monitorCrossRefID: SYSINT;
  InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.MonitorStop( monitorCrossRefID, InvokeID );
end;

function TCtConectorX.AlternateCall(activeCall, otherCall: SYSINT;
  const DeviceID: WideString; InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.AlternateCall( activeCall, otherCall, DeviceID,
  InvokeID );
end;

function TCtConectorX.AnswerCall(alertingCall: SYSINT;
  const DeviceID: WideString; InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.AnswerCall( alertingCall, DeviceID, InvokeID );
end;

function TCtConectorX.ClearCall(call: SYSINT; const deviceID: WideString;
  InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.ClearCall( call, deviceID, InvokeID );
end;

function TCtConectorX.ClearConnection(call: SYSINT; const deviceID,
  UserToUserInformation: WideString; InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.ClearConnection( call, deviceID, UserToUserInformation,
  InvokeID );
end;

function TCtConectorX.ConferenceCall(heldCall, activeCall: SYSINT;
  const deviceID: WideString; InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.ConferenceCall( heldCall, activeCall, deviceID,
  InvokeID );
end;

function TCtConectorX.ConsultationCall(activeCall: SYSINT;
  const callingDevice, calledDevice, UserToUserInformation: WideString;
  InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.ConsultationCall( activeCall, callingDevice, calledDevice,
  UserToUserInformation, InvokeID );
end;

function TCtConectorX.DeflectCall(deflectCall: SYSINT; const deviceID,
  calledDevice: WideString; InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.DeflectCall( deflectCall, deviceID, calledDevice,
  InvokeID );
end;

function TCtConectorX.GroupPickupCall(deflectCall: SYSINT; const deviceID,
  pickupDevice: WideString; InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.GroupPickupCall( deflectCall, deviceID, pickupDevice,
  InvokeID );
end;

function TCtConectorX.HoldCall(activeCall: SYSINT;
  const deviceID: WideString; InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.HoldCall( activeCall, deviceID, InvokeID );
end;

function TCtConectorX.MakeCall(const callingDevice, calledDevice,
  UserToUserInformation: WideString; InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.MakeCall( callingDevice, calledDevice, UserToUserInformation,
  InvokeID );
end;

function TCtConectorX.MakePredictiveCall(const callingDevice,
  calledDevice: WideString; allocationState: SYSINT;
  priorityCalling: WordBool; maxRings, answerTreat: SYSINT;
  const UserToUserInformation: WideString; InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.MakePredictiveCall( callingDevice, calledDevice,
  AllocationState_t( allocationState ), priorityCalling, maxRings,
  ATTAnswerTreat_t( answerTreat ), UserToUserInformation, InvokeID );
end;

function TCtConectorX.RetrieveCall(heldCall: SYSINT;
  const deviceID: WideString; InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.RetrieveCall( heldCall, deviceID, InvokeID );
end;

function TCtConectorX.TransferCall(heldCall, activeCall: SYSINT;
  const deviceID: WideString; InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.TransferCall( heldCall, activeCall, deviceID, InvokeID );
end;

function TCtConectorX.QueryAgentState(const device: WideString;
  InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.QueryAgentState( device, InvokeID );
end;

function TCtConectorX.QueryDeviceInfo(const device: WideString;
  InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.QueryDeviceInfo( device, InvokeID );
end;

function TCtConectorX.SetAgentState(const device: WideString;
  agentMode: SYSINT; const agentID, agentGroup, agentPassword: WideString;
  workMode, reasonCode: SYSINT; enablePending: WordBool;
  InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.SetAgentState( device, AgentMode_t( agentMode ), agentID,
  agentGroup, agentPassword, ATTWorkMode_t( workMode ), reasonCode,
  enablePending, InvokeID );
end;

function TCtConectorX.QueryAcdSplit(const device: WideString;
  InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.QueryAcdSplit( device, InvokeID );
end;

function TCtConectorX.QueryAgentLogin(const device: WideString;
  InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.QueryAgentLogin( device, InvokeID );
end;

function TCtConectorX.QueryCallClassifier(InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.QueryCallClassifier( InvokeID );
end;

function TCtConectorX.QueryTrunkGroup(const device: WideString;
  InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.QueryTrunkGroup( device, InvokeID );
end;

function TCtConectorX.SnapshotDeviceReq(const snapshotObj: WideString;
  InvokeID: Int64): SYSINT;
begin
Result := FDelphiControl.CtConector.SnapshotDeviceReq( snapshotObj, InvokeID );
end;

procedure TCtConectorX.DoOnACSCloseStreamConf(Sender: TObject;
  InvokeID: TInvokeID);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnACSCloseStreamConf( InvokeID );
  end;
end;

procedure TCtConectorX.DoOnACSOpenStreamConf(Sender: TObject;
  InvokeID: TInvokeID; apiVer, libVer, tsrvVer, drvrVer: Version_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnACSOpenStreamConf( InvokeID, apiVer, libVer, tsrvVer, drvrVer );
  end;
end;

procedure TCtConectorX.DoOnACSUniversalFailureConf(Sender: TObject;
  InvokeID: TInvokeID; error: ACSUniversalFailure_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnACSUniversalFailureConf( InvokeID, Ord( error ) );
  end;
end;

procedure TCtConectorX.DoOnCSTAUniversalFailureConf(Sender: TObject;
  InvokeID: TInvokeID; error: CSTAUniversalFailure_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAUniversalFailureConf( InvokeID, Ord( error ) );
  end;
end;

procedure TCtConectorX.DoOnCtEvent(Sender: TObject; Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCtEvent( Event.eventHeader.eventClass, Event.eventHeader.eventType );
  end;
end;

procedure TCtConectorX.DoOnCSTABackInService(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t; device: DeviceID_t;
  cause: CSTAEventCause_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTABackInService( monitorCrossRefId, device, Ord( cause ) );
  end;
end;

procedure TCtConectorX.DoOnCSTACallCleared(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t; clearedCall: ConnectionID_t;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t;
  reason: ATTReasonCode_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTACallCleared( monitorCrossRefId, clearedCall.callID,
    clearedCall.deviceID, Ord( localConnectionInfo ), Ord( cause ),
    Ord( reason ) );
  end;
end;

procedure TCtConectorX.DoOnCSTACallInformation(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t; connection: ConnectionID_t;
  device: SubjectDeviceID_t; accountInfo: AccountInfo_t;
  authorisationCode: AuthCode_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTACallInformation( monitorCrossRefId, connection.callID,
    connection.deviceID, device.deviceID, accountInfo, authorisationCode );
  end;
end;

procedure TCtConectorX.DoOnCSTAConferenced(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t; primaryOldCall,
  secondaryOldCall: ConnectionID_t; confController,
  addedParty: SubjectDeviceID_t; conferenceConnections: ConnectionList_t;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t;
  originalCallInfo: ATTOriginalCallInfo_t;
  distributingDevice: CalledDeviceID_t; ucid: ATTUCID_t;
  trunkList: ATTTrunkList_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAConferenced( monitorCrossRefId, primaryOldCall.callID,
    primaryOldCall.deviceID, secondaryOldCall.callID, secondaryOldCall.deviceID,
    confController.deviceID, addedParty.deviceID, Ord( localConnectionInfo ),
    Ord( cause ), distributingDevice.deviceID, ucid );
  end;
end;

procedure TCtConectorX.DoOnCSTAConnectionCleared(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  droppedConnection: ConnectionID_t; releasingDevice: SubjectDeviceID_t;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t;
  userInfo: ATTUserToUserInfo_t);
var
  I : Integer;
  _userInfo : ShortString;
begin
if Assigned( FEvents ) then
  begin
  _userInfo := EmptyStr;
  for I := 0 to userInfo.data.length - 1 do
    begin
    _userInfo := _userInfo + Char( userinfo.data.value[ I ] );
    end;
  FEvents.OnCSTAConnectionCleared( monitorCrossRefId, droppedConnection.callID,
    droppedConnection.deviceID, releasingDevice.deviceID,
    Ord( localConnectionInfo ), Ord( cause ), _userInfo );
  end;
end;

procedure TCtConectorX.DoOnCSTADelivered(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t; connection: ConnectionID_t;
  alertingDevice: SubjectDeviceID_t; callingDevice: CallingDeviceID_t;
  calledDevice: CalledDeviceID_t;
  lastRedirectionDevice: RedirectionDeviceID_t;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t;
  deliveredType: ATTDeliveredType_t; trunkGroup, trunkMember,
  split: DeviceID_t; lookaheadInfo: ATTLookaheadInfo_t;
  userEnteredCode: ATTUserEnteredCode_t; userInfo: ATTUserToUserInfo_t;
  reason: ATTReasonCode_t; originalCallInfo: ATTOriginalCallInfo_t;
  distributingDevice: CalledDeviceID_t; ucid: ATTUCID_t;
  callOriginatorInfo: ATTCallOriginatorInfo_t; flexibleBilling: Boolean);
var
  I : Integer;
  _userInfo : ShortString;
begin
if Assigned( FEvents ) then
  begin
  _userInfo := EmptyStr;
  for I := 0 to userInfo.data.length - 1 do
    begin
    _userInfo := _userInfo + Char( userinfo.data.value[ I ] );
    end;
  FEvents.OnCSTADelivered( monitorCrossRefId, connection.callID,
    connection.deviceID, alertingDevice.deviceID, callingDevice.deviceID,
    calledDevice.deviceID, lastRedirectionDevice.deviceID,
    Ord( localConnectionInfo ), Ord( cause ), Ord( deliveredType ),
    trunkGroup, trunkMember, split, _userInfo, Ord( reason ),
    distributingDevice.deviceID, ucid, flexibleBilling );
  end;
end;

procedure TCtConectorX.DoOnCSTADiverted(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t; connection: ConnectionID_t;
  divertingDevice: SubjectDeviceID_t; newDestination: CalledDeviceID_t;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTADiverted( monitorCrossRefId, connection.callID,
    connection.deviceID, divertingDevice.deviceID, newDestination.deviceID,
    Ord( localConnectionInfo ), Ord( Cause ) );
  end;
end;

procedure TCtConectorX.DoOnCSTADoNotDisturb(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t; device: SubjectDeviceID_t;
  doNotDisturbOn: Boolean);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTADoNotDisturb( monitorCrossRefId, device.deviceID,
    doNotDisturbOn );
  end;
end;

procedure TCtConectorX.DoOnCSTAEstablished(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  establishedConnection: ConnectionID_t;
  answeringDevice: SubjectDeviceID_t; callingDevice: CallingDeviceID_t;
  calledDevice: CalledDeviceID_t;
  lastRedirectionDevice: RedirectionDeviceID_t;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t;
  trunkGroup, trunkMember, split: DeviceID_t;
  lookaheadInfo: ATTLookaheadInfo_t; userEnteredCode: ATTUserEnteredCode_t;
  userInfo: ATTUserToUserInfo_t; reason: ATTReasonCode_t;
  originalCallInfo: ATTOriginalCallInfo_t;
  distributingDevice: CalledDeviceID_t; ucid: ATTUCID_t;
  callOriginatorInfo: ATTCallOriginatorInfo_t; flexibleBilling: Boolean);
var
  I : Integer;
  _userInfo : ShortString;
begin
if Assigned( FEvents ) then
  begin
  _userInfo := EmptyStr;
  for I := 0 to userInfo.data.length - 1 do
    begin
    _userInfo := _userInfo + Char( userinfo.data.value[ I ] );
    end;

  FEvents.OnCSTAEstablished( monitorCrossRefId, establishedConnection.callID,
    establishedConnection.deviceID, answeringDevice.deviceID,
    callingDevice.deviceID, calledDevice.deviceID,
    lastRedirectionDevice.deviceID, Ord( localConnectionInfo ), Ord( cause ),
    trunkGroup, trunkMember, split, _userinfo, Ord( reason ),
    distributingDevice.deviceID, ucid, flexibleBilling );
  end;
end;

procedure TCtConectorX.DoOnCSTAFailed(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  failedConnection: ConnectionID_t; failingDevice: SubjectDeviceID_t;
  calledDevice: CalledDeviceID_t;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAFailed( monitorCrossRefId, failedConnection.callID,
    failedConnection.deviceID, failingDevice.deviceID, calledDevice.deviceID,
    Ord( localConnectionInfo ), Ord( cause ) );
  end;
end;

procedure TCtConectorX.DoOnCSTAForwarding(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t; device: SubjectDeviceID_t;
  forwardingInformation: ForwardingInfo_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAForwarding( monitorCrossRefId, device.deviceID,
    Ord( forwardingInformation.forwardingType ),
    forwardingInformation.forwardingOn, forwardingInformation.forwardDN );
  end;
end;

procedure TCtConectorX.DoOnCSTAHeld(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  heldConnection: ConnectionID_t; holdingDevice: SubjectDeviceID_t;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAHeld( monitorCrossRefId, heldConnection.callID,
    heldConnection.deviceID, holdingDevice.deviceID, Ord( localConnectionInfo ),
    Ord( cause ) );
  end;
end;

procedure TCtConectorX.DoOnCSTALoggedOff(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  agentDevice: SubjectDeviceID_t; agentID: AgentID_t;
  agentGroup: AgentGroup_t; reasonCode: Integer);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTALoggedOff( monitorCrossRefId, agentDevice.deviceID,
    agentID, agentGroup, reasonCode );
  end;
end;

procedure TCtConectorX.DoOnCSTALoggedOn(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  agentDevice: SubjectDeviceID_t; agentID: AgentID_t;
  agentGroup: AgentGroup_t; password: AgentPassword_t;
  workMode: ATTWorkMode_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTALoggedOn( monitorCrossRefId, agentDevice.deviceID, agentID,
    agentGroup, password, Ord( workMode ) );
  end;
end;

procedure TCtConectorX.DoOnCSTAMessageWaiting(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  deviceForMessage: CalledDeviceID_t; invokingDevice: SubjectDeviceID_t;
  messageWaitingOn: Boolean);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAMessageWaiting( monitorCrossRefId, deviceForMessage.deviceID,
    invokingDevice.deviceID, messageWaitingOn );
  end;
end;

procedure TCtConectorX.DoOnCSTAMonitorConf(Sender: TObject;
  InvokeID: TInvokeID; monitorCrossRefID: CSTAMonitorCrossRefID_t;
  monitorFilter: CSTAMonitorFilter_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAMonitorConf( InvokeID, monitorCrossRefID );
  end;
end;

procedure TCtConectorX.DoOnCSTAMonitorStopConf(Sender: TObject;
  InvokeID: TInvokeID);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAMonitorStopConf( InvokeID );
  end;
end;

procedure TCtConectorX.DoOnCSTANetworkReached(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t; connection: ConnectionID_t;
  trunkUsed: SubjectDeviceID_t; calledDevice: CalledDeviceID_t;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t;
  progressLocation: ATTProgressLocation_t;
  progressDescription: ATTProgressDescription_t; trunkGroup,
  trunkMember: DeviceID_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTANetworkReached( monitorCrossRefId, connection.callID,
    connection.deviceID, trunkUsed.deviceID, calledDevice.deviceID,
    Ord( localConnectionInfo ), Ord( cause ), Ord( progressLocation ),
    Ord( progressDescription ), trunkGroup, trunkMember );
  end;
end;

procedure TCtConectorX.DoOnCSTANotReady(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  agentDevice: SubjectDeviceID_t; agentID: AgentID_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTANotReady( monitorCrossRefId, agentDevice.deviceID, agentID );
  end;
end;

procedure TCtConectorX.DoOnCSTAOriginated(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  originatedConnection: ConnectionID_t; callingDevice: SubjectDeviceID_t;
  calledDevice: CalledDeviceID_t;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t;
  logicalAgent: DeviceID_t; userInfo: ATTUserToUserInfo_t);
var
  I : Integer;
  _userInfo : ShortString;
begin
if Assigned( FEvents ) then
  begin
  _userInfo := EmptyStr;
  for I := 0 to userInfo.data.length - 1 do
    begin
    _userInfo := _userInfo + Char( userinfo.data.value[ I ] );
    end;
  FEvents.OnCSTAOriginated( monitorCrossRefId, originatedConnection.callID,
    originatedConnection.deviceID, callingDevice.deviceID,
    calledDevice.deviceID, Ord( localConnectionInfo ), Ord( cause ),
    _userinfo );
  end;
end;

procedure TCtConectorX.DoOnCSTAOutOfService(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t; device: DeviceID_t;
  cause: CSTAEventCause_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAOutOfService( monitorCrossRefId, device, Ord( Cause ) );
  end;
end;

procedure TCtConectorX.DoOnCSTAPrivateStatus(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t; connection: ConnectionID_t;
  calledDevice, chargingDevice, trunkGroup, trunkMember: DeviceID_t;
  chargeType: ATTChargeType_t; charge: Integer; error: ATTChargeError_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAPrivateStatus( monitorCrossRefId, connection.callID,
    connection.deviceID, calledDevice, chargingDevice, trunkGroup, trunkMember,
    Ord( chargeType ), charge, Ord( error ) );
  end;
end;

procedure TCtConectorX.DoOnCSTAQueued(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  queuedConnection: ConnectionID_t; queue: SubjectDeviceID_t;
  callingDevice: CallingDeviceID_t; calledDevice: CalledDeviceID_t;
  lastRedirectionDevice: RedirectionDeviceID_t; numberQueued: short;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAQueued( monitorCrossRefId, queuedConnection.callID,
    queuedConnection.deviceID, queue.deviceID, callingDevice.deviceID,
    calledDevice.deviceID, lastRedirectionDevice.deviceID, numberQueued,
    Ord( localConnectionInfo ), Ord( cause ) );
  end;
end;

procedure TCtConectorX.DoOnCSTAReady(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  agentDevice: SubjectDeviceID_t; agentID: AgentID_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAReady( monitorCrossRefId, agentDevice.deviceID, agentID );
  end;
end;

procedure TCtConectorX.DoOnCSTARetrieved(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  retrievedConnection: ConnectionID_t; retrievingDevice: SubjectDeviceID_t;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTARetrieved( monitorCrossRefId, retrievedConnection.callID,
    retrievedConnection.deviceID, retrievingDevice.deviceID,
    Ord( localConnectionInfo ), Ord( cause ) );
  end;
end;

procedure TCtConectorX.DoOnCSTAServiceInitiated(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  initiatedConnection: ConnectionID_t;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t;
  ucid: ATTUCID_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAServiceInitiated( monitorCrossRefId, initiatedConnection.callID,
    initiatedConnection.deviceID, Ord( localConnectionInfo ), Ord( cause ),
    ucid );
  end;
end;

procedure TCtConectorX.DoOnCSTATransferred(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t; primaryOldCall,
  secondaryOldCall: ConnectionID_t; transferringDevice,
  transferredDevice: SubjectDeviceID_t;
  transferredConnections: ConnectionList_t;
  localConnectionInfo: LocalConnectionState_t; cause: CSTAEventCause_t;
  originalCallInfo: ATTOriginalCallInfo_t;
  distributingDevice: CalledDeviceID_t; ucid: ATTUCID_t;
  trunkList: ATTTrunkList_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTATransferred( monitorCrossRefId, primaryOldCall.callID,
    primaryOldCall.deviceID, secondaryOldCall.callID, secondaryOldCall.deviceID,
    transferringDevice.deviceID, transferringDevice.deviceID,
    Ord( localConnectionInfo ), Ord( cause ), ucid );
  end;
end;

procedure TCtConectorX.DoOnCSTAWorkNotReady(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  agentDevice: SubjectDeviceID_t; agentID: AgentID_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAWorkNotReady( monitorCrossRefId, agentDevice.deviceID, agentID );
  end;
end;

procedure TCtConectorX.DoOnCSTAWorkReady(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t;
  agentDevice: SubjectDeviceID_t; agentID: AgentID_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAWorkReady( monitorCrossRefId, agentDevice.deviceID, agentID );
  end;
end;

procedure TCtConectorX.DoOnCSTAMonitorEnded(Sender: TObject;
  monitorCrossRefId: CSTAMonitorCrossRefID_t; cause: CSTAEventCause_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAMonitorEnded( monitorCrossRefId, Ord( cause ) );
  end;
end;

procedure TCtConectorX.DoOnCSTAAlternateCallConf(Sender: TObject;
  InvokeID: TInvokeID);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAAlternateCallConf( InvokeID );
  end;
end;

procedure TCtConectorX.DoOnCSTAAnswerCallConf(Sender: TObject;
  InvokeID: TInvokeID);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAAnswerCallConf( InvokeID );
  end;
end;

procedure TCtConectorX.DoOnCSTAClearCallConf(Sender: TObject;
  InvokeID: TInvokeID);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAClearCallConf( InvokeID );
  end;
end;

procedure TCtConectorX.DoOnCSTAClearConnectionConf(Sender: TObject;
  InvokeID: TInvokeID);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAClearConnectionConf( InvokeID );
  end;
end;

procedure TCtConectorX.DoOnCSTAConferenceCallConf(Sender: TObject;
  InvokeID: TInvokeID; newCall: ConnectionID_t; connList: ConnectionList_t;
  ucid: ATTUCID_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAConferenceCallConf( InvokeID, newCall.callID, newCall.deviceID,
    ucid );
  end;
end;

procedure TCtConectorX.DoOnCSTAConsultationCallConf(Sender: TObject;
  InvokeID: TInvokeID; newCall: ConnectionID_t; ucid: ATTUCID_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAConsultationCallConf( InvokeID, newCall.callID,
    newCall.deviceID, ucid );
  end;
end;

procedure TCtConectorX.DoOnCSTADeflectCallConf(Sender: TObject;
  InvokeID: TInvokeID);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTADeflectCallConf( InvokeID );
  end;
end;

procedure TCtConectorX.DoOnCSTAGroupPickupCallConf(Sender: TObject;
  InvokeID: TInvokeID);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAGroupPickupCallConf( InvokeID );
  end;
end;

procedure TCtConectorX.DoOnCSTAHoldCallConf(Sender: TObject;
  InvokeID: TInvokeID);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAHoldCallConf( InvokeID );
  end;
end;

procedure TCtConectorX.DoOnCSTAMakeCallConf(Sender: TObject;
  InvokeID: TInvokeID; ucid: ATTUCID_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAMakeCallConf( InvokeID, ucid );
  end;
end;

procedure TCtConectorX.DoOnCSTAMakePredictiveCallConf(Sender: TObject;
  InvokeID: TInvokeID; newCall: ConnectionID_t; ucid: ATTUCID_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTAMakePredictiveCallConf( InvokeID, newCall.callID,
    newCall.deviceID, ucid );
  end;
end;

procedure TCtConectorX.DoOnCSTARetrieveCallConf(Sender: TObject;
  InvokeID: TInvokeID);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTARetrieveCallConf( InvokeID );
  end;
end;

procedure TCtConectorX.DoOnCSTATransferCallConf(Sender: TObject;
  InvokeID: TInvokeID; newCall: ConnectionID_t; connList: ConnectionList_t;
  ucid: ATTUCID_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnCSTATransferCallConf( InvokeID, newCall.callID, newCall.deviceID,
    ucid );
  end;
end;

procedure TCtConectorX.DoOnCSTASnapshotDeviceConf(Sender: TObject;
  InvokeID: TInvokeID; snapshotData: CSTASnapshotDeviceData_t);
var
  I : Integer;
  _callIDs : String;
begin
if Assigned( FEvents ) then
  begin
  _callIDs := EmptyStr;
  for I := 0 to snapshotData.count - 1 do
    begin
    _callIDs := _callIDs +
      Format( '%d-%d',
        [ snapshotData.info[ i ].callIdentifier.callID,
          Ord( snapshotData.info[ i ].localCallState.state^ ) ] );
    if i < snapshotData.count - 1 then
      begin
      _callIDs := _callIDs + '#';
      end;
    end;

  FEvents.OnCSTASnapshotDeviceConf( InvokeID, _callIDs );
  end;
end;

procedure TCtConectorX.DoOnATTQueryAcdSplitConf(Sender: TObject;
  InvokeID: TInvokeID; availableAgents, callsInQueue,
  agentsLoggedIn: short);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnATTQueryAcdSplitConf( InvokeID, availableAgents, callsInQueue,
    agentsLoggedIn );
  end;
end;

procedure TCtConectorX.DoOnATTQueryAgentLoginConf(Sender: TObject;
  InvokeID: TInvokeID; privEventCrossRefID: ATTPrivEventCrossRefID_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnATTQueryAgentLoginConf( InvokeID, privEventCrossRefID );
  end;
end;

procedure TCtConectorX.DoOnATTQueryAgentLoginEnd(Sender: TObject;
  privEventCrossRefID: ATTPrivEventCrossRefID_t);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnATTQueryAgentLoginEnd( privEventCrossRefID );
  end;
end;

procedure TCtConectorX.DoOnATTQueryAgentLoginResp(Sender: TObject;
  privEventCrossRefID: ATTPrivEventCrossRefID_t;
  devices: array of ShortString);
var
  I : Integer;
  _devices : String;
begin
if Assigned( FEvents ) then
  begin
  _devices := EmptyStr;
  for I := 0 to Length( devices ) - 1 do
    begin
    _devices := _devices + devices[ I ];
    if I < Length( devices ) - 1 then
      begin
      _devices := _devices + ';';
      end;
    end;
  FEvents.OnATTQueryAgentLoginResp( privEventCrossRefID, _devices );
  end;
end;

procedure TCtConectorX.DoOnATTQueryCallClassifierConf(Sender: TObject;
  InvokeID: TInvokeID; numAvailPorts, numInUsePorts: short);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnATTQueryCallClassifierConf( InvokeID, numAvailPorts,
    numInUsePorts );
  end;
end;

procedure TCtConectorX.DoOnATTQueryTgConf(Sender: TObject;
  InvokeID: TInvokeID; idleTrunks, usedTrunks: short);
begin
if Assigned( FEvents ) then
  begin
  FEvents.OnATTQueryTgConf( InvokeID, idleTrunks, usedTrunks );
  end;
end;

function TCtConectorX.DrawTextBiDiModeFlagsReadingOnly: Integer;
begin
Result := FDelphiControl.DrawTextBiDiModeFlagsReadingOnly;
end;

procedure TCtConectorX.InitiateAction;
begin
FDelphiControl.InitiateAction;
end;

function TCtConectorX.ACSUniversalFailureToStr(error: SYSINT): WideString;
begin
Result := uTranslations.ACSUniversalFailureToStr(
  ACSUniversalFailure_t( error ) );
end;

function TCtConectorX.AgentModeToStr(agentMode: SYSINT): WideString;
begin
Result := uTranslations.AgentModeToStr( AgentMode_t( agentMode ) );
end;

function TCtConectorX.AgentStateToStr(agentState: SYSINT): WideString;
begin
Result := uTranslations.AgentStateToStr( AgentState_t( agentState ) );
end;

function TCtConectorX.ATTDeliveredTypeToStr(
  deliveredType: SYSINT): WideString;
begin
Result := uTranslations.ATTDeliveredTypeToStr(
  ATTDeliveredType_t( deliveredType ) );
end;

function TCtConectorX.ATTEventTypeToStr(eventType: SYSINT): WideString;
begin
Result := uTranslations.ATTEventTypeToStr( eventType );
end;

function TCtConectorX.ATTProgressDescriptionToStr(
  progressDescription: SYSINT): WideString;
begin
Result := uTranslations.ATTProgressDescriptionToStr(
  ATTProgressDescription_t( progressDescription ) );
end;

function TCtConectorX.ATTProgressLocationToStr(
  progressLocation: SYSINT): WideString;
begin
Result := uTranslations.ATTProgressLocationToStr(
  ATTProgressLocation_t( progressLocation ) );
end;

function TCtConectorX.ATTReasonCodeToStr(reasonCode: SYSINT): WideString;
begin
Result := uTranslations.ATTReasonCodeToStr( ATTReasonCode_t( reasonCode ) );
end;

function TCtConectorX.ATTTalkStateToStr(talkState: SYSINT): WideString;
begin
Result := uTranslations.ATTTalkStateToStr( ATTTalkState_t( talkState ) );
end;

function TCtConectorX.ATTWorkModeToStr(workMode: SYSINT): WideString;
begin
Result := uTranslations.ATTWorkModeToStr( ATTWorkMode_t( workMode ) );
end;

function TCtConectorX.CallStateToStr(callState: SYSINT): WideString;
begin
Result := uTranslations.CallStateToStr( CSTASimpleCallState_t( callState ) );
end;

function TCtConectorX.CSTAEventCauseToStr(eventCause: SYSINT): WideString;
begin
Result := uTranslations.CSTAEventCauseToStr( CSTAEventCause_t( eventCause ) );
end;

function TCtConectorX.CSTAUniversalFailureToStr(error: SYSINT): WideString;
begin
Result := uTranslations.CSTAUniversalFailureToStr(
  CSTAUniversalFailure_t( error ) );
end;

function TCtConectorX.CtReturnToStr(ctReturn: SYSINT): WideString;
begin
Result := uTranslations.CtReturnToStr( ctReturn );
end;

function TCtConectorX.DeviceTypeToStr(deviceType: SYSINT): WideString;
begin
Result := uTranslations.DeviceTypeToStr( DeviceType_t( deviceType ) );
end;

function TCtConectorX.EventClassToStr(eventClass: SYSINT): WideString;
begin
Result := uTranslations.EventClassToStr( eventClass );
end;

function TCtConectorX.EventTypeToStr(eventClass,
  eventType: SYSINT): WideString;
begin
Result := uTranslations.EventTypeToStr( eventClass, eventType );
end;

function TCtConectorX.LocalConnectionStateToStr(
  localConnectionState: SYSINT): WideString;
begin
Result := uTranslations.LocalConnectionStateToStr(
  LocalConnectionState_t( localConnectionState ) );
end;

{ TPanelCtConector }

procedure TPanelCtConector.CanotResizePanel(Sender: TObject);
begin
  Self.Width := 32;
  Self.Height := 32;
end;

constructor TPanelCtConector.Create(AOwner: TComponent);
begin
  inherited;
  Self.Visible := False;

  Self.BevelInner := bvLowered;
  Self.BevelOuter := bvRaised;
  Self.Caption := '';
  Self.Height := 32;
  Self.Width := 32;
  Self.OnResize := CanotResizePanel;
  FImage := TImage.Create(Self);
  FImage.Parent := Self;
  FImage.Align := alClient;
  FImage.Canvas.TextOut(6, 2, 'Ct');
  FImage.Canvas.TextOut(0, 15, 'Conector');
  FCtConector := TCtClient.Create( False );
end;

destructor TPanelCtConector.Destroy;
begin
  FImage.Free;
  if Assigned( FCtConector ) then
    begin
    if not FCtConector.Suspended then
      begin
      FCtConector.ShutDown;
      end
    else
      begin
      FCtConector.Free;
      end;
    end;
  inherited;
end;

initialization
  TActiveXControlFactory.Create(
    ComServer,
    TCtConectorX,
    TPanelCtConector,
    Class_CtConectorX,
    1,
    '',
    0,
    tmApartment);
end.
