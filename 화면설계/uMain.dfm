object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #49324#54924#49324#50629#49892' '#54868#47732#44396#49457
  ClientHeight = 709
  ClientWidth = 929
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 640
    Width = 929
    Height = 69
    Align = alBottom
    TabOrder = 0
    object BitBtn2: TBitBtn
      Left = 117
      Top = 8
      Width = 103
      Height = 45
      Caption = #49324#50857#51088#44288#47532
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object BitBtn11: TBitBtn
      Left = 226
      Top = 8
      Width = 103
      Height = 45
      Caption = #54872#51088#44288#47532
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 103
      Height = 45
      Caption = #48337#46041#44288#47532
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
    end
  end
  object cxS: TcxScheduler
    Left = 134
    Top = 14
    Width = 795
    Height = 491
    DateNavigator.RowCount = 2
    ViewDay.Active = True
    ContentPopupMenu.PopupMenu = PopupMenu1
    EventOperations.Deleting = False
    EventOperations.InplaceEditing = False
    EventOperations.Intersection = False
    EventOperations.MovingBetweenResources = False
    EventOperations.Moving = False
    EventOperations.Recurrence = False
    EventOperations.Sizing = False
    EventPopupMenu.PopupMenu = PopupMenu2
    EventPopupMenu.UseBuiltInPopupMenu = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    OptionsView.WorkFinish = 0.750000000000000000
    Storage = cxSchedulerDBStorage
    TabOrder = 1
    OnBeforeEditing = cxSBeforeEditing
    Selection = 6
    Splitters = {
      8B020000FB0000001A0300000001000086020000010000008B020000EA010000}
    StoredClientBounds = {01000000010000001A030000EA010000}
  end
  object Button1: TButton
    Left = 544
    Top = 130
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object cxGrid1: TcxGrid
    Left = 26
    Top = 406
    Width = 621
    Height = 199
    TabOrder = 3
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1ID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
      end
      object cxGrid1DBTableView1Caption: TcxGridDBColumn
        DataBinding.FieldName = 'Caption'
      end
      object cxGrid1DBTableView1StartTime: TcxGridDBColumn
        DataBinding.FieldName = 'StartTime'
      end
      object cxGrid1DBTableView1EndTime: TcxGridDBColumn
        DataBinding.FieldName = 'EndTime'
      end
      object cxGrid1DBTableView1Test: TcxGridDBColumn
        DataBinding.FieldName = 'Test'
      end
      object cxGrid1DBTableView1EventType: TcxGridDBColumn
        DataBinding.FieldName = 'EventType'
      end
      object cxGrid1DBTableView1Options: TcxGridDBColumn
        DataBinding.FieldName = 'Options'
      end
      object cxGrid1DBTableView1Message: TcxGridDBColumn
        DataBinding.FieldName = 'Message'
      end
      object cxGrid1DBTableView1LabelColor: TcxGridDBColumn
        DataBinding.FieldName = 'LabelColor'
      end
      object cxGrid1DBTableView1State: TcxGridDBColumn
        DataBinding.FieldName = 'State'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Button2: TButton
    Left = 534
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 4
    OnClick = Button2Click
  end
  object MainMenu1: TMainMenu
    Left = 784
    Top = 94
    object N1: TMenuItem
      Caption = #51333#47308
    end
    object N2: TMenuItem
      Caption = #44288#47532
      object N5: TMenuItem
        Caption = #48337#46041#44288#47532
      end
      object N4: TMenuItem
        Caption = #49324#50857#51088#44288#47532
      end
      object N6: TMenuItem
        Caption = #54872#51088#44288#47532
        object N7: TMenuItem
          Caption = #51077#50896#46321#47197
        end
        object N8: TMenuItem
          Caption = #48337#46041#48320#44221
        end
        object N9: TMenuItem
          Caption = #53748#50896#49444#51221
        end
        object N10: TMenuItem
          Caption = #45236#50669#48372#44592
        end
      end
    end
    object N11: TMenuItem
      Caption = #51068#48152#44592#47197#51648
      object Intake1: TMenuItem
        Caption = 'Intake'
      end
      object I1: TMenuItem
        Caption = #49324#54924#49324#50629#44592#47197#51648' I'
      end
      object II1: TMenuItem
        Caption = #49324#54924#49324#50629#44592#47197#51648' II'
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object N17: TMenuItem
        Caption = #49324#54924#49324#50629#51648#46020
      end
      object N18: TMenuItem
        Caption = #49324#54924#51116#54876#54984#47144
      end
    end
    object N12: TMenuItem
      Caption = #54532#47196#44536#47016#44288#47532
      object N13: TMenuItem
        Caption = #54532#47196#44536#47016#46321#47197'/'#49688#51221
      end
      object N14: TMenuItem
        Caption = #49828#52992#51572#44288#47532
      end
    end
    object N3: TMenuItem
      Caption = #50516#54840#49688#51221
    end
    object N15: TMenuItem
      Caption = #44288#47532#51088
      object N19: TMenuItem
        Caption = #49324#50857#51088#44288#47532
      end
      object N26: TMenuItem
        Caption = #51204#47928#51032#51221#48372
      end
      object N27: TMenuItem
        Caption = #54532#47196#44536#47016#44288#47532
      end
      object N28: TMenuItem
        Caption = #51109#49548#44288#47532
      end
      object N20: TMenuItem
        Caption = #50741#49496'...'
      end
    end
    object Supervisor1: TMenuItem
      Caption = 'Supervisor'
      object N22: TMenuItem
        Caption = #48337#50896#46321#47197
      end
      object N24: TMenuItem
        Caption = #48337#50896#44288#47532#51088#44288#47532
      end
      object N23: TMenuItem
        Caption = #54532#47196#44536#47016#48260#51204#44288#47532
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 782
    Top = 36
  end
  object cxSchedulerDBStorage: TcxSchedulerDBStorage
    Resources.Items = <>
    CustomFields = <
      item
        FieldName = 'Test'
      end>
    Holidays = cxSchedulerHolidays1
    DataSource = DataSource1
    FieldNames.Caption = 'Caption'
    FieldNames.EventType = 'EventType'
    FieldNames.Finish = 'EndTime'
    FieldNames.ID = 'ID'
    FieldNames.LabelColor = 'LabelColor'
    FieldNames.Message = 'Message'
    FieldNames.Options = 'Options'
    FieldNames.Start = 'StartTime'
    FieldNames.State = 'State'
    Left = 200
    Top = 128
  end
  object cxSchedulerHolidays1: TcxSchedulerHolidays
    Locations = <
      item
        Name = #53580#49828#53944'1'
        Visible = True
        Holidays = <
          item
            Date = 40728.000000000000000000
            Name = #48373#49709#50500#51208
          end
          item
            Date = 40729.000000000000000000
            Name = #51088#46160#51208
          end>
      end>
    Left = 198
    Top = 202
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=rh119;Persist Security Info=True;Us' +
      'er ID=sa;Initial Catalog=Schedule;Data Source=rhocs'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 114
    Top = 28
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'TestS'
    Left = 190
    Top = 26
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 266
    Top = 32
  end
  object PopupMenu1: TPopupMenu
    Left = 424
    Top = 88
    object N21: TMenuItem
      Caption = #51068#51221#51077#47141
    end
    object oday1: TMenuItem
      Caption = #50724#45720' '#45216#51088#47196' '#51060#46041
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 408
    Top = 244
    object MenuItem1: TMenuItem
      Caption = 'delete'
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = #50724#45720' '#45216#51088#47196' '#51060#46041
    end
  end
end
