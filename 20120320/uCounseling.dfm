object frmCounseling: TfrmCounseling
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #49324#54924#49324#50629#51648#46020
  ClientHeight = 669
  ClientWidth = 1018
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Padding.Left = 15
  Padding.Top = 15
  Padding.Right = 15
  Padding.Bottom = 15
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox4: TcxGroupBox
    Left = 8
    Top = 15
    Caption = #54872#51088#47749
    TabOrder = 0
    Height = 50
    Width = 220
    object txtPatientName: TcxTextEdit
      Left = 6
      Top = 18
      Enabled = False
      Properties.Alignment.Horz = taCenter
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.Color = clBtnFace
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.TextColor = clWindowText
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 0
      Text = 'txtPatientName'
      Width = 200
    end
  end
  object cxGroupBox6: TcxGroupBox
    Left = 226
    Top = 15
    Caption = #49457#48324'/'#45208#51060
    TabOrder = 1
    Height = 50
    Width = 220
    object txtSexAge: TcxTextEdit
      Left = 8
      Top = 18
      Enabled = False
      Properties.Alignment.Horz = taCenter
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.Color = clBtnFace
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.TextColor = clWindowText
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 0
      Text = 'txtUserID'
      Width = 200
    end
  end
  object cxGroupBox5: TcxGroupBox
    Left = 8
    Top = 64
    Caption = #51077#50896#51068#49884
    TabOrder = 2
    Height = 50
    Width = 219
    object cxDateInDate: TcxDateEdit
      Left = 6
      Top = 18
      Enabled = False
      Style.HotTrack = False
      StyleDisabled.Color = clBtnFace
      StyleDisabled.TextColor = clWindowText
      TabOrder = 0
      Width = 200
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 452
    Top = 15
    Caption = #51652#45800#47749
    TabOrder = 3
    Height = 50
    Width = 220
    object txtDiag: TcxTextEdit
      Left = 6
      Top = 17
      Enabled = False
      Properties.ReadOnly = True
      Style.Color = clBtnFace
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.Color = clBtnFace
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.TextColor = clWindowText
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 0
      Text = 'txtUserID'
      Width = 200
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 670
    Top = 15
    Caption = #51452#52824#51032
    TabOrder = 4
    Height = 50
    Width = 220
    object txtDoctor: TcxTextEdit
      Left = 8
      Top = 17
      Enabled = False
      Properties.Alignment.Horz = taCenter
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.TextColor = clWindowText
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 0
      Text = 'txtUserID'
      Width = 201
    end
  end
  object cxGroupBox9: TcxGroupBox
    Left = 226
    Top = 64
    Caption = #49345#45812#51068#49884
    TabOrder = 5
    Height = 50
    Width = 220
    object cxDateMeetingDate: TcxDateEdit
      Left = 7
      Top = 17
      Style.Color = 15782908
      Style.HotTrack = False
      TabOrder = 0
      Width = 200
    end
  end
  object cxGroupBox7: TcxGroupBox
    Left = 8
    Top = 128
    Caption = #49900#47532' '#49324#54924#51201' '#47928#51228
    TabOrder = 6
    Height = 149
    Width = 438
    object chkA1: TcxCheckBox
      Left = 34
      Top = 22
      Caption = #44032#51313#44368#50977' '#48143' '#44032#51313#44036#51032' '#44040#46321' '#49345#45812
      TabOrder = 0
      Transparent = True
      Width = 392
    end
    object chkA2: TcxCheckBox
      Left = 34
      Top = 44
      Caption = #54617#44368' '#48143' '#51649#51109#50640#49436#51032' '#48512#51201#51025' '#47928#51228' '#49345#45812
      TabOrder = 1
      Transparent = True
      Width = 392
    end
    object chkA3: TcxCheckBox
      Left = 34
      Top = 66
      Caption = #50896#47564#54620' '#48337#46041#49373#54876' '#51201#51025#51648#46020' '#48143' '#49345#45812
      TabOrder = 2
      Transparent = True
      Width = 392
    end
    object chkA4: TcxCheckBox
      Left = 34
      Top = 88
      Caption = #44032#51313' '#48143' '#49324#54924#51201' '#54872#44221#51312#49324
      TabOrder = 3
      Transparent = True
      Width = 392
    end
    object chkA5: TcxCheckBox
      Left = 34
      Top = 110
      Caption = #51221#49436#51201' '#51648#51648' '#48143' '#49324#54924#51201#51025#47141' '#54217#44032
      TabOrder = 4
      Transparent = True
      Width = 392
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 8
    Top = 277
    Caption = #53748#50896#44228#54925
    TabOrder = 7
    Height = 149
    Width = 438
    object chkB1: TcxCheckBox
      Left = 34
      Top = 22
      Caption = #53748#50896#44228#54925' '#49688#47549' '#48143' '#51648#46020
      TabOrder = 0
      Transparent = True
      Width = 392
    end
    object chkB2: TcxCheckBox
      Left = 34
      Top = 44
      Caption = #53748#50896' '#54980' '#44032#51313#44288#44228
      TabOrder = 1
      Transparent = True
      Width = 392
    end
    object chkB3: TcxCheckBox
      Left = 34
      Top = 66
      Caption = #53748#50896' '#54980' '#54617#44368' '#48143' '#51649#51109#49373#54876#51032' '#51201#51025#47928#51228
      TabOrder = 2
      Transparent = True
      Width = 392
    end
    object chkB4: TcxCheckBox
      Left = 34
      Top = 88
      Caption = #53748#50896' '#54980' '#45824#51064#44288#44228' '#44060#49440
      TabOrder = 3
      Transparent = True
      Width = 392
    end
    object chkB5: TcxCheckBox
      Left = 34
      Top = 110
      Caption = #53748#50896' '#54980' '#44228#49549#51201#51064' '#50557#47932#44288#47532' '#48143' '#48337#50896#44284#51032' '#50672#44228
      TabOrder = 4
      Transparent = True
      Width = 392
    end
  end
  object cxGroupBox8: TcxGroupBox
    Left = 8
    Top = 426
    Caption = #51116#54876
    TabOrder = 8
    Height = 107
    Width = 438
    object chkC1: TcxCheckBox
      Left = 34
      Top = 22
      Caption = #49324#54924#48373#44480#50640' '#45824#54620' '#49345#45812
      TabOrder = 0
      Transparent = True
      Width = 392
    end
    object chkC2: TcxCheckBox
      Left = 34
      Top = 44
      Caption = #50668#44032#49440#50857' '#51648#46020' '#48143' '#50508#49440
      TabOrder = 1
      Transparent = True
      Width = 392
    end
    object chkC3: TcxCheckBox
      Left = 34
      Top = 66
      Caption = #50808#48149#49884#51032' '#49324#54924#51201#51025' '#47928#51228' '#49345#45812
      TabOrder = 2
      Transparent = True
      Width = 392
    end
  end
  object cxGroupBox10: TcxGroupBox
    Left = 8
    Top = 533
    Caption = #44221#51228#51201#51064' '#47928#51228
    TabOrder = 9
    Height = 84
    Width = 438
    object chkD1: TcxCheckBox
      Left = 34
      Top = 22
      Caption = #44221#51228#51201' '#48512#45812' '#49345#45812
      TabOrder = 0
      Transparent = True
      Width = 392
    end
    object chkD2: TcxCheckBox
      Left = 34
      Top = 44
      Caption = #49324#54924#48372#49345' '#48143' '#48277#51201' '#51228#46020#50640' '#45824#54620' '#51221#48372#51228#44277
      TabOrder = 1
      Transparent = True
      Width = 392
    end
  end
  object cxGroupBox11: TcxGroupBox
    Left = 452
    Top = 128
    Caption = #51648#50669#49324#54924' '#51088#50896#50672#44208
    TabOrder = 10
    Height = 129
    Width = 438
    object chkE1: TcxCheckBox
      Left = 34
      Top = 22
      Caption = 'A.A '#47784#51076#50504#45236
      TabOrder = 0
      Transparent = True
      Width = 392
    end
    object chkE2: TcxCheckBox
      Left = 34
      Top = 44
      Caption = #49324#54924#48373#44480#49884#49444#50640' '#45824#54620' '#51221#48372#51228#44277
      TabOrder = 1
      Transparent = True
      Width = 392
    end
    object chkE3: TcxCheckBox
      Left = 34
      Top = 66
      Caption = #45230#48337#50896' '#49548#44060' '#48143' '#50672#44208
      TabOrder = 2
      Transparent = True
      Width = 392
    end
    object chkE4: TcxCheckBox
      Left = 34
      Top = 88
      Caption = #51648#50669#49324#54924#48373#51648#44288' '#48143' '#51221#49888' '#48372#44148#49468#53552' '#49548#44060
      TabOrder = 3
      Transparent = True
      Width = 392
    end
  end
  object cxGroupBox12: TcxGroupBox
    Left = 452
    Top = 257
    Caption = #44592#53440
    TabOrder = 11
    Height = 84
    Width = 438
    object chkF1: TcxCheckBox
      Left = 34
      Top = 22
      Caption = #48337#46041#49373#54876' '#48143' '#51665#45800#50836#48277' '#49884' '#48156#44204#46104#45716' '#47928#51228#51216#51012' '#45812#45817' '#51452#52824#51032#50752' '#54801#51032#54632
      TabOrder = 0
      Transparent = True
      Width = 392
    end
    object chkF2: TcxCheckBox
      Left = 34
      Top = 44
      Caption = #44592#53440
      TabOrder = 1
      Transparent = True
      Width = 392
    end
  end
  object cxGroupBox21: TcxGroupBox
    Left = 452
    Top = 341
    Caption = 'Worker'#39's Opinion'
    TabOrder = 12
    Height = 276
    Width = 438
    object memoWorkerOpinion: TMemo
      Left = 6
      Top = 19
      Width = 420
      Height = 240
      Color = 12968956
      ImeName = 'Microsoft Office IME 2007'
      Lines.Strings = (
        'Memo1')
      MaxLength = 3000
      ScrollBars = ssVertical
      TabOrder = 0
      OnKeyDown = memoWorkerOpinionKeyDown
    end
  end
  object btnSave: TcxButton
    Left = 904
    Top = 128
    Width = 100
    Height = 50
    Caption = #51200#51109
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      00006A5347FF6A5347FF6A5347FF6A5347FF6A5347FF6A5347FF6A5347FF6A53
      47FF6A5347FF6A5347FF6A5347FF6A5347FF6A5347FF00000000000000006D56
      4AFF9C7D6EFF856A5CFFD9D9D9FFD4D4D4FFD1D1D1FFCECECEFFC6C6C6FFC3C3
      C3FFC2C2C2FFC2C2C2FF856A5CFF7A5E51FF9C7D6EFF6D564AFF715A4FFFA182
      73FFA18273FF8A6F62FFDDDDDDFF7F6356FFA18273FFDADADAFFD3D3D3FFCECE
      CEFFCBCBCBFFC8C8C8FF8A6F62FF7F6356FFA18273FF715A4FFF765F53FFA788
      79FFA78879FF907568FFDFDFDFFF85695CFFA78879FFDEDEDEFFDDDDDDFFD9D9
      D9FFD4D4D4FFD0D0D0FF907568FF85695CFFA78879FF765F53FF7A6358FFAE8F
      80FFAE8F80FF977C6EFFE0E0E0FF8C7063FFAE8F80FFE0E0E0FFDFDFDFFFDEDE
      DEFFDDDDDDFFD8D8D8FF977C6EFF8C7063FFAE8F80FF7A6358FF80685DFFB595
      86FFB59586FF9E8375FFE0E0E0FFE1E1E1FFE2E2E2FFE2E2E2FFE1E1E1FFE0E0
      E0FFE0E0E0FFDEDEDEFF9E8375FF92776AFFB59586FF80685DFF866E63FFBC9D
      8EFFBC9D8EFFBC9D8EFFA58A7DFFA58A7DFFA58A7DFFA58A7DFFA58A7DFFA58A
      7DFFA58A7DFFA58A7DFF9A7E71FF9A7E71FFBC9D8EFF866E63FF8B7468FFC4A4
      95FFC4A495FFC4A495FFC4A495FFC4A495FFC4A495FFC4A495FFC4A495FFC4A4
      95FFC4A495FFC4A495FFC4A495FFC4A495FFC4A495FF8B7468FF917A6EFFCBAC
      9DFFB4998CFFB4998CFFB4998CFFB4998CFFB4998CFFB4998CFFB4998CFFB499
      8CFFB4998CFFB4998CFFB4998CFFB4998CFFCBAC9DFF917A6EFF967F74FFD3B3
      A4FFBCA193FFF4F4F4FFEBEBEBFFE3E3E3FFDDDDDDFFD9D9D9FFD6D6D6FFD5D5
      D5FFD5D5D5FFD7D7D7FFDADADAFFBCA193FFD3B3A4FF967F74FF9B8479FFDABA
      ABFFC2A79AFFFEFEFEFFF8F8F8FFF1F1F1FFECECECFFE7E7E7FFE3E3E3FFE1E1
      E1FFDFDFDFFFDFDFDFFFDFDFDFFFC2A79AFFDABAABFF9B8479FFA1897EFFE0C1
      B2FFC9AEA1FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFF8F8F8FFF5F5F5FFF1F1
      F1FFEDEDEDFFEAEAEAFFE7E7E7FFC9AEA1FFE0C1B2FFA1897EFFA58E83FFE6C7
      B8FFCFB4A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFCFCFCFFF7F7F7FFF1F1F1FFCFB4A7FFE6C7B8FFA58E83FFA99286FFECCC
      BDFFD4B9ACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFCFCFCFFD4B9ACFFECCCBDFFA99286FFAC9589FFF0D1
      C2FFD9BEB0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFD9BEB0FFF0D1C2FFAC9589FF00000000AF98
      8CFFAF988CFFAF988CFFAF988CFFAF988CFFAF988CFFAF988CFFAF988CFFAF98
      8CFFAF988CFFAF988CFFAF988CFFAF988CFFAF988CFF00000000}
    Layout = blGlyphTop
    LookAndFeel.SkinName = 'Caramel'
    SpeedButtonOptions.Transparent = True
    TabOrder = 13
    OnClick = btnSaveClick
  end
  object cxButton3: TcxButton
    Left = 904
    Top = 184
    Width = 100
    Height = 50
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
    Layout = blGlyphTop
    LookAndFeel.SkinName = 'Caramel'
    ModalResult = 11
    SpeedButtonOptions.Transparent = True
    TabOrder = 14
  end
  object Panel6: TPanel
    Left = 661
    Top = 345
    Width = 217
    Height = 13
    BevelOuter = bvNone
    Caption = 'Keyword = '#39'F1'#39' '#54841#51008'  '#39'/'#39' + keyword '#51077#47141
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 15
  end
end
