object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #47196#44536#51064
  ClientHeight = 120
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 18
    Width = 48
    Height = 13
    Caption = #48337#50896#49440#53469
  end
  object Label2: TLabel
    Left = 32
    Top = 46
    Width = 36
    Height = 13
    Caption = #50500#51060#46356
  end
  object Label3: TLabel
    Left = 32
    Top = 76
    Width = 24
    Height = 13
    Caption = #50516#54840
  end
  object ComboBox1: TComboBox
    Left = 74
    Top = 15
    Width = 145
    Height = 21
    Style = csDropDownList
    ImeName = 'Microsoft Office IME 2007'
    ItemIndex = 0
    TabOrder = 1
    Text = #47476#45348#49828#48337#50896
    Items.Strings = (
      #47476#45348#49828#48337#50896
      #46020#48393#48337#50896
      #51032#51221#48512#55184#47553#49828#48337#50896)
  end
  object Edit1: TEdit
    Left = 74
    Top = 42
    Width = 145
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 74
    Top = 72
    Width = 145
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 248
    Top = 22
    Width = 75
    Height = 25
    Caption = #47196#44536#51064
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 248
    Top = 53
    Width = 75
    Height = 25
    Caption = #51333#47308
    ModalResult = 1
    TabOrder = 4
  end
end
