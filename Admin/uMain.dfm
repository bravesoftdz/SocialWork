object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #49324#54924#49324#50629#49892' '#44288#47532#51088#54168#51060#51648
  ClientHeight = 446
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 22
    Top = 14
    Width = 411
    Height = 107
    Caption = #49436#48260#51221#48372
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 22
      Width = 62
      Height = 13
      Caption = 'Server Name'
    end
    object Label2: TLabel
      Left = 46
      Top = 51
      Width = 36
      Height = 13
      Caption = 'User ID'
    end
    object Label3: TLabel
      Left = 36
      Top = 76
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object txtServerName: TEdit
      Left = 88
      Top = 19
      Width = 215
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 0
      Text = 'rhocs'
    end
    object txtUserID: TEdit
      Left = 88
      Top = 46
      Width = 215
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 1
      Text = 'socialworker'
    end
    object txtPassword: TEdit
      Left = 88
      Top = 73
      Width = 215
      Height = 21
      ImeName = 'Microsoft Office IME 2007'
      PasswordChar = '*'
      TabOrder = 2
      Text = 'rh119'
    end
    object btnConnect: TButton
      Left = 314
      Top = 19
      Width = 75
      Height = 48
      Caption = 'Connect'
      TabOrder = 3
      OnClick = btnConnectClick
    end
    object btnDisconnect: TButton
      Left = 314
      Top = 69
      Width = 75
      Height = 25
      Caption = 'Disconnect'
      Enabled = False
      TabOrder = 4
    end
  end
  object Encryption: TRHEncryption
    Left = 452
    Top = 18
  end
end
