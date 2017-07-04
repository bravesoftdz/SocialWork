unit uSurvey1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGlobal, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel, Menus,
  cxStyles, dxSkinscxPC3Painter, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxLabel, ADODB, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  StdCtrls, cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxVGrid, cxInplaceContainer, cxGroupBox, dxSkinOffice2007Blue, dxSkinBlack,
  dxSkinBlue, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, ExtCtrls;

type
  TfrmSurvey1 = class(TForm)
    btnFamilyMgr: TcxButton;
    adoFamily: TADOQuery;
    btnSave: TcxButton;
    cxButton3: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxDateSurvey: TcxDateEdit;
    cxGroupBox3: TcxGroupBox;
    txtInfoDonor: TcxTextEdit;
    cxGroupBox4: TcxGroupBox;
    dsFamily: TDataSource;
    cxGroupBox6: TcxGroupBox;
    txtPatientName: TcxTextEdit;
    txtSexAge: TcxTextEdit;
    cxGroupBox7: TcxGroupBox;
    txtAddress: TcxTextEdit;
    cxGroupBox8: TcxGroupBox;
    txtTelHome: TcxTextEdit;
    cxGroupBox5: TcxGroupBox;
    txtTelMobile: TcxTextEdit;
    cxGroupBox10: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGFamily: TcxGridDBTableView;
    cxGFamilyRelationshipName: TcxGridDBColumn;
    cxGFamilyFamilyName: TcxGridDBColumn;
    cxGFamilyInMate: TcxGridDBColumn;
    cxGFamilyHealth: TcxGridDBColumn;
    cxGFamilyETC: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox11: TcxGroupBox;
    cboReligion: TcxComboBox;
    cxGroupBox13: TcxGroupBox;
    cboInsuType: TcxComboBox;
    cxGroupBox15: TcxGroupBox;
    cboHousingType: TcxComboBox;
    cxGroupBox17: TcxGroupBox;
    cboEconomicType: TcxComboBox;
    cxGroupBox19: TcxGroupBox;
    cboCareer: TcxComboBox;
    cxGroupBox20: TcxGroupBox;
    cboArmyCareer: TcxComboBox;
    cxGroupBox21: TcxGroupBox;
    txtArmyEtc: TcxTextEdit;
    txtInsuEtc: TcxTextEdit;
    txtHousingYear: TcxTextEdit;
    Label3: TLabel;
    txtHousingMonth: TcxTextEdit;
    Label4: TLabel;
    txtEconomicEtc: TcxTextEdit;
    cxGroupBox9: TcxGroupBox;
    txtProperty: TcxTextEdit;
    cxGroupBox12: TcxGroupBox;
    txtEstate: TcxTextEdit;
    cxGroupBox14: TcxGroupBox;
    cboProtector: TcxComboBox;
    txtProtectorEtc: TcxTextEdit;
    cxGroupBox16: TcxGroupBox;
    cboToSolveProblem: TcxComboBox;
    cxGroupBox18: TcxGroupBox;
    cboExpectation: TcxComboBox;
    txtExpectationEtc: TcxTextEdit;
    cxGroupBox22: TcxGroupBox;
    cxGroupBox23: TcxGroupBox;
    memoResourceAfterLeaving: TMemo;
    memoETC: TMemo;
    txtReligionEtc: TcxTextEdit;
    Panel6: TPanel;
    Panel1: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboReligionPropertiesChange(Sender: TObject);
    procedure cboInsuTypePropertiesChange(Sender: TObject);
    procedure cboHousingTypePropertiesChange(Sender: TObject);
    procedure cboEconomicTypePropertiesChange(Sender: TObject);
    procedure cboExpectationPropertiesChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnFamilyMgrClick(Sender: TObject);
    procedure cboProtectorPropertiesChange(Sender: TObject);
    procedure memoResourceAfterLeavingKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure ClearControls;
    procedure SetControls;
  public
    { Public declarations }
    ModifiedFamily: Boolean;
    adoSurvey1: TAdoQuery;
    adoInOut: TADOQuery;
  end;

var
  frmSurvey1: TfrmSurvey1;

implementation
uses uConfig, uDB, uRecord, uFamilyMgr, uQuery;
{$R *.dfm}

procedure TfrmSurvey1.btnFamilyMgrClick(Sender: TObject);
var
  oFamilyMgr: TfrmFamilyMgr;
begin
  if adoInOut.IsEmpty then Exit;

  Application.CreateForm(TfrmFamilyMgr, oFamilyMgr);

  oFamilyMgr.adoInOut := adoInOut;
  oFamilyMgr.ShowModal;

  if oFamilyMgr.Modified then
  begin
    adoFamily.Close;
    adoFamily.Open;
    ModifiedFamily := True;
  end;

  oFamilyMgr.Free;
