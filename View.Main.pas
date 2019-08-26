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
    Button2: TButton;
    Label1: TLabel;
    lblConnect: TLabel;
    Label2: TLabel;
    lblSdk: TLabel;
    Label3: TLabel;
    lblBattery: TLabel;
    tmBattery: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure tmBatteryTimer(Sender: TObject);
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
{  Drone.TakeOff;
  Sleep(5000);
  Drone.Forward(40);
  Sleep(5000);
  Drone.Clockwise(90);
  Sleep(5000);
  Drone.Forward(40);
  Sleep(5000);
  Drone.Clockwise(90);
  Sleep(5000);
  Drone.Forward(60);
  Sleep(5000);
  Drone.flip(tfleft);
  Sleep(5000);
  Drone.Clockwise(90);
  Sleep(5000);
  Drone.Land;
  ShowMessage('Fim');
  }
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if Drone.Connect then
  begin
    lblConnect.Caption := 'Connect';
    lblConnect.Font.Color := clGreen;
    lblSdk.Caption := Drone.Sdk;
    tmBattery.Enabled := False;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Drone := TTello.Create;
end;

procedure TForm1.tmBatteryTimer(Sender: TObject);
begin
 tmBattery.Enabled := False;
 try
   lblBattery.Caption := IntToStr(Drone.Battery) + ' %';
 finally
   tmBattery.Enabled := True;
 end;
end;

end.
