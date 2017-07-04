object frmDoJobAll: TfrmDoJobAll
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #51652#54665#45236#50857' '#51068#44292#51077#47141
  ClientHeight = 670
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  KeyPreview = True
  Padding.Left = 10
  Padding.Top = 30
  Padding.Right = 10
  Padding.Bottom = 10
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 739
    Top = 82
    Width = 80
    Height = 15
    Caption = 'TAB : '#45796#51020#44208#44284
  end
  object Label2: TLabel
    Left = 698
    Top = 100
    Width = 121
    Height = 15
    Caption = 'Shift + TAB : '#51060#51204#44208#44284
  end
  object btnClose: TcxButton
    Left = 728
    Top = 573
    Width = 80
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
  object cxGrid1: TcxGrid
    Left = 10
    Top = 30
    Width = 663
    Height = 630
    Align = alLeft
    TabOrder = 1
    object cxGWrite: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnEditKeyDown = cxGWriteEditKeyDown
      DataController.DataSource = frmDoJob.dsPP
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object cxGWritePatientName: TcxGridDBColumn
        Caption = #54872#51088#47749
        DataBinding.FieldName = 'PatientName'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 65
      end
      object cxGWriteSex: TcxGridDBColumn
        Caption = #49457#48324
        DataBinding.FieldName = 'Sex'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 35
      end
      object cxGWritePatientID: TcxGridDBColumn
        Caption = #54872#51088#48264#54840
        DataBinding.FieldName = 'PatientID'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 61
      end
      object cxGWriteBirthday: TcxGridDBColumn
        Caption = #49373#45380#50900#51068
        DataBinding.FieldName = 'Birthday'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 80
      end
      object cxGWriteResult: TcxGridDBColumn
        Caption = #44208#44284
        DataBinding.FieldName = 'Result'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.VisibleLineCount = 4
        HeaderAlignmentHorz = taCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 398
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGWrite
    end
  end
  object Panel5: TPanel
    Left = 260
    Top = 8
    Width = 413
    Height = 20
    BevelOuter = bvNone
    Caption = #51077#47141#49884' '#39'F1'#39' '#53412#47484' '#45572#47476#49884#47732' '#45800#52629#53412' '#45236#50669#51012' '#49440#53469#54616#49892' '#49688' '#51080#49845#45768#45796' !'
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 2
  end
end