end;

procedure TfrmSurvey1.cboEconomicTypePropertiesChange(Sender: TObject);
begin
  txtEconomicEtc.Clear;
  txtEconomicEtc.Enabled := False;

  if (cboEconomicType.ItemIndex=3) or (cboEconomicType.ItemIndex=6) then
  begin
    txtEconomicEtc.Enabled := True;
    txtEconomicEtc.Text := adoSurvey1.FieldByName('EconomicEtc').AsString;
  end;
end;

procedure TfrmSurvey1.cboExpectationPropertiesChange(Sender: TObject);
begin
  txtExpectationEtc.Clear;
  txtExpectationEtc.Enabled := False;

  if cboExpectation.ItemIndex = 5 then
  begin
    txtExpectationEtc.Text := adoSurvey1.FieldByName('ExpectationEtc').AsString;
    txtExpectationEtc.Enabled := True;
  end;
end;

procedure TfrmSurvey1.cboHousingTypePropertiesChange(Sender: TObject);
begin
  txtHousingYear.Enabled := (cboHousingType.ItemIndex=1) or (cboHousingType.ItemIndex=3);
  txtHousingMonth.Enabled := (cboHousingType.ItemIndex=2) or (cboHousingType.ItemIndex=3) or (cboHousingType.ItemIndex=4);

  txtHousingYear.Clear;
  txtHousingMonth.Clear;
  case cboHousingType.ItemIndex of
    1: txtHousingYear.Text := adoSurvey1.FieldByName('HousingYear').AsString;
    2: txtHousingMonth.Text := adoSurvey1.FieldByName('HousingMonth').AsString;
    3:
    begin
      txtHousingYear.Text := adoSurvey1.FieldByName('HousingYear').AsString;
      txtHousingMonth.Text := adoSurvey1.FieldByName('HousingMonth').AsString;
    end;
    4: txtHousingMonth.Text := adoSurvey1.FieldByName('HousingMonth').AsString;
  end;
end;

procedure TfrmSurvey1.cboInsuTypePropertiesChange(Sender: TObject);
begin
  txtInsuEtc.Enabled := cboInsuType.ItemIndex = 3;

  txtInsuEtc.Clear;
  if cboInsuType.ItemIndex = 3 then
    txtInsuEtc.Text := adoSurvey1.FieldByName('InsuEtc').AsString;
end;

procedure TfrmSurvey1.cboProtectorPropertiesChange(Sender: TObject);
begin
  txtProtectorEtc.Clear;
  txtProtectorEtc.Enabled := False;

  if cboProtector.ItemIndex = 2 then
  begin
    txtProtectorEtc.Text := adoSurvey1.FieldByName('ProtectorEtc').AsString;
    txtProtectorEtc.Enabled := True;
  end;
end;

procedure TfrmSurvey1.cboReligionPropertiesChange(Sender: TObject);
begin
  txtReligionEtc.Enabled := cboReligion.ItemIndex = 3;

  txtReligionEtc.Clear;
  if cboreligion.ItemIndex = 3 then
    txtReligionEtc.Text := adoSurvey1.FieldByName('ReligionEtc').AsString;
end;

procedure TfrmSurvey1.ClearControls;
begin
  txtPatientName.Clear;
  txtSexAge.Clear;
  cxDateSurvey.Clear;
  txtInfoDonor.Clear;
  txtAddress.Clear;
  txtTelHome.Clear;
  txtTelMobile.Clear;
  cboReligion.Clear;
  txtReligionEtc.Clear;
  txtReligionEtc.Enabled := False;
  cboInsuType.Clear;
  txtInsuEtc.Clear;
  txtInsuEtc.Enabled := False;
  cboHousingType.Clear;
  txtHousingYear.Clear;
  txtHousingMonth.Clear;
  txtHousingYear.Enabled := False;
  txtHousingMonth.Enabled := False;
  cboEconomicType.Clear;
  txtEconomicEtc.Clear;
  txtEconomicEtc.Enabled := False;
  cboCareer.Clear;
  cboArmyCareer.Clear;
  txtArmyEtc.Clear;
  txtProperty.Clear;
  txtEstate.Clear;
  cboProtector.Clear;
  txtProtectorEtc.Clear;
  txtProtectorEtc.Enabled := False;
  cboToSolveProblem.Clear;
  cboExpectation.Clear;
  txtExpectationEtc.Clear;
  txtExpectationEtc.Enabled := False;
  memoResourceAfterLeaving.Lines.Clear;
  memoETC.Lines.Clear;
