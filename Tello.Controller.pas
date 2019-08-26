unit Tello.Controller;

interface

uses Bo.UDP;

type

  TTypeFlips = (tfleft, tfright, tfforward, tfback);

  TTello = class
  private
    FControl: TUDPControl;
    FInit: Boolean;
    function SendCommand(ACommand: string): Boolean;
  public
    constructor Create(AServer: string = '192.168.10.1'; APort: Integer = 8889);
    {Controle de Inicio}
    function Connect: Boolean;
    function TakeOff: Boolean; {Decolar padrão 150 cm}
    function Land: Boolean; {Aterrissa}
    function Emergency: Boolean; {Desliga as helices}
    function Stop: Boolean; {Paira no Ar em qualquer momento}
    {Movimentos}
    function Up(const ADisplacement: Integer = 20): Boolean;   {Cima minimo = 20 cm}
    function Down(const ADisplacement: Integer = 20): Boolean; {Baixo minimo = 20 cm}
    function Left(const ADisplacement: Integer = 20): Boolean; {Esquerda minimo = 20 cm}
    function Right(const ADisplacement: Integer = 20): Boolean; {Direita minimo = 20 cm}
    function &Forward(const ADisplacement: Integer = 20): Boolean; {Frente minimo = 20 cm}
    function Back(const ADisplacement: Integer = 20): Boolean; {Para Atrás minimo = 20 cm}
    {Rotação}
    function Clockwise(const ADisplacement: Integer = 1): Boolean; {Rotação Horario}
    function Counterclockwise(const ADisplacement: Integer = 1): Boolean; {Rotação Anti - Horario}
    function flip(ATypeFlips: TTypeFlips = tfleft): Boolean;
    {Status}
    function Battery: Integer; {Percentual bateria}
    function Time: string;     {Tempo de voo}
    function Sdk: string;      {Versão SDK}
  end;

implementation

{ Tello }

uses Classes, Sysutils;

function TTello.Back(const ADisplacement: Integer): Boolean;
begin
  Result := SendCommand('back ' + IntToStr(ADisplacement));
end;

function TTello.Battery: Integer;
var
  _C: string;
begin
  Result := 0;
  _C := FControl.Send('battery?');
  _C := Copy(_C, 1, Pos(_C, '#$'));
  if StrToIntDef(_C, -1) > -1 then
    Result := StrToInt(_C);
end;

function TTello.time: string;
begin
  Result := FControl.Send('time?');
end;

function TTello.Sdk: string;
begin
  Result := FControl.Send('sdk?');
end;

function TTello.Up(const ADisplacement: Integer): Boolean;
begin
  Result := SendCommand('up ' + IntToStr(ADisplacement));
end;

function TTello.Clockwise(const ADisplacement: Integer): Boolean;
begin
  Result := SendCommand('cw ' + IntToStr(ADisplacement));
end;

function TTello.Connect: Boolean;
begin
  if not FInit then
    FInit := FControl.InitC;
end;

function TTello.Counterclockwise(const ADisplacement: Integer): Boolean;
begin
  Result := SendCommand('ccw ' + IntToStr(ADisplacement));
end;

constructor TTello.Create(AServer: string; APort: Integer);
begin
  FControl := TUDPControl.Create(AServer, APort);
end;

function TTello.Down(const ADisplacement: Integer): Boolean;
begin
  Result := SendCommand('Down ' + IntToStr(ADisplacement));
end;

function TTello.Emergency: Boolean;
begin
  Result := SendCommand('emergency');
end;

function TTello.flip(ATypeFlips: TTypeFlips): Boolean;
var
  _C: string;
begin
  case ATypeFlips of
    tfleft:    _C := 'l';
    tfright:   _C := 'r';
    tfforward: _C := 'f';
    tfback:    _C := 'b';
  end;
  Result := SameText(FControl.Send('flip ' + _C), 'ok');
end;

function TTello.Forward(const ADisplacement: Integer): Boolean;
begin
  Result := SendCommand('forward ' + IntToStr(ADisplacement));
end;

function TTello.Land: Boolean;
begin
  Result := SendCommand('land');
end;

function TTello.Left(const ADisplacement: Integer): Boolean;
begin
  Result := SendCommand('left ' + IntToStr(ADisplacement));
end;

function TTello.Right(const ADisplacement: Integer): Boolean;
begin
  Result := SendCommand('right ' + IntToStr(ADisplacement));
end;

function TTello.SendCommand(ACommand: string): Boolean;
begin
  Result := SameText(FControl.Send(ACommand),'ok');
end;

function TTello.Stop: Boolean;
begin
  Result := SendCommand('stop');
end;

function TTello.TakeOff: Boolean;
begin
  Result := SendCommand('takeoff');
end;


end.
