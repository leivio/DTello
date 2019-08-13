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
      Left = 7
      Top = 24
      Width = 171
      Height = 25
      Caption = 'Start Fly'
      TabOrder = 0
      OnClick = Button1Click
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
    end
  end
end
