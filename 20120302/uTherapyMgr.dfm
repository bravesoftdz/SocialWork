object frmTherapyMgr: TfrmTherapyMgr
  Left = 0
  Top = 0
  Caption = #51221#49888#52824#47308#44288#47532
  ClientHeight = 691
  ClientWidth = 1174
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Bottom = 5
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPage: TcxPageControl
    Left = 0
    Top = 81
    Width = 1174
    Height = 605
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabViewSchedule
    Properties.TabPosition = tpBottom
    ClientRectBottom = 576
    ClientRectLeft = 3
    ClientRectRight = 1168
    ClientRectTop = 3
    object cxTabViewTable: TcxTabSheet
      Caption = #53580#51060#48660#48372#44592
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 1165
        Height = 573
        Align = alClient
        TabOrder = 0
        object cxGInOut: TcxGridDBTableView
          OnCellDblClick = cxGInOutCellDblClick
          DataController.DataSource = dsScheduler
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Inactive = dbMain.cxSelection
          object cxGInOutProgramName: TcxGridDBColumn
            Caption = #54532#47196#44536#47016
            DataBinding.FieldName = 'ProgramName'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 181
          end
          object cxGInOutContent: TcxGridDBColumn
            Caption = #45236#50857
            DataBinding.FieldName = 'Content'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 179
          end
          object cxGInOutSDate: TcxGridDBColumn
            Caption = #51068#51088
            DataBinding.FieldName = 'SDate'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
          end
          object cxGInOutSTime: TcxGridDBColumn
            Caption = #49884#51089#49884#44036
            DataBinding.FieldName = 'STime'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
          end
          object cxGInOutFTime: TcxGridDBColumn
            Caption = #51333#47308#49884#44036
            DataBinding.FieldName = 'FTime'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
          end
          object cxGInOutChairmanIDs: TcxGridDBColumn
            Caption = #51652#54665#51088
            DataBinding.FieldName = 'ChairmanNames'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 198
          end
          object cxGInOutWorkerName: TcxGridDBColumn
            Caption = #49324#54924#48373#51648#49324
            DataBinding.FieldName = 'WorkerName'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 78
          end
          object cxGInOutDoctorName: TcxGridDBColumn
            Caption = #51204#47928#51032
            DataBinding.FieldName = 'DoctorName'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 78
          end
        end
        object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end>
        end
        object cxGrid1DBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGInOut
        end
      end
    end
    object cxTabViewSchedule: TcxTabSheet
      Caption = #51068#51221#48372#44592
      ImageIndex = 1
      object cxScheduler: TcxScheduler
        Left = 0
        Top = 0
        Width = 1165
        Height = 573
        DateNavigator.RowCount = 2
        DateNavigator.ShowDatesContainingHolidaysInColor = True
        DateNavigator.OnSelectionChanged = cxSchedulerDateNavigatorSelectionChanged
        ViewDay.Active = True
        Align = alClient
        ContentPopupMenu.UseBuiltInPopupMenu = False
        ControlBox.Control = cxGroupViewType
        EventOperations.Deleting = False
        EventOperations.InplaceEditing = False
        EventOperations.Intersection = False
        EventOperations.MovingBetweenResources = False
        EventOperations.Moving = False
        EventOperations.Recurrence = False
        EventPopupMenu.UseBuiltInPopupMenu = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        OptionsView.StartOfWeek = swMonday
        OptionsView.WorkDays = [dMonday, dTuesday, dWednesday, dThursday, dFriday, dSaturday]
        OptionsView.WorkStart = 0.354166666666666700
        OptionsView.WorkFinish = 0.750000000000000000
        Storage = cxSchedulerDBStorage1
        TabOrder = 0
        OnBeforeEditing = cxSchedulerBeforeEditing
        Selection = 1
        Splitters = {
          FD030000FB0000008C04000000010000F803000001000000FD0300003C020000}
        StoredClientBounds = {01000000010000008C0400003C020000}
        object cxGroupViewType: TcxGroupBox
          Left = 0
          Top = 0
          Align = alClient
          Alignment = alTopCenter
          Caption = 'View Type'
          TabOrder = 0
          Height = 316
          Width = 143
          object rSelectDateDay: TcxRadioButton
            Left = 12
            Top = 27
            Width = 57
            Height = 17
            Caption = 'Day'
            TabOrder = 0
            OnClick = rSelectDateDayClick
            Transparent = True
          end
          object rSelectDateWeek: TcxRadioButton
            Left = 12
            Top = 48
            Width = 51
            Height = 17
            Caption = 'Week'
            TabOrder = 1
            OnClick = rSelectDateDayClick
            Transparent = True
          end
          object rSelectDateMonth: TcxRadioButton
            Left = 12
            Top = 90
            Width = 55
            Height = 17
            Caption = 'Month'
            TabOrder = 3
            OnClick = rSelectDateDayClick
            Transparent = True
          end
          object rSelectDateWeekTime: TcxRadioButton
            Left = 12
            Top = 69
            Width = 91
            Height = 17
            Caption = 'Week ( Time )'
            Checked = True
            TabOrder = 2
            TabStop = True
            OnClick = rSelectDateDayClick
            Transparent = True
          end
        end
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Alignment = alTopCenter
    Caption = #44160#49353#51312#44148
    TabOrder = 1
    Height = 81
    Width = 1174
    object cboWard: TcxComboBox
      Left = 176
      Top = 21
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 20
      Properties.OnChange = cboWardPropertiesChange
      Style.Color = 15782908
      TabOrder = 0
      Width = 121
    end
    object cxLabel1: TcxLabel
      Left = 148
      Top = 23
      Caption = #48337#46041
      Properties.Alignment.Horz = taRightJustify
      Transparent = True
      AnchorX = 176
    end
    object cboProgram: TcxComboBox
      Left = 356
      Top = 21
      Properties.DropDownListStyle = lsEditFixedList
      Properties.DropDownRows = 20
      Properties.OnChange = cboProgramPropertiesChange
      Style.Color = 15782908
      TabOrder = 2
      Width = 225
    end
    object cxLabel2: TcxLabel
      Left = 304
      Top = 23
      Caption = #54532#47196#44536#47016
      Properties.Alignment.Horz = taRightJustify
      Transparent = True
      AnchorX = 356
    end
    object cboChairman: TcxComboBox
      Left = 177
      Top = 46
      Properties.DropDownListStyle = lsEditFixedList
      Properties.OnChange = cboChairmanPropertiesChange
      Style.Color = 15782908
      TabOrder = 4
      Width = 121
    end
    object cxLabel3: TcxLabel
      Left = 135
      Top = 48
      Caption = #51652#54665#51088
      Properties.Alignment.Horz = taRightJustify
      Transparent = True
      AnchorX = 175
    end
    object txtContent: TcxTextEdit
      Left = 356
      Top = 46
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 6
      Width = 225
    end
    object cxLabel4: TcxLabel
      Left = 322
      Top = 48
      Caption = #45236#50857
      Properties.Alignment.Horz = taRightJustify
      Transparent = True
      AnchorX = 350
    end
    object btnSearch: TcxButton
      Left = 587
      Top = 45
      Width = 67
      Height = 24
      Caption = #44160#49353
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000442F005F3827004F00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000002D1F003FB67E00FFB67E00FF2D1F003F000000000000
        000000000000000000005B4D2E6EB38D37E6B67E01FFB67E01FFBB8A1DFBAC89
        3ADB302A1A3A0B07000F9F6E00DFB67E00FF9F6E00DF22180030000000000000
        000018150E1DB38D37E6BA8611FFD2B36BFFEADFC4FFEDE3CDFFDDC693FFC59A
        39FFB78004FFA87D1BE2B67E00FF7D5600AF0B08001000000000000000000000
        0000B38D37E6C19229FFEEE5D1FFF8F8F8FFF8F7F5FFF7F5EEFFF7F6EFFFF7F6
        F3FFE5D5B0FFBB8713FFA37D27D6000000000000000000000000000000005B4E
        2F6EBD8A19FFF2EDE2FFF8F8F8FFF7F5EEFFF6F1DFFFF5EFD6FFF5EFD6FFF6F1
        E0FFF7F6EFFFE5D5B0FFB77F03FF302A1A3A000000000000000000000000B28C
        37E5D5B673FFF8F8F8FFF8F7F5FFF6F1DFFFF4ECCBFFF3E8BEFFF3E9BFFFF4EC
        CCFFF6F1E0FFF7F6F3FFC59A39FFAB893BDA000000000000000000000000B77F
        03FFEDE3CEFFF8F8F8FFF7F5EEFFF5EFD5FFF3E8BEFFF1E3A8FFF1E3A9FFF3E9
        BFFFF5EFD6FFF7F6EFFFDDC794FFBB8A1DFB000000000000000000000000B77F
        03FFF2EDE1FFF8F8F8FFF7F5EEFFF5EFD5FFF3E8BDFFF1E2A8FFF1E3A8FFF3E8
        BEFFF5EFD6FFF7F5EEFFEDE3CEFFB67E01FF000000000000000000000000BB8B
        1FFBE5D4AFFFF8F8F8FFF8F7F5FFF6F1DFFFF4ECCBFFF3E8BDFFF3E8BEFFF4EC
        CBFFF6F1DFFFF8F7F5FFE7D9BAFFB67E01FF000000000000000000000000AC89
        3CDACDA855FFF8F8F8FFF8F8F8FFF7F5EEFFF6F1DFFFF5EFD5FFF5EFD5FFF6F1
        DFFFF7F5EEFFF8F8F8FFD0AF63FFB38C35E6000000000000000000000000322B
        1B3CB9840DFFECE2CAFFF8F8F8FFF8F8F8FFF8F7F5FFF7F5EEFFF7F5EEFFF8F7
        F5FFF8F8F8FFEEE5D1FFBA8610FF5C4F2F700000000000000000000000000000
        0000997D3FBFBE8D1EFFEBE0C6FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8F8FFF8F8
        F8FFF3EFE6FFC69B3AFFB38D37E6000000000000000000000000000000000000
        000000000000997D3FBFBB8813FFCDA958FFE7D9B9FFF3EEE4FFECE2CAFFD6B9
        79FFBA8611FFB38C35E619160F1E000000000000000000000000000000000000
        00000000000000000000322B1B3CAC893ADBBB8B1FFBB77F02FFB77F02FFB38D
        37E65C4F2F700000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      LookAndFeel.SkinName = 'Caramel'
      SpeedButtonOptions.Transparent = True
      TabOrder = 8
      OnClick = btnSearchClick
    end
    object lblBasicYear: TcxLabel
      Left = 13
      Top = 23
      Caption = #51089#50629#45380#46020
      Transparent = True
    end
    object btnScheduleAppend: TcxButton
      Left = 689
      Top = 23
      Width = 80
      Height = 46
      Caption = #51068#51221#52628#44032
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000004800FF004200FF004400FF004900FF00000000000000005E5349FF3F33
        28FF403428FF000000003E3327FF403428FF3E3327FFB0ABA6FFFFFFFFFFFFFF
        FFFF005D00FF00FFFFFF1DBA2FFF005D00FFFFFFFFFFFFFFFFFF72675FFFFFFF
        FFFFFFFFFFFFB2AAA1FFB2AAA1FFFFFFFFFFFFFFFFFFFFFFFFFF004800FF0040
        00FF005D00FF3ED550FF1BB532FF005D00FF004400FF004900FF71665DFFFFFF
        FFFFF7F0EAFF8B8178FF8B8178FFF7F1EBFFF2EBE5FFFFFFFFFF005D00FF00FF
        FFFF11A103FF0EA20EFF0EA618FF0FAA1BFF11AE17FF005D00FF746960FFFFFF
        FFFFF4EDE8FFF9F4EEFFF9F4EEFFF4EFE9FFF3EEE8FFFFFFFFFF005D00FF00FF
        FFFF00FFFFFF00FFFFFF1BAF28FF23BA27FF00FFFFFF005D00FF776D63FFFFFF
        FFFFFFFEFAFFFFFFFBFFFFFFFBFFFFFFFBFFFFFFFBFFFFFFFFFF005D00FF005D
        00FF005D00FF00FFFFFF1EAD1CFF005D00FF005D00FF005D00FF7C7066FFFFFF
        FFFFFFF8EAFFFFF8ECFFFFF8ECFFFFF8ECFFFFF8ECFFFFFCF7FFFFFFFFFFFFFF
        FFFF005D00FF00FFFFFF00FFFFFF005D00FFFFFFFFFFFFFFFFFF7F7369FFFFFF
        FFFFFFF2DEFFFFF3E0FFFFF3E0FFFFF3E0FFFFF3E0FFFFF3DFFFF7F6F3FFFFFF
        FFFF005D00FF005D00FF005D00FF005D00FFFFFFFFFF7F7369FF82776DFFFFFF
        FFFFFFEDD0FFFFEED3FFFFEED3FFFFEED3FFFFEED3FFFFEDD1FFF9F8F6FFFDFD
        FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF82776DFF857A6FFFFFFF
        FFFFFFE7C3FFFFE9C7FFFFE9C7FFFFE9C7FFFFE9C7FFFFE8C3FFFAF9F9FFECE5
        DDFFECE6DEFFECE6DEFFECE6DEFFEBE4DCFFFFFFFFFF857A6FFF897E72FFFFFF
        FFFFFFE0B0FFFFE2B4FFFFE2B4FFFFE2B4FFFFE2B4FFFFE0B0FFFBFAFBFFFBFA
        F8FFFCFAF8FFFCFAF8FFFCFAF8FFFBF9F7FFFFFFFFFF897E72FF8D8175FFFFFF
        FFFFFFFFFCFFFFFFFDFFFFFFFDFFFFFFFDFFFFFFFDFFFFFFFCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8377FF908478FFFFFF
        FFFF0029FFFF0034FFFF0034FFFF0034FFFF0034FFFF0029FFFFFFFFFFFF8A7D
        70FF908478FF908478FF908478FF908478FF92867AFF978B80FF93887AFFFFFF
        FFFF1F55FFFF2C5FFFFF2C5FFFFF2C5FFFFF2C5FFFFF1F55FFFFFFFFFFFF9388
        7BFF000000000000000000000000000000000000000000000000988C7FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF988C
        7FFF000000000000000000000000000000000000000000000000A09588FF9B90
        83FF9A8E81FF9A8E81FF9A8E81FF9A8E81FF9A8E81FF9A8E81FF9B9083FFA095
        88FF000000000000000000000000000000000000000000000000}
      Layout = blGlyphTop
      LookAndFeel.SkinName = 'Caramel'
      SpeedButtonOptions.Transparent = True
      TabOrder = 10
      OnClick = btnScheduleAppendClick
    end
    object btnScheduleUpdate: TcxButton
      Left = 773
      Top = 23
      Width = 80
      Height = 46
      Caption = #51068#51221#49688#51221
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000FFFFFFFF3F3328FF005F93FFFFFFFFFFFFFF
        FFFFFFFFFFFF00000000000000000000000000000000000000005E5349FF3F33
        28FF403428FF000000003E3327FFFFFFFFFF005F93FFE7FAFFFF003A5DFF003A
        5DFFFFFFFFFFB2ADA9FF00000000403428FF3F3328FF5F534AFF72675FFFFFFF
        FFFFFFFFFFFFB2AAA1FFB2AAA1FFFFFFFFFF005F93FFE7FAFFFFD0F9FFFF52CB
        FFFFA13400FFFFFFFFFFDFDCD8FFFFFFFFFFFFFFFFFF72675FFF71665DFFFFFF
        FFFFF7F0EAFF8B8178FF8B8178FFFCF9F7FFFFFFFFFF005F93FF52CBFFFFE294
        31FFFF9D00FFA13400FFFFFFFFFFFCF9F6FFFFFFFFFF71665DFF746960FFFFFF
        FFFFF4EDE8FFF9F4EEFFF9F4EEFFF4EFE9FFFFFFFFFF005F93FFF4D7A5FFFFFA
        D1FFE29431FFFF9D00FFA13400FFFFFFFFFFFFFFFFFF746960FF776D63FFFFFF
        FFFFFFFEFAFFFFFFFBFFFFFFFBFFFFFFFBFFFFFFFDFFFFFFFFFFD56B03FFF4D7
        A5FFFFFAD1FFE29431FFFF9D00FFA13400FFFFFFFFFFC7C3BFFF7C7066FFFFFF
        FFFFFFF8EAFFFFF8ECFFFFF8ECFFFFF8ECFFFFF8ECFFFFFCF7FFFFFFFFFFD069
        06FFF4D7A5FFFFFAD1FFE29431FFFF9D00FFA13400FFFFFFFFFF7F7369FFFFFF
        FFFFFFF2DEFFFFF3E0FFFFF3E0FFFFF3E0FFFFF3E0FFFFF3DFFFFCFBFAFFFFFF
        FFFFCC6908FFF4D7A5FFFFFAD1FFE29431FF0024F6FF0015C8FF82776DFFFFFF
        FFFFFFEDD0FFFFEED3FFFFEED3FFFFEED3FFFFEED3FFFFEDD1FFF9F8F6FFFDFD
        FBFFFFFFFFFFCD6C0CFFF4D7A5FFFFFFFFFF0024F6FF0015C8FF857A6FFFFFFF
        FFFFFFE7C3FFFFE9C7FFFFE9C7FFFFE9C7FFFFE9C7FFFFE8C3FFFAF9F9FFECE5
        DDFFF7F5F1FFFFFFFFFFCD6C0CFF0024F6FFFFCCFFFF153ACFFF897E72FFFFFF
        FFFFFFE0B0FFFFE2B4FFFFE2B4FFFFE2B4FFFFE2B4FFFFE0B0FFFBFAFBFFFBFA
        F8FFFCFAF8FFFEFDFCFFFFFFFFFF0B32CDFF0013C5FFFFFFFFFF8D8175FFFFFF
        FFFFFFFFFCFFFFFFFDFFFFFFFDFFFFFFFDFFFFFFFDFFFFFFFCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1CCC7FF908478FFFFFF
        FFFF0029FFFF0034FFFF0034FFFF0034FFFF0034FFFF0029FFFFFFFFFFFF8A7D
        70FF908478FF908478FF908478FF908478FF92867AFF978B80FF93887AFFFFFF
        FFFF1F55FFFF2C5FFFFF2C5FFFFF2C5FFFFF2C5FFFFF1F55FFFFFFFFFFFF9388
        7BFF000000000000000000000000000000000000000000000000988C7FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF988C
        7FFF000000000000000000000000000000000000000000000000A09588FF9B90
        83FF9A8E81FF9A8E81FF9A8E81FF9A8E81FF9A8E81FF9A8E81FF9B9083FFA095
        88FF000000000000000000000000000000000000000000000000}
      Layout = blGlyphTop
      LookAndFeel.SkinName = 'Caramel'
      SpeedButtonOptions.Transparent = True
      TabOrder = 11
      OnClick = btnScheduleUpdateClick
    end
    object btnRatingMgr: TcxButton
      Left = 877
      Top = 23
      Width = 80
      Height = 46
      Caption = #44060#48324#54217#44032#44288#47532
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000001010
        11183A3A3B5A47484A6F4F50557D5857568959564F895B564C8A5B574C8A5A59
        538955524B894F483E7E4444466B353638520909090D00000000000000000101
        01014742356E9A8350E5B68E3CFFBC9038FFBF943EFFC19741FFBF933DFFA15F
        07FF9D5700FF9D5500FF9B5700FF634D319E0000000000000000000000005541
        1575AF8731FFB58C38FFBB9242FFC19848FFC59C4CFFCCA353FFA56512FFA763
        0DFFBE8231FFEFDDC2FFA45D05FFA46008FF2F1B014700000000000000005341
        1A71B28A39FFB99140FFBF9746FFC69C4CFFCDA252FFC69645FFAE6610FFB46D
        16FFC6893BFFEFDBC1FFB1670AFFB06C16FF824F0DBA00000000000000000303
        0106B89140FBB89140FFC29949FFCA9F4FFFD0A656FFCB9847FFB86D16FFC177
        1EFFCD893AFFEED8BEFFBD7013FFBA721AFF9A5F17CD00000000000000000000
        00001511081CB18F49E3C09848FFC69B4AFFD3A85AFFE9BE73FFC4771CFFCC7E
        24FFD18731FFDEB27FFFCB7A1EFFC0761BFF79501F9100000000000000000000
        0000000000000000000068542A7DEFC67DFFFFDCA2FFE6DDC7FFD8B588FFD981
        1EFFDE892BFFD9882CFFD28125FFCE8C3DF20704020900000000000000000000
        00000000000000000000000000000909070BB0D2F4F5B5D7F6FFB5DDFFFFAAA2
        95D4BE813CC1D29247D8946936980805020A0000000000000000000000000000
        00000000000000000000000000000000000061748282D5E6F6FFD3E6F7FF313B
        4242000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000BFCFDCDCD4E6F6FFD4E6F6FFB4C3
        CFCF000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000031394147C0DCF5FFBDD8F2FFBDD8F2FFC4E2
        FBFF1E2228420000000000000000000000000000000000000000000000000000
        0000000000000000000000000000647C97C5ACD3F2FFA7CEEEFFA8CEEEFFB2DB
        FBFF445369D60000000000000000000000000000000000000000000000000000
        00000000000000000000010102076586ADFF9BCCF6FF98C8F3FF96C7F3FF89B3
        DEFF2B354DFF0202030E00000000000000000000000000000000000000000000
        00000000000000000000030406192D3F60FF668BB6FF4F6A8FFF222940FF222A
        40FF2B364DFF0405082400000000000000000000000000000000000000000000
        000000000000000000000000000029384EC2232C42FF27334BFF2A3750FF2A37
        51FF2D374DE50000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000191D26742B374ACD2E3A4EDB2027
        338D010101040000000000000000000000000000000000000000}
      Layout = blGlyphTop
      LookAndFeel.SkinName = 'Caramel'
      SpeedButtonOptions.Transparent = True
      TabOrder = 12
      OnClick = btnRatingMgrClick
    end
    object cxSpinBasicYear: TcxSpinEdit
      Left = 65
      Top = 21
      Properties.CanEdit = False
      Properties.MinValue = 2000.000000000000000000
      Properties.OnChange = cxspinBasicYearPropertiesChange
      Style.Color = 15782908
      TabOrder = 13
      Value = 2000
      Width = 63
    end
  end
  object dsScheduler: TDataSource
    DataSet = adoSchedule
    Left = 248
    Top = 144
  end
  object cxSchedulerDBStorage1: TcxSchedulerDBStorage
    Resources.Items = <>
    CustomFields = <>
    DataSource = dsScheduler
    FieldNames.Caption = 'ProgramName'
    FieldNames.EventType = 'EventType'
    FieldNames.Finish = 'FinishTime'
    FieldNames.ID = 'ScheduleID'
    FieldNames.LabelColor = 'LabelColor'
    FieldNames.Message = 'Content'
    FieldNames.Options = 'Options'
    FieldNames.Start = 'StartTime'
    FieldNames.State = 'State'
    Left = 168
    Top = 260
  end
  object adoSchedule: TADOQuery
    Connection = dbMain.adoSocialWorkDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *'
      '       ,Programs.Color as LabelColor'
      
        '       ,(select UserName from Users where Users.UserID = Schedul' +
        'e.WorkerID) as WorkerName'
      
        '       ,(select UserName from Users where Users.UserID = Schedul' +
        'e.DoctorID) as DoctorName'
      
        '       ,(select ProgramName from Programs where Programs.Program' +
        'ID = Schedule.ProgramID) as ProgramName'
      
        '       ,(select Color from Programs where Programs.ProgramID = S' +
        'chedule.ProgramID) as Color'
      '  from Schedule, programs'
      ' where Schedule.ProgramID = Programs.ProgramID'
      '')
    Left = 164
    Top = 142
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 386
    Top = 216
  end
  object Timer2: TTimer
    Left = 516
    Top = 216
  end
end
