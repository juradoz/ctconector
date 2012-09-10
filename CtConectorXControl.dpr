library CtConectorXControl;

uses
  ComServ,
  CtConectorXControl_TLB in 'CtConectorXControl_TLB.pas',
  CtConectorImpl in 'CtConectorImpl.pas' {CtConectorX: CoClass},
  uACS_h in 'avaya\cTranslations\uACS_h.pas',
  uACSdefs_h in 'avaya\cTranslations\uACSdefs_h.pas',
  uAttpdefs_h in 'avaya\cTranslations\uATTpdefs_h.pas',
  uATTpriv_h in 'avaya\cTranslations\uATTpriv_h.pas',
  uBasicCallControlCtConector in 'avaya\classes\uBasicCallControlCtConector.pas',
  uCSTA_h in 'avaya\cTranslations\uCSTA_h.pas',
  uCSTADefs_h in 'avaya\cTranslations\uCSTAdefs_h.pas',
  uCtClient in 'avaya\classes\uCtClient.pas',
  uCtEvents in 'avaya\utils\uCtEvents.pas',
  uCtMessages in 'avaya\utils\uCtMessages.pas',
  uCtTypes in 'avaya\utils\uCtTypes.pas',
  uGeneralThread in 'Threads\uGeneralThread.pas',
  uMonitorServicesCtConector in 'avaya\classes\uMonitorServicesCtConector.pas',
  uNoSleepPeekMessageThread in 'Threads\uNoSleepPeekMessageThread.pas',
  uPeriodicThread in 'Threads\uPeriodicThread.pas',
  uRepeatedThread in 'Threads\uRepeatedThread.pas',
  uSnapShotServicesCtConector in 'avaya\classes\uSnapShotServicesCtConector.pas',
  uStreamerCtConector in 'avaya\classes\uStreamerCtConector.pas',
  uTelephonySuplementaryCtConector in 'avaya\classes\uTelephonySuplementaryCtConector.pas',
  uThreadMessageEvent in 'Threads\uThreadMessageEvent.pas',
  uTranslations in 'avaya\utils\uTranslations.pas',
  uTsplatfm_h in 'avaya\cTranslations\uTsplatfm_h.pas',
  uEscapeServicesCtConector in 'avaya\classes\uEscapeServicesCtConector.pas';

{$E ocx}

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