end;

procedure TfrmSurvey1.btnSaveClick(Sender: TObject);
begin
  if not adoSurvey1.Active then Exit;

  if trim(cxDateSurvey.EditText) = NULLString then
  begin
    oGlobal.Msg('조사일시를 기록하십시오!');
    Exit;
  end;

  if oGlobal.YesNo('저장하시겠습니까?') <> mrYes then Exit;

  adoSurvey1.DisableControls;
  try
    adoSurvey1.Connection.BeginTrans;
    if adoSurvey1.IsEmpty then
    begin
      adoSurvey1.Append;
      adoSurvey1.FieldByName('InOutID').AsInteger := adoInOut.FieldByName('InOutID').AsInteger;
    end
    else
      adoSurvey1.Edit;

    adoSurvey1.FieldByName('Address').AsString := trim(txtAddress.Text);
    adoSurvey1.FieldByName('TelHome').AsString := trim(txtTelHome.Text);
    adoSurvey1.FieldByName('TelMobile').AsString := trim(txtTelMobile.Text);
    adoSurvey1.FieldByName('Religion').AsString := oGlobal.GetItemIndex(cboReligion.ItemIndex);
    adoSurvey1.FieldByName('ReligionEtc').AsString := trim(txtReligionEtc.Text);
    adoSurvey1.FieldByName('InsuType').AsString := oGlobal.GetItemIndex(cboInsuType.ItemIndex);
    adoSurvey1.FieldByName('InsuEtc').AsString := trim(txtInsuEtc.Text);
    adoSurvey1.FieldByName('HousingType').AsString := oGlobal.GetItemIndex(cboHousingType.ItemIndex);
    adoSurvey1.FieldByName('HousingYear').AsString := trim(txtHousingYear.Text);
    adoSurvey1.FieldByName('HousingMonth').AsString := trim(txtHousingMonth.Text);
    adoSurvey1.FieldByName('EconomicType').AsString := oGlobal.GetItemIndex(cboEconomicType.ItemIndex);
    adoSurvey1.FieldByName('EconomicEtc').AsString := trim(txtEconomicEtc.Text);
    adoSurvey1.FieldByName('Career').AsString := oGlobal.GetItemIndex(cboCareer.ItemIndex);
    adoSurvey1.FieldByName('ArmyCareer').AsString := oGlobal.GetItemIndex(cboArmyCareer.ItemIndex);
    adoSurvey1.FieldByName('ArmyEtc').AsString := trim(txtArmyEtc.Text);
    adoSurvey1.FieldByName('Property').AsString := trim(txtProperty.Text);
    adoSurvey1.FieldByName('Estate').AsString := trim(txtEstate.Text);
    adoSurvey1.FieldByName('Protector').AsString := oGlobal.GetItemIndex(cboProtector.ItemIndex);
    adoSurvey1.FieldByName('ProtectorEtc').AsString := trim(txtProtectorEtc.Text);
    adoSurvey1.FieldByName('ToSolveProblem').AsString := oGlobal.GetItemIndex(cboToSolveProblem.ItemIndex);
    adoSurvey1.FieldByName('Expectation').AsString := oGlobal.GetItemIndex(cboExpectation.ItemIndex);
    adoSurvey1.FieldByName('ExpectationEtc').AsString := trim(txtExpectationEtc.Text);
    adoSurvey1.FieldByName('ResourceAfterLeaving').AsString := trim(memoResourceAfterLeaving.Lines.Text);
    adoSurvey1.FieldByName('ETC').AsString := trim(memoETC.Lines.Text);
    adoSurvey1.FieldByName('InfoDonor').AsString := trim(txtInfoDonor.Text);

    if oGlobal.isNotNullStr(cxDateSurvey.Text) then
      adoSurvey1.FieldByName('SurveyDate').AsString := oGlobal.DateToString(cxDateSurvey.Date);

    adoSurvey1.FieldByName('WriteDate').AsString := oGlobal.DateToString(now);
    adoSurvey1.FieldByName('Writer').AsString := oConfig.User.UserID;

    adoSurvey1.Post;

    adoSurvey1.Connection.CommitTrans;

    oGlobal.Msg('저장하였습니다!');

    ModalResult := mrOK;
  except
    adoSurvey1.Cancel;
    adoSurvey1.Connection.RollbackTrans;

    oGlobal.Msg('저장에 실패했습니다!');
  end;
  adoSurvey1.EnableControls;
end;

procedure TfrmSurvey1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoInOut := nil;
  adoSurvey1 := nil;
