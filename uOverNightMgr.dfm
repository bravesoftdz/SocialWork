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
    Width = 593
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
      Width = 585
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      ExplicitLeft = 12
      ExplicitTop = 547
      ExplicitWidth = 543
    end
    object cxGroupBox6: TcxGroupBox
      Left = 4
      Top = 69
      Align = alClient
      Caption = #54872#51088#47532#49828#53944
      ParentBackground = False
      ParentColor = False
      Style.Color = clBtnFace
      TabOrder = 0
      Height = 390
      Width = 585
      object cxGrid2: TcxGrid
        Left = 2
        Top = 18
        Width = 581
        Height = 370
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 15
        ExplicitWidth = 579
        ExplicitHeight = 365
        object cxGInOut: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          OnFocusedRecordChanged = cxGInOutFocusedRecordChanged
          DataController.DataSource = dsInOut
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0.'#47749';'
              Kind = skCount
              FieldName = 'PatientID'
              Column = cxGInOutPatientID
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Inactive = dbMain.cxSelection
          object cxGInOutPatientID: TcxGridDBColumn
            Caption = #54872#51088#48264#54840
            DataBinding.FieldName = 'PatientID'
            FooterAlignmentHorz = taRightJustify
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
          object cxGInOutWardName: TcxGridDBColumn
            Caption = #48337#46041
            DataBinding.FieldName = 'WardName'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 83
          end
          object cxGInOutColumn1: TcxGridDBColumn
            Caption = #48372#54744
            DataBinding.FieldName = 'BohumName'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 84
          end
        end
        object cxGridDBBandedTableView1: TcxGridDBBandedTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsInOut
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end>
        end
        object cxGridDBTableView2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
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
      Width = 585
      Height = 65
      Align = alTop
      BevelOuter = bvLowered
      Padding.Top = 3
      TabOrder = 1
      inline frameInOut: TframeInOutSearch
        Left = 1
        Top = 4
        Width = 583
        Height = 60
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 1
        ExplicitTop = 4
        ExplicitWidth = 583
        ExplicitHeight = 60
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
      Width = 585
      object cxGrid1: TcxGrid
        Left = 2
        Top = 18
        Width = 581
        Height = 184
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = 15
        ExplicitWidth = 579
        ExplicitHeight = 179
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsOverNight
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
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
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsInOut
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end>
        end
        object cxGridDBTableView3: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
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
    Left = 593
    Top = 0
    Width = 620
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
      Width = 612
      Height = 65
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 48
        Height = 13
        Caption = #45380#46020#49440#53469
      end
      object lblSelectedYear: TLabel
        Left = 155
        Top = 10
        Width = 48
        Height = 13
        Caption = #45380#46020#49440#53469
      end
      object Label3: TLabel
        Left = 40
        Top = 33
        Width = 24
        Height = 13
        Caption = #44396#48516
      end
      object btnAppend: TcxButton
        Left = 227
        Top = 20
        Width = 70
        Height = 26
        Caption = #52628#44032
        LookAndFeel.SkinName = 'Caramel'
        OptionsImage.Glyph.Data = {
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
        SpeedButtonOptions.Transparent = True
        TabOrder = 0
        OnClick = btnAppendClick
      end
      object btnUpdate: TcxButton
        Left = 307
        Top = 21
        Width = 70
        Height = 26
        Caption = #49688#51221
        LookAndFeel.SkinName = 'Caramel'
        OptionsImage.Glyph.Data = {
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
        SpeedButtonOptions.Transparent = True
        TabOrder = 1
        OnClick = btnUpdateClick
      end
      object btnDelete: TcxButton
        Left = 389
        Top = 20
        Width = 70
        Height = 26
        Caption = #49325#51228
        LookAndFeel.SkinName = 'Caramel'
        OptionsImage.Glyph.Data = {
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
        SpeedButtonOptions.Transparent = True
        TabOrder = 2
        OnClick = btnDeleteClick
      end
      object cxDESelectedDate: TcxDateEdit
        Left = 66
        Top = 7
        Properties.OnChange = cxDESelectedDatePropertiesChange
        TabOrder = 3
        Width = 83
      end
      object cboOvernightState: TcxComboBox
        Left = 66
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
      Top = 69
      Width = 612
      Height = 597
      Align = alClient
      TabOrder = 1
      object cxGridDBTableView4: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsList
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.ColumnAutoWidth = True
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
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsInOut
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        Bands = <
          item
          end>
      end
      object cxGridDBTableView5: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
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
    DataSet = adopInOut
    Left = 122
    Top = 230
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
  object adopInOut: TADOStoredProc
    Connection = dbMain.adoSocialWorkDB
    ProcedureName = 'pInOut;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@HospitalID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 1
      end
      item
        Name = '@CurDate'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@PPYearMonth'
        Attributes = [paNullable]
        DataType = ftString
        Size = 7
        Value = Null
      end
      item
        Name = '@SearchCondition'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@SearchText'
        Attributes = [paNullable]
        DataType = ftString
        Size = 20
        Value = Null
      end
      item
        Name = '@WardID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@InOutState'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@BohumID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = '@Order'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 58
    Top = 232
  end
end
