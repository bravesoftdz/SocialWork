object frmPatientEdit: TfrmPatientEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #54872#51088#51221#48372#49688#51221
  ClientHeight = 144
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 12
    Top = 12
    Width = 221
    Height = 117
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 18
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = #54872#51088#48264#54840
    end
    object Label2: TLabel
      Left = 48
      Top = 42
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = #49457#47749
    end
    object Label3: TLabel
      Left = 24
      Top = 64
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = #49373#45380#50900#51068
    end
    object Label4: TLabel
      Left = 48
      Top = 87
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = #49457#48324
    end
    object cxDEBirthday: TcxDateEdit
      Left = 78
      Top = 59
      TabOrder = 1
      Width = 121
    end
    object txtPatientName: TcxTextEdit
      Left = 78
      Top = 37
      TabOrder = 0
      Text = 'cxTextEdit1'
      Width = 121
    end
    object rMale: TRadioButton
      Left = 78
      Top = 86
      Width = 37
      Height = 17
      Caption = #45224
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object rFeMale: TRadioButton
      Left = 115
      Top = 86
      Width = 37
      Height = 17
      Caption = #50668
      TabOrder = 3
    end
    object pnlPatientID: TPanel
      Left = 78
      Top = 13
      Width = 121
      Height = 21
      BevelOuter = bvLowered
      Caption = 'pnlPatientID'
      TabOrder = 4
    end
  end
  object btnOK: TButton
    Left = 262
    Top = 27
    Width = 75
    Height = 25
    Caption = #51221#48372#49688#51221
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 262
    Top = 58
    Width = 75
    Height = 25
    Caption = #52712#49548
    ModalResult = 2
    TabOrder = 2
  end
end
