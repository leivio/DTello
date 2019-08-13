unit Bo.UDP;

interface

uses Classes, Sysutils, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient;

type
  TUDPControl = class
  private
    FServer: string;
    FPort: Integer;
    FUDP: TIdUDPClient;
  public
    const
      INIT = 'command';
    const
      PORT_INIT   = 8889;
      PORT_STATE  = 8890;
      PORT_STREAM = 11111;
    constructor Create(AServer: string = '192.168.10.1'; APort: Integer = PORT_INIT);
    procedure BeforeDestruction; override;
    function Send(const ACommand: string = INIT): string;

    function InitC: Boolean;
  end;

implementation

{ TUDPControl }

procedure TUDPControl.BeforeDestruction;
begin
  inherited;
  if FUDP.Connected then
    FUDP.Disconnect;
  FUDP.Free;
end;

constructor TUDPControl.Create(AServer: string; APort: Integer);
begin
  FServer := AServer;
  FPort := APort;
  FUDP := TIdUDPClient.Create(nil);
  FUDP.ReceiveTimeout := 2000;
  FUDP.Host := AServer;
  FUDP.Port := APort;
end;

function TUDPControl.InitC: Boolean;
var
  _C: string;
begin
  if not FUDP.Connected then FUDP.Connect;
  FUDP.Send(TUDPControl.INIT);
  _C := FUDP.ReceiveString;
  Result := SameText(_C,'ok');
end;

function TUDPControl.Send(const ACommand: string): string;
begin
  FUDP.Send(ACommand);
  Sleep(50);
  Result := FUDP.ReceiveString;
end;

end.


