unit CtConectorXControl_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.130.1.0.1.0.1.6  $
// File generated on 23/02/2006 23:57:32 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Documents and Settings\jurado\Meus documentos\Trabalho\TTS\Avaya\src\CtConectorXControl.tlb (1)
// LIBID: {CE923AAD-7222-40A6-88A1-78C53557805C}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\system32\stdvcl40.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL, Variants;


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CtConectorXControlMajorVersion = 1;
  CtConectorXControlMinorVersion = 0;

  LIBID_CtConectorXControl: TGUID = '{CE923AAD-7222-40A6-88A1-78C53557805C}';

  IID_ICtConectorX: TGUID = '{91FD4DA7-EBD7-42EF-A98F-2A7D05F1A5FB}';
  DIID_ICtConectorXEvents: TGUID = '{DA49C783-26BC-452D-9D5A-E7D21E3B6D0A}';
  CLASS_CtConectorX: TGUID = '{09748F29-C3D3-4FAC-A359-FC2542110118}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  ICtConectorX = interface;
  ICtConectorXDisp = dispinterface;
  ICtConectorXEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  CtConectorX = ICtConectorX;


// *********************************************************************//
// Interface: ICtConectorX
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {91FD4DA7-EBD7-42EF-A98F-2A7D05F1A5FB}
// *********************************************************************//
  ICtConectorX = interface(IDispatch)
    ['{91FD4DA7-EBD7-42EF-A98F-2A7D05F1A5FB}']
    function OpenStream(const ServerID: WideString; const LoginID: WideString;
                        const Passwd: WideString; InvokeID: Int64): SYSINT; safecall;
    function CloseStream(InvokeID: Int64): SYSINT; safecall;
    procedure Shutdown; safecall;
    function MonitorDevice(const deviceID: WideString; InvokeID: Int64): SYSINT; safecall;
    function MonitorCall(call: SYSINT; const device: WideString; InvokeID: Int64): SYSINT; safecall;
    function MonitorCallsViaDevice(const deviceID: WideString; InvokeID: Int64): SYSINT; safecall;
    function MonitorStop(monitorCrossRefID: SYSINT; InvokeID: Int64): SYSINT; safecall;
    function AlternateCall(activeCall: SYSINT; otherCall: SYSINT; const deviceID: WideString; 
                           InvokeID: Int64): SYSINT; safecall;
    function AnswerCall(alertingCall: SYSINT; const deviceID: WideString; InvokeID: Int64): SYSINT; safecall;
    function ConferenceCall(heldCall: SYSINT; activeCall: SYSINT; const deviceID: WideString; 
                            InvokeID: Int64): SYSINT; safecall;
    function ConsultationCall(activeCall: SYSINT; const callingDevice: WideString; 
                              const calledDevice: WideString; 
                              const UserToUserInformation: WideString; InvokeID: Int64): SYSINT; safecall;
    function DeflectCall(DeflectCall: SYSINT; const deviceID: WideString; 
                         const calledDevice: WideString; InvokeID: Int64): SYSINT; safecall;
    function ClearCall(call: SYSINT; const deviceID: WideString; InvokeID: Int64): SYSINT; safecall;
    function ClearConnection(call: SYSINT; const deviceID: WideString; 
                             const UserToUserInformation: WideString; InvokeID: Int64): SYSINT; safecall;
    function GroupPickupCall(DeflectCall: SYSINT; const deviceID: WideString; 
                             const pickupDevice: WideString; InvokeID: Int64): SYSINT; safecall;
    function HoldCall(activeCall: SYSINT; const deviceID: WideString; InvokeID: Int64): SYSINT; safecall;
    function MakeCall(const callingDevice: WideString; const calledDevice: WideString; 
                      const UserToUserInformation: WideString; InvokeID: Int64): SYSINT; safecall;
    function MakePredictiveCall(const callingDevice: WideString; const calledDevice: WideString; 
                                allocationState: SYSINT; priorityCalling: WordBool; 
                                maxRings: SYSINT; answerTreat: SYSINT; 
                                const UserToUserInformation: WideString; InvokeID: Int64): SYSINT; safecall;
    function RetrieveCall(heldCall: SYSINT; const deviceID: WideString; InvokeID: Int64): SYSINT; safecall;
    function TransferCall(heldCall: SYSINT; activeCall: SYSINT; const deviceID: WideString; 
                          InvokeID: Int64): SYSINT; safecall;
    function SetAgentState(const device: WideString; agentMode: SYSINT; const agentID: WideString; 
                           const agentGroup: WideString; const agentPassword: WideString; 
                           workMode: SYSINT; reasonCode: SYSINT; enablePending: WordBool; 
                           InvokeID: Int64): SYSINT; safecall;
    function QueryAgentState(const device: WideString; InvokeID: Int64): SYSINT; safecall;
    function QueryDeviceInfo(const device: WideString; InvokeID: Int64): SYSINT; safecall;
    function SnapshotDeviceReq(const snapshotObj: WideString; InvokeID: Int64): SYSINT; safecall;
    function QueryAcdSplit(const device: WideString; InvokeID: Int64): SYSINT; safecall;
    function QueryAgentLogin(const device: WideString; InvokeID: Int64): SYSINT; safecall;
    function QueryTrunkGroup(const device: WideString; InvokeID: Int64): SYSINT; safecall;
    function QueryCallClassifier(InvokeID: Int64): SYSINT; safecall;
  end;

// *********************************************************************//
// DispIntf:  ICtConectorXDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {91FD4DA7-EBD7-42EF-A98F-2A7D05F1A5FB}
// *********************************************************************//
  ICtConectorXDisp = dispinterface
    ['{91FD4DA7-EBD7-42EF-A98F-2A7D05F1A5FB}']
    function OpenStream(const ServerID: WideString; const LoginID: WideString; 
                        const Passwd: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 1;
    function CloseStream(InvokeID: {??Int64}OleVariant): SYSINT; dispid 2;
    procedure Shutdown; dispid 3;
    function MonitorDevice(const deviceID: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 4;
    function MonitorCall(call: SYSINT; const device: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 5;
    function MonitorCallsViaDevice(const deviceID: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 6;
    function MonitorStop(monitorCrossRefID: SYSINT; InvokeID: {??Int64}OleVariant): SYSINT; dispid 7;
    function AlternateCall(activeCall: SYSINT; otherCall: SYSINT; const deviceID: WideString; 
                           InvokeID: {??Int64}OleVariant): SYSINT; dispid 8;
    function AnswerCall(alertingCall: SYSINT; const deviceID: WideString; 
                        InvokeID: {??Int64}OleVariant): SYSINT; dispid 9;
    function ConferenceCall(heldCall: SYSINT; activeCall: SYSINT; const deviceID: WideString; 
                            InvokeID: {??Int64}OleVariant): SYSINT; dispid 10;
    function ConsultationCall(activeCall: SYSINT; const callingDevice: WideString; 
                              const calledDevice: WideString; 
                              const UserToUserInformation: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 11;
    function DeflectCall(DeflectCall: SYSINT; const deviceID: WideString; 
                         const calledDevice: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 12;
    function ClearCall(call: SYSINT; const deviceID: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 13;
    function ClearConnection(call: SYSINT; const deviceID: WideString; 
                             const UserToUserInformation: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 14;
    function GroupPickupCall(DeflectCall: SYSINT; const deviceID: WideString; 
                             const pickupDevice: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 15;
    function HoldCall(activeCall: SYSINT; const deviceID: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 16;
    function MakeCall(const callingDevice: WideString; const calledDevice: WideString; 
                      const UserToUserInformation: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 17;
    function MakePredictiveCall(const callingDevice: WideString; const calledDevice: WideString; 
                                allocationState: SYSINT; priorityCalling: WordBool; 
                                maxRings: SYSINT; answerTreat: SYSINT; 
                                const UserToUserInformation: WideString; 
                                InvokeID: {??Int64}OleVariant): SYSINT; dispid 18;
    function RetrieveCall(heldCall: SYSINT; const deviceID: WideString; 
                          InvokeID: {??Int64}OleVariant): SYSINT; dispid 19;
    function TransferCall(heldCall: SYSINT; activeCall: SYSINT; const deviceID: WideString; 
                          InvokeID: {??Int64}OleVariant): SYSINT; dispid 20;
    function SetAgentState(const device: WideString; agentMode: SYSINT; const agentID: WideString; 
                           const agentGroup: WideString; const agentPassword: WideString; 
                           workMode: SYSINT; reasonCode: SYSINT; enablePending: WordBool; 
                           InvokeID: {??Int64}OleVariant): SYSINT; dispid 21;
    function QueryAgentState(const device: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 22;
    function QueryDeviceInfo(const device: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 23;
    function SnapshotDeviceReq(const snapshotObj: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 24;
    function QueryAcdSplit(const device: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 25;
    function QueryAgentLogin(const device: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 26;
    function QueryTrunkGroup(const device: WideString; InvokeID: {??Int64}OleVariant): SYSINT; dispid 27;
    function QueryCallClassifier(InvokeID: {??Int64}OleVariant): SYSINT; dispid 28;
  end;

// *********************************************************************//
// DispIntf:  ICtConectorXEvents
// Flags:     (4096) Dispatchable
// GUID:      {DA49C783-26BC-452D-9D5A-E7D21E3B6D0A}
// *********************************************************************//
  ICtConectorXEvents = dispinterface
    ['{DA49C783-26BC-452D-9D5A-E7D21E3B6D0A}']
    procedure OnCtEvent(EventClass: SYSINT; EventType: SYSINT); dispid 1;
    procedure OnACSOpenStreamConf(InvokeID: SYSINT; const apiVer: WideString; 
                                  const libVer: WideString; const tsrvVer: WideString; 
                                  const drvVer: WideString); dispid 2;
    procedure OnACSCloseStreamConf(InvokeID: SYSINT); dispid 3;
    procedure OnACSUniversalFailureConf(InvokeID: SYSINT; error: SYSINT); dispid 4;
    procedure OnCSTAUniversalFailureConf(InvokeID: SYSINT; error: SYSINT); dispid 5;
    procedure OnCSTAMonitorConf(InvokeID: SYSINT; monitorCrossRefID: SYSINT); dispid 6;
    procedure OnCSTAMonitorStopConf(InvokeID: SYSINT); dispid 7;
    procedure OnCSTACallCleared(monitorCrossRefID: SYSINT; call: SYSINT; const device: WideString; 
                                localConnectionInfo: SYSINT; cause: SYSINT; reason: SYSINT); dispid 8;
    procedure OnCSTAConferenced(monitorCrossRefID: SYSINT; primaryOldCall: SYSINT; 
                                const primaryOldDevice: WideString; secondaryOldCall: SYSINT; 
                                const secondaryOldDevice: WideString; 
                                const confController: WideString; const addedParty: WideString; 
                                localConnectionInfo: SYSINT; cause: SYSINT; 
                                const distributingDevice: WideString; const ucid: WideString); dispid 9;
    procedure OnCSTAConnectionCleared(monitorCrossRefID: Integer; droppedConnectionCall: SYSINT; 
                                      const droppedConnectionDevice: WideString; 
                                      const releasingDevice: WideString; 
                                      localConnectionInfo: SYSINT; cause: SYSINT; 
                                      const userInfo: WideString); dispid 10;
    procedure OnCSTADelivered(monitorCrossRefID: SYSINT; connectionCall: SYSINT; 
                              const connectionDevice: WideString; const alertingDevice: WideString; 
                              const callingDevice: WideString; const calledDevice: WideString; 
                              const lastRedirectionDevice: WideString; localConnectionInfo: SYSINT; 
                              cause: SYSINT; deliveredType: SYSINT; const trunkGroup: WideString; 
                              const trunkMember: WideString; const split: WideString; 
                              const userInfo: WideString; reason: SYSINT; 
                              const distributingDevice: WideString; const ucid: WideString; 
                              flexibleBilling: WordBool); dispid 11;
    procedure OnCSTADiverted(monitorCrossRefID: SYSINT; connectionCall: SYSINT; 
                             const connectionDevice: WideString; const divertingDevice: WideString; 
                             const newDestination: WideString; localConnectionInfo: SYSINT; 
                             cause: SYSINT); dispid 12;
    procedure OnCSTAEstablished(monitorCrossRefID: SYSINT; establishedConnectionCall: SYSINT; 
                                const establishedConnectionDevice: WideString; 
                                const answeringDevice: WideString; const callingDevice: WideString; 
                                const calledDevice: WideString; 
                                const lastRedirectionDevice: WideString; 
                                localConnectionInfo: SYSINT; cause: SYSINT; 
                                const trunkGroup: WideString; const trunkMember: WideString; 
                                const split: WideString; const userInfo: WideString; 
                                reason: SYSINT; const distributingDevice: WideString; 
                                const ucid: WideString; flexibleBilling: WordBool); dispid 13;
    procedure OnCSTAFailed(monitorCrossRefID: SYSINT; failedConnectionCall: SYSINT; 
                           const failedConnectionDevice: WideString; 
                           const failingDevice: WideString; const calledDevice: WideString; 
                           localConnectionInfo: SYSINT; cause: SYSINT); dispid 14;
    procedure OnCSTAHeld(monitorCrossRefID: SYSINT; heldConnectionCall: SYSINT; 
                         const heldConnectionDevice: WideString; const holdingDevice: WideString; 
                         localConnectionInfo: SYSINT; cause: SYSINT); dispid 15;
    procedure OnCSTANetworkReached(monitorCrossRefID: SYSINT; connectionCall: SYSINT; 
                                   const connectionDevice: WideString; const trunkUsed: WideString; 
                                   const calledDevice: WideString; localConnectionInfo: SYSINT; 
                                   cause: SYSINT; progressLocation: SYSINT; 
                                   progressDescription: SYSINT; const trunkGroup: WideString; 
                                   const trunkMember: WideString); dispid 16;
    procedure OnCSTAOriginated(monitorCrossRefID: SYSINT; originatedConnectionCall: SYSINT; 
                               const originatedConnectionDevice: WideString; 
                               const callingDevice: WideString; const calledDevice: WideString; 
                               localConnectionInfo: SYSINT; cause: SYSINT; 
                               const userInfo: WideString); dispid 17;
    procedure OnCSTAQueued(monitorCrossRedId: SYSINT; queuedConnectionCall: SYSINT; 
                           const queuedConnectionDevice: WideString; const queue: WideString; 
                           const callingDevice: WideString; const calledDevice: WideString; 
                           const lastRedirectionDevice: WideString; numberQueued: SYSINT; 
                           localConnectionInfo: SYSINT; cause: SYSINT); dispid 18;
    procedure OnCSTARetrieved(monitorCrossRefID: SYSINT; retrievedConnectionCall: SYSINT; 
                              const retrievedConnectionDevice: WideString; 
                              const retrievingDevice: WideString; localConnectionInfo: SYSINT; 
                              cause: SYSINT); dispid 19;
    procedure OnCSTAServiceInitiated(monitorCrossRefID: SYSINT; initiatedConnectionCall: SYSINT; 
                                     const initiatedConnectionDevice: WideString; 
                                     localConnectionInfo: SYSINT; cause: SYSINT; 
                                     const ucid: WideString); dispid 20;
    procedure OnCSTATransferred(monitorCrossRefID: SYSINT; primaryOldCall: SYSINT; 
                                const primaryOldDevice: WideString; secondaryOldCall: SYSINT; 
                                const secondaryOldDevice: WideString; 
                                const transferringDevice: WideString; 
                                const transferredDevice: WideString; localConnectionInfo: SYSINT; 
                                cause: SYSINT; const ucid: WideString); dispid 21;
    procedure OnCSTACallInformation(monitorCrossRefID: SYSINT; connectionCall: SYSINT; 
                                    const connectionDevice: WideString; const device: WideString; 
                                    const accountInfo: WideString; 
                                    const authorisationCode: WideString); dispid 22;
    procedure OnCSTADoNotDisturb(monitorCrossRefID: SYSINT; const device: WideString; 
                                 doNotDisturbOn: WordBool); dispid 23;
    procedure OnCSTAForwarding(monitorCrossRefID: SYSINT; const device: WideString; 
                               forwardingType: SYSINT; forwardingOn: WordBool; 
                               const forwardDN: WideString); dispid 24;
    procedure OnCSTAMessageWaiting(monitorCrossRefID: SYSINT; const deviceForMessage: WideString; 
                                   const invokingDevice: WideString; messageWaitingOn: WordBool); dispid 25;
    procedure OnCSTALoggedOn(monitorCrossRefID: SYSINT; const agentDevice: WideString; 
                             const agentID: WideString; const agentGroup: WideString; 
                             const password: WideString; workMode: SYSINT); dispid 26;
    procedure OnCSTALoggedOff(monitorCrossRefID: SYSINT; const agentDevice: WideString; 
                              const agentID: WideString; const agentGroup: WideString; 
                              reasonCode: SYSINT); dispid 27;
    procedure OnCSTANotReady(monitorCrossRefID: SYSINT; const agentDevice: WideString; 
                             const agentID: WideString); dispid 28;
    procedure OnCSTAReady(monitorCrossRefID: SYSINT; const agentDevice: WideString; 
                          const agentID: WideString); dispid 29;
    procedure OnCSTAWorkNotReady(monitorCrossRefID: SYSINT; const agentDevice: WideString; 
                                 const agentID: WideString); dispid 30;
    procedure OnCSTAWorkReady(monitorCrossRefID: SYSINT; const agentDevice: WideString; 
                              const agentID: WideString); dispid 31;
    procedure OnCSTABackInService(monitorCrossRefID: SYSINT; const device: WideString; cause: SYSINT); dispid 32;
    procedure OnCSTAOutOfService(monitorCrossRefID: SYSINT; const device: WideString; cause: SYSINT); dispid 33;
    procedure OnCSTAPrivateStatus(monitorCrossRefID: SYSINT; connectionCall: SYSINT; 
                                  const connectionDevice: WideString; 
                                  const calledDevice: WideString; const chargingDevice: WideString; 
                                  const trunkGroup: WideString; const trunkMember: WideString; 
                                  chargeType: SYSINT; charge: SYSINT; error: SYSINT); dispid 34;
    procedure OnCSTAMonitorEnded(monitorCrossRedId: SYSINT; cause: SYSINT); dispid 35;
    procedure OnCSTAAlternateCallConf(InvokeID: SYSINT); dispid 36;
    procedure OnCSTAAnswerCallConf(InvokeID: SYSINT); dispid 37;
    procedure OnCSTAConferenceCallConf(InvokeID: SYSINT; newCallID: SYSINT; 
                                       const newCallDeviceID: WideString; const ucid: WideString); dispid 38;
    procedure OnCSTAConsultationCallConf(InvokeID: SYSINT; newCallID: SYSINT; 
                                         const newCallDeviceID: WideString; const ucid: WideString); dispid 39;
    procedure OnCSTADeflectCallConf(InvokeID: SYSINT); dispid 40;
    procedure OnCSTAClearCallConf(InvokeID: SYSINT); dispid 41;
    procedure OnCSTAClearConnectionConf(InvokeID: SYSINT); dispid 42;
    procedure OnCSTAGroupPickupCallConf(InvokeID: SYSINT); dispid 43;
    procedure OnCSTAHoldCallConf(InvokeID: SYSINT); dispid 44;
    procedure OnCSTAMakeCallConf(InvokeID: SYSINT; const ucid: WideString); dispid 45;
    procedure OnCSTARetrieveCallConf(InvokeID: SYSINT); dispid 46;
    procedure OnCSTATransferCallConf(InvokeID: SYSINT; newCallID: SYSINT; 
                                     const newCallDeviceID: WideString; const ucid: WideString); dispid 47;
    procedure OnCSTAMakePredictiveCallConf(InvokeID: SYSINT; newCallID: SYSINT; 
                                           const newCallDeviceID: WideString; const ucid: WideString); dispid 48;
    procedure OnCSTASetAgentStateConf(InvokeID: SYSINT; isPending: WordBool); dispid 49;
    procedure OnCSTAQueryAgentStateConf(InvokeID: SYSINT; agentState: SYSINT; workMode: SYSINT; 
                                        talkState: SYSINT; reasonCode: SYSINT; 
                                        pendingWorkMode: SYSINT; pendingReasonCode: SYSINT); dispid 50;
    procedure OnCSTAQueryDeviceInfoConf(InvokeID: SYSINT; const device: WideString; 
                                        deviceType: SYSINT; deviceClass: SYSINT; 
                                        extensionClass: Integer; associatedClass: SYSINT; 
                                        const associatedDevice: WideString); dispid 51;
    procedure OnCSTASnapshotDeviceConf(InvokeID: SYSINT; const snapshotData: WideString); dispid 52;
    procedure OnATTQueryAcdSplitConf(InvokeID: SYSINT; availableAgents: SYSINT; 
                                     callsInQueue: SYSINT; agentsLoggedIn: SYSINT); dispid 53;
    procedure OnATTQueryAgentLoginConf(InvokeID: SYSINT; privEventCrossRefID: SYSINT); dispid 54;
    procedure OnATTQueryAgentLoginResp(privEventCrossRefID: SYSINT; const devices: WideString); dispid 55;
    procedure OnATTQueryAgentLoginEnd(privEventCrossRefID: SYSINT); dispid 56;
    procedure OnATTQueryTgConf(InvokeID: SYSINT; idleTrunks: SYSINT; usedTrunks: SYSINT); dispid 57;
    procedure OnATTQueryCallClassifierConf(InvokeID: SYSINT; numAvailPorts: SYSINT; 
                                           numInUsePorts: SYSINT); dispid 58;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TCtConectorX
// Help String      : CtConectorX Control
// Default Interface: ICtConectorX
// Def. Intf. DISP? : No
// Event   Interface: ICtConectorXEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TCtConectorXOnCtEvent = procedure(Sender: TObject; EventClass: SYSINT; EventType: SYSINT) of object;
  TCtConectorXOnACSOpenStreamConf = procedure(Sender: TObject; InvokeID: SYSINT; 
                                                               const apiVer: WideString; 
                                                               const libVer: WideString; 
                                                               const tsrvVer: WideString; 
                                                               const drvVer: WideString) of object;
  TCtConectorXOnACSCloseStreamConf = procedure(Sender: TObject; InvokeID: SYSINT) of object;
  TCtConectorXOnACSUniversalFailureConf = procedure(Sender: TObject; InvokeID: SYSINT; error: SYSINT) of object;
  TCtConectorXOnCSTAUniversalFailureConf = procedure(Sender: TObject; InvokeID: SYSINT; 
                                                                      error: SYSINT) of object;
  TCtConectorXOnCSTAMonitorConf = procedure(Sender: TObject; InvokeID: SYSINT; 
                                                             monitorCrossRefID: SYSINT) of object;
  TCtConectorXOnCSTAMonitorStopConf = procedure(Sender: TObject; InvokeID: SYSINT) of object;
  TCtConectorXOnCSTACallCleared = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                             call: SYSINT; 
                                                             const device: WideString; 
                                                             localConnectionInfo: SYSINT; 
                                                             cause: SYSINT; reason: SYSINT) of object;
  TCtConectorXOnCSTAConferenced = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                             primaryOldCall: SYSINT; 
                                                             const primaryOldDevice: WideString; 
                                                             secondaryOldCall: SYSINT; 
                                                             const secondaryOldDevice: WideString; 
                                                             const confController: WideString; 
                                                             const addedParty: WideString; 
                                                             localConnectionInfo: SYSINT; 
                                                             cause: SYSINT; 
                                                             const distributingDevice: WideString; 
                                                             const ucid: WideString) of object;
  TCtConectorXOnCSTAConnectionCleared = procedure(Sender: TObject; monitorCrossRefID: Integer; 
                                                                   droppedConnectionCall: SYSINT; 
                                                                   const droppedConnectionDevice: WideString; 
                                                                   const releasingDevice: WideString; 
                                                                   localConnectionInfo: SYSINT; 
                                                                   cause: SYSINT; 
                                                                   const userInfo: WideString) of object;
  TCtConectorXOnCSTADelivered = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                           connectionCall: SYSINT; 
                                                           const connectionDevice: WideString; 
                                                           const alertingDevice: WideString; 
                                                           const callingDevice: WideString; 
                                                           const calledDevice: WideString; 
                                                           const lastRedirectionDevice: WideString; 
                                                           localConnectionInfo: SYSINT; 
                                                           cause: SYSINT; deliveredType: SYSINT; 
                                                           const trunkGroup: WideString; 
                                                           const trunkMember: WideString; 
                                                           const split: WideString; 
                                                           const userInfo: WideString; 
                                                           reason: SYSINT; 
                                                           const distributingDevice: WideString; 
                                                           const ucid: WideString; 
                                                           flexibleBilling: WordBool) of object;
  TCtConectorXOnCSTADiverted = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                          connectionCall: SYSINT; 
                                                          const connectionDevice: WideString; 
                                                          const divertingDevice: WideString; 
                                                          const newDestination: WideString; 
                                                          localConnectionInfo: SYSINT; cause: SYSINT) of object;
  TCtConectorXOnCSTAEstablished = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                             establishedConnectionCall: SYSINT; 
                                                             const establishedConnectionDevice: WideString; 
                                                             const answeringDevice: WideString; 
                                                             const callingDevice: WideString; 
                                                             const calledDevice: WideString; 
                                                             const lastRedirectionDevice: WideString; 
                                                             localConnectionInfo: SYSINT; 
                                                             cause: SYSINT; 
                                                             const trunkGroup: WideString; 
                                                             const trunkMember: WideString; 
                                                             const split: WideString; 
                                                             const userInfo: WideString; 
                                                             reason: SYSINT; 
                                                             const distributingDevice: WideString; 
                                                             const ucid: WideString; 
                                                             flexibleBilling: WordBool) of object;
  TCtConectorXOnCSTAFailed = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                        failedConnectionCall: SYSINT; 
                                                        const failedConnectionDevice: WideString; 
                                                        const failingDevice: WideString; 
                                                        const calledDevice: WideString; 
                                                        localConnectionInfo: SYSINT; cause: SYSINT) of object;
  TCtConectorXOnCSTAHeld = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                      heldConnectionCall: SYSINT; 
                                                      const heldConnectionDevice: WideString; 
                                                      const holdingDevice: WideString; 
                                                      localConnectionInfo: SYSINT; cause: SYSINT) of object;
  TCtConectorXOnCSTANetworkReached = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                                connectionCall: SYSINT; 
                                                                const connectionDevice: WideString; 
                                                                const trunkUsed: WideString; 
                                                                const calledDevice: WideString; 
                                                                localConnectionInfo: SYSINT; 
                                                                cause: SYSINT; 
                                                                progressLocation: SYSINT; 
                                                                progressDescription: SYSINT; 
                                                                const trunkGroup: WideString; 
                                                                const trunkMember: WideString) of object;
  TCtConectorXOnCSTAOriginated = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                            originatedConnectionCall: SYSINT; 
                                                            const originatedConnectionDevice: WideString; 
                                                            const callingDevice: WideString; 
                                                            const calledDevice: WideString; 
                                                            localConnectionInfo: SYSINT; 
                                                            cause: SYSINT; 
                                                            const userInfo: WideString) of object;
  TCtConectorXOnCSTAQueued = procedure(Sender: TObject; monitorCrossRedId: SYSINT; 
                                                        queuedConnectionCall: SYSINT; 
                                                        const queuedConnectionDevice: WideString; 
                                                        const queue: WideString; 
                                                        const callingDevice: WideString; 
                                                        const calledDevice: WideString; 
                                                        const lastRedirectionDevice: WideString; 
                                                        numberQueued: SYSINT; 
                                                        localConnectionInfo: SYSINT; cause: SYSINT) of object;
  TCtConectorXOnCSTARetrieved = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                           retrievedConnectionCall: SYSINT; 
                                                           const retrievedConnectionDevice: WideString; 
                                                           const retrievingDevice: WideString; 
                                                           localConnectionInfo: SYSINT; 
                                                           cause: SYSINT) of object;
  TCtConectorXOnCSTAServiceInitiated = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                                  initiatedConnectionCall: SYSINT; 
                                                                  const initiatedConnectionDevice: WideString; 
                                                                  localConnectionInfo: SYSINT; 
                                                                  cause: SYSINT; 
                                                                  const ucid: WideString) of object;
  TCtConectorXOnCSTATransferred = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                             primaryOldCall: SYSINT; 
                                                             const primaryOldDevice: WideString; 
                                                             secondaryOldCall: SYSINT; 
                                                             const secondaryOldDevice: WideString; 
                                                             const transferringDevice: WideString; 
                                                             const transferredDevice: WideString; 
                                                             localConnectionInfo: SYSINT; 
                                                             cause: SYSINT; const ucid: WideString) of object;
  TCtConectorXOnCSTACallInformation = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                                 connectionCall: SYSINT; 
                                                                 const connectionDevice: WideString; 
                                                                 const device: WideString; 
                                                                 const accountInfo: WideString; 
                                                                 const authorisationCode: WideString) of object;
  TCtConectorXOnCSTADoNotDisturb = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                              const device: WideString; 
                                                              doNotDisturbOn: WordBool) of object;
  TCtConectorXOnCSTAForwarding = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                            const device: WideString; 
                                                            forwardingType: SYSINT; 
                                                            forwardingOn: WordBool; 
                                                            const forwardDN: WideString) of object;
  TCtConectorXOnCSTAMessageWaiting = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                                const deviceForMessage: WideString; 
                                                                const invokingDevice: WideString; 
                                                                messageWaitingOn: WordBool) of object;
  TCtConectorXOnCSTALoggedOn = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                          const agentDevice: WideString; 
                                                          const agentID: WideString; 
                                                          const agentGroup: WideString; 
                                                          const password: WideString; 
                                                          workMode: SYSINT) of object;
  TCtConectorXOnCSTALoggedOff = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                           const agentDevice: WideString; 
                                                           const agentID: WideString; 
                                                           const agentGroup: WideString; 
                                                           reasonCode: SYSINT) of object;
  TCtConectorXOnCSTANotReady = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                          const agentDevice: WideString; 
                                                          const agentID: WideString) of object;
  TCtConectorXOnCSTAReady = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                       const agentDevice: WideString; 
                                                       const agentID: WideString) of object;
  TCtConectorXOnCSTAWorkNotReady = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                              const agentDevice: WideString; 
                                                              const agentID: WideString) of object;
  TCtConectorXOnCSTAWorkReady = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                           const agentDevice: WideString; 
                                                           const agentID: WideString) of object;
  TCtConectorXOnCSTABackInService = procedure(Sender: TObject; monitorCrossRefID: SYSINT; 
                                                               const device: WideString; 
                                                               cause: SYSINT) of object;
  TCtConectorXOnCSTAOutOfService = procedure(Sender: TObject; monitorCrossRefID: SYSINT;
                                                              const device: WideString;
                                                              cause: SYSINT) of object;
  TCtConectorXOnCSTAPrivateStatus = procedure(Sender: TObject; monitorCrossRefID: SYSINT;
                                                               connectionCall: SYSINT;
                                                               const connectionDevice: WideString;
                                                               const calledDevice: WideString;
                                                               const chargingDevice: WideString;
                                                               const trunkGroup: WideString;
                                                               const trunkMember: WideString;
                                                               chargeType: SYSINT; charge: SYSINT;
                                                               error: SYSINT) of object;
  TCtConectorXOnCSTAMonitorEnded = procedure(Sender: TObject; monitorCrossRedId: SYSINT;
                                                              cause: SYSINT) of object;
  TCtConectorXOnCSTAAlternateCallConf = procedure(Sender: TObject; InvokeID: SYSINT) of object;
  TCtConectorXOnCSTAAnswerCallConf = procedure(Sender: TObject; InvokeID: SYSINT) of object;
  TCtConectorXOnCSTAConferenceCallConf = procedure(Sender: TObject; InvokeID: SYSINT;
                                                                    newCallID: SYSINT;
                                                                    const newCallDeviceID: WideString;
                                                                    const ucid: WideString) of object;
  TCtConectorXOnCSTAConsultationCallConf = procedure(Sender: TObject; InvokeID: SYSINT;
                                                                      newCallID: SYSINT;
                                                                      const newCallDeviceID: WideString;
                                                                      const ucid: WideString) of object;
  TCtConectorXOnCSTADeflectCallConf = procedure(Sender: TObject; InvokeID: SYSINT) of object;
  TCtConectorXOnCSTAClearCallConf = procedure(Sender: TObject; InvokeID: SYSINT) of object;
  TCtConectorXOnCSTAClearConnectionConf = procedure(Sender: TObject; InvokeID: SYSINT) of object;
  TCtConectorXOnCSTAGroupPickupCallConf = procedure(Sender: TObject; InvokeID: SYSINT) of object;
  TCtConectorXOnCSTAHoldCallConf = procedure(Sender: TObject; InvokeID: SYSINT) of object;
  TCtConectorXOnCSTAMakeCallConf = procedure(Sender: TObject; InvokeID: SYSINT;
                                                              const ucid: WideString) of object;
  TCtConectorXOnCSTARetrieveCallConf = procedure(Sender: TObject; InvokeID: SYSINT) of object;
  TCtConectorXOnCSTATransferCallConf = procedure(Sender: TObject; InvokeID: SYSINT;
                                                                  newCallID: SYSINT;
                                                                  const newCallDeviceID: WideString;
                                                                  const ucid: WideString) of object;
  TCtConectorXOnCSTAMakePredictiveCallConf = procedure(Sender: TObject; InvokeID: SYSINT;
                                                                        newCallID: SYSINT;
                                                                        const newCallDeviceID: WideString;
                                                                        const ucid: WideString) of object;
  TCtConectorXOnCSTASetAgentStateConf = procedure(Sender: TObject; InvokeID: SYSINT;
                                                                   isPending: WordBool) of object;
  TCtConectorXOnCSTAQueryAgentStateConf = procedure(Sender: TObject; InvokeID: SYSINT;
                                                                     agentState: SYSINT;
                                                                     workMode: SYSINT;
                                                                     talkState: SYSINT;
                                                                     reasonCode: SYSINT;
                                                                     pendingWorkMode: SYSINT;
                                                                     pendingReasonCode: SYSINT) of object;
  TCtConectorXOnCSTAQueryDeviceInfoConf = procedure(Sender: TObject; InvokeID: SYSINT;
                                                                     const device: WideString;
                                                                     deviceType: SYSINT;
                                                                     deviceClass: SYSINT;
                                                                     extensionClass: Integer;
                                                                     associatedClass: SYSINT;
                                                                     const associatedDevice: WideString) of object;
  TCtConectorXOnCSTASnapshotDeviceConf = procedure(Sender: TObject; InvokeID: SYSINT;
                                                                    const snapshotData: WideString) of object;
  TCtConectorXOnATTQueryAcdSplitConf = procedure(Sender: TObject; InvokeID: SYSINT;
                                                                  availableAgents: SYSINT;
                                                                  callsInQueue: SYSINT;
                                                                  agentsLoggedIn: SYSINT) of object;
  TCtConectorXOnATTQueryAgentLoginConf = procedure(Sender: TObject; InvokeID: SYSINT;
                                                                    privEventCrossRefID: SYSINT) of object;
  TCtConectorXOnATTQueryAgentLoginResp = procedure(Sender: TObject; privEventCrossRefID: SYSINT;
                                                                    const devices: WideString) of object;
  TCtConectorXOnATTQueryAgentLoginEnd = procedure(Sender: TObject; privEventCrossRefID: SYSINT) of object;
  TCtConectorXOnATTQueryTgConf = procedure(Sender: TObject; InvokeID: SYSINT; idleTrunks: SYSINT;
                                                            usedTrunks: SYSINT) of object;
  TCtConectorXOnATTQueryCallClassifierConf = procedure(Sender: TObject; InvokeID: SYSINT;
                                                                        numAvailPorts: SYSINT;
                                                                        numInUsePorts: SYSINT) of object;

  TCtConectorX = class(TOleControl)
  private
    FOnCtEvent: TCtConectorXOnCtEvent;
    FOnACSOpenStreamConf: TCtConectorXOnACSOpenStreamConf;
    FOnACSCloseStreamConf: TCtConectorXOnACSCloseStreamConf;
    FOnACSUniversalFailureConf: TCtConectorXOnACSUniversalFailureConf;
    FOnCSTAUniversalFailureConf: TCtConectorXOnCSTAUniversalFailureConf;
    FOnCSTAMonitorConf: TCtConectorXOnCSTAMonitorConf;
    FOnCSTAMonitorStopConf: TCtConectorXOnCSTAMonitorStopConf;
    FOnCSTACallCleared: TCtConectorXOnCSTACallCleared;
    FOnCSTAConferenced: TCtConectorXOnCSTAConferenced;
    FOnCSTAConnectionCleared: TCtConectorXOnCSTAConnectionCleared;
    FOnCSTADelivered: TCtConectorXOnCSTADelivered;
    FOnCSTADiverted: TCtConectorXOnCSTADiverted;
    FOnCSTAEstablished: TCtConectorXOnCSTAEstablished;
    FOnCSTAFailed: TCtConectorXOnCSTAFailed;
    FOnCSTAHeld: TCtConectorXOnCSTAHeld;
    FOnCSTANetworkReached: TCtConectorXOnCSTANetworkReached;
    FOnCSTAOriginated: TCtConectorXOnCSTAOriginated;
    FOnCSTAQueued: TCtConectorXOnCSTAQueued;
    FOnCSTARetrieved: TCtConectorXOnCSTARetrieved;
    FOnCSTAServiceInitiated: TCtConectorXOnCSTAServiceInitiated;
    FOnCSTATransferred: TCtConectorXOnCSTATransferred;
    FOnCSTACallInformation: TCtConectorXOnCSTACallInformation;
    FOnCSTADoNotDisturb: TCtConectorXOnCSTADoNotDisturb;
    FOnCSTAForwarding: TCtConectorXOnCSTAForwarding;
    FOnCSTAMessageWaiting: TCtConectorXOnCSTAMessageWaiting;
    FOnCSTALoggedOn: TCtConectorXOnCSTALoggedOn;
    FOnCSTALoggedOff: TCtConectorXOnCSTALoggedOff;
    FOnCSTANotReady: TCtConectorXOnCSTANotReady;
    FOnCSTAReady: TCtConectorXOnCSTAReady;
    FOnCSTAWorkNotReady: TCtConectorXOnCSTAWorkNotReady;
    FOnCSTAWorkReady: TCtConectorXOnCSTAWorkReady;
    FOnCSTABackInService: TCtConectorXOnCSTABackInService;
    FOnCSTAOutOfService: TCtConectorXOnCSTAOutOfService;
    FOnCSTAPrivateStatus: TCtConectorXOnCSTAPrivateStatus;
    FOnCSTAMonitorEnded: TCtConectorXOnCSTAMonitorEnded;
    FOnCSTAAlternateCallConf: TCtConectorXOnCSTAAlternateCallConf;
    FOnCSTAAnswerCallConf: TCtConectorXOnCSTAAnswerCallConf;
    FOnCSTAConferenceCallConf: TCtConectorXOnCSTAConferenceCallConf;
    FOnCSTAConsultationCallConf: TCtConectorXOnCSTAConsultationCallConf;
    FOnCSTADeflectCallConf: TCtConectorXOnCSTADeflectCallConf;
    FOnCSTAClearCallConf: TCtConectorXOnCSTAClearCallConf;
    FOnCSTAClearConnectionConf: TCtConectorXOnCSTAClearConnectionConf;
    FOnCSTAGroupPickupCallConf: TCtConectorXOnCSTAGroupPickupCallConf;
    FOnCSTAHoldCallConf: TCtConectorXOnCSTAHoldCallConf;
    FOnCSTAMakeCallConf: TCtConectorXOnCSTAMakeCallConf;
    FOnCSTARetrieveCallConf: TCtConectorXOnCSTARetrieveCallConf;
    FOnCSTATransferCallConf: TCtConectorXOnCSTATransferCallConf;
    FOnCSTAMakePredictiveCallConf: TCtConectorXOnCSTAMakePredictiveCallConf;
    FOnCSTASetAgentStateConf: TCtConectorXOnCSTASetAgentStateConf;
    FOnCSTAQueryAgentStateConf: TCtConectorXOnCSTAQueryAgentStateConf;
    FOnCSTAQueryDeviceInfoConf: TCtConectorXOnCSTAQueryDeviceInfoConf;
    FOnCSTASnapshotDeviceConf: TCtConectorXOnCSTASnapshotDeviceConf;
    FOnATTQueryAcdSplitConf: TCtConectorXOnATTQueryAcdSplitConf;
    FOnATTQueryAgentLoginConf: TCtConectorXOnATTQueryAgentLoginConf;
    FOnATTQueryAgentLoginResp: TCtConectorXOnATTQueryAgentLoginResp;
    FOnATTQueryAgentLoginEnd: TCtConectorXOnATTQueryAgentLoginEnd;
    FOnATTQueryTgConf: TCtConectorXOnATTQueryTgConf;
    FOnATTQueryCallClassifierConf: TCtConectorXOnATTQueryCallClassifierConf;
    FIntf: ICtConectorX;
    function  GetControlInterface: ICtConectorX;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function OpenStream(const ServerID: WideString; const LoginID: WideString;
                        const Passwd: WideString; InvokeID: Int64): SYSINT;
    function CloseStream(InvokeID: Int64): SYSINT;
    procedure Shutdown;
    function MonitorDevice(const deviceID: WideString; InvokeID: Int64): SYSINT;
    function MonitorCall(call: SYSINT; const device: WideString; InvokeID: Int64): SYSINT;
    function MonitorCallsViaDevice(const deviceID: WideString; InvokeID: Int64): SYSINT;
    function MonitorStop(monitorCrossRefID: SYSINT; InvokeID: Int64): SYSINT;
    function AlternateCall(activeCall: SYSINT; otherCall: SYSINT; const deviceID: WideString;
                           InvokeID: Int64): SYSINT;
    function AnswerCall(alertingCall: SYSINT; const deviceID: WideString; InvokeID: Int64): SYSINT;
    function ConferenceCall(heldCall: SYSINT; activeCall: SYSINT; const deviceID: WideString;
                            InvokeID: Int64): SYSINT;
    function ConsultationCall(activeCall: SYSINT; const callingDevice: WideString;
                              const calledDevice: WideString;
                              const UserToUserInformation: WideString; InvokeID: Int64): SYSINT;
    function DeflectCall(DeflectCall: SYSINT; const deviceID: WideString;
                         const calledDevice: WideString; InvokeID: Int64): SYSINT;
    function ClearCall(call: SYSINT; const deviceID: WideString; InvokeID: Int64): SYSINT;
    function ClearConnection(call: SYSINT; const deviceID: WideString;
                             const UserToUserInformation: WideString; InvokeID: Int64): SYSINT;
    function GroupPickupCall(DeflectCall: SYSINT; const deviceID: WideString;
                             const pickupDevice: WideString; InvokeID: Int64): SYSINT;
    function HoldCall(activeCall: SYSINT; const deviceID: WideString; InvokeID: Int64): SYSINT;
    function MakeCall(const callingDevice: WideString; const calledDevice: WideString;
                      const UserToUserInformation: WideString; InvokeID: Int64): SYSINT;
    function MakePredictiveCall(const callingDevice: WideString; const calledDevice: WideString;
                                allocationState: SYSINT; priorityCalling: WordBool;
                                maxRings: SYSINT; answerTreat: SYSINT;
                                const UserToUserInformation: WideString; InvokeID: Int64): SYSINT;
    function RetrieveCall(heldCall: SYSINT; const deviceID: WideString; InvokeID: Int64): SYSINT;
    function TransferCall(heldCall: SYSINT; activeCall: SYSINT; const deviceID: WideString;
                          InvokeID: Int64): SYSINT;
    function SetAgentState(const device: WideString; agentMode: SYSINT; const agentID: WideString;
                           const agentGroup: WideString; const agentPassword: WideString;
                           workMode: SYSINT; reasonCode: SYSINT; enablePending: WordBool;
                           InvokeID: Int64): SYSINT;
    function QueryAgentState(const device: WideString; InvokeID: Int64): SYSINT;
    function QueryDeviceInfo(const device: WideString; InvokeID: Int64): SYSINT;
    function SnapshotDeviceReq(const snapshotObj: WideString; InvokeID: Int64): SYSINT;
    function QueryAcdSplit(const device: WideString; InvokeID: Int64): SYSINT;
    function QueryAgentLogin(const device: WideString; InvokeID: Int64): SYSINT;
    function QueryTrunkGroup(const device: WideString; InvokeID: Int64): SYSINT;
    function QueryCallClassifier(InvokeID: Int64): SYSINT;
    property ControlInterface: ICtConectorX read GetControlInterface;
    property DefaultInterface: ICtConectorX read GetControlInterface;
  published
    property OnCtEvent: TCtConectorXOnCtEvent read FOnCtEvent write FOnCtEvent;
    property OnACSOpenStreamConf: TCtConectorXOnACSOpenStreamConf read FOnACSOpenStreamConf write FOnACSOpenStreamConf;
    property OnACSCloseStreamConf: TCtConectorXOnACSCloseStreamConf read FOnACSCloseStreamConf write FOnACSCloseStreamConf;
    property OnACSUniversalFailureConf: TCtConectorXOnACSUniversalFailureConf read FOnACSUniversalFailureConf write FOnACSUniversalFailureConf;
    property OnCSTAUniversalFailureConf: TCtConectorXOnCSTAUniversalFailureConf read FOnCSTAUniversalFailureConf write FOnCSTAUniversalFailureConf;
    property OnCSTAMonitorConf: TCtConectorXOnCSTAMonitorConf read FOnCSTAMonitorConf write FOnCSTAMonitorConf;
    property OnCSTAMonitorStopConf: TCtConectorXOnCSTAMonitorStopConf read FOnCSTAMonitorStopConf write FOnCSTAMonitorStopConf;
    property OnCSTACallCleared: TCtConectorXOnCSTACallCleared read FOnCSTACallCleared write FOnCSTACallCleared;
    property OnCSTAConferenced: TCtConectorXOnCSTAConferenced read FOnCSTAConferenced write FOnCSTAConferenced;
    property OnCSTAConnectionCleared: TCtConectorXOnCSTAConnectionCleared read FOnCSTAConnectionCleared write FOnCSTAConnectionCleared;
    property OnCSTADelivered: TCtConectorXOnCSTADelivered read FOnCSTADelivered write FOnCSTADelivered;
    property OnCSTADiverted: TCtConectorXOnCSTADiverted read FOnCSTADiverted write FOnCSTADiverted;
    property OnCSTAEstablished: TCtConectorXOnCSTAEstablished read FOnCSTAEstablished write FOnCSTAEstablished;
    property OnCSTAFailed: TCtConectorXOnCSTAFailed read FOnCSTAFailed write FOnCSTAFailed;
    property OnCSTAHeld: TCtConectorXOnCSTAHeld read FOnCSTAHeld write FOnCSTAHeld;
    property OnCSTANetworkReached: TCtConectorXOnCSTANetworkReached read FOnCSTANetworkReached write FOnCSTANetworkReached;
    property OnCSTAOriginated: TCtConectorXOnCSTAOriginated read FOnCSTAOriginated write FOnCSTAOriginated;
    property OnCSTAQueued: TCtConectorXOnCSTAQueued read FOnCSTAQueued write FOnCSTAQueued;
    property OnCSTARetrieved: TCtConectorXOnCSTARetrieved read FOnCSTARetrieved write FOnCSTARetrieved;
    property OnCSTAServiceInitiated: TCtConectorXOnCSTAServiceInitiated read FOnCSTAServiceInitiated write FOnCSTAServiceInitiated;
    property OnCSTATransferred: TCtConectorXOnCSTATransferred read FOnCSTATransferred write FOnCSTATransferred;
    property OnCSTACallInformation: TCtConectorXOnCSTACallInformation read FOnCSTACallInformation write FOnCSTACallInformation;
    property OnCSTADoNotDisturb: TCtConectorXOnCSTADoNotDisturb read FOnCSTADoNotDisturb write FOnCSTADoNotDisturb;
    property OnCSTAForwarding: TCtConectorXOnCSTAForwarding read FOnCSTAForwarding write FOnCSTAForwarding;
    property OnCSTAMessageWaiting: TCtConectorXOnCSTAMessageWaiting read FOnCSTAMessageWaiting write FOnCSTAMessageWaiting;
    property OnCSTALoggedOn: TCtConectorXOnCSTALoggedOn read FOnCSTALoggedOn write FOnCSTALoggedOn;
    property OnCSTALoggedOff: TCtConectorXOnCSTALoggedOff read FOnCSTALoggedOff write FOnCSTALoggedOff;
    property OnCSTANotReady: TCtConectorXOnCSTANotReady read FOnCSTANotReady write FOnCSTANotReady;
    property OnCSTAReady: TCtConectorXOnCSTAReady read FOnCSTAReady write FOnCSTAReady;
    property OnCSTAWorkNotReady: TCtConectorXOnCSTAWorkNotReady read FOnCSTAWorkNotReady write FOnCSTAWorkNotReady;
    property OnCSTAWorkReady: TCtConectorXOnCSTAWorkReady read FOnCSTAWorkReady write FOnCSTAWorkReady;
    property OnCSTABackInService: TCtConectorXOnCSTABackInService read FOnCSTABackInService write FOnCSTABackInService;
    property OnCSTAOutOfService: TCtConectorXOnCSTAOutOfService read FOnCSTAOutOfService write FOnCSTAOutOfService;
    property OnCSTAPrivateStatus: TCtConectorXOnCSTAPrivateStatus read FOnCSTAPrivateStatus write FOnCSTAPrivateStatus;
    property OnCSTAMonitorEnded: TCtConectorXOnCSTAMonitorEnded read FOnCSTAMonitorEnded write FOnCSTAMonitorEnded;
    property OnCSTAAlternateCallConf: TCtConectorXOnCSTAAlternateCallConf read FOnCSTAAlternateCallConf write FOnCSTAAlternateCallConf;
    property OnCSTAAnswerCallConf: TCtConectorXOnCSTAAnswerCallConf read FOnCSTAAnswerCallConf write FOnCSTAAnswerCallConf;
    property OnCSTAConferenceCallConf: TCtConectorXOnCSTAConferenceCallConf read FOnCSTAConferenceCallConf write FOnCSTAConferenceCallConf;
    property OnCSTAConsultationCallConf: TCtConectorXOnCSTAConsultationCallConf read FOnCSTAConsultationCallConf write FOnCSTAConsultationCallConf;
    property OnCSTADeflectCallConf: TCtConectorXOnCSTADeflectCallConf read FOnCSTADeflectCallConf write FOnCSTADeflectCallConf;
    property OnCSTAClearCallConf: TCtConectorXOnCSTAClearCallConf read FOnCSTAClearCallConf write FOnCSTAClearCallConf;
    property OnCSTAClearConnectionConf: TCtConectorXOnCSTAClearConnectionConf read FOnCSTAClearConnectionConf write FOnCSTAClearConnectionConf;
    property OnCSTAGroupPickupCallConf: TCtConectorXOnCSTAGroupPickupCallConf read FOnCSTAGroupPickupCallConf write FOnCSTAGroupPickupCallConf;
    property OnCSTAHoldCallConf: TCtConectorXOnCSTAHoldCallConf read FOnCSTAHoldCallConf write FOnCSTAHoldCallConf;
    property OnCSTAMakeCallConf: TCtConectorXOnCSTAMakeCallConf read FOnCSTAMakeCallConf write FOnCSTAMakeCallConf;
    property OnCSTARetrieveCallConf: TCtConectorXOnCSTARetrieveCallConf read FOnCSTARetrieveCallConf write FOnCSTARetrieveCallConf;
    property OnCSTATransferCallConf: TCtConectorXOnCSTATransferCallConf read FOnCSTATransferCallConf write FOnCSTATransferCallConf;
    property OnCSTAMakePredictiveCallConf: TCtConectorXOnCSTAMakePredictiveCallConf read FOnCSTAMakePredictiveCallConf write FOnCSTAMakePredictiveCallConf;
    property OnCSTASetAgentStateConf: TCtConectorXOnCSTASetAgentStateConf read FOnCSTASetAgentStateConf write FOnCSTASetAgentStateConf;
    property OnCSTAQueryAgentStateConf: TCtConectorXOnCSTAQueryAgentStateConf read FOnCSTAQueryAgentStateConf write FOnCSTAQueryAgentStateConf;
    property OnCSTAQueryDeviceInfoConf: TCtConectorXOnCSTAQueryDeviceInfoConf read FOnCSTAQueryDeviceInfoConf write FOnCSTAQueryDeviceInfoConf;
    property OnCSTASnapshotDeviceConf: TCtConectorXOnCSTASnapshotDeviceConf read FOnCSTASnapshotDeviceConf write FOnCSTASnapshotDeviceConf;
    property OnATTQueryAcdSplitConf: TCtConectorXOnATTQueryAcdSplitConf read FOnATTQueryAcdSplitConf write FOnATTQueryAcdSplitConf;
    property OnATTQueryAgentLoginConf: TCtConectorXOnATTQueryAgentLoginConf read FOnATTQueryAgentLoginConf write FOnATTQueryAgentLoginConf;
    property OnATTQueryAgentLoginResp: TCtConectorXOnATTQueryAgentLoginResp read FOnATTQueryAgentLoginResp write FOnATTQueryAgentLoginResp;
    property OnATTQueryAgentLoginEnd: TCtConectorXOnATTQueryAgentLoginEnd read FOnATTQueryAgentLoginEnd write FOnATTQueryAgentLoginEnd;
    property OnATTQueryTgConf: TCtConectorXOnATTQueryTgConf read FOnATTQueryTgConf write FOnATTQueryTgConf;
    property OnATTQueryCallClassifierConf: TCtConectorXOnATTQueryCallClassifierConf read FOnATTQueryCallClassifierConf write FOnATTQueryCallClassifierConf;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'Servers';

implementation

uses ComObj;

procedure TCtConectorX.InitControlData;
const
  CEventDispIDs: array [0..57] of DWORD = (
    $00000001, $00000002, $00000003, $00000004, $00000005, $00000006,
    $00000007, $00000008, $00000009, $0000000A, $0000000B, $0000000C,
    $0000000D, $0000000E, $0000000F, $00000010, $00000011, $00000012,
    $00000013, $00000014, $00000015, $00000016, $00000017, $00000018,
    $00000019, $0000001A, $0000001B, $0000001C, $0000001D, $0000001E,
    $0000001F, $00000020, $00000021, $00000022, $00000023, $00000024,
    $00000025, $00000026, $00000027, $00000028, $00000029, $0000002A,
    $0000002B, $0000002C, $0000002D, $0000002E, $0000002F, $00000030,
    $00000031, $00000032, $00000033, $00000034, $00000035, $00000036,
    $00000037, $00000038, $00000039, $0000003A);
  CControlData: TControlData2 = (
    ClassID: '{09748F29-C3D3-4FAC-A359-FC2542110118}';
    EventIID: '{DA49C783-26BC-452D-9D5A-E7D21E3B6D0A}';
    EventCount: 58;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$00000000*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnCtEvent) - Cardinal(Self);
end;

