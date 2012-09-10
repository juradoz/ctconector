unit uSnapShotServicesCtConector;

interface

uses uTelephonySuplementaryCtConector, uCtTypes, uACS_h, uCtEvents, uCSTA_h,
  uATTPriv_h;

type
  TSnapShotServicesCtConector = class( TTelephonySuplementaryCtConector )
    private
      FOnCSTASnapshotDeviceConf : TCSTASnapshotDeviceConfEvent;

      procedure RaiseCSTASnapshotDeviceConfEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );
    protected
      procedure HandleCtEvent( Event : CSTAEvent_t; PrivateData : ATTPrivateData_t );override;
    public
      function SnapshotDeviceReq( const snapshotObj : TDeviceID; const InvokeID : TInvokeID = 0 ) : TSAPI;

    published
      property OnCSTASnapshotDeviceConf : TCSTASnapshotDeviceConfEvent read FOnCSTASnapshotDeviceConf write FOnCSTASnapshotDeviceConf;

  end;

implementation

uses SysUtils, uStreamerCtConector, uMonitorServicesCtConector, uCSTADefs_h, uACSDefs_h;

{ TSnapShotServicesCtConector }

procedure TSnapShotServicesCtConector.HandleCtEvent(Event: CSTAEvent_t;
  PrivateData: ATTPrivateData_t);
begin
inherited;
case Event.eventHeader.eventClass of

  CSTACONFIRMATION :
    begin

    case Event.eventHeader.eventType of

      CSTA_SNAPSHOT_DEVICE_CONF :
        begin
        RaiseCSTASnapshotDeviceConfEvent( Event, PrivateData );
        end;

      end;

    end;

  end;
end;

procedure TSnapShotServicesCtConector.RaiseCSTASnapshotDeviceConfEvent(
  Event: CSTAEvent_t; PrivateData: ATTPrivateData_t);
begin
if Assigned( FOnCSTASnapshotDeviceConf ) then
  begin
  try
    FOnCSTASnapshotDeviceConf( Self, Event._event.cstaConfirmation.invokeID,
      Event._event.cstaConfirmation.snapshotDevice.snapshotData );
  except
    on E : Exception do
      begin
      CatchEventException( 'FOnCSTASnapshotDeviceConf', E.Message );
      end;
  end;
  end;
end;

function TSnapShotServicesCtConector.SnapshotDeviceReq(
  const snapshotObj: TDeviceID; const InvokeID : TInvokeID): TSAPI;
var _snapshotObj : DeviceID_t;
begin
Result := DEFAULT_ERROR_CODE;
if CheckParams( snapshotObj <> EmptyStr, 'SnapshotDeviceReq' ) then
  begin
  PrepareDeviceID_t( _snapshotObj, snapshotObj );
  Result := cstaSnapshotDeviceReq( FAcsHandle, InvokeID, @_snapshotObj, nil );
  CheckForGoodCtResult( Result, 'cstaSnapshotDeviceReq' );
  end
end;

end.
 