object frmKeywordSettingMgr: TfrmKeywordSettingMgr
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Setting Keyword '#47588#45768#51200
  ClientHeight = 473
  ClientWidth = 853
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline frameKeyword: TframeKeyword
    Left = 0
    Top = 0
    Width = 853
    Height = 473
    Align = alClient
    Padding.Left = 15
    Padding.Top = 70
    Padding.Right = 15
    Padding.Bottom = 15
    TabOrder = 0
    ExplicitLeft = -12
    ExplicitTop = 62
    inherited cxKeywordTree: TcxDBTreeList
      Height = 388
      ExplicitLeft = 15
    end
    inherited Panel1: TPanel
      Height = 388
      inherited cxDBMemo1: TcxDBMemo
        ExplicitWidth = 417
        ExplicitHeight = 365
        Height = 388
      end
    end
    inherited adoKeyword: TADOQuery
      Active = False
    end
  end
end
