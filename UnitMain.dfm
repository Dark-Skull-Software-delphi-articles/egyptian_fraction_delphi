object FormMain: TFormMain
  Left = 290
  Top = 278
  Width = 310
  Height = 167
  Caption = 'Fraction Egyptienne'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelResult: TLabel
    Left = 24
    Top = 112
    Width = 57
    Height = 13
    Caption = 'Résultat de '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object LabelNum: TLabel
    Left = 16
    Top = 16
    Width = 82
    Height = 13
    Caption = 'Nombre à diviser:'
  end
  object LabelDenum: TLabel
    Left = 16
    Top = 64
    Width = 66
    Height = 13
    Caption = 'Dénominateur'
  end
  object Edit1: TEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '1'
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 24
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '1'
    OnKeyPress = Edit1KeyPress
  end
  object ButtonCalc: TButton
    Left = 184
    Top = 57
    Width = 75
    Height = 25
    Caption = 'Calculer'
    Default = True
    TabOrder = 2
    OnClick = ButtonCalcClick
  end
end
