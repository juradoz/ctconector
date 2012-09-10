unit uCtEvents;

interface

uses uCtTypes, uCSTADefs_h, uCSTA_h, uACSDefs_h, uACS_h, uATTPDefs_h,
  uATTPriv_h, Windows;

type

  { Events presents in TCtConector }
  TNullConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID ) of object;

  TACSOpenStreamConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    apiVer, libVer, tsrvVer, drvrVer : uACSDefs_h.Version_t ) of object;

  TACSCloseStreamConfEvent = TNullConfEvent;

  TACSUniversalFailureConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID; error : ACSUniversalFailure_t ) of object;

  TCSTAUniversalFailureConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID; error : CSTAUniversalFailure_t ) of object;


  { Events presents in TMonitorServicesCTConector }
  TCSTAMonitorConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    monitorCrossRefID : CSTAMonitorCrossRefID_t;
    monitorFilter     : CSTAMonitorFilter_t ) of object;

  TCSTAMonitorStopConfEvent = TNullConfEvent;

  TCSTAMonitorEndedEvent = procedure( Sender : TObject;
    monitorCrossRefId : CSTAMonitorCrossRefID_t;
    cause : CSTAEventCause_t ) of object;


  TCSTAServiceInitiatedEvent = procedure( Sender : TObject;
    monitorCrossRefId : CSTAMonitorCrossRefID_t;
    initiatedConnection : ConnectionID_t;
    localConnectionInfo : LocalConnectionState_t;
    cause : CSTAEventCause_t;
    ucid : ATTUCID_t ) of object;

  TCSTAOriginatedEvent = procedure( Sender : TObject;
    monitorCrossRefId   : CSTAMonitorCrossRefID_t;
    originatedConnection : ConnectionID_t;
    callingDevice       : SubjectDeviceID_t;
    calledDevice        : CalledDeviceID_t;
    localConnectionInfo : LocalConnectionState_t;
    cause               : CSTAEventCause_t;    logicalAgent        : DeviceID_t;
    { NEXT UNSUPPORTED. ALWAYS EMPTY }
    userInfo            : ATTUserToUserInfo_t ) of object;

  TCSTADeliveredEvent = procedure( Sender : TObject;
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
    flexibleBilling       : Boolean ) of object;

  TCSTAEstablishedEvent = procedure( Sender : TObject;
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
    flexibleBilling       : Boolean ) of object;

  TCSTANetworkReachedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    connection            : ConnectionID_t;
    trunkUsed             : SubjectDeviceID_t;
    calledDevice          : CalledDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t;
    progressLocation      : ATTProgressLocation_t;
    progressDescription   : ATTProgressDescription_t;
    trunkGroup            : DeviceID_t;
    trunkMember           : DeviceID_t ) of object;

  TCSTACallClearedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    clearedCall           : ConnectionID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t;
    reason                : ATTReasonCode_t ) of object;

  TCSTAConnectionClearedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    droppedConnection     : ConnectionID_t;
    releasingDevice       : SubjectDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t;
    userInfo              : ATTUserToUserInfo_t ) of object;

  TCSTAConferencedEvent = procedure( Sender : TObject;
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
    trunkList             : ATTTrunkList_t ) of object;

  TCSTADivertedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    connection            : ConnectionID_t;
    divertingDevice       : SubjectDeviceID_t;
    newDestination        : CalledDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t ) of object;

  TCSTAFailedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    failedConnection      : ConnectionID_t;
    failingDevice         : SubjectDeviceID_t;
    calledDevice          : CalledDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t ) of object;

  TCSTAHeldEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    heldConnection        : ConnectionID_t;
    holdingDevice         : SubjectDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t ) of object;

  TCSTAQueuedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    queuedConnection      : ConnectionID_t;
    queue                 : SubjectDeviceID_t;
    callingDevice         : CallingDeviceID_t;
    calledDevice          : CalledDeviceID_t;
    lastRedirectionDevice : RedirectionDeviceID_t;
    numberQueued          : short;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t ) of object;

  TCSTARetrievedEvent = procedure( Sender : TObject;
    monitorCrossRefId     : CSTAMonitorCrossRefID_t;
    retrievedConnection   : ConnectionID_t;
    retrievingDevice      : SubjectDeviceID_t;
    localConnectionInfo   : LocalConnectionState_t;
    cause                 : CSTAEventCause_t ) of object;

  TCSTATransferredEvent = procedure( Sender : TObject;
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
    trunkList              : ATTTrunkList_t ) of object;

  TCSTACallInformationEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    connection             : ConnectionID_t;
    device                 : SubjectDeviceID_t;
    accountInfo            : AccountInfo_t;
    authorisationCode      : AuthCode_t ) of object;

  TCSTADoNotDisturbEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    device                 : SubjectDeviceID_t;
    doNotDisturbOn         : Boolean ) of object;

  TCSTAForwardingEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    device                 : SubjectDeviceID_t;
    forwardingInformation  : ForwardingInfo_t ) of object;

  TCSTAMessageWaitingEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    deviceForMessage       : CalledDeviceID_t;
    invokingDevice         : SubjectDeviceID_t;
    messageWaitingOn       : Boolean ) of object;

  TCSTALoggedOnEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    agentDevice            : SubjectDeviceID_t;
    agentID                : AgentID_t;
    agentGroup             : AgentGroup_t;
    password               : AgentPassword_t;
    workMode               : ATTWorkMode_t ) of object;

  TCSTALoggedOffEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    agentDevice            : SubjectDeviceID_t;
    agentID                : AgentID_t;
    agentGroup             : AgentGroup_t;
    reasonCode             : Integer ) of object;

  TCSTAAgentStatusChangeEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    agentDevice            : SubjectDeviceID_t;
    agentID                : AgentID_t ) of object;

  TCSTANotReadyEvent = TCSTAAgentStatusChangeEvent;

  TCSTAReadyEvent = TCSTAAgentStatusChangeEvent;

  TCSTAWorkNotReadyEvent = TCSTAAgentStatusChangeEvent;

  TCSTAWorkReadyEvent = TCSTAAgentStatusChangeEvent;

  TCSTAServiceStatusChange = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    device                 : DeviceID_t;
    cause                  : CSTAEventCause_t ) of object;

  TCSTABackInServiceEvent = TCSTAServiceStatusChange;

  TCSTAOutOfServiceEvent = TCSTAServiceStatusChange;

  TCSTAPrivateStatusEvent = procedure( Sender : TObject;
    monitorCrossRefId      : CSTAMonitorCrossRefID_t;
    connection             : ConnectionID_t;
    calledDevice           : DeviceID_t;
    chargingDevice         : DeviceID_t;
    trunkGroup             : DeviceID_t;
    trunkMember            : DeviceID_t;
    chargeType             : ATTChargeType_t;
    charge                 : LongInt;
    error                  : ATTChargeError_t ) of object;

  { Events presents in TBasicCallControlCtConector }

  TCSTAAlternateCallConfEvent = TNullConfEvent;

  TCSTAAnswerCallConfEvent    = TNullConfEvent;

  TCSTAConferenceCallConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    newCall : ConnectionID_t; connList : ConnectionList_t; ucid : ATTUCID_t ) of object;

  TCSTAConsultationCallConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    newCall : ConnectionID_t; ucid : ATTUCID_t ) of object;

  TCSTADeflectCallConfEvent = TNullConfEvent;

  TCSTAClearCallConfEvent = TNullConfEvent;

  TCSTAClearConnectionConfEvent = TNullConfEvent;

  TCSTAGroupPickupCallConfEvent = TNullConfEvent;

  TCSTAHoldCallConfEvent = TNullConfEvent;

  TCSTAMakeCallConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    ucid : ATTUCID_t ) of object;

  TCSTAMakePredictiveCallConfEvent = procedure( Sender : TObject;
    InvokeID : TInvokeID; newCall : ConnectionID_t; ucid : ATTUCID_t ) of object;

  TCSTARetrieveCallConfEvent = TNullConfEvent;

  TCSTATransferCallConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    newCall : ConnectionID_t; connList : ConnectionList_t; ucid : ATTUCID_t ) of object;

  { Events presents in TTelephonySuplementaryCtConector }

  TCSTASetAgentStateConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    isPending : Boolean ) of object;

  TCSTAQueryAgentStateConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    agentState        : AgentState_t;
    workMode          : ATTWorkMode_t;
    talkState         : ATTTalkState_t;
    reasonCode        : Integer;
    pendingWorkMode   : ATTWorkMode_t;
    pendingReasonCode : Integer ) of object;

  TCSTAQueryDeviceInfoConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    device           : DeviceID_t;
    deviceType       : DeviceType_t;
    deviceClass      : DeviceClass_t;
    extensionClass   : ATTExtensionClass_t;
    associatedClass  : ATTExtensionClass_t;
    associatedDevice : DeviceID_t ) of object;

    { Events presents in TSnapShotServicesCtConector }

  TCSTASnapshotDeviceConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    snapshotData               : CSTASnapshotDeviceData_t ) of object;

    { Events presents in TEscapeServicesCtConector }
  TCSTAEscapeSvcConfEvent = TNullConfEvent;

  TATTQueryAcdSplitConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    availableAgents : short;
    callsInQueue    : short;
    agentsLoggedIn  : short ) of object;

  TATTQueryAgentLoginConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    privEventCrossRefID : ATTPrivEventCrossRefID_t ) of object;

  TATTQueryAgentLoginResp = procedure( Sender : TObject;
    privEventCrossRefID   : ATTPrivEventCrossRefID_t;
    devices : array of ShortString ) of object;

  TATTQueryAgentLoginEnd = procedure( Sender : TObject;
    privEventCrossRefID   : ATTPrivEventCrossRefID_t ) of object;

  TCSTAPrivateEvent = procedure( Sender : TObject;
    privateData   : ATTPrivateData_t ) of object;

  TATTQueryTgConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    idleTrunks         : short;
    usedTrunks         : short ) of object;

  TATTQueryCallClassifierConfEvent = procedure( Sender : TObject; InvokeID : TInvokeID;
    numAvailPorts      : short;
    numInUsePorts      : short ) of object;


implementation

end.
