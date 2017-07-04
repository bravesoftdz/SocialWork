object frmOverNightMgr: TfrmOverNightMgr
  Left = 0
  Top = 0
  Caption = #50808#52636'/'#50808#48149', CR '#44288#47532
  ClientHeight = 670
  ClientWidth = 1213
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 551
    Height = 670
    Align = alLeft
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 4
      Top = 459
      Width = 543
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitLeft = 12
      ExplicitTop = 547
    end
    object cxGroupBox6: TcxGroupBox
      Left = 4
      Top = 61
      Align = alClient
      Caption = #54872#51088#47532#49828#53944
      ParentBackground = False
      ParentColor = False
      Style.Color = clBtnFace
      TabOrder = 0
      Height = 398
      Width = 543
      object cxGrid2: TcxGrid
        Left = 3
        Top = 15
        Width = 537
        Height = 373
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 18
        ExplicitWidth = 539
        ExplicitHeight = 378
        object cxGInOut: TcxGridDBTableView
          DataController.DataSource = dsInOut
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Inactive = dbMain.cxSelection
          object cxGInOutPatientID: TcxGridDBColumn
            Caption = #54872#51088#48264#54840
            DataBinding.FieldName = 'PatientID'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Width = 62
          end
          object cxGInOutPatientName: TcxGridDBColumn
            Caption = #54872#51088#49457#47749
            DataBinding.FieldName = 'PatientName'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Width = 59
          end
          object cxGInOutSex: TcxGridDBColumn
            Caption = #49457#48324
            DataBinding.FieldName = 'SEX'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 29
          end
          object cxGInOutBirthday: TcxGridDBColumn
            Caption = #49373#45380#50900#51068
            DataBinding.FieldName = 'BIRTHDAY'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
          end
          object cxGInOutWardName: TcxGridDBColumn
            Caption = #48337#46041
            DataBinding.FieldName = 'WardName'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 122
          end
          object cxGInOutStateName: TcxGridDBColumn
            Caption = #49345#53468
            DataBinding.FieldName = 'StateName'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 34
          end
          object cxGInOutInDate: TcxGridDBColumn
            Caption = #51077#50896#51068#51088
            DataBinding.FieldName = 'InDate'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
          end
          object cxGInOutOutDate: TcxGridDBColumn
            Caption = #53748#50896#51068#51088
            DataBinding.FieldName = 'OutDate'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
          end
        end
        object cxGridDBBandedTableView1: TcxGridDBBandedTableView
          DataController.DataSource = dsInOut
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end>
        end
        object cxGridDBTableView2: TcxGridDBTableView
          DataController.DataSource = dsInOut
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGInOut
        end
      end
    end
    object Panel2: TPanel
      Left = 4
      Top = 4
      Width = 543
      Height = 57
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 1
      object Label2: TLabel
        Left = 253
        Top = 21
        Width = 24
        Height = 13
        Caption = #44160#49353
      end
      object cxGroupBox5: TcxGroupBox
        Left = 136
        Top = 7
        Caption = #44160#49353'/'#51221#47148#49692#49436
        ParentBackground = False
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 0
        Height = 44
        Width = 105
        object cboOrder: TcxComboBox
          Left = 4
          Top = 14
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #54872#51088#49457#47749
            #54872#51088#48264#54840)
          Properties.OnChange = cboOrderPropertiesChange
          TabOrder = 0
          Text = #54872#51088#49457#47749
          Width = 95
        end
      end
      object btnSearch: TcxButton
        Left = 403
        Top = 16
        Width = 67
        Height = 26
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
        TabOrder = 1
        OnClick = btnSearchClick
      end
      object txtSearch: TcxTextEdit
        Left = 279
        Top = 18
        Style.HotTrack = False
        Style.LookAndFeel.SkinName = 'Caramel'
        StyleDisabled.LookAndFeel.SkinName = 'Caramel'
        StyleFocused.LookAndFeel.SkinName = 'Caramel'
        StyleHot.LookAndFeel.SkinName = 'Caramel'
        TabOrder = 2
        OnKeyUp = txtSearchKeyUp
        Width = 118
      end
      object cxGroupBox2: TcxGroupBox
        Left = 68
        Top = 7
        Caption = #51077#50896#44396#48516
        ParentBackground = False
        ParentColor = False
        Style.Color = clBtnFace
        TabOrder = 3
        Height = 44
        Width = 65
        object cboInOut: TcxComboBox
          Left = 4
          Top = 14
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #51077#50896
            #53748#50896
            #51204#52404)
          Properties.OnChange = cboInOutPropertiesChange
          TabOrder = 0
          Text = #51077#50896
          Width = 55
        end
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 4
      Top = 462
      Align = alBottom
      Caption = #50808#52636'/'#50808#48149' '#45236#50669
      ParentBackground = False
      ParentColor = False
      Style.Color = clBtnFace
      TabOrder = 2
      Height = 204
      Width = 543
      object cxGrid1: TcxGrid
        Left = 3
        Top = 15
        Width = 537
        Height = 179
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 18
        ExplicitWidth = 539
        ExplicitHeight = 184
        object cxGridDBTableView1: TcxGridDBTableView
          DataController.DataSource = dsOverNight
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Inactive = dbMain.cxSelection
          object cxGridDBTableView1StateName: TcxGridDBColumn
            Caption = #44396#48516
            DataBinding.FieldName = 'StateName'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 59
          end
          object cxGridDBTableView1StartTime: TcxGridDBColumn
            Caption = #49884#51089#51068#49884
            DataBinding.FieldName = 'StartTime'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 114
          end
          object cxGridDBTableView1FinishTime: TcxGridDBColumn
            Caption = #51333#47308#51068#49884
            DataBinding.FieldName = 'FinishTime'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 113
          end
          object cxGridDBTableView1Comment: TcxGridDBColumn
            Caption = #48708#44256
            DataBinding.FieldName = 'Comment'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 219
          end
        end
        object cxGridDBBandedTableView2: TcxGridDBBandedTableView
          DataController.DataSource = dsInOut
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end>
        end
        object cxGridDBTableView3: TcxGridDBTableView
          DataController.DataSource = dsInOut
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 551
    Top = 0
    Width = 662
    Height = 670
    Align = alClient
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    TabOrder = 1
    object Panel4: TPanel
      Left = 4
      Top = 4
      Width = 654
      Height = 57
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 10
        Width = 48
        Height = 13
        Caption = #45380#46020#49440#53469
      end
      object lblSelectedYear: TLabel
        Left = 149
        Top = 10
        Width = 48
        Height = 13
        Caption = #45380#46020#49440#53469
      end
      object Label3: TLabel
        Left = 34
        Top = 33
        Width = 24
        Height = 13
        Caption = #44396#48516
      end
      object btnAppend: TcxButton
        Left = 221
        Top = 20
        Width = 70
        Height = 26
        Caption = #52628#44032
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
        LookAndFeel.SkinName = 'Caramel'
        SpeedButtonOptions.Transparent = True
        TabOrder = 0
        OnClick = btnAppendClick
      end
      object btnUpdate: TcxButton
        Left = 301
        Top = 21
        Width = 70
        Height = 26
        Caption = #49688#51221
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
        LookAndFeel.SkinName = 'Caramel'
        SpeedButtonOptions.Transparent = True
        TabOrder = 1
        OnClick = btnUpdateClick
      end
      object btnDelete: TcxButton
        Left = 383
        Top = 20
        Width = 70
        Height = 26
        Caption = #49325#51228
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          93FF000093FF0000000000000000000093FF000093FF000000005E5349FF3F33
          28FF403428FF000000003E3327FF403428FF3E3327FFFFFFFFFF000093FF0029
          FFFF0033FFFF000093FF000093FF0033FFFF0029FFFF000093FF72675FFFFFFF
          FFFFFFFFFFFFB2AAA1FFB2AAA1FFFFFFFFFFFFFFFFFFFFFFFFFF0029CAFFFFCC
          FFFF0029FFFF0033FFFF0033FFFF0029FFFFFFCCFFFF0029CAFF71665DFFFFFF
          FFFFF7F0EAFF8B8178FF8B8178FFF7F1EBFFF2EBE5FFFAF7F4FFFFFFFFFF0029
          CAFF0C4CFFFF0C4CFFFF0C4CFFFF0C4CFFFF0029CAFFFFFFFFFF746960FFFFFF
          FFFFF4EDE8FFF9F4EEFFF9F4EEFFF4EFE9FFF3EEE8FFFAF8F6FFFFFFFFFF0000
          93FF146CFFFF146CFFFF146CFFFF146CFFFF000093FFFFFFFFFF776D63FFFFFF
          FFFFFFFEFAFFFFFFFBFFFFFFFBFFFFFFFBFFFFFFFBFFFFFFFFFF000093FF2083
          FFFF2083FFFFFFCCFFFFFFCCFFFF2083FFFF2083FFFF000093FF7C7066FFFFFF
          FFFFFFF8EAFFFFF8ECFFFFF8ECFFFFF8ECFFFFF8ECFFFFFFFFFF0029CAFFFFCC
          FFFFFFCCFFFF0029CAFF0029CAFFFFCCFFFFFFCCFFFF0029CAFF7F7369FFFFFF
          FFFFFFF2DEFFFFF3E0FFFFF3E0FFFFF3E0FFFFF3E0FFFFFAF2FFFEFEFFFF0029
          CAFF0029CAFFFFFFFFFFFFFFFFFF0029CAFF0029CAFFFFFFFFFF82776DFFFFFF
          FFFFFFEDD0FFFFEED3FFFFEED3FFFFEED3FFFFEED3FFFFEDD1FFFDFCFBFFFFFF
          FFFFFFFFFFFFFEFDFCFFFEFDFCFFFFFFFFFFFFFFFFFFCCC7C3FF857A6FFFFFFF
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
        LookAndFeel.SkinName = 'Caramel'
        SpeedButtonOptions.Transparent = True
        TabOrder = 2
        OnClick = btnDeleteClick
      end
      object cxDESelectedDate: TcxDateEdit
        Left = 60
        Top = 7
        Properties.OnChange = cxDESelectedDatePropertiesChange
        TabOrder = 3
        Width = 83
      end
      object cboOvernightState: TcxComboBox
        Left = 60
        Top = 29
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          #51204#52404
          #50808#52636'/'#50808#48149
          'CR')
        Properties.OnChange = cboOvernightStatePropertiesChange
        TabOrder = 4
        Text = #51204#52404
        Width = 83
      end
    end
    object cxGrid3: TcxGrid
      Left = 4
      Top = 61
      Width = 654
      Height = 605
      Align = alClient
      TabOrder = 1
      object cxGridDBTableView4: TcxGridDBTableView
        DataController.DataSource = dsList
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        Styles.Inactive = dbMain.cxSelection
        object cxGridDBTableView4StateName: TcxGridDBColumn
          Caption = #44396#48516
          DataBinding.FieldName = 'StateName'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Sorting = False
          Width = 60
        end
        object cxGridDBTableView4StartTime: TcxGridDBColumn
          Caption = #49884#51089#51068#49884
          DataBinding.FieldName = 'StartTime'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Sorting = False
        end
        object cxGridDBTableView4FinishTime: TcxGridDBColumn
          Caption = #51333#47308#51068#49884
          DataBinding.FieldName = 'FinishTime'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Sorting = False
        end
        object cxGridDBTableView4PatientID: TcxGridDBColumn
          Caption = #54872#51088#48264#54840
          DataBinding.FieldName = 'PatientID'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Sorting = False
        end
        object cxGridDBTableView4PatientName: TcxGridDBColumn
          Caption = #54872#51088#49457#47749
          DataBinding.FieldName = 'PatientName'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Sorting = False
        end
        object cxGridDBTableView4Comment: TcxGridDBColumn
          Caption = #48708#44256
          DataBinding.FieldName = 'Comment'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.Sorting = False
          Width = 200
        end
      end
      object cxGridDBBandedTableView3: TcxGridDBBandedTableView
        DataController.DataSource = dsInOut
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Bands = <
          item
          end>
      end
      object cxGridDBTableView5: TcxGridDBTableView
        DataController.DataSource = dsInOut
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel3: TcxGridLevel
        GridView = cxGridDBTableView4
      end
    end
  end
  object dsInOut: TDataSource
    DataSet = adoInOut
    OnDataChange = dsInOutDataChange
    Left = 126
    Top = 240
  end
  object adoInOut: TADOQuery
    Connection = dbMain.adoSocialWorkDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *'
      '       ,case I.state when 0 then '#39#51077#50896#39
      '                     when 1 then '#39#53748#50896#39
      '                     else '#39#50640#47084#39
      '        end as StateName'
      
        '       ,(select UserName from users where hospitalid=0 and useri' +
        'd=I.UserID and Worker=1) as WorkerName'
      
        '       ,(select UserName from users where hospitalid=0 and useri' +
        'd=I.DoctorID and Doctor=1) as DoctorName'
      
        '       ,(select WardName from Wards where wards.wardid=I.wardid)' +
        ' as WardName'
      
        '  from InOut As I inner join patients as P on I.hospitalID=P.hos' +
        'pitalID and I.patientID=P.PatientID')
    Left = 60
    Top = 240
  end
  object adoOverNight: TADOQuery
    Connection = dbMain.adoSocialWorkDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT PatientID, Comment, o.InOutID as InOutID'
      '       ,CONVERT(VARCHAR(16), starttime, 120) as starttime'
      '       ,CONVERT(VARCHAR(16), finishtime, 120) as finishtime'
      '       ,CASE overnightstate WHEN 0 THEN '#39#50808#52636'/'#50808#48149#39
      '                     WHEN 1 THEN '#39'CR'#39
      '        END AS StateName'
      
        '       ,(select PatientName from Patients where Patients.Patient' +
        'ID = i.PatientID) as PatientName'
      '  from overnight as o, inout as i'
      ' where o.inoutid = i.inoutid'
      ' order by StartTime Desc'
      '')
    Left = 368
    Top = 238
  end
  object dsOverNight: TDataSource
    DataSet = adoOverNight
    Left = 444
    Top = 238
  end
  object adoList: TADOQuery
    Connection = dbMain.adoSocialWorkDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select PatientID, StartTime, FinishTime, Comment'
      '       ,CASE OverNightState WHEN 0 THEN '#39#50808#52636'/'#50808#48149#39
      '                            WHEN 1 THEN '#39'CR'#39
      '        END AS StateName'
      
        '       ,(select PatientName from Patients where Patients.Hospita' +
        'lID = i.HospitalID and Patients.PatientID = i.PatientID) as Pati' +
        'entName'
      '  from overnight as o, inout as i'
      'where o.inoutid = i.inoutid'
      '  order by PatientID')
    Left = 666
    Top = 228
  end
  object dsList: TDataSource
    DataSet = adoList
    Left = 708
    Top = 228
  end
end
