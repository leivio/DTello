program DTelloControl;

uses
  Vcl.Forms,
  View.Main in 'View.Main.pas' {Form1},
  Tello.Controller in 'Tello.Controller.pas',
  Bo.UDP in 'Bo.UDP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
