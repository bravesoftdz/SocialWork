object frmAdminSetup: TfrmAdminSetup
  Left = 0
  Top = 0
  Caption = #44288#47532#51088#54168#51060#51648
  ClientHeight = 412
  ClientWidth = 705
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
  object Button1: TButton
    Left = 36
    Top = 24
    Width = 351
    Height = 25
    Caption = 'Ward History '#47564#46308#44592
    TabOrder = 0
    OnClick = Button1Click
  end
  object ProgressBarWardHistory: TProgressBar
    Left = 36
    Top = 51
    Width = 351
    Height = 12
    TabOrder = 1
  end
  object Button2: TButton
    Left = 36
    Top = 73
    Width = 351
    Height = 25
    Caption = 'PP WardID, WardDate '#50640' '#44050' '#51077#47141
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 36
    Top = 104
    Width = 351
    Height = 25
    Caption = 'InOut '#51032' intime, outdate, outtime = null'#51012' '#39#39', '#39'00:00:00'#39#51004#47196' '#48148#44984#44592
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 36
    Top = 135
    Width = 351
    Height = 25
    Caption = 'ShortKey to Keyword'
    TabOrder = 4
    OnClick = Button4Click
  end
end
