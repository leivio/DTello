object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'DTello Control'
  ClientHeight = 440
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 185
    Height = 440
    Align = alLeft
    Caption = '  Control  '
    TabOrder = 0
    object Button1: TButton
      Left = 8
      Top = 64
      Width = 171
      Height = 25
      Caption = 'Sample Fly'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 27
      Width = 171
      Height = 25
      Caption = 'Connect'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 185
    Top = 0
    Width = 615
    Height = 440
    Align = alClient
    TabOrder = 1
    object GroupBox3: TGroupBox
      Left = 2
      Top = 120
      Width = 611
      Height = 318
      Align = alClient
      TabOrder = 0
    end
    object GroupBox4: TGroupBox
      Left = 2
      Top = 15
      Width = 611
      Height = 105
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 44
        Height = 13
        Caption = 'Connect:'
      end
      object lblConnect: TLabel
        Left = 58
        Top = 16
        Width = 64
        Height = 13
        Caption = 'Disconnected'
      end
      object Label2: TLabel
        Left = 29
        Top = 35
        Width = 23
        Height = 13
        Caption = 'SDK:'
      end
      object lblSdk: TLabel
        Left = 58
        Top = 35
        Width = 16
        Height = 13
        Caption = '0.0'
      end
      object Label3: TLabel
        Left = 141
        Top = 16
        Width = 40
        Height = 13
        Caption = 'Battery:'
      end
      object lblBattery: TLabel
        Left = 185
        Top = 16
        Width = 20
        Height = 13
        Caption = '0 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object tmBattery: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = tmBatteryTimer
    Left = 491
    Top = 23
  end
end