end;

procedure TfrmSurvey1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmSurvey1.FormShow(Sender: TObject);
begin
  ModifiedFamily := False;

  ClearControls;
  SetControls;

  try
    adoFamily.SQL.Text := QueryFamily(adoInOut.FieldByName('InOutID').AsInteger);
    adoFamily.Open;
  except
    oGlobal.Msg('가족관계정보에 접근할 수 없습니다!');
    Close;
  end;
end;

procedure TfrmSurvey1.memoResourceAfterLeavingKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Sender is TMemo)then
  begin
    if (Key = VK_RETURN) then
      dbMain.SetCurrentKeyword(TMemo(Sender))
    else if (Key = VK_F1) then
      oGlobal.GetKeywordContent(TMemo(Sender));
  end;
end;

procedure TfrmSurvey1.SetControls;
begin
  if not adoInOut.isEmpty then
  begin
    txtPatientName.Text := adoInOut.FieldByName('PatientName').AsString;
    txtSexAge.Text := oGlobal.GetAge(adoInOut.FieldByName('Birthday').AsString, adoInOut.FieldByName('InDate').AsString);

    if adoInOut.FieldByName('Sex').AsString = cMale then
      txtSexAge.Text := '남 (만' + txtSexAge.Text + '세)'
    else
      txtSexAge.Text := '여 (만' + txtSexAge.Text + '세)';
  end;

  if adoSurvey1.IsEmpty then
  begin
    cxDateSurvey.EditText := oGlobal.DateToString(Now);
    Exit;
  end;

  if oGlobal.isNotNullStr(adoSurvey1.FieldByName('SurveyDate').AsString) then
    cxDateSurvey.EditText := adoSurvey1.FieldByName('SurveyDate').AsString;

  txtInfoDonor.Text := adoSurvey1.FieldByName('InfoDonor').AsString;
  txtAddress.Text := adoSurvey1.FieldByName('Address').AsString;
  txtTelHome.Text := adoSurvey1.FieldByName('TelHome').AsString;
  txtTelMobile.Text := adoSurvey1.FieldByName('TelMobile').AsString;
  cboReligion.ItemIndex := oGlobal.GetItemIndex(adoSurvey1.FieldByName('Religion').AsString);
  txtReligionEtc.Text := adoSurvey1.FieldByName('ReligionEtc').AsString;
  cboInsuType.ItemIndex := oGlobal.GetItemIndex(adoSurvey1.FieldByName('InsuType').AsString);
  txtInsuEtc.Text := adoSurvey1.FieldByName('InsuEtc').AsString;
  cboHousingType.ItemIndex := oGlobal.GetItemIndex(adoSurvey1.FieldByName('HousingType').AsString);
  cboHousingType.Properties.OnChange(cboHousingType);
  txtHousingYear.Text := adoSurvey1.FieldByName('HousingYear').AsString;
  txtHousingMonth.Text := adoSurvey1.FieldByName('HousingMonth').AsString;
  cboEconomicType.ItemIndex := oGlobal.GetItemIndex(adoSurvey1.FieldByName('EconomicType').AsString);
  txtEconomicEtc.Text := adoSurvey1.FieldByName('EconomicEtc').AsString;
  cboCareer.ItemIndex := oGlobal.GetItemIndex(adoSurvey1.FieldByName('Career').AsString);
  cboArmyCareer.ItemIndex := oGlobal.GetItemIndex(adoSurvey1.FieldByName('ArmyCareer').AsString);
  txtArmyEtc.Text := adoSurvey1.FieldByName('ArmyEtc').AsString;
  txtProperty.Text := adoSurvey1.FieldByName('Property').AsString;
  txtEstate.Text := adoSurvey1.FieldByName('Estate').AsString;
  cboProtector.ItemIndex := oGlobal.GetItemIndex(adoSurvey1.FieldByName('Protector').AsString);
  txtProtectorEtc.Text := adoSurvey1.FieldByName('ProtectorEtc').AsString;
  cboToSolveProblem.ItemIndex := oGlobal.GetItemIndex(adoSurvey1.FieldByName('ToSolveProblem').AsString);
  cboExpectation.ItemIndex := oGlobal.GetItemIndex(adoSurvey1.FieldByName('Expectation').AsString);
  txtExpectationEtc.Text := adoSurvey1.FieldByName('ExpectationEtc').AsString;
  memoResourceAfterLeaving.Lines.Text := adoSurvey1.FieldByName('ResourceAfterLeaving').AsString;
  memoETC.Lines.Text := adoSurvey1.FieldByName('ETC').AsString;
end;

end.
