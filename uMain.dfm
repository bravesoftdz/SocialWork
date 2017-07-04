object frmMain: TfrmMain
  Left = 0
  Top = 0
  ClientHeight = 506
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Padding.Left = 3
  Padding.Top = 5
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPage: TcxPageControl
    Left = 3
    Top = 5
    Width = 795
    Height = 501
    Align = alClient
    TabOrder = 0
    Properties.CloseButtonMode = cbmActiveTab
    Properties.CustomButtons.Buttons = <>
    Properties.NavigatorPosition = npRightBottom
    Properties.ShowFrame = True
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 494
    ClientRectLeft = 4
    ClientRectRight = 788
    ClientRectTop = 4
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 646
    Top = 36
  end
  object MainMenu1: TMainMenu
    Left = 576
    Top = 148
    object N1: TMenuItem
      Caption = #54028#51068'(&F)'
      object N2: TMenuItem
        Action = actClose
      end
    end
    object mTherapy: TMenuItem
      Action = actTherapyMgr
    end
    object mRecord: TMenuItem
      Action = actRecord
    end
    object N4: TMenuItem
      Action = actOverNightMgr
    end
    object N5: TMenuItem
      Action = actStatistics
    end
    object mDoctor: TMenuItem
      Caption = 'Doctor(&D)'
    end
    object mPatientInOutInfo: TMenuItem
      Action = actPatientMgr
    end
    object mSetting: TMenuItem
      Action = actSetting
    end
    object N3: TMenuItem
      Caption = #50516#54840#48320#44221
      OnClick = N3Click
    end
  end
  object ActionList1: TActionList
    Left = 546
    Top = 222
    object actClose: TAction
      Caption = #45803#44592
      OnExecute = actCloseExecute
    end
    object actTherapyMgr: TAction
      Caption = #51221#49888#52824#47308#44288#47532
      OnExecute = actTherapyMgrExecute
    end
    object actRatingMgr: TAction
      Caption = #44060#48324#54217#44032#44288#47532
    end
    object actRecord: TAction
      Caption = #44592#47197#51648#44288#47532
      OnExecute = actRecordExecute
    end
    object actSocialWorkGuide: TAction
      Caption = #49324#54924#49324#50629#51648#46020
    end
    object actPatientMgr: TAction
      Caption = #54872#51088' '#48143' '#51077'/'#53748#50896' '#44288#47532
      OnExecute = actPatientMgrExecute
    end
    object actSetting: TAction
      Caption = #51068#48152#44288#47532
      OnExecute = actSettingExecute
    end
    object actOverNightMgr: TAction
      Caption = #50808#48149'/'#50808#52636', CR'#44288#47532
      OnExecute = actOverNightMgrExecute
    end
    object actStatistics: TAction
      Caption = #53685#44228
      OnExecute = actStatisticsExecute
    end
  end
  object dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList
    Left = 320
    Top = 30
    object dxLayoutSkinLookAndFeel: TdxLayoutSkinLookAndFeel
      LookAndFeel.SkinName = 'Caramel'
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 316
    Top = 116
    PixelsPerInch = 96
    object cxStyleReadOnly: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Caramel'
    Left = 90
    Top = 58
  end
end
