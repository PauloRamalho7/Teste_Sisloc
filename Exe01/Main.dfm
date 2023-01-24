object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = 'Pre'#231'o de venda'
  ClientHeight = 161
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LblResultado: TLabel
    Left = 34
    Top = 75
    Width = 108
    Height = 16
    Caption = 'Valor Calculado: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblQtd: TLabel
    Left = 34
    Top = 29
    Width = 99
    Height = 13
    Caption = 'Quantidade de DVDs'
  end
  object EdtQtd: TEdit
    Left = 32
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
    OnKeyPress = EdtQtdKeyPress
  end
  object BtnCalcular: TButton
    Left = 34
    Top = 104
    Width = 75
    Height = 25
    Caption = '&Calcular'
    TabOrder = 1
    OnClick = BtnCalcularClick
  end
  object BtnZerar: TButton
    Left = 136
    Top = 104
    Width = 75
    Height = 25
    Caption = '&Zerar'
    TabOrder = 2
    OnClick = BtnZerarClick
  end
end
