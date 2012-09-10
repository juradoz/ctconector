unit uThreadMessageEvent;

interface

uses Windows, SysUtils;

type

  EPostThreadMessage = Exception;

  {$IFDEF COMTAGMSG}
  TThreadMessageEvent = procedure ( Sender : TObject; lpMsg : TagMSG ) of object;
  {$ELSE}
  TThreadMessageEvent = procedure ( Sender : TObject; const Message, wParam,
    lParam : Cardinal ) of object;
  {$ENDIF}

implementation

end.
 