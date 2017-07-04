object frmUserMgr: TfrmUserMgr
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #49324#50857#51088#44288#47532
  ClientHeight = 424
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 15
  Padding.Top = 30
  Padding.Right = 15
  Padding.Bottom = 15
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxG: TcxGrid
    Left = 15
    Top = 30
    Width = 368
    Height = 379
    Align = alLeft
    TabOrder = 0
    object cxGUser: TcxGridDBTableView
      OnCustomDrawCell = cxGUserCustomDrawCell
      DataController.DataSource = dsUser
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.Inactive = dbMain.cxSelection
      object cxGUserUserID: TcxGridDBColumn
        DataBinding.FieldName = 'UserID'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 75
      end
      object cxGUserUserName: TcxGridDBColumn
        DataBinding.FieldName = 'UserName'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 108
      end
      object cxGUserWorker: TcxGridDBColumn
        DataBinding.FieldName = 'Worker'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 41
      end
      object cxGUserDoctor: TcxGridDBColumn
        DataBinding.FieldName = 'Doctor'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 38
      end
      object cxGUserAdmin: TcxGridDBColumn
        DataBinding.FieldName = 'Admin'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 35
      end
      object cxGUserUsed: TcxGridDBColumn
        DataBinding.FieldName = 'Used'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Sorting = False
        Width = 32
      end
    end
    object cxGLevel1: TcxGridLevel
      GridView = cxGUser
    end
  end
  object btnUserAppend: TcxButton
    Left = 399
    Top = 64
    Width = 75
    Height = 50
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
    Layout = blGlyphTop
    LookAndFeel.SkinName = 'Caramel'
    SpeedButtonOptions.Transparent = True
    TabOrder = 1
    OnClick = btnUserAppendClick
  end
  object btnUserUpdate: TcxButton
    Left = 399
    Top = 120
    Width = 75
    Height = 50
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
    Layout = blGlyphTop
    LookAndFeel.SkinName = 'Caramel'
    SpeedButtonOptions.Transparent = True
    TabOrder = 2
    OnClick = btnUserUpdateClick
  end
  object chkUsed: TcxCheckBox
    Left = 336
    Top = 9
    Caption = 'Used'
    TabOrder = 3
    Transparent = True
    OnClick = chkUsedClick
    Width = 47
  end
  object adoUser: TADOQuery
    Connection = dbMain.adoSocialWorkDB
    CursorType = ctStatic
    AfterOpen = adoUserAfterOpen
    AfterClose = adoUserAfterClose
    Parameters = <>
    SQL.Strings = (
      'select * from users')
    Left = 112
    Top = 142
  end
  object dsUser: TDataSource
    DataSet = adoUser
    OnDataChange = dsUserDataChange
    Left = 176
    Top = 140
  end
end
