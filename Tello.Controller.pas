unit Tello.Controller;

interface

uses Bo.UDP;

type

  TTello = class
  private
    FControl: TUDPControl;
    FInit: Boolean;
    function SendCommand(ACommand: string): Boolean;
  public
    constructor Create(AServer: string = '192.168.10.1'; APort: Integer = 8889);
    procedure TakeOff;
    procedure Land;
  end;

implementation

{ Tello }

constructor TTello.Create(AServer: string; APort: Integer);
begin
  FControl := TUDPControl.Create(AServer, APort);
end;

procedure TTello.Land;
begin
  SendCommand('land');
end;

function TTello.SendCommand(ACommand: string): Boolean;
begin
  if not FInit then
    FInit := FControl.InitC;
  if FInit then
    FControl.Send(ACommand);
end;

procedure TTello.TakeOff;
begin
  SendCommand('takeoff');
end;

end.