procedure TCtConectorX.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as ICtConectorX;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TCtConectorX.GetControlInterface: ICtConectorX;
begin
  CreateControl;
  Result := FIntf;
end;

function TCtConectorX.OpenStream(const ServerID: WideString; const LoginID: WideString; 
                                 const Passwd: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.OpenStream(ServerID, LoginID, Passwd, InvokeID);
end;

function TCtConectorX.CloseStream(InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.CloseStream(InvokeID);
end;

procedure TCtConectorX.Shutdown;
begin
  DefaultInterface.Shutdown;
end;

function TCtConectorX.MonitorDevice(const deviceID: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.MonitorDevice(deviceID, InvokeID);
end;

function TCtConectorX.MonitorCall(call: SYSINT; const device: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.MonitorCall(call, device, InvokeID);
end;

function TCtConectorX.MonitorCallsViaDevice(const deviceID: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.MonitorCallsViaDevice(deviceID, InvokeID);
end;

function TCtConectorX.MonitorStop(monitorCrossRefID: SYSINT; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.MonitorStop(monitorCrossRefID, InvokeID);
end;

function TCtConectorX.AlternateCall(activeCall: SYSINT; otherCall: SYSINT; 
                                    const deviceID: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.AlternateCall(activeCall, otherCall, deviceID, InvokeID);
end;

function TCtConectorX.AnswerCall(alertingCall: SYSINT; const deviceID: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.AnswerCall(alertingCall, deviceID, InvokeID);
end;

function TCtConectorX.ConferenceCall(heldCall: SYSINT; activeCall: SYSINT; 
                                     const deviceID: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.ConferenceCall(heldCall, activeCall, deviceID, InvokeID);
end;

function TCtConectorX.ConsultationCall(activeCall: SYSINT; const callingDevice: WideString; 
                                       const calledDevice: WideString; 
                                       const UserToUserInformation: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.ConsultationCall(activeCall, callingDevice, calledDevice, 
                                              UserToUserInformation, InvokeID);
end;

function TCtConectorX.DeflectCall(DeflectCall: SYSINT; const deviceID: WideString; 
                                  const calledDevice: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.DeflectCall(DeflectCall, deviceID, calledDevice, InvokeID);
end;

function TCtConectorX.ClearCall(call: SYSINT; const deviceID: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.ClearCall(call, deviceID, InvokeID);
end;

function TCtConectorX.ClearConnection(call: SYSINT; const deviceID: WideString; 
                                      const UserToUserInformation: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.ClearConnection(call, deviceID, UserToUserInformation, InvokeID);
end;

function TCtConectorX.GroupPickupCall(DeflectCall: SYSINT; const deviceID: WideString; 
                                      const pickupDevice: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.GroupPickupCall(DeflectCall, deviceID, pickupDevice, InvokeID);
end;

function TCtConectorX.HoldCall(activeCall: SYSINT; const deviceID: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.HoldCall(activeCall, deviceID, InvokeID);
end;

function TCtConectorX.MakeCall(const callingDevice: WideString; const calledDevice: WideString; 
                               const UserToUserInformation: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.MakeCall(callingDevice, calledDevice, UserToUserInformation, InvokeID);
end;

function TCtConectorX.MakePredictiveCall(const callingDevice: WideString; 
                                         const calledDevice: WideString; allocationState: SYSINT; 
                                         priorityCalling: WordBool; maxRings: SYSINT; 
                                         answerTreat: SYSINT; 
                                         const UserToUserInformation: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.MakePredictiveCall(callingDevice, calledDevice, allocationState, 
                                                priorityCalling, maxRings, answerTreat, 
                                                UserToUserInformation, InvokeID);
end;

function TCtConectorX.RetrieveCall(heldCall: SYSINT; const deviceID: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.RetrieveCall(heldCall, deviceID, InvokeID);
end;

function TCtConectorX.TransferCall(heldCall: SYSINT; activeCall: SYSINT; 
                                   const deviceID: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.TransferCall(heldCall, activeCall, deviceID, InvokeID);
end;

function TCtConectorX.SetAgentState(const device: WideString; agentMode: SYSINT; 
                                    const agentID: WideString; const agentGroup: WideString; 
                                    const agentPassword: WideString; workMode: SYSINT; 
                                    reasonCode: SYSINT; enablePending: WordBool; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.SetAgentState(device, agentMode, agentID, agentGroup, agentPassword, 
                                           workMode, reasonCode, enablePending, InvokeID);
end;

function TCtConectorX.QueryAgentState(const device: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.QueryAgentState(device, InvokeID);
end;

function TCtConectorX.QueryDeviceInfo(const device: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.QueryDeviceInfo(device, InvokeID);
end;

function TCtConectorX.SnapshotDeviceReq(const snapshotObj: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.SnapshotDeviceReq(snapshotObj, InvokeID);
end;

function TCtConectorX.QueryAcdSplit(const device: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.QueryAcdSplit(device, InvokeID);
end;

function TCtConectorX.QueryAgentLogin(const device: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.QueryAgentLogin(device, InvokeID);
end;

function TCtConectorX.QueryTrunkGroup(const device: WideString; InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.QueryTrunkGroup(device, InvokeID);
end;

function TCtConectorX.QueryCallClassifier(InvokeID: Int64): SYSINT;
begin
  Result := DefaultInterface.QueryCallClassifier(InvokeID);
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TCtConectorX]);
end;

end.

