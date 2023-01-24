object PrincipalEx2: TPrincipalEx2
  Left = 0
  Top = 0
  Caption = 'Exercicio 02'
  ClientHeight = 348
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Produto: TGroupBox
    Left = 8
    Top = 8
    Width = 225
    Height = 113
    Caption = 'Produto'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object EdtNome: TEdit
      Left = 82
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object EdtValor: TEdit
      Left = 82
      Top = 53
      Width = 121
      Height = 21
      TabOrder = 1
      OnKeyPress = EdtValorKeyPress
    end
    object BtnIncProd: TButton
      Left = 128
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 2
      OnClick = BtnIncProdClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 280
    Top = 8
    Width = 225
    Height = 145
    Caption = 'Descontos dos Produtos'
    TabOrder = 1
    object Label3: TLabel
      Left = 7
      Top = 49
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label4: TLabel
      Left = 16
      Top = 81
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label5: TLabel
      Left = 7
      Top = 19
      Width = 33
      Height = 13
      Caption = 'Codigo'
    end
    object EdtQtdDesc: TEdit
      Left = 85
      Top = 46
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object EdtValorDesc: TEdit
      Left = 85
      Top = 78
      Width = 121
      Height = 21
      TabOrder = 1
      OnKeyPress = EdtValorKeyPress
    end
    object Button1: TButton
      Left = 132
      Top = 109
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = Button1Click
    end
    object EdtCodDesc: TEdit
      Left = 85
      Top = 16
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 176
    Width = 497
    Height = 113
    Caption = 'Calculo'
    TabOrder = 2
    object Label6: TLabel
      Left = 16
      Top = 24
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object Label7: TLabel
      Left = 16
      Top = 56
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object LblValor: TLabel
      Left = 232
      Top = 56
      Width = 54
      Height = 13
      Caption = 'Valor final: '
    end
    object lblNome: TLabel
      Left = 232
      Top = 24
      Width = 34
      Height = 13
      Caption = 'Nome: '
    end
    object EdtProd: TEdit
      Left = 82
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object EdtQtd: TEdit
      Left = 82
      Top = 53
      Width = 121
      Height = 21
      TabOrder = 1
      OnKeyPress = EdtValorKeyPress
    end
    object Button2: TButton
      Left = 128
      Top = 80
      Width = 75
      Height = 25
      Caption = 'Calcular'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
end
