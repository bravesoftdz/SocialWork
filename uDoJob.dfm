object frmDoJob: TfrmDoJob
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #51652#54665#45236#50857
  ClientHeight = 678
  ClientWidth = 1172
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Padding.Left = 10
  Padding.Top = 15
  Padding.Right = 10
  Padding.Bottom = 15
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 531
    Top = 15
    Width = 43
    Height = 648
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object btnRight: TcxButton
      Left = 5
      Top = 244
      Width = 32
      Height = 30
      LookAndFeel.SkinName = 'Caramel'
      OptionsImage.Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7A190B7A190FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7
        A190B7A394B7A190FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7A190BCAB9DB9A595B7A190FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFB7A190B7A190B7A190B7A190FFFFFFB7A190B7A190BB
        A797C0B0A1C0B0A1BBA797B7A190FFFFFFFFFFFFFFFFFFFFFFFFB7A190C5B4A5
        C5B4A5B7A190FFFFFFB7A190C5B4A5C5B4A5C5B4A5C5B4A5C5B4A5BDA999B7A1
        90FFFFFFFFFFFFFFFFFFB7A190CBBAAACBBAAAB7A190FFFFFFB7A190CBBAAACB
        BAAACBBAAACBBAAACBBAAACBBAAABFAB9BB7A190FFFFFFFFFFFFB7A190D1BFAF
        D1BFAFB7A190FFFFFFB7A190D1BFAFD1BFAFD1BFAFD1BFAFD1BFAFD1BFAFD1BF
        AFC2AD9DB7A190FFFFFFB7A190D7C5B4D7C5B4B7A190FFFFFFB7A190D7C5B4D7
        C5B4D7C5B4D7C5B4D7C5B4D7C5B4D7C5B4D7C5B4C8B6A6B7A190B7A190DCC9B9
        DCC9B9B7A190FFFFFFB7A190DCC9B9DCC9B9DCC9B9DCC9B9DCC9B9DCC9B9DCC9
        B9E4D6C9CCBBACB7A190B7A190E2CFBEE2CFBEB7A190FFFFFFB7A190E2CFBEE2
        CFBEE2CFBEE2CFBEE2CFBEE2CFBEE9DACDCEBCAEB7A190FFFFFFB7A190E8D4C3
        E8D4C3B7A190FFFFFFB7A190E8D4C3E8D4C3E8D4C3E8D4C3E8D4C3EDDED1CFBD
        AFB7A190FFFFFFFFFFFFB7A190F4E8DDF4E8DDB7A190FFFFFFB7A190F4E8DDF1
        E2D4EDD9C7EDD9C7F1E2D4D0BEB0B7A190FFFFFFFFFFFFFFFFFFB7A190B7A190
        B7A190B7A190FFFFFFB7A190B7A190D1BFB1F2DDCBF5E5D7D1BFB1B7A190FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7
        A190F9E9DAD3C1B2B7A190FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7A190D3C1B3B7A190FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7
        A190B7A190FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      SpeedButtonOptions.Transparent = True
      TabOrder = 0
      OnClick = btnRightClick
    end
    object btnLeft: TcxButton
      Left = 6
      Top = 286
      Width = 32
      Height = 30
      LookAndFeel.SkinName = 'Caramel'
      OptionsImage.Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7A190B7A190FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7A190B7
        A394B7A190FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFB7A190B9A595BCAB9DB7A190FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7A190BBA797C0B0A1C0
        B0A1BBA797B7A190B7A190FFFFFFB7A190B7A190B7A190B7A190FFFFFFFFFFFF
        FFFFFFB7A190BDA999C5B4A5C5B4A5C5B4A5C5B4A5C5B4A5B7A190FFFFFFB7A1
        90C5B4A5C5B4A5B7A190FFFFFFFFFFFFB7A190BFAB9BCBBAAACBBAAACBBAAACB
        BAAACBBAAACBBAAAB7A190FFFFFFB7A190CBBAAACBBAAAB7A190FFFFFFB7A190
        C2AD9DD1BFAFD1BFAFD1BFAFD1BFAFD1BFAFD1BFAFD1BFAFB7A190FFFFFFB7A1
        90D1BFAFD1BFAFB7A190B7A190C8B6A6D7C5B4D7C5B4D7C5B4D7C5B4D7C5B4D7
        C5B4D7C5B4D7C5B4B7A190FFFFFFB7A190D7C5B4D7C5B4B7A190B7A190CCBBAC
        E4D6C9DCC9B9DCC9B9DCC9B9DCC9B9DCC9B9DCC9B9DCC9B9B7A190FFFFFFB7A1
        90DCC9B9DCC9B9B7A190FFFFFFB7A190CEBCAEE9DACDE2CFBEE2CFBEE2CFBEE2
        CFBEE2CFBEE2CFBEB7A190FFFFFFB7A190E2CFBEE2CFBEB7A190FFFFFFFFFFFF
        B7A190CFBDAFEDDED1E8D4C3E8D4C3E8D4C3E8D4C3E8D4C3B7A190FFFFFFB7A1
        90E8D4C3E8D4C3B7A190FFFFFFFFFFFFFFFFFFB7A190D0BEB0F1E2D4EDD9C7ED
        D9C7F1E2D4F4E8DDB7A190FFFFFFB7A190F4E8DDF4E8DDB7A190FFFFFFFFFFFF
        FFFFFFFFFFFFB7A190D1BFB1F5E5D7F2DDCBD1BFB1B7A190B7A190FFFFFFB7A1
        90B7A190B7A190B7A190FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7A190D3C1B2F9
        E9DAB7A190FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFB7A190D3C1B3B7A190FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7
        A190B7A190FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      SpeedButtonOptions.Transparent = True
      TabOrder = 1
      OnClick = btnLeftClick
    end
  end
  object pnlRight: TPanel
    Left = 574
    Top = 15
    Width = 589
    Height = 648
    Align = alLeft
    BevelOuter = bvLowered
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    TabOrder = 1
    object cxGroupBox1: TcxGroupBox
      Left = 4
      Top = 4
      Align = alClient
      Caption = #52280#50668#54872#51088
      ParentBackground = False
      ParentColor = False
      Style.Color = clBtnFace
      TabOrder = 0
      Height = 479
      Width = 581
      object cxGrid: TcxGrid
        Left = 2
        Top = 18
        Width = 577
        Height = 459
        Align = alClient
        TabOrder = 0
        object cxGList: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FilterBox.CustomizeDialog = False
          FilterBox.Position = fpTop
          OnCustomDrawCell = cxGListCustomDrawCell
          DataController.DataSource = dsPP
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #52509#50896'=,0.'
              Kind = skCount
              FieldName = 'Selected'
              Column = cxGListPatientID
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = ' '
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          Styles.Inactive = dbMain.cxSelection
          object cxGListSelect: TcxGridDBColumn
            Caption = #49440#53469
            DataBinding.FieldName = 'Selected'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.Alignment = taCenter
            Properties.NullStyle = nssUnchecked
            FooterAlignmentHorz = taRightJustify
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Sorting = False
            Width = 31
          end
          object cxGListPatientID: TcxGridDBColumn
            Caption = #54872#51088#48264#54840
            DataBinding.FieldName = 'PatientID'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 62
          end
          object cxGListPatientName: TcxGridDBColumn
            Caption = #49457#47749
            DataBinding.FieldName = 'PatientName'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 47
          end
          object cxGListSex: TcxGridDBColumn
            Caption = #49457#48324
            DataBinding.FieldName = 'Sex'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 28
          end
          object cxGListBirthday: TcxGridDBColumn
            Caption = #49373#45380#50900#51068
            DataBinding.FieldName = 'Birthday'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
          end
          object cxGListAge: TcxGridDBColumn
            Caption = #45208#51060
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            OnGetDataText = cxGListAgeGetDataText
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 40
          end
          object cxGListInDate: TcxGridDBColumn
            Caption = #51077#50896#51068
            DataBinding.FieldName = 'InDate'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 62
          end
          object cxGListOutDate: TcxGridDBColumn
            Caption = #53748#50896#51068
            DataBinding.FieldName = 'OutDate'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 60
          end
          object cxGListInOutID: TcxGridDBColumn
            DataBinding.FieldName = 'InOutID'
            Visible = False
            Options.Editing = False
          end
          object cxGListWardName: TcxGridDBColumn
            Caption = #48337#46041
            DataBinding.FieldName = 'WardName'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 67
          end
          object cxGListBohumName: TcxGridDBColumn
            Caption = #48372#54744
            DataBinding.FieldName = 'BohumName'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 91
          end
        end
        object cxGridDBBandedTableView1: TcxGridDBBandedTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end>
        end
        object cxGridDBTableView2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGList
        end
      end
    end
    object cxGroupBox2: TcxGroupBox
      Left = 4
      Top = 483
      Align = alBottom
      Caption = #44208#44284
      ParentBackground = False
      ParentColor = False
      Style.Color = clBtnFace
      TabOrder = 1
      Height = 161
      Width = 581
      object dbMemoResult: TDBMemo
        Left = 2
        Top = 18
        Width = 470
        Height = 141
        Align = alLeft
        DataField = 'Result'
        DataSource = dsPP
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ImeName = 'Microsoft Office IME 2007'
        MaxLength = 1000
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
        OnKeyDown = dbMemoResultKeyDown
      end
      object Panel2: TPanel
        Left = 472
        Top = 18
        Width = 107
        Height = 141
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object btnClose: TcxButton
          Left = 9
          Top = 97
          Width = 91
          Height = 32
          Caption = #45803#44592
          LookAndFeel.SkinName = 'Caramel'
          ModalResult = 11
          OptionsImage.Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000036342EFF36342EFF36342EFF36342EFF3634
            2EFF36342EFF36342EFF36342EFF36342EFF36342EFF00000000000000000000
            000000000000000000060000000136342EFFE0E2E2FF7A7976FF36342EFF1F6E
            43FF227A4BFF257E4EFF2A7E50FF2B7F50FF36342EFF00000000000100010001
            0001000100010000A4FF0000A4FF36342EFFDEE0E0FFE0E2E2FFE0E2E2FF7A79
            76FF36342EFF1E643EFF237446FF1F7E4BFF36342EFF00000000000100010001
            0001000100010000A4FF2929EFFF0000A4FFE0E2E2FFD1D4D4FFBEC1C1FFE0E2
            E2FFE0E2E2FF36342EFF18653BFF197544FF36342EFF000000000000A4FF0000
            A4FF0000A4FF0000A4FF2929EFFF2929EFFF0000A4FFD1D4D4FFBEC1C1FFB7B9
            B9FFE0E2E2FF36342EFF17623AFF196E41FF36342EFF000000000000A4FF2929
            EFFF2929EFFF2929EFFF2929EFFF0000B4FF2929EFFF0000A4FFBEC1C1FFB7B9
            B9FFE0E2E2FF36342EFF195E39FF15703FFF36342EFF000000000000A4FF2929
            EFFF0000B4FF0000B4FF0000B4FF0000B4FF0000B4FF2929EFFF0000A4FF6A6C
            6CFFE0E2E2FF36342EFF185B36FF136C3CFF36342EFF000000000000A4FF8282
            FBFF0000CCFF0000CCFF0000CCFF0000CCFF0000CCFF8282FBFF0000A4FF7779
            79FF5A5B5BFF36342EFF105932FF0E6638FF36342EFF000000000000A4FF8282
            FBFF8282FBFF8282FBFF8282FBFF0000CCFF8282FBFF0000A4FFBBBDBDFFA2A4
            A4FFE0E2E2FF36342EFF0D4E2BFF0D562FFF36342EFF000000000000A4FF0000
            A4FF0000A4FF0000A4FF8282FBFF8282FBFF0000A4FFCDD0D0FFBEC1C1FFB7B9
            B9FFE0E2E2FF36342EFF083E22FF074F2AFF36342EFF00000000000000000000
            0000000000000000A4FF8282FBFF0000A4FFDCDEDEFFD0D3D3FFBEC1C1FFB7B9
            B9FFE0E2E2FF36342EFF062D18FF064121FF36342EFF00000000000000000000
            0000000000000000A4FF0000A4FF36342EFFE0E2E2FFD0D3D3FFBDC0C0FFB5B7
            B7FFE0E2E2FF36342EFF001C0DFF003318FF36342EFF00000000000000000000
            000000000000000000000000000036342EFFE0E2E2FFD0D3D3FFBDC0C0FFABAD
            ADFFE0E2E2FF36342EFF000F07FF002813FF36342EFF00000000000000000000
            000000000000000000000000000036342EFF36342EFF36342EFF36342EFF3634
            2EFF36342EFF36342EFF36342EFF36342EFF36342EFF00000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
          SpeedButtonOptions.Transparent = True
          TabOrder = 0
        end
        object cxButton1: TcxButton
          Left = 9
          Top = 60
          Width = 91
          Height = 31
          Caption = #51068#44292#51077#47141
          LookAndFeel.SkinName = 'Caramel'
          OptionsImage.Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            20000000000000040000000000000000000000000000000000000000001F0C0C
            0C850B0B0B830B0B0B830B0B0B830A0A0A830A0A0A830A0A0A830A0A0A830A0A
            0A830A0A0A83090909840909098400000029000000000000000003030350FCFC
            FCFFECECECFFEBEBEBFFF9F9F9FFF7F7F7FFF7F7F7FFF7F7F7FFF5F5F5FFF5F5
            F5FFF5F5F5FFF5F5F5FFFCFCFCFF09090969000000000000000003030350FCFC
            FCFFB6B6B6FF60676FFFB3B3B3FFE7E7E7FFE7E7E7FFE8E8E8FFE8E8E8FFE8E8
            E8FFE8E8E8FFE8E8E8FFF9F9F9FF09090969000000000000000003030350FCFC
            FCFFE7E7E7FF99ABC7FF58719AFF888B8EFFE6E6E6FFE9E9E9FFE9E9E9FFE9E9
            E9FFE9E9E9FFE9E9E9FFFBFBFBFF09090969000000000000000004040450FCFC
            FCFFECECECFFCFCECEFF7FD7FFFF0389D4FF7D868CFFE9E9E9FFECECECFFECEC
            ECFFECECECFFECECECFFFCFCFCFF0A0A0A69000000000000000004040450FCFC
            FCFFF0F0F0FFF2F2F2FF98B8C0FF2CD7FFFF0685CCFF878D90FFEAEAEAFFEEEE
            EEFFEEEEEEFFEEEEEEFFFCFCFCFF0A0A0A69000000000000000004040450FCFC
            FCFFF5F5F5FFF5F5F5FFF5F5F5FFABBFC4FF2FD5FFFF0387D2FF7D878DFFEFEF
            EFFFF0F0F0FFF2F2F2FFFCFCFCFF0A0A0A69000000000000000004040450FCFC
            FCFFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFA0BBC3FF2FDAFFFF0587CFFF8D94
            98FFF3F3F3FFF3F3F3FFFCFCFCFF0B0B0B69000000000000000004040450FCFC
            FCFFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFABC0C6FF39D8FFFF0689
            CFFF808A90FFF4F4F4FFFCFCFCFF0B0B0B69000000000000000004040450FCFC
            FCFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFABC0C6FF35DB
            FFFF0489D2FF8F9599FFFCFCFCFF0B0B0B69000000000000000004040450FCFC
            FCFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFA5BC
            C2FF3EE2FFFF068BD0FF8E9498FF0A0A0A6B000000000000000004040450FCFC
            FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFC6C6
            C6FF8CA2A7FF39DEFFFF0883C7FF050B0FAB000000030000000004040450FCFC
            FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFFCBCB
            CBFFE8E8E8FFAABEC4FF78E1FFFF838B91FC050402740000000204040450FCFC
            FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF7F7F7FFCFCF
            CFFFFCFCFCFF757575C6504E4D84E6E5E4FF5B6C9EF60001043F04040451FCFC
            FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF7F7F7FFDADA
            DAFF7C7C7CCA0000000E0000000032353D607399ECF103050D3E00000000BABA
            BAF9B4B4B4F4B4B4B4F4B4B4B4F4B4B4B4F4B4B4B4F4B4B4B4F4B8B8B8F78080
            80C40000001800000000000000000404050D2535698100000112}
          SpeedButtonOptions.Transparent = True
          TabOrder = 1
          OnClick = cxButton1Click
        end
      end
    end
    object chkSelectAllList: TcxCheckBox
      Left = 514
      Top = 6
      Caption = #49440#53469
      TabOrder = 2
      Transparent = True
      OnClick = chkSelectAllListClick
      Width = 47
    end
    object Panel4: TPanel
      Left = 90
      Top = 8
      Width = 403
      Height = 13
      BevelOuter = bvNone
      Caption = #52972#47100#51228#47785#51012' '#53364#47533#54616#49884#47732' '#51221#47148'/'#54596#53552#47484' '#51060#50857#54616#49892' '#49688' '#51080#49845#45768#45796
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 3
    end
    object Panel5: TPanel
      Left = 260
      Top = 487
      Width = 217
      Height = 13
      BevelOuter = bvNone
      Caption = 'Keyword = '#39'F1'#39' '#54841#51008'  '#39'/'#39' + keyword '#51077#47141
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 10
    Top = 15
    Width = 521
    Height = 648
    Align = alLeft
    BevelOuter = bvLowered
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    TabOrder = 2
    object cxGroupBox3: TcxGroupBox
      Left = 4
      Top = 83
      Align = alClient
      Caption = #51077#50896#54872#51088
      ParentBackground = False
      ParentColor = False
      Style.Color = clBtnFace
      TabOrder = 0
      Height = 561
      Width = 513
      object cxGrid1: TcxGrid
        Left = 2
        Top = 18
        Width = 509
        Height = 541
        Align = alClient
        TabOrder = 0
        object cxGInOut: TcxGridTableView
          Navigator.Buttons.CustomButtons = <>
          OnCanFocusRecord = cxGInOutCanFocusRecord
          OnCustomDrawCell = cxGInOutCustomDrawCell
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = ' '
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          Styles.Inactive = dbMain.cxSelection
          object cxGInOutSelect: TcxGridColumn
            Caption = #49440#53469
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.Alignment = taCenter
            Properties.NullStyle = nssUnchecked
            HeaderAlignmentHorz = taCenter
            Options.Filtering = False
            Options.Sorting = False
            Width = 30
          end
          object cxGInOutPatientID: TcxGridColumn
            Caption = #54872#51088#48264#54840
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 56
          end
          object cxGInOutPatientName: TcxGridColumn
            Caption = #49457#47749
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 44
          end
          object cxGInOutSex: TcxGridColumn
            Caption = #49457#48324
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 29
          end
          object cxGInOutAge: TcxGridColumn
            Caption = #45208#51060
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 28
          end
          object cxGInOutInDate: TcxGridColumn
            Caption = #51077#50896#51068
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
          end
          object cxGInOutOutDate: TcxGridColumn
            Caption = #53748#50896#51068
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
          end
          object cxGInOutWard: TcxGridColumn
            Caption = #48337#46041
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 69
          end
          object cxGInOutBohum: TcxGridColumn
            Caption = #48372#54744
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taLeftJustify
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 100
          end
          object cxGInOutEnabled: TcxGridColumn
            DataBinding.ValueType = 'Boolean'
            Visible = False
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
          end
          object cxGInOutInOutID: TcxGridColumn
            Visible = False
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
          end
          object cxGInOutWardID: TcxGridColumn
            Visible = False
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
          end
          object cxGInOutWardDate: TcxGridColumn
            Caption = 'WardDate'
            Visible = False
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGInOut
        end
      end
    end
    object cxGroupBox5: TcxGroupBox
      Left = 4
      Top = 4
      Align = alTop
      Caption = #51077#50896' '#54872#51088' '#44160#49353
      ParentBackground = False
      ParentColor = False
      Style.Color = clBtnFace
      TabOrder = 1
      Height = 79
      Width = 513
      inline frameInOut: TframeInOutSearch
        Left = 2
        Top = 18
        Width = 509
        Height = 59
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 18
        ExplicitWidth = 509
        ExplicitHeight = 59
      end
    end
    object chkSelectAllInPatient: TcxCheckBox
      Left = 445
      Top = 83
      Caption = #49440#53469
      TabOrder = 2
      Transparent = True
      OnClick = chkSelectAllInPatientClick
      Width = 47
    end
    object pnlDate: TPanel
      Left = 108
      Top = 8
      Width = 391
      Height = 13
      BevelOuter = bvNone
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 3
    end
  end
  object dsPP: TDataSource
    DataSet = adoPP
    Left = 278
    Top = 216
  end
  object adoPP: TADOQuery
    Connection = dbMain.adoSocialWorkDB
    CursorType = ctStatic
    BeforePost = adoPPBeforePost
    Parameters = <>
    SQL.Strings = (
      'select TOP 1 *'
      
        '  from vProgramPatients Inner Join InOut on vProgramPatients.InO' +
        'utID = InOut.InOutID')
    Left = 280
    Top = 156
  end
  object TimerEvent: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerEventTimer
    Left = 376
    Top = 218
  end
  object TimerShow: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerShowTimer
    Left = 374
    Top = 162
  end
  object adopInOut: TADOStoredProc
    Connection = dbMain.adoSocialWorkDB
    CursorType = ctStatic
    AfterOpen = adopInOutAfterOpen
    ProcedureName = 'pInOut;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@HospitalID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
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
    Left = 72
    Top = 210
  end
end
