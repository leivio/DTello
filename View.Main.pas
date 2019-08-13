unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Tello.Controller,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Drone: TTello;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Drone.TakeOff;
  Sleep(5000);
  Drone.Forward(40);
  Sleep(5000);
  Drone.Clockwise(90);
  Sleep(5000);
  Drone.Forward(40);
  Sleep(5000);
  Drone.Clockwise(90);
  Sleep(5000);
  Drone.Forward(40);
  Sleep(5000);
  Drone.Clockwise(90);
  Sleep(5000);
  Drone.Land;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Drone := TTello.Create;
end;

end.
