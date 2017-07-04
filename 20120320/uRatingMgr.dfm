object frmRatingMgr: TfrmRatingMgr
  Left = 0
  Top = 0
  Caption = #44060#48324#54217#44032#44288#47532
  ClientHeight = 662
  ClientWidth = 1167
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 71
    Width = 547
    Height = 591
    Align = alLeft
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    TabOrder = 0
    object cxGroupBox6: TcxGroupBox
      Left = 4
      Top = 4
      Align = alClient
      Caption = #54872#51088#47532#49828#53944
      ParentBackground = False
      ParentColor = False
      Style.Color = clBtnFace
      TabOrder = 0
      Height = 583
      Width = 539
      object cxGrid2: TcxGrid
        Left = 3
        Top = 15
        Width = 533
        Height = 558
        Align = alClient
        TabOrder = 0
        object cxGInOut: TcxGridDBTableView
          OnFocusedRecordChanged = cxGInOutFocusedRecordChanged
          DataController.DataSource = dsInOut
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.NoDataToDisplayInfoText = ' '
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          Styles.Inactive = dbMain.cxSelection
          object cxGInOutNo: TcxGridDBColumn
            Caption = 'No'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            OnGetDataText = cxGInOutNoGetDataText
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 26
          end
          object cxGInOutPatientID: TcxGridDBColumn
            Caption = #48264#54840
            DataBinding.FieldName = 'PatientID'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Width = 51
          end
          object cxGInOutPatientName: TcxGridDBColumn
            Caption = #49457#47749
            DataBinding.FieldName = 'PatientName'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Width = 47
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
            Width = 61
          end
          object cxGInOutWard: TcxGridDBColumn
            Caption = #48337#46041
            DataBinding.FieldName = 'WardName'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 73
          end
          object cxGInOutInDate: TcxGridDBColumn
            Caption = #51077#50896#51068#51088
            DataBinding.FieldName = 'InDate'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Width = 63
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
            Width = 62
          end
          object cxGInOutBohum: TcxGridDBColumn
            Caption = #48372#54744
            DataBinding.FieldName = 'BohumName'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Sorting = False
            Width = 87
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
  end
  object QRPP: TQuickRep
    Left = 600
    Top = 125
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QRPPBeforePrint
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRLOOPBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0')
    OnPreview = QRPPPreview
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stQRP
    PreviewLeft = 0
    PreviewTop = 0
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 47
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        124.354166666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 2
        Top = 10
        Width = 713
        Height = 36
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          95.250000000000000000
          5.291666666666667000
          26.458333333333330000
          1886.479166666667000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #54532#47196#44536#47016' '#44060#48324#54217#44032
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 18
      end
    end
    object bandFirst: TQRBand
      Left = 38
      Top = 85
      Width = 718
      Height = 77
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        203.729166666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRMemo6: TQRMemo
        Left = 100
        Top = 50
        Width = 250
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          264.583333333333400000
          132.291666666666700000
          661.458333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRMemo3: TQRMemo
        Left = 0
        Top = 25
        Width = 100
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          66.145833333333340000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = 14737632
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRMemo4: TQRMemo
        Left = 100
        Top = 25
        Width = 150
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          264.583333333333400000
          66.145833333333340000
          396.875000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRMemo14: TQRMemo
        Left = 0
        Top = 0
        Width = 100
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          0.000000000000000000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = 14737632
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel33: TQRLabel
        Left = 0
        Top = 4
        Width = 100
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          0.000000000000000000
          10.583333333333330000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #48337' '#47197' '#48264' '#54840
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRMemo15: TQRMemo
        Left = 100
        Top = 0
        Width = 150
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          264.583333333333400000
          0.000000000000000000
          396.875000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 107
        Top = 4
        Width = 136
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          283.104166666666700000
          10.583333333333330000
          359.833333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = adopInOut
        DataField = 'PatientID'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRMemo1: TQRMemo
        Left = 500
        Top = 0
        Width = 100
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          1322.916666666667000000
          0.000000000000000000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = 14737632
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 500
        Top = 4
        Width = 100
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1322.916666666667000000
          10.583333333333330000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #49457#48324'/'#50672#47161
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRMemo2: TQRMemo
        Left = 600
        Top = 0
        Width = 118
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          1587.500000000000000000
          0.000000000000000000
          312.208333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 1
        Top = 28
        Width = 100
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          2.645833333333333000
          74.083333333333340000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #48337'        '#46041
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRMemo5: TQRMemo
        Left = 0
        Top = 50
        Width = 100
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          132.291666666666700000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = 14737632
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 0
        Top = 54
        Width = 100
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          0.000000000000000000
          142.875000000000000000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #49324#54924' '#48373#51648#49324
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRMemo9: TQRMemo
        Left = 250
        Top = 0
        Width = 100
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          661.458333333333400000
          0.000000000000000000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = 14737632
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 250
        Top = 4
        Width = 100
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          661.458333333333400000
          10.583333333333330000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #49457'        '#47749
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRMemo10: TQRMemo
        Left = 350
        Top = 0
        Width = 150
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          926.041666666666800000
          0.000000000000000000
          396.875000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 356
        Top = 4
        Width = 136
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          941.916666666666800000
          10.583333333333330000
          359.833333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = adopInOut
        DataField = 'PatientName'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object lblSexAge: TQRLabel
        Left = 607
        Top = 4
        Width = 58
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1606.020833333333000000
          10.583333333333330000
          153.458333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #49457#48324'/'#50672#47161
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 107
        Top = 29
        Width = 136
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          283.104166666666700000
          76.729166666666680000
          359.833333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = adopInOut
        DataField = 'WardName'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRMemo11: TQRMemo
        Left = 250
        Top = 25
        Width = 100
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          661.458333333333400000
          66.145833333333340000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = 14737632
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRMemo16: TQRMemo
        Left = 350
        Top = 25
        Width = 150
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          926.041666666666800000
          66.145833333333340000
          396.875000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 250
        Top = 29
        Width = 100
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          661.458333333333400000
          76.729166666666680000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #48337'        '#49892
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 357
        Top = 29
        Width = 136
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          944.562500000000000000
          76.729166666666680000
          359.833333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = adopInOut
        DataField = 'QRDBText3'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRMemo17: TQRMemo
        Left = 500
        Top = 25
        Width = 100
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          1322.916666666667000000
          66.145833333333340000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = 14737632
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRMemo18: TQRMemo
        Left = 600
        Top = 25
        Width = 118
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          1587.500000000000000000
          66.145833333333340000
          312.208333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 500
        Top = 29
        Width = 100
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1322.916666666667000000
          76.729166666666680000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #51077' '#50896' '#45216' '#51676
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 607
        Top = 29
        Width = 102
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1606.020833333333000000
          76.729166666666680000
          269.875000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = adopInOut
        DataField = 'InDate'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText10: TQRDBText
        Left = 107
        Top = 54
        Width = 136
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          283.104166666666700000
          142.875000000000000000
          359.833333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = adopInOut
        DataField = 'WorkerName'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRMemo19: TQRMemo
        Left = 250
        Top = 50
        Width = 100
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          661.458333333333400000
          132.291666666666700000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = 14737632
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRMemo20: TQRMemo
        Left = 350
        Top = 50
        Width = 368
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          926.041666666666800000
          132.291666666666700000
          973.666666666666900000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 250
        Top = 54
        Width = 100
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          661.458333333333400000
          142.875000000000000000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #51221#49888#44284#51204#47928#51032
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBText11: TQRDBText
        Left = 356
        Top = 54
        Width = 353
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          941.916666666666800000
          142.875000000000000000
          933.979166666666600000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = adopInOut
        DataField = 'DoctorName'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object subbandResult: TQRSubDetail
      Left = 38
      Top = 197
      Width = 718
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = subbandResultBeforePrint
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333340000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRPP
      DataSet = adoPP
      PrintBefore = False
      PrintIfEmpty = True
      object qrMemoProgramBody: TQRMemo
        Left = 100
        Top = 0
        Width = 150
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          264.583333333333400000
          0.000000000000000000
          396.875000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrMemoResultBody: TQRMemo
        Left = 250
        Top = 0
        Width = 468
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          661.458333333333400000
          0.000000000000000000
          1238.250000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrMemoResultTitle: TQRMemo
        Left = 0
        Top = 0
        Width = 100
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          0.000000000000000000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 8
        Top = 4
        Width = 86
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          10.583333333333330000
          227.541666666666700000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = adoPP
        DataField = 'SDate'
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrMemoResult: TQRMemo
        Left = 258
        Top = 4
        Width = 451
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          682.625000000000000000
          10.583333333333330000
          1193.270833333333000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrMemoProgram: TQRMemo
        Left = 107
        Top = 4
        Width = 136
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          283.104166666666700000
          10.583333333333330000
          359.833333333333400000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object PageFooterBand1: TQRBand
      Left = 38
      Top = 222
      Width = 718
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel122: TQRLabel
        Left = 585
        Top = 0
        Width = 133
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1547.812500000000000000
          0.000000000000000000
          351.895833333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #49324#54924#49324#50629#49892' - '#44060#48324#54217#44032
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #47569#51008' '#44256#46357
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRSysData1: TQRSysData
        Left = 306
        Top = 2
        Width = 46
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          809.625000000000000000
          5.291666666666667000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Transparent = False
        ExportAs = exptText
        FontSize = 10
      end
      object lblPageCount: TQRLabel
        Left = 352
        Top = 2
        Width = 53
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          931.333333333333400000
          5.291666666666667000
          140.229166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #54168#51060#51648#49688
        Color = clWhite
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRDBImage1: TQRDBImage
        Left = 0
        Top = 0
        Width = 155
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          0.000000000000000000
          0.000000000000000000
          410.104166666666800000)
        XLColumn = 0
        DataField = 'HospitalImage'
        DataSet = adoHospital
      end
    end
    object bandSubTitle: TQRChildBand
      Left = 38
      Top = 162
      Width = 718
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = subbandResult
      Size.Values = (
        92.604166666666680000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = bandFirst
      PrintOrder = cboAfterParent
      object QRMemo7: TQRMemo
        Left = 0
        Top = 10
        Width = 100
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          0.000000000000000000
          26.458333333333330000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = 14737632
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 0
        Top = 14
        Width = 100
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          0.000000000000000000
          37.041666666666670000
          264.583333333333400000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #51068'        '#49884
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRMemo8: TQRMemo
        Left = 100
        Top = 10
        Width = 150
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          264.583333333333400000
          26.458333333333330000
          396.875000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = 14737632
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 100
        Top = 14
        Width = 150
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          264.583333333333400000
          37.041666666666670000
          396.875000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #54532#47196#44536#47016#47749
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
      object QRMemo22: TQRMemo
        Left = 250
        Top = 10
        Width = 468
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          66.145833333333340000
          661.458333333333400000
          26.458333333333330000
          1238.250000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = 14737632
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 250
        Top = 14
        Width = 468
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          661.458333333333400000
          37.041666666666670000
          1238.250000000000000000)
        XLColumn = 0
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #44060' '#48324' '#54217' '#44032
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 10
      end
    end
  end
  object QRPreview: TQRPreview
    Left = 562
    Top = 461
    Width = 594
    Height = 615
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    TabOrder = 3
    PageNumber = 1
    Zoom = 100
  end
  object memoProgram: TMemo
    Left = 575
    Top = 327
    Width = 136
    Height = 24
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ImeName = 'Microsoft Office IME 2007'
    Lines.Strings = (
      'memoProgram')
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object memoResult: TMemo
    Left = 613
    Top = 319
    Width = 451
    Height = 76
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #47569#51008' '#44256#46357
    Font.Style = []
    ImeName = 'Microsoft Office IME 2007'
    Lines.Strings = (
      'memoResult')
    ParentFont = False
    TabOrder = 5
    Visible = False
  end
  object Panel8: TPanel
    Left = 0
    Top = 0
    Width = 1167
    Height = 71
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object btnPreviewFit: TSpeedButton
      Left = 735
      Top = 41
      Width = 28
      Height = 26
      GroupIndex = 2
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000000000000000000000000000000000
        00000000000000000000C6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
        C6FFC6C6C6FFC6C6C6FF000000FF000000000000000000000000000000000000
        00000000000000000000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC6C6C6FF000000FF000000000000000000000000000000000000
        00000000000000000000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC6C6C6FF000000FF000000000000000000000000000000000000
        00000000000000000000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC6C6C6FF000000FF000000000000000000000000000000000000
        00000000000000000000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC6C6C6FF000000FF000000000000000000000000000000000000
        00000000000000000000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC6C6C6FF000000FF000000000000000000000000000000000000
        00000000000000000000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC6C6C6FF000000FF000000000000000000000000000000000000
        00000000000000000000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC6C6C6FF000000FF000000000000000000000000000000000000
        00000000000000000000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC6C6C6FF000000FF000000000000000000000000000000000000
        00000000000000000000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC6C6C6FF000000FF000000000000000000000000000000000000
        00000000000000000000C6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
        C6FFC6C6C6FFC6C6C6FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = btnPreviewFitClick
    end
    object btnPreviewWidth: TSpeedButton
      Left = 763
      Top = 41
      Width = 28
      Height = 26
      GroupIndex = 2
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FF0000000000000000000000000000
        0000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FF0000000000000000000000000000
        0000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FF0000000000000000000000000000
        0000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FF0000000000000000000000000000
        0000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FF0000000000000000FF0000FF0000
        0000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FF00000000FF0000FFFF0000FFFF00
        00FFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FFC6C6C6FFFF0000FFFF0000FFFF0000FFFF00
        00FFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
        00FFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFFF0000FFFF0000FFFF0000FF0000
        0000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FF00000000FF0000FF000000000000
        0000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FF0000000000000000000000000000
        0000C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FF0000000000000000000000000000
        0000C6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
        C6FFC6C6C6FFC6C6C6FFC6C6C6FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = btnPreviewFitClick
    end
    object btnPreview100: TSpeedButton
      Left = 791
      Top = 41
      Width = 28
      Height = 26
      GroupIndex = 2
      Down = True
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000C40E0000C40E00000000000000000000D8E9ECFFD8E9
        ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC6C6C6FF000000FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6C6FFC6C6
        C6FFC6C6C6FFC6C6C6FFC6C6C6FFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9
        ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFFD8E9ECFF}
      OnClick = btnPreviewFitClick
    end
    object Label1: TLabel
      Left = 825
      Top = 47
      Width = 26
      Height = 13
      Caption = 'Zoom'
    end
    object Label10: TLabel
      Left = 898
      Top = 46
      Width = 11
      Height = 13
      Caption = '%'
    end
    object btnPrior: TcxButton
      Left = 617
      Top = 41
      Width = 36
      Height = 26
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000B7A190FFB7A190FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000B7A190FFB7A394FFB7A190FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000B7A190FFB9A595FFBCAB9DFFB7A190FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000B7A190FFBBA797FFC0B0A1FFC0B0A1FFBBA797FFB7A1
        90FFB7A190FF00000000B7A190FFB7A190FFB7A190FFB7A190FF000000000000
        000000000000B7A190FFBDA999FFC5B4A5FFC5B4A5FFC5B4A5FFC5B4A5FFC5B4
        A5FFB7A190FF00000000B7A190FFC5B4A5FFC5B4A5FFB7A190FF000000000000
        0000B7A190FFBFAB9BFFCBBAAAFFCBBAAAFFCBBAAAFFCBBAAAFFCBBAAAFFCBBA
        AAFFB7A190FF00000000B7A190FFCBBAAAFFCBBAAAFFB7A190FF00000000B7A1
        90FFC2AD9DFFD1BFAFFFD1BFAFFFD1BFAFFFD1BFAFFFD1BFAFFFD1BFAFFFD1BF
        AFFFB7A190FF00000000B7A190FFD1BFAFFFD1BFAFFFB7A190FFB7A190FFC8B6
        A6FFD7C5B4FFD7C5B4FFD7C5B4FFD7C5B4FFD7C5B4FFD7C5B4FFD7C5B4FFD7C5
        B4FFB7A190FF00000000B7A190FFD7C5B4FFD7C5B4FFB7A190FFB7A190FFCCBB
        ACFFE4D6C9FFDCC9B9FFDCC9B9FFDCC9B9FFDCC9B9FFDCC9B9FFDCC9B9FFDCC9
        B9FFB7A190FF00000000B7A190FFDCC9B9FFDCC9B9FFB7A190FF00000000B7A1
        90FFCEBCAEFFE9DACDFFE2CFBEFFE2CFBEFFE2CFBEFFE2CFBEFFE2CFBEFFE2CF
        BEFFB7A190FF00000000B7A190FFE2CFBEFFE2CFBEFFB7A190FF000000000000
        0000B7A190FFCFBDAFFFEDDED1FFE8D4C3FFE8D4C3FFE8D4C3FFE8D4C3FFE8D4
        C3FFB7A190FF00000000B7A190FFE8D4C3FFE8D4C3FFB7A190FF000000000000
        000000000000B7A190FFD0BEB0FFF1E2D4FFEDD9C7FFEDD9C7FFF1E2D4FFF4E8
        DDFFB7A190FF00000000B7A190FFF4E8DDFFF4E8DDFFB7A190FF000000000000
        00000000000000000000B7A190FFD1BFB1FFF5E5D7FFF2DDCBFFD1BFB1FFB7A1
        90FFB7A190FF00000000B7A190FFB7A190FFB7A190FFB7A190FF000000000000
        0000000000000000000000000000B7A190FFD3C1B2FFF9E9DAFFB7A190FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000B7A190FFD3C1B3FFB7A190FF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000B7A190FFB7A190FF0000
        0000000000000000000000000000000000000000000000000000}
      LookAndFeel.SkinName = 'Caramel'
      SpeedButtonOptions.Transparent = True
      TabOrder = 0
      OnClick = btnPriorClick
    end
    object btnNext: TcxButton
      Left = 694
      Top = 41
      Width = 36
      Height = 26
      Glyph.Data = {
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
      LookAndFeel.SkinName = 'Caramel'
      SpeedButtonOptions.Transparent = True
      TabOrder = 1
      OnClick = btnNextClick
    end
    object pnlPageNum: TPanel
      Left = 656
      Top = 41
      Width = 35
      Height = 26
      BevelOuter = bvLowered
      Caption = 'pnlPageNum'
      TabOrder = 2
    end
    object btnPrinterSetup: TcxButton
      Left = 789
      Top = 9
      Width = 80
      Height = 26
      Caption = 'Print Setup'
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
      TabOrder = 3
      OnClick = btnPrinterSetupClick
    end
    object btnPrint: TcxButton
      Left = 617
      Top = 9
      Width = 80
      Height = 26
      Caption = 'Print'
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
      TabOrder = 4
      OnClick = btnPrintClick
    end
    object cxSEZoom: TcxSpinEdit
      Left = 852
      Top = 44
      Properties.MaxValue = 100.000000000000000000
      Properties.MinValue = 1.000000000000000000
      Properties.OnChange = btnPreviewFitClick
      TabOrder = 5
      Value = 100
      Width = 44
    end
    object cxButton1: TcxButton
      Left = 914
      Top = 9
      Width = 80
      Height = 26
      Caption = #45803#44592
      Glyph.Data = {
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
      LookAndFeel.SkinName = 'Caramel'
      ModalResult = 11
      SpeedButtonOptions.Transparent = True
      TabOrder = 6
    end
    object cxGroupBox3: TcxGroupBox
      Left = 7
      Top = 11
      Caption = #52280#49437#45380#50900
      ParentBackground = False
      ParentColor = False
      Style.Color = clBtnFace
      TabOrder = 7
      Height = 48
      Width = 95
      object cxDate: TcxDateEdit
        Left = 7
        Top = 16
        Properties.OnChange = cxDatePropertiesChange
        Style.HotTrack = False
        StyleDisabled.TextColor = clWindowText
        TabOrder = 0
        Width = 79
      end
    end
    inline frameInOut: TframeInOutSearch
      Left = 114
      Top = 8
      Width = 460
      Height = 57
      TabOrder = 8
      ExplicitLeft = 114
      ExplicitTop = 8
    end
    object btnPringAll: TcxButton
      Left = 703
      Top = 9
      Width = 80
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
      TabOrder = 9
      OnClick = btnPringAllClick
    end
  end
  object dsInOut: TDataSource
    DataSet = adopInOut
    Left = 216
    Top = 208
  end
  object TimerClose: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerCloseTimer
    Left = 342
    Top = 232
  end
  object adoPP: TADOQuery
    Connection = dbMain.adoSocialWorkDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select PP.*'
      '       ,SDate'
      
        '       ,(select ProgramName from Programs where Programs.Program' +
        'ID=Schedule.ProgramID) as ProgramName'
      
        '  from ProgramPatients as PP INNER JOIN Schedule ON Schedule.Sch' +
        'eduleID=PP.ScheduleID'
      ' order by sDate Desc')
    Left = 194
    Top = 410
  end
  object dsPP: TDataSource
    DataSet = adoPP
    Left = 252
    Top = 412
  end
  object adoHospital: TADOQuery
    Connection = dbMain.adoSocialWorkDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from hospitals')
    Left = 68
    Top = 236
  end
  object adopInOut: TADOStoredProc
    Connection = dbMain.adoSocialWorkDB
    CursorType = ctStatic
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
    Left = 154
    Top = 210
  end
end
