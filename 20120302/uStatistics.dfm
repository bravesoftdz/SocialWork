object frmStatistics: TfrmStatistics
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #49324#54924#49324#50629#49892#53685#44228
  ClientHeight = 689
  ClientWidth = 1146
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Padding.Left = 5
  Padding.Top = 5
  Padding.Right = 5
  Padding.Bottom = 5
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 5
    Top = 121
    Width = 1136
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Color = clGray
    ParentColor = False
    ExplicitLeft = 642
    ExplicitTop = 157
    ExplicitWidth = 527
  end
  object cxGrid1: TcxGrid
    Left = 5
    Top = 37
    Width = 1136
    Height = 84
    Align = alTop
    TabOrder = 0
    object cxGInOut: TcxGridDBTableView
      DataController.DataSource = dsInOut
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#0'
          Kind = skSum
          FieldName = 'intake'
          Column = cxGInOutintake
        end
        item
          Format = '#0'
          Kind = skSum
          FieldName = 'survey1'
          Column = cxGInOutsurvey1
        end
        item
          Format = '#0'
          Kind = skSum
          FieldName = 'survey2'
          Column = cxGInOutsurvey2
        end
        item
          Format = '#0'
          Kind = skSum
          FieldName = 'counseling'
          Column = cxGInOutcounseling
        end
        item
          Format = '#0'
          Kind = skSum
          FieldName = 'training'
          Column = cxGInOuttraining
        end
        item
          Format = '#0'
          Kind = skSum
          FieldName = 'Visit'
          Column = cxGInOutVisit
        end
        item
          Format = '#0'
          Kind = skSum
          FieldName = 'PP'
          Column = cxGInOutPP
        end
        item
          Format = '#0'
          Kind = skSum
          FieldName = 'PP1'
          Column = cxGInOutPP1
        end
        item
          Format = '#0'
          Kind = skSum
          FieldName = 'PP2'
          Column = cxGInOutPP2
        end
        item
          Format = '#0'
          Kind = skSum
          FieldName = 'PP3'
          Column = cxGInOutPP3
        end
        item
          Format = '#0'
          Kind = skSum
          FieldName = 'PP4'
          Column = cxGInOutPP4
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.Inactive = dbMain.cxSelection
      object cxGInOutPatientID: TcxGridDBColumn
        Caption = #54872#51088#48264#54840
        DataBinding.FieldName = 'PatientID'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 62
      end
      object cxGInOutPatientName: TcxGridDBColumn
        Caption = #54872#51088#49457#47749
        DataBinding.FieldName = 'PatientName'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 59
      end
      object cxGInOutBirthday: TcxGridDBColumn
        Caption = #49373#45380#50900#51068
        DataBinding.FieldName = 'Birthday'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
      end
      object cxGInOutAge: TcxGridDBColumn
        Caption = #45208#51060
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        OnGetDataText = cxGInOutAgeGetDataText
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 41
      end
      object cxGInOutSEX: TcxGridDBColumn
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
      object cxGInOutInDate: TcxGridDBColumn
        Caption = #51077#50896#51068
        DataBinding.FieldName = 'InDate'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
      end
      object cxGInOutOutDate: TcxGridDBColumn
        Caption = #53748#50896#51068
        DataBinding.FieldName = 'OutDate'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
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
      object cxGInOutWardName: TcxGridDBColumn
        Caption = #48337#46041
        DataBinding.FieldName = 'WardName'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taLeftJustify
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 91
      end
      object cxGInOutPP: TcxGridDBColumn
        Caption = #52824#47308
        DataBinding.FieldName = 'PP'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 40
      end
      object cxGInOutPP1: TcxGridDBColumn
        Caption = #51068#48152
        DataBinding.FieldName = 'PP1'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 40
      end
      object cxGInOutPP2: TcxGridDBColumn
        Caption = #51089#50629
        DataBinding.FieldName = 'PP2'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 40
      end
      object cxGInOutPP3: TcxGridDBColumn
        Caption = #52824#47308#44537
        DataBinding.FieldName = 'PP3'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 40
      end
      object cxGInOutPP4: TcxGridDBColumn
        Caption = #44032#51313#52824#47308
        DataBinding.FieldName = 'PP4'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 57
      end
      object cxGInOutintake: TcxGridDBColumn
        Caption = #44060#51064
        DataBinding.FieldName = 'intake'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 40
      end
      object cxGInOutcounseling: TcxGridDBColumn
        Caption = #51648#46020
        DataBinding.FieldName = 'counseling'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 40
      end
      object cxGInOutsurvey1: TcxGridDBColumn
        Caption = #51312#49324'I'
        DataBinding.FieldName = 'survey1'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 40
      end
      object cxGInOutsurvey2: TcxGridDBColumn
        Caption = #51312#49324'II'
        DataBinding.FieldName = 'survey2'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 40
      end
      object cxGInOuttraining: TcxGridDBColumn
        Caption = #51116#54876
        DataBinding.FieldName = 'training'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 40
      end
      object cxGInOutVisit: TcxGridDBColumn
        Caption = #48169#47928
        DataBinding.FieldName = 'Visit'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 40
      end
      object cxGInOutBohumName: TcxGridDBColumn
        Caption = #51032#47308#48372#51109
        DataBinding.FieldName = 'BohumName'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 129
      end
    end
    object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
      DataController.DataSource = dsInOut
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Bands = <
        item
        end>
    end
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.DataSource = dsInOut
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGInOut
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 5
    Width = 1136
    Height = 32
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 48
      Height = 13
      Caption = #45380#46020#49440#53469
    end
    object lblSelectedYear: TLabel
      Left = 149
      Top = 11
      Width = 48
      Height = 13
      Caption = #45380#46020#49440#53469
    end
    object Label3: TLabel
      Left = 578
      Top = 10
      Width = 48
      Height = 13
      Caption = #44160#49353#51312#44148
    end
    object Label2: TLabel
      Left = 694
      Top = 10
      Width = 24
      Height = 13
      Caption = #44160#49353
    end
    object Label4: TLabel
      Left = 305
      Top = 10
      Width = 24
      Height = 13
      Caption = #48337#46041
    end
    object Label5: TLabel
      Left = 417
      Top = 9
      Width = 24
      Height = 13
      Caption = #48372#54744
    end
    object cxDESelectedDate: TcxDateEdit
      Left = 60
      Top = 7
      Properties.OnChange = cxDESelectedDatePropertiesChange
      TabOrder = 0
      Width = 83
    end
    object cboSearchCondition: TcxComboBox
      Left = 628
      Top = 5
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        #51060#47492
        #48264#54840)
      Properties.OnChange = cboSearchConditionPropertiesChange
      TabOrder = 1
      Text = #51060#47492
      Width = 59
    end
    object txtSearch: TcxTextEdit
      Left = 719
      Top = 5
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 2
      OnKeyUp = txtSearchKeyUp
      Width = 111
    end
    object btnSearch: TcxButton
      Left = 836
      Top = 3
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
      TabOrder = 3
      OnClick = btnSearchClick
    end
    object cboWard: TcxComboBox
      Left = 329
      Top = 6
      Properties.DropDownListStyle = lsFixedList
      Properties.OnChange = cboWardPropertiesChange
      TabOrder = 4
      Width = 82
    end
    object cboBohum: TcxComboBox
      Left = 442
      Top = 6
      Properties.DropDownListStyle = lsFixedList
      Properties.OnChange = cboBohumPropertiesChange
      TabOrder = 5
      Width = 125
    end
    object btnPrintOne: TcxButton
      Left = 926
      Top = 3
      Width = 77
      Height = 26
      Caption = 'Print One'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00009A9A9AFF999999FF989898FF979797FF969696FF959595FF949494FF9494
        94FF939393FF929292FF919191FF919191FF0000000000000000000000000000
        00009C9C9CFFDDDDDDFFDBDBDBFFD9D9D9FFD8D8D8FFD6D6D6FFD4D4D4FFD2D2
        D2FFD1D1D1FFCFCFCFFFCDCDCDFF919191FF0000000000000000000000006969
        69FF7D7D7DFFC8C8C8FFC6C6C6FFC5C5C5FFC3C3C3FFC2C2C2FFC0C0C0FFBFBF
        BFFFBDBDBDFFBCBCBCFFBBBBBBFF777777FF656565FF000000006A6A6AFFA0A0
        A0FF7E7E7EFF7D7D7DFF7C7C7CFF7C7C7CFF7C7C7CFF7B7B7BFF7A7A7AFF7A7A
        7AFF797979FF787878FF787878FF787878FF939393FF656565FF6A6A6AFFA1A1
        A1FFA1A1A1FF9F9F9FFF9F9F9FFF9D9D9DFF9C9C9CFF9B9B9BFF9A9A9AFF9999
        99FF989898FF979797FF969696FF959595FF949494FF656565FF6B6B6BFFB8B8
        B8FFB6B6B6FFB5B5B5FFB4B4B4FFB2B2B2FFB1B1B1FFAFAFAFFFAEAEAEFFADAD
        ADFFABABABFFAAAAAAFFA9A9A9FFA8A8A8FFA6A6A6FF656565FF6C6C6CFFD6D6
        D6FFD4D4D4FFD2D2D2FFD1D1D1FFCFCFCFFFCDCDCDFFCCCCCCFFCACACAFFC8C8
        C8FFC6C6C6FF7B7B7BFFC3C3C3FF7A7A7AFFC0C0C0FF666666FF6C6C6CFFD8D8
        D8FFD7D7D7FFD5D5D5FFD3D3D3FFD2D2D2FFD0D0D0FFCECECEFFCDCDCDFFCBCB
        CBFFC9C9C9FFC7C7C7FFC6C6C6FFC4C4C4FFC2C2C2FF676767FF6C6C6CFFDADA
        DAFF838383FF828282FF818181FF818181FF818181FF808080FF7F7F7FFF7F7F
        7FFF7E7E7EFF7D7D7DFF7C7C7CFF7C7C7CFFC5C5C5FF676767FF000000006C6C
        6CFFBDBDBDFFA7A7A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF9E9E9EFFAFAFAFFF686868FF00000000000000000000
        0000BFBFBFFFA8A8A8FFFFFFFFFFF5F5F5FFF2F2F2FFF0F0F0FFEFEFEFFFEDED
        EDFFEBEBEBFFFFFFFFFF9F9F9FFFB2B2B2FF0000000000000000000000000000
        0000C0C0C0FFAAAAAAFFFFFFFFFFF7F7F7FFF5F5F5FFF3F3F3FFF2F2F2FFF0F0
        F0FFEEEEEEFFFFFFFFFFA1A1A1FFB4B4B4FF0000000000000000000000000000
        000003030308ABABABFFFFFFFFFFF9F9F9FFF7F7F7FFF6F6F6FFF5F5F5FFF2F2
        F2FFF0F0F0FFFFFFFFFFA3A3A3FF000000000000000000000000000000000000
        000000000000ACACACFFFFFFFFFFFCFCFCFFFAFAFAFFF9F9F9FFF7F7F7FFF5F5
        F5FFF3F3F3FFFFFFFFFFA4A4A4FF000000000000000000000000000000000000
        000000000000ADADADFFACACACFFABABABFFABABABFFABABABFFA9A9A9FFA8A8
        A8FFA8A8A8FFA7A7A7FFA6A6A6FF000000000000000000000000}
      LookAndFeel.SkinName = 'Caramel'
      SpeedButtonOptions.Transparent = True
      TabOrder = 6
      OnClick = btnPrintOneClick
    end
    object chkViewAll: TcxCheckBox
      Left = 230
      Top = 8
      Caption = #51204#52404#48372#44592
      Properties.OnChange = chkViewAllPropertiesChange
      State = cbsChecked
      TabOrder = 7
      Transparent = True
      Width = 71
    end
  end
  object pnlBody: TPanel
    Left = 711
    Top = 124
    Width = 430
    Height = 560
    Align = alClient
    TabOrder = 2
    object cxGroupBox1: TcxGroupBox
      Left = 1
      Top = 402
      Align = alBottom
      Caption = #50808#52636#50808#48149', CR'
      TabOrder = 0
      Height = 157
      Width = 428
      object cxGrid4: TcxGrid
        Left = 3
        Top = 15
        Width = 422
        Height = 132
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 18
        ExplicitWidth = 424
        ExplicitHeight = 137
        object cxGOvernight: TcxGridDBTableView
          DataController.DataSource = dsOvernight
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Inactive = dbMain.cxSelection
          object cxGOvernightStateName: TcxGridDBColumn
            Caption = #44396#48516
            DataBinding.FieldName = 'StateName'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
          end
          object cxGOvernightstartdate: TcxGridDBColumn
            Caption = #49884#51089#51068#49884
            DataBinding.FieldName = 'startdate'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 100
          end
          object cxGOvernightfinishdate: TcxGridDBColumn
            Caption = #51333#47308#51068#49884
            DataBinding.FieldName = 'finishdate'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 100
          end
          object cxGOvernightComment: TcxGridDBColumn
            Caption = #48708#44256
            DataBinding.FieldName = 'Comment'
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 500
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGOvernight
        end
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 1
      Top = 1
      Align = alClient
      Caption = #51221#49888#52824#47308' '#51652#54665#45236#50669
      TabOrder = 1
      Height = 401
      Width = 428
      object cxGrid3: TcxGrid
        Left = 3
        Top = 15
        Width = 422
        Height = 376
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 18
        ExplicitWidth = 424
        ExplicitHeight = 381
        object cxGError: TcxGridBandedTableView
          OnCustomDrawCell = cxGErrorCustomDrawCell
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Bands = <
            item
              Caption = 'test'
            end>
          object cxGErrorProgram: TcxGridBandedColumn
            Caption = #54532#47196#44536#47016
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.VertSizing = False
            Width = 192
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGErrorStarttime: TcxGridBandedColumn
            Caption = #49884#51089#51068#49884
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGErrorFinishtime: TcxGridBandedColumn
            Caption = #51333#47308#51068#49884
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Width = 100
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGErrorCheck: TcxGridBandedColumn
            Caption = #49884#44036#51473#48373
            DataBinding.ValueType = 'Boolean'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.Alignment = taCenter
            Properties.NullStyle = nssUnchecked
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Width = 55
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
        end
        object cxGridLevel3: TcxGridLevel
          GridView = cxGError
        end
      end
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 5
    Top = 124
    Width = 706
    Height = 560
    Align = alLeft
    TabOrder = 3
    Properties.ActivePage = cxTabSheet1
    ClientRectBottom = 554
    ClientRectLeft = 3
    ClientRectRight = 700
    ClientRectTop = 26
    object cxTabSheet1: TcxTabSheet
      Caption = #49324#50629#54788#54889'('#49900#49324#44284')'
      ImageIndex = 0
      object cxGrid5: TcxGrid
        Left = 0
        Top = 0
        Width = 697
        Height = 528
        Align = alClient
        TabOrder = 0
        object cxGMonth2: TcxGridBandedTableView
          OnCustomDrawCell = cxGMonthCustomDrawCell
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0.;-0.;'
              Kind = skSum
              Column = cxGridBandedColumn2
            end
            item
              Format = '0.;-0.;'
              Kind = skSum
              Column = cxGridBandedColumn3
            end
            item
              Format = '0.;-0.;'
              Kind = skSum
              Column = cxGridBandedColumn4
            end
            item
              Format = '0.;-0.;'
              Kind = skSum
              Column = cxGridBandedColumn5
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Bands = <
            item
              Caption = 'test'
            end>
          object cxGridBandedColumn1: TcxGridBandedColumn
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Width = 34
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
            IsCaptionAssigned = True
          end
          object cxGridBandedColumn2: TcxGridBandedColumn
            Caption = #51068#48152#52824#47308
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGridBandedColumn3: TcxGridBandedColumn
            Caption = #51089#50629
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGridBandedColumn4: TcxGridBandedColumn
            Caption = #52824#47308#44537
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object cxGridBandedColumn5: TcxGridBandedColumn
            Caption = #44032#51313#52824#47308
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object cxGridBandedColumn6: TcxGridBandedColumn
            Caption = #44060#51064#47141
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object cxGridBandedColumn7: TcxGridBandedColumn
            Caption = #49324#50629#51648#46020
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object cxGridBandedColumn8: TcxGridBandedColumn
            Caption = #51312#49324'I'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object cxGridBandedColumn9: TcxGridBandedColumn
            Caption = #51312#49324'II'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object cxGridBandedColumn10: TcxGridBandedColumn
            Caption = #51116#54876
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object cxGridBandedColumn11: TcxGridBandedColumn
            Caption = #44032#51221#48169#47928
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGMonth2
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #49324#50629#54788#54889'('#49324#54924#49324#50629#49892')'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 697
        Height = 528
        Align = alClient
        TabOrder = 0
        object cxGMonth: TcxGridBandedTableView
          OnCustomDrawCell = cxGMonthCustomDrawCell
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0.;-0.;'
              Kind = skSum
              Column = cxGMonthColumn2
            end
            item
              Format = '0.;-0.;'
              Kind = skSum
              Column = cxGMonthColumn3
            end
            item
              Format = '0.;-0.;'
              Kind = skSum
              Column = cxGMonthColumn4
            end
            item
              Format = '0.;-0.;'
              Kind = skSum
              Column = cxGMonthColumn5
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Bands = <
            item
              Caption = 'test'
            end>
          object cxGMonthColumn1: TcxGridBandedColumn
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            Options.Editing = False
            Options.Filtering = False
            Options.VertSizing = False
            Width = 34
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
            IsCaptionAssigned = True
          end
          object cxGMonthColumn2: TcxGridBandedColumn
            Caption = #51068#48152#52824#47308
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object cxGMonthColumn3: TcxGridBandedColumn
            Caption = #51089#50629
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object cxGMonthColumn4: TcxGridBandedColumn
            Caption = #52824#47308#44537
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object cxGMonthColumn5: TcxGridBandedColumn
            Caption = #44032#51313#52824#47308
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object cxGMonthColumn6: TcxGridBandedColumn
            Caption = #44060#51064#47141
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 5
            Position.RowIndex = 0
          end
          object cxGMonthColumn7: TcxGridBandedColumn
            Caption = #49324#50629#51648#46020
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 6
            Position.RowIndex = 0
          end
          object cxGMonthColumn8: TcxGridBandedColumn
            Caption = #51312#49324'I'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 7
            Position.RowIndex = 0
          end
          object cxGMonthColumn9: TcxGridBandedColumn
            Caption = #51312#49324'II'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 8
            Position.RowIndex = 0
          end
          object cxGMonthColumn10: TcxGridBandedColumn
            Caption = #51116#54876
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 9
            Position.RowIndex = 0
          end
          object cxGMonthColumn11: TcxGridBandedColumn
            Caption = #44032#51221#48169#47928
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.VertSizing = False
            Position.BandIndex = 0
            Position.ColIndex = 10
            Position.RowIndex = 0
          end
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = cxGMonth
        end
      end
    end
  end
  object btnPringAll: TcxButton
    Left = 1012
    Top = 8
    Width = 75
    Height = 26
    Caption = 'Print All'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      000012121240777777FFA4A4A4FFA4A4A4FFA2A2A2FF9F9F9FFF9A9A9AFF9696
      96FF929292FF8E8E8EFF6A6A6AFF131313450000000000000000000000001212
      12402929298F6E6E6EFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFF2F2F2FFE9E9
      E9FFE1E1E1FFD9D9D9FF797673FF26264BD11919237400000000252525807F7F
      7FFF9D9D9DFF818181FFDBDBDBFFECECECFFECECECFFECECECFFE7E7E7FFE0E0
      E0FFD8D8D8FFB4AFACFF19308CFF101EC3FF6E6C6AFF252525804F4F4FDFBFBF
      BFFF5F5F5FFF000000FF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A
      2AFF212020FF062054FF003DE9FF40468AFFBBBBBAFF4F4F4FDF7B7B7BFFCCCC
      CCFFB3B3B3FF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9A9A9AFF9794
      94FF27519CFF0099F7FF1348E6FFB0A6A6FFCCCCCCFF7B7B7BFF919191FFD9D9
      D9FFDBDBDBFFDEDEDEFFDFDFDFFFE1E1E1FFE2E2E2FFE2E2E2FFE0DFDEFF5A7F
      D4FF04B8FEFF04CCFEFF1A41E4FFC3C3D3FFD9D9D9FF919191FF848484FFF0F0
      F0FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFC3D5
      F1FF5BBBF3FF178DF5FF09CEFEFF078FFEFF7186EEFF818181FF464646CFC4E3
      C4FF66AD66FFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCECF4FF1C5FE2FF1AF9FEFF0BB3FEFF3D57E2FF454442D61B1B1B608891
      88FFB7CBB7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF73A3FAFF22CBFEFF30FEFEFF0949EDFF5A5874FF1B1B1B60000000001212
      1240323232AFAFAFAFFFFFFFFFFFFFFFFFFFFEFEFEFFF6F6F6FFEDEDEDFFBABF
      CEFF2085EDFF4AFEFEFF45FEFEFF1C83E6FE103072BB00031B1F000000000000
      0000000000004B4B4BEF717171FF7D7D7DFF7B7B7BFF787878FF757574FF6368
      73FF3E68A0FF3271B3FF44D5F6FF5BFEFEFF47FEFEFF073DC8CD000000000000
      00000000000009090920A4A4A4FFFAFAFAFFF2F2F2FFEAEAEAFFE2E2E2FFDADA
      DAFFD2D2D2FF4B5D6EEA5AD8ECFB70FEFEFF5AF3FEFF011F888B000000000000
      00000000000000000000A4A4A4FFFFFFFFFFFAFAFAFFF2F2F2FFEAEAEAFFE2E2
      E2FFCACED2FF78D1EDFF99FEFEFF90FEFEFF49BDFEFF000B484A000000000000
      00000000000000000000A4A4A4FFFFFFFFFFFFFFFFFFFAFAFAFFF2F2F2FFE8E9
      E9FF87C5EDFFD7FEFEFFD3FEFEFFD0FEFEFF277EEAEB00031212000000000000
      00000000000000000000A4A4A4FFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAFFC8E6
      F6FF58BDFEFF4AA1E3FC40A1E9EA5AB4F7F80542ABAC00000000000000000000
      00000000000000000000777777FFA4A4A4FFA4A4A4FFA4A4A4FFA3A3A3FF6E71
      71FF616364FF303D47E200040B0F000D2B2B00091F1F00000000}
    LookAndFeel.SkinName = 'Caramel'
    SpeedButtonOptions.Transparent = True
    TabOrder = 4
    OnClick = btnPringAllClick
  end
  object adoInOut: TADOQuery
    Connection = dbMain.adoSocialWorkDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '--select * from'
      '--('
      
        'select Patients.PatientName as PatientName, Patients.Sex as SEX,' +
        ' Patients.Birthday as Birthday'
      '       ,inout.*'
      '       , case inout.state when 0 then '#39#51077#50896#39
      '                          when 1 then '#39#53748#50896#39
      '                          else '#39#50640#47084#39
      '         end as StateName'
      '       ,(select WardName'
      '           from Wards'
      '           where wards.wardid=inout.wardid) as WardName'
      '       ,(select BohumName'
      '           from Bohum'
      '          where Bohum.BohumID=inout.BohumID) as BohumName'
      '       ,(select count(*)'
      '           from intake'
      '          where inout.inoutid=intake.inoutid'
      
        '            and intake.MeetingDate between '#39'2012-01-01'#39' and '#39'201' +
        '2-01-31'#39') as intake'
      '       ,(select count(*)'
      '           from survey1'
      '          where inout.inoutid=survey1.inoutid'
      
        '            and survey1.SurveyDate between '#39'2012-01-01'#39' and '#39'201' +
        '2-01-31'#39') as survey1'
      '       ,(select count(*)'
      '           from survey2'
      '          where inout.inoutid=survey2.inoutid'
      
        '            and survey2.MeetingDate between '#39'2012-01-01'#39' and '#39'20' +
        '12-01-31'#39') as survey2'
      '       ,(select count(*)'
      '           from counseling'
      '          where inout.inoutid=counseling.inoutid'
      
        '            and counseling.MeetingDate between '#39'2012-01-01'#39' and ' +
        #39'2012-01-31'#39') as counseling'
      '       ,(select count(*)'
      '           from training'
      '          where inout.inoutid=training.inoutid'
      
        '            and training.MeetingDate between '#39'2012-01-01'#39' and '#39'2' +
        '012-01-31'#39') as training'
      '       ,(select count(*)'
      '           from visit'
      '          where inout.inoutid=visit.inoutid'
      
        '            and visit.VisitDate between '#39'2012-01-01'#39' and '#39'2012-0' +
        '1-31'#39') as Visit'
      '       ,(select count(*)'
      '           from programpatients as PP'
      
        '                inner join Schedule on Schedule.ScheduleID=PP.Sc' +
        'heduleID'
      
        '          where inout.inoutid=PP.inoutid and convert(char(10),Sc' +
        'hedule.StartTime,120) between '#39'2012-01-01'#39' and '#39'2012-01-31'#39') as ' +
        'PP'
      '       ,(select count(*)'
      '           from programpatients as PP'
      
        '                inner join Schedule on Schedule.ScheduleID=PP.Sc' +
        'heduleID'
      
        '        '#9#9#9#9'inner join programs on schedule.programid=programs.p' +
        'rogramid and programs.programtypeid=1'
      
        '          where inout.inoutid=PP.inoutid and convert(char(10),Sc' +
        'hedule.StartTime,120) between '#39'2012-01-01'#39' and '#39'2012-01-31'#39') as ' +
        'PP1'
      '       ,(select count(*)'
      '           from programpatients as PP'
      
        '                inner join Schedule on Schedule.ScheduleID=PP.Sc' +
        'heduleID'
      
        '        '#9#9#9#9'inner join programs on schedule.programid=programs.p' +
        'rogramid and programs.programtypeid=2'
      
        '          where inout.inoutid=PP.inoutid and convert(char(10),Sc' +
        'hedule.StartTime,120) between '#39'2012-01-01'#39' and '#39'2012-01-31'#39') as ' +
        'PP2'
      '       ,(select count(*)'
      '           from programpatients as PP'
      
        '                inner join Schedule on Schedule.ScheduleID=PP.Sc' +
        'heduleID'
      
        '        '#9#9#9#9'inner join programs on schedule.programid=programs.p' +
        'rogramid and programs.programtypeid=3'
      
        '          where inout.inoutid=PP.inoutid and convert(char(10),Sc' +
        'hedule.StartTime,120) between '#39'2012-01-01'#39' and '#39'2012-01-31'#39') as ' +
        'PP3'
      '       ,(select count(*)'
      '           from programpatients as PP'
      
        '                inner join Schedule on Schedule.ScheduleID=PP.Sc' +
        'heduleID'
      
        '        '#9#9#9#9'inner join programs on schedule.programid=programs.p' +
        'rogramid and programs.programtypeid=4'
      
        '          where inout.inoutid=PP.inoutid and convert(char(10),Sc' +
        'hedule.StartTime,120) between '#39'2012-01-01'#39' and '#39'2012-01-31'#39') as ' +
        'PP4'
      
        '  from inout as inout inner join patients on patients.hospitalid' +
        '=inout.hospitalid and patients.patientid=inout.patientid'
      ' where inout.hospitalid=patients.hospitalid'
      '   and inout.patientid=patients.patientid'
      '   and inout.hospitalid=1'
      '--) AS A'
      
        '-- where intake>0 or survey1>0 or survey2>0 or counseling>0 or t' +
        'raining>0 or visit>0 or PP>0'
      '-- order by A.patientid')
    Left = 56
    Top = 76
  end
  object dsInOut: TDataSource
    DataSet = adoInOut
    OnDataChange = dsInOutDataChange
    Left = 120
    Top = 76
  end
  object adoVisit: TADOQuery
    Connection = dbMain.adoSocialWorkDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from visit')
    Left = 762
    Top = 286
  end
  object dsVisit: TDataSource
    DataSet = adoVisit
    Left = 842
    Top = 288
  end
  object adoOvernight: TADOQuery
    Connection = dbMain.adoSocialWorkDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select InOutID'
      '       ,OvernightState'
      '       ,CASE overnightstate WHEN 0 THEN '#39#50808#52636'/'#50808#48149#39
      '                     WHEN 1 THEN '#39'CR'#39
      '        END AS StateName'
      '       ,CONVERT(VARCHAR(16), starttime, 120) as startdate'
      '       ,CONVERT(VARCHAR(16), finishtime, 120) as finishdate'
      '       ,Comment'
      '  from overnight')
    Left = 790
    Top = 496
  end
  object dsOvernight: TDataSource
    DataSet = adoOvernight
    Left = 866
    Top = 504
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    Version = 0
    Left = 604
    Top = 322
    object dxComponentPrinter1Link1: TdxGridReportLink
      Active = True
      Component = cxGrid5
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 40945.424293252310000000
      OptionsFormatting.UseNativeStyles = True
      OptionsView.Caption = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      StyleRepository = cxStyleRepository1
      Styles.BandHeader = cxStyle1
      Styles.Caption = cxStyle2
      Styles.CardCaptionRow = cxStyle3
      Styles.CardRowCaption = cxStyle4
      Styles.Content = cxStyle5
      Styles.ContentEven = cxStyle6
      Styles.ContentOdd = cxStyle7
      Styles.FilterBar = cxStyle8
      Styles.Footer = cxStyle9
      Styles.Group = cxStyle10
      Styles.Header = cxStyle11
      Styles.Preview = cxStyle12
      Styles.Selection = cxStyle13
      BuiltInReportLink = True
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 524
    Top = 256
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnShadow
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
  end
end
