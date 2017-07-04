object frmTherapyEdit: TfrmTherapyEdit
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #51221#49888#52824#47308#51068#51221
  ClientHeight = 768
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Padding.Left = 3
  Padding.Top = 3
  Padding.Right = 3
  Padding.Bottom = 3
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox8: TcxGroupBox
    Left = 18
    Top = 222
    Caption = #45236#50857
    TabOrder = 0
    Height = 50
    Width = 438
    object txtContent: TcxTextEdit
      Left = 6
      Top = 17
      Properties.MaxLength = 100
      Style.Color = 15782908
      Style.HotTrack = False
      Style.LookAndFeel.SkinName = 'Caramel'
      StyleDisabled.Color = clBtnFace
      StyleDisabled.LookAndFeel.SkinName = 'Caramel'
      StyleFocused.LookAndFeel.SkinName = 'Caramel'
      StyleHot.LookAndFeel.SkinName = 'Caramel'
      TabOrder = 0
      Text = 'txtUserID'
      OnKeyDown = cboProgramKeyDown
      Width = 416
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 18
    Top = 18
    Caption = #54532#47196#44536#47016#47749
    ParentBackground = False
    ParentColor = False
    Style.Color = clBtnFace
    TabOrder = 1
    Height = 50
    Width = 438
    object cboProgram: TcxComboBox
      Left = 6
      Top = 17
      Properties.DropDownListStyle = lsEditFixedList
      Properties.DropDownRows = 20
      Properties.ItemHeight = 18
      Style.BorderColor = clWindowFrame
      Style.Color = 15782908
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      OnKeyDown = cboProgramKeyDown
      Width = 416
    end
  end
  object cxGroupBox5: TcxGroupBox
    Left = 18
    Top = 69
    Caption = #51068#51088
    TabOrder = 2
    Height = 50
    Width = 149
    object cxDateStart: TcxDateEdit
      Left = 6
      Top = 18
      Style.Color = 15782908
      Style.HotTrack = False
      StyleDisabled.TextColor = clWindowText
      TabOrder = 0
      OnKeyDown = cboProgramKeyDown
      Width = 109
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 167
    Top = 119
    Caption = #51109#49548
    TabOrder = 3
    Height = 50
    Width = 289
    object cxBELocation: TcxButtonEdit
      Left = 6
      Top = 16
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxBELocationPropertiesButtonClick
      Style.Color = 14737632
      TabOrder = 0
      Text = 'cxBELocation'
      Width = 267
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 167
    Top = 171
    Caption = #51652#54665#51088
    TabOrder = 4
    Height = 50
    Width = 289
    object cxBEChairman: TcxButtonEdit
      Left = 6
      Top = 16
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = cxBEChairmanPropertiesButtonClick
      Style.Color = 14737632
      TabOrder = 0
      Text = 'cxButtonEdit1'
      Width = 267
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 18
    Top = 119
    Caption = #49324#54924#48373#51648#49324
    TabOrder = 5
    Height = 50
    Width = 149
    object cboWorker: TcxComboBox
      Left = 6
      Top = 17
      Properties.DropDownListStyle = lsFixedList
      Properties.ItemHeight = 18
      Style.Color = 15782908
      TabOrder = 0
      OnKeyDown = cboProgramKeyDown
      Width = 113
    end
  end
  object cxGroupBox6: TcxGroupBox
    Left = 18
    Top = 171
    Caption = #51221#49888#44284#51204#47928#51032
    TabOrder = 6
    Height = 50
    Width = 149
    object cboDoctor: TcxComboBox
      Left = 6
      Top = 17
      Properties.DropDownListStyle = lsFixedList
      Style.Color = clWindow
      TabOrder = 0
      OnKeyDown = cboProgramKeyDown
      Width = 113
    end
  end
  object cxGroupBox22: TcxGroupBox
    Left = 18
    Top = 273
    Caption = #51652#54665#51088#51032#44204
    TabOrder = 7
    Height = 160
    Width = 438
    object memoChairmanOpinion: TMemo
      Left = 7
      Top = 19
      Width = 420
      Height = 126
      ImeName = 'Microsoft Office IME 2007'
      Lines.Strings = (
        'Memo1')
      MaxLength = 1000
      ScrollBars = ssVertical
      TabOrder = 0
      OnKeyDown = cboProgramKeyDown
    end
  end
  object cxGroupBox10: TcxGroupBox
    Left = 18
    Top = 434
    Caption = #48373#51648#49324#51032#44204
    TabOrder = 8
    Height = 160
    Width = 438
    object memoWorkerOpinion: TMemo
      Left = 6
      Top = 19
      Width = 420
      Height = 126
      ImeName = 'Microsoft Office IME 2007'
      Lines.Strings = (
        'Memo1')
      MaxLength = 1000
      ScrollBars = ssVertical
      TabOrder = 0
      OnKeyDown = cboProgramKeyDown
    end
  end
  object cxGroupBox11: TcxGroupBox
    Left = 18
    Top = 596
    Caption = #51204#47928#51032#51032#44204
    TabOrder = 9
    Height = 160
    Width = 438
    object memoDoctorOpinion: TMemo
      Left = 7
      Top = 19
      Width = 420
      Height = 124
      ImeName = 'Microsoft Office IME 2007'
      Lines.Strings = (
        'Memo1')
      MaxLength = 1000
      ScrollBars = ssVertical
      TabOrder = 0
      OnKeyDown = cboProgramKeyDown
    end
  end
  object cxGroupBox7: TcxGroupBox
    Left = 167
    Top = 69
    Caption = #49884#44036
    TabOrder = 10
    Height = 50
    Width = 289
    object cxTimeStart: TcxTimeEdit
      Left = 6
      Top = 18
      EditValue = 0d
      Properties.TimeFormat = tfHourMin
      Style.Color = clWindow
      TabOrder = 0
      OnKeyDown = cboProgramKeyDown
      Width = 60
    end
    object cxTimeFinish: TcxTimeEdit
      Left = 91
      Top = 18
      EditValue = 0d
      Properties.TimeFormat = tfHourMin
      Style.Color = clWindow
      TabOrder = 1
      OnKeyDown = cboProgramKeyDown
      Width = 60
    end
    object cxLabel6: TcxLabel
      Left = 73
      Top = 19
      Caption = '~'
      Transparent = True
    end
    object chkNotFixed: TcxCheckBox
      Left = 165
      Top = 20
      Caption = #48120#51221
      Properties.OnChange = chkNotFixedPropertiesChange
      TabOrder = 2
      Transparent = True
      OnKeyDown = cboProgramKeyDown
      Width = 52
    end
  end
  object btnSave: TcxButton
    Left = 479
    Top = 60
    Width = 100
    Height = 40
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
    LookAndFeel.SkinName = 'Caramel'
    SpeedButtonOptions.Transparent = True
    TabOrder = 11
    OnClick = btnSaveClick
  end
  object btnClose: TcxButton
    Left = 480
    Top = 548
    Width = 100
    Height = 40
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
    TabOrder = 12
  end
  object btnDelete: TcxButton
    Left = 479
    Top = 105
    Width = 100
    Height = 40
    Caption = #49325#51228
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000000000000000
      0000000000006E6E6EB58C8C8CFF898989FF858585FF818181FF7C7C7CFF7777
      77FF737373FF6F6F6FFF6B6B6BFF545454B50000000000000000000000000000
      000000000000919191FFA3A3A3FFB7B7B7FFB1B1B1FFAAAAAAFFA3A3A3FF9C9C
      9CFF959595FF8F8F8FFF7A7A7AFF686868FF0000000000000000000000000000
      000000000000919191FFBFBFBFFFB9B9B9FFA4A4A4FFBCBCBCFFA5A5A5FF8888
      88FFAAAAAAFF909090FF8A8A8AFF696969FF0000000000000000000000000000
      000000000000939393FFC1C1C1FFBABABAFFA4A4A4FFBDBDBDFFA5A5A5FF8989
      89FFAAAAAAFF919191FF8B8B8BFF696969FF0000000000000000000000000000
      000000000000959595FFC3C3C3FFBDBDBDFFA4A4A4FFBEBEBEFFA7A7A7FF8B8B
      8BFFAAAAAAFF929292FF8C8C8CFF6A6A6AFF0000000000000000000000000000
      000000000000959595FFC5C5C5FFBDBDBDFFA4A4A4FFC0C0C0FFA9A9A9FF8C8C
      8CFFAAAAAAFF939393FF8D8D8DFF6B6B6BFF0000000000000000000000000000
      000000000000979797FFC6C6C6FFC0C0C0FFA4A4A4FFC1C1C1FFAAAAAAFF8D8D
      8DFFAAAAAAFF959595FF8E8E8EFF6B6B6BFF0000000000000000000000000000
      000000000000989898FFC8C8C8FFC1C1C1FFA4A4A4FFC2C2C2FFACACACFF8E8E
      8EFFAAAAAAFF959595FF909090FF6C6C6CFF0000000000000000000000000000
      000000000000999999FFC9C9C9FFC3C3C3FFA4A4A4FFC4C4C4FFADADADFF8F8F
      8FFFAAAAAAFF979797FF919191FF6D6D6DFF0000000000000000000000000000
      0000000000009A9A9AFFCBCBCBFFA9A9A9FFA4A4A4FFC5C5C5FF979797FF9191
      91FFAAAAAAFF989898FF929292FF6D6D6DFF0000000000000000000000000000
      000000000000878787FFAFAFAFFFA9A9A9FFA4A4A4FF9E9E9EFF989898FF9191
      91FF8B8B8BFF858585FF818181FF636363FF0000000000000000000000000000
      00009F9F9FFF9C9C9CFF999999FF959595FF909090FF8B8B8BFF858585FF8181
      81FF7C7C7CFF777777FF737373FF6F6F6FFF6C6C6CFF00000000000000000000
      0000A0A0A0FFD5D5D5FFD0D0D0FFC9C9C9FFC2C2C2FFBBBBBBFFB3B3B3FFABAB
      ABFFA4A4A4FF9C9C9CFF959595FF8F8F8FFF6D6D6DFF00000000000000000000
      0000000000009D9D9DFF9A9A9AFF969696FF929292FF8D8D8DFF898989FF8383
      83FF7E7E7EFF797979FF757575FF717171FF0000000000000000000000000000
      000000000000000000000000000000000000636363FF898989FF000000008989
      89FF636363FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000898989FF636363FF8989
      89FF000000000000000000000000000000000000000000000000}
    LookAndFeel.SkinName = 'Caramel'
    SpeedButtonOptions.Transparent = True
    TabOrder = 13
    OnClick = btnDeleteClick
  end
  object btnDoJob: TcxButton
    Left = 480
    Top = 346
    Width = 100
    Height = 40
    Caption = #51652#54665#45236#50857
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000000000000000000000000000000000000000000F0000
      0032000000330000003300000033000000330000003300000033000000320000
      000F000000000000000000000000000000000000000000000000331B066FA553
      0CFBA7530BFFA7520AFFA7520AFFA7520AFFA7520AFFA7530BFFA7530BFB3519
      036D000000000000000200000000000000000000000000000000B25F18FFD899
      5DFFE3A971FFE3A870FFE3A770FFE3A770FFE3A870FFE4A971FFDA995DFFBF5D
      11FF000000330206053D0000003300000033000000320000000FC27937FFEAC0
      97FFE1A261FFE19F5CFFE19D59FFE19D59FFE19F5DFFE1A261FFECC097FFC868
      1BFF268272FF34856FFF337E6CFF337E6CFF337D6AFB1026206FCF8D4FFFF1D6
      BCFFF0B776FFF0BA7BFFF5FAFDFFEBEFF2FFF0B979FFF1B877FFF5D7BDFFD272
      24FF45AE88FF4BA980FF55AE86FF56AF87FF50A583FF338270FFD08843FFF2DB
      C5FFFAE6CEFFFFF8EAFFFFFEFEFFF6F5F3FFF0E4D3FFFFE7CEFFFAD9C1FFC580
      34FF45AC87FF4EAB83FF39A275FF3EA577FF75C4A2FF318472FF0B07040DB072
      34D0EEBA86FFAFC7CEFF5D9FC3FF3C7CA0FF768488FFF8B983FFB28F47FF44AD
      7AFFFDFAFCFFF6EFEFFF3BAF81FF35AF7CFF95DABEFF308674FF000000000000
      000023170A28819596EA67A3C5FF5089A9FF5E7370FFA4C9A1FF87E4C5FFD5F4
      E7FFFFFFFDFFFFF5F2FFC6DFCFFF93E4C5FF9ADDC6FF308876FD000000000000
      0000040A0E3F78BDE2FF7FC0E3FF71AFD2FF5A97BFFF26756EE263B9A1FF99C8
      D7FF63A0C2FF437C9FFF5D8693FF68BAA4FF257163D00308070E000000000000
      0000012859EAA7EFFFFF8ED1F0FF7EBFDEFF76B3D5FF001B4BD8030B08125591
      9FE86CA3C3FF548AA9FF2C6473EA071612280000000000000000000000000000
      00000A3A6AFF69AACEFF79B3D6FF8CCCECFF80BFE0FF072356FF000000297FBF
      E1FF81C0E2FF72B0D1FF5F99BFFF060A0E3F0000000000000000000000000000
      0000114374FF2D77A9FF4E89B7FF517AA5FF334F7BFF0D2C5CFF032750D6A8EF
      FFFF8FD1F0FF7FBFDEFF76B4D5FF052755EA0000000000000000000000000000
      0000103D6DFC287BAEFF418ABAFF407CABFF254A77FF0D2D58E30A3B6BFF69AB
      CEFF79B5D6FF8CCCECFF81C0E0FF0B2B5BFF0000000000000000000000000000
      000002090F22134777FB1E6193FF1D5787FF123E6CF701020408114474FF2D78
      A9FF4E89B7FF517AA5FF33507BFF103160FF0000000000000000000000000000
      0000000000000000000000000000010407100000000000000000113D6BF9287B
      AEFF4089BAFF407CABFF244A77FF103365FC0000000000000000000000000000
      000000000000000000000000000000000000000000000000000002080F211246
      77FC1D5F91FF1C5786FF123F6FFC020910220000000000000000}
    LookAndFeel.SkinName = 'Caramel'
    SpeedButtonOptions.Transparent = True
    TabOrder = 14
    OnClick = btnDoJobClick
  end
  object chkDone: TcxCheckBox
    Left = 489
    Top = 35
    Caption = #51089#50629#50756#47308
    TabOrder = 15
    Transparent = True
    Width = 78
  end
  object btnPrint: TcxButton
    Left = 480
    Top = 392
    Width = 100
    Height = 40
    Caption = #45236#50857#52636#47141
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
    TabOrder = 16
    OnClick = btnPrintClick
  end
  object cxGroupBox12: TcxGroupBox
    Left = 472
    Top = 151
    Caption = #52280#49437#51088
    TabOrder = 17
    Height = 188
    Width = 115
    object cxListProgramPatient: TcxListBox
      Left = 3
      Top = 15
      Width = 109
      Height = 163
      Align = alClient
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 13
      Style.Color = 14737632
      TabOrder = 0
    end
  end
  object btnTherapyHisotyr: TcxButton
    Left = 480
    Top = 496
    Width = 100
    Height = 31
    Caption = #45236#50669#48372#44592
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      20000000000000040000000000000000000000000000000000000000006B0000
      00FF000000FF000000FF00000064000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FFC2C2
      C2FFBBBBBBFFA0A0A0FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FFFEFE
      FEFFEAEAEAFFBBBBBBFF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FFFEFE
      FEFFEAEAEAFFBBBBBBFF000000FF00000000000000EA000000DE000000D10000
      00B0000000CC00000059000000DE000000CC0000008600000000000000FFFEFE
      FEFFE6E6E6FFC1C1C1FF000000FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000009B0000
      00FF000000FF000000FF00000092000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FFC2C2
      C2FFBBBBBBFFA0A0A0FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FFFEFE
      FEFFEAEAEAFFBBBBBBFF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FFFEFE
      FEFFEAEAEAFFBBBBBBFF000000FF00000000000000DE000000DE000000B00000
      00DE000000EA00000000000000CC000000CC0000008600000000000000FFFEFE
      FEFFE6E6E6FFC1C1C1FF000000FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000009B0000
      00FF000000FF000000FF00000092000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FFC2C2
      C2FFBBBBBBFFA0A0A0FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FFFEFE
      FEFFEAEAEAFFBBBBBBFF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FFFEFE
      FEFFEAEAEAFFBBBBBBFF000000FF00000000000000CC00000086000000590000
      00CC000000CC000000B000000059000000B0000000CC00000000000000FFFEFE
      FEFFE6E6E6FFC1C1C1FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000530000
      00FF000000FF000000FF0000004C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    LookAndFeel.SkinName = 'Caramel'
    SpeedButtonOptions.Transparent = True
    TabOrder = 18
    OnClick = btnTherapyHisotyrClick
  end
  object Panel5: TPanel
    Left = 228
    Top = 277
    Width = 217
    Height = 13
    BevelOuter = bvNone
    Caption = 'Keyword = '#39'F1'#39' '#54841#51008'  '#39'/'#39' + keyword '#51077#47141
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 19
  end
  object Panel1: TPanel
    Left = 227
    Top = 438
    Width = 217
    Height = 13
    BevelOuter = bvNone
    Caption = 'Keyword = '#39'F1'#39' '#54841#51008'  '#39'/'#39' + keyword '#51077#47141
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 20
  end
  object Panel2: TPanel
    Left = 228
    Top = 600
    Width = 217
    Height = 13
    BevelOuter = bvNone
    Caption = 'Keyword = '#39'F1'#39' '#54841#51008'  '#39'/'#39' + keyword '#51077#47141
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 21
  end
end
