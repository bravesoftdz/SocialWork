unit uVisit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxGroupBox, DB, ADODB,
  uGlobal, cxCheckBox, cxSpinEdit, cxTimeEdit, cxLabel, cxRadioGroup;

type
  TfrmVisit = class(TForm)
    btnSave: TcxButton;
    cxButton3: TcxButton;
    btnShortKey: TcxButton;
    ScrollBox1: TScrollBox;
    cxGroupBox4: TcxGroupBox;
    txtSocialWorker: TcxTextEdit;
    cxGroupBox9: TcxGroupBox;
    cxDateVisit: TcxDateEdit;
    cxGroupBox3: TcxGroupBox;
    memoD1: TMemo;
    cxGroupBox8: TcxGroupBox;
    memoD2: TMemo;
    cxGroupBox11: TcxGroupBox;
    txtAccompanyETC: TcxTextEdit;
    cxGroupBox15: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    txtPName: TcxTextEdit;
    txtPAddress: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxSpinPAge: TcxSpinEdit;
    cxLabel4: TcxLabel;
    txtPTel: TcxTextEdit;
    cxGroupBox16: TcxGroupBox;
    txtPhimselfETC: TcxTextEdit;
    cxGroupBox17: TcxGroupBox;
    txtPBohumETC: TcxTextEdit;
    cxGroupBox18: TcxGroupBox;
    cxLabel5: TcxLabel;
    txtPatientID: TcxTextEdit;
    cxLabel6: TcxLabel;
    txtPatientName: TcxTextEdit;
    cxLabel7: TcxLabel;
    txtSexAge: TcxTextEdit;
    cxLabel8: TcxLabel;
    txtRoom: TcxTextEdit;
    cxLabel9: TcxLabel;
    txtDiagName: TcxTextEdit;
    cxLabel10: TcxLabel;
    cxLabel12: TcxLabel;
    txtPrognosis: TcxTextEdit;
    cxLabel13: TcxLabel;
    txtOpinion: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    cxGroupBox6: TcxGroupBox;
    cxGroupBox7: TcxGroupBox;
    cxGroupBox10: TcxGroupBox;
    txtA1: TcxTextEdit;
    cxGroupBox21: TcxGroupBox;
    txtDoctor: TcxTextEdit;
    cxGroupBox22: TcxGroupBox;
    txtA2: TcxTextEdit;
    txtA3: TcxTextEdit;
    txtA4: TcxTextEdit;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox12: TcxGroupBox;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxGroupBox13: TcxGroupBox;
    txtB1: TcxTextEdit;
    txtB2: TcxTextEdit;
    txtB3: TcxTextEdit;
    txtB4: TcxTextEdit;
    txtB5: TcxTextEdit;
    cxLabel22: TcxLabel;
    cxGroupBox14: TcxGroupBox;
    cxGroupBox19: TcxGroupBox;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    cxLabel26: TcxLabel;
    cxLabel27: TcxLabel;
    cxGroupBox20: TcxGroupBox;
    txtC1: TcxTextEdit;
    txtC2: TcxTextEdit;
    txtC3: TcxTextEdit;
    txtC4: TcxTextEdit;
    txtC5: TcxTextEdit;
    cxGroupBox23: TcxGroupBox;
    memoE1: TMemo;
    cxGroupBox24: TcxGroupBox;
    memoE2: TMemo;
    cxGroupBox25: TcxGroupBox;
    memoComment: TMemo;
    txtIndate: TcxTextEdit;
    cxTimeVisit: TcxTimeEdit;
    rMale: TcxRadioButton;
    rFeMale: TcxRadioButton;
    rAccompany1: TcxRadioButton;
    rAccompany2: TcxRadioButton;
    rAccompany3: TcxRadioButton;
    rAccompany4: TcxRadioButton;
    rAccompany5: TcxRadioButton;
    rPhimself1: TcxRadioButton;
    rPhimself2: TcxRadioButton;
    rPhimself3: TcxRadioButton;
    rPhimself4: TcxRadioButton;
    rPhimself5: TcxRadioButton;
    rPBohum1: TcxRadioButton;
    rPBohum2: TcxRadioButton;
    rPBohum3: TcxRadioButton;
    rPBohum4: TcxRadioButton;
    rPBohum5: TcxRadioButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnShortKeyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure memoD1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetControls;
  public
    { Public declarations }
    adoInOut: TADOQuery;
    adoVisit: TAdoQuery;
    EditMode: TEditMode;
  end;

var
  frmVisit: TfrmVisit;

implementation
uses uConfig, uDB, uShortKeyMgr;
{$R *.dfm}

procedure TfrmVisit.btnSaveClick(Sender: TObject);
var
  nInOutID, nSeq: integer;
  sVisitDate, sVisitTime: string;
begin
  if not adoVisit.Active then Exit;

  nInOutID := adoInOut.FieldByName('InOutID').AsInteger;
  sVisitDate := cxDateVisit.Text;
  sVisitTime := cxTimeVisit.Text;

  if oGlobal.isNullStr(sVisitDate) then
  begin
    oGlobal.Msg('방문일자를 선택하십시오!');
    cxDateVisit.SetFocus;
    Exit;
  end;

  if ((EditMode = emAppend) and dbMain.isExistVisitDate(nInOutID, sVisitDate)) or
     ((EditMode = emUpdate) and (sVisitDate <> adoVisit.FieldByName('VisitDate').AsString) and
       dbMain.isExistVisitDate(nInOutID, sVisitDate)) then
  begin
    oGlobal.Msg('해당 입력일에 이미 입력된 내용이 있습니다!');
    Exit;
  end;

  if oGlobal.YesNo('저장하시겠습니까?') <> mrYes then Exit;

  adoVisit.DisableControls;
  try
    adoVisit.Connection.BeginTrans;

    if EditMode = emAppend then
    begin
      adoVisit.Append;
      adoVisit.FieldByName('InOutID').AsInteger := adoInOut.FieldByName('InOutID').AsInteger;
      adoVisit.FieldByName('Seq').AsInteger := dbMain.GetLastVisitSeq(adoInOut.FieldByName('InOutID').AsInteger) + 1;
    end
    else
      adoVisit.Edit;

    adoVisit.FieldByName('VisitDate').AsString := sVisitDate;
    adoVisit.FieldByName('VisitTime').AsString := sVisitTime;

    if rAccompany1.Checked then adoVisit.FieldByName('Accompany').AsInteger := 1
    else if rAccompany2.Checked then adoVisit.FieldByName('Accompany').AsInteger := 2
    else if rAccompany3.Checked then adoVisit.FieldByName('Accompany').AsInteger := 3
    else if rAccompany4.Checked then adoVisit.FieldByName('Accompany').AsInteger := 4
    else if rAccompany5.Checked then adoVisit.FieldByName('Accompany').AsInteger := 5;

    adoVisit.FieldByName('AccompanyETC').AsString := trim(txtAccompanyETC.Text);

    adoVisit.FieldByName('prognosis').AsString := trim(txtPrognosis.Text);
    adoVisit.FieldByName('opinion').AsString := trim(txtOpinion.Text);
    adoVisit.FieldByName('PName').AsString := trim(txtPName.Text);

    if rMale.Checked then
      adoVisit.FieldByName('PSex').AsString := cMale
    else if rFeMale.Checked then
      adoVisit.FieldByName('PSex').AsString := cFeMale;

    adoVisit.FieldByName('PAge').AsInteger := cxSpinPAge.Value;
    adoVisit.FieldByName('PAddress').AsString := trim(txtPAddress.Text);
    adoVisit.FieldByName('PTel').AsString := trim(txtPTel.Text);

    if rPhimself1.Checked then adoVisit.FieldByName('Phimself').AsInteger := 1
    else if rPhimself2.Checked then adoVisit.FieldByName('Phimself').AsInteger := 2
    else if rPhimself3.Checked then adoVisit.FieldByName('Phimself').AsInteger := 3
    else if rPhimself4.Checked then adoVisit.FieldByName('Phimself').AsInteger := 4
    else if rPhimself5.Checked then adoVisit.FieldByName('Phimself').AsInteger := 5;

    adoVisit.FieldByName('PhimselfETC').AsString := trim(txtPhimselfETC.Text);

    if rPBohum1.Checked then adoVisit.FieldByName('PBohum').AsInteger := 1
    else if rPBohum2.Checked then adoVisit.FieldByName('PBohum').AsInteger := 2
    else if rPBohum3.Checked then adoVisit.FieldByName('PBohum').AsInteger := 3
    else if rPBohum4.Checked then adoVisit.FieldByName('PBohum').AsInteger := 4
    else if rPBohum5.Checked then adoVisit.FieldByName('PBohum').AsInteger := 5;

    adoVisit.FieldByName('PBohumETC').AsString := trim(txtPBohumETC.Text);

    adoVisit.FieldByName('A1').AsString := trim(txtA1.text);
    adoVisit.FieldByName('A2').AsString := trim(txtA2.text);
    adoVisit.FieldByName('A3').AsString := trim(txtA3.text);
    adoVisit.FieldByName('A4').AsString := trim(txtA4.text);

    adoVisit.FieldByName('B1').AsString := trim(txtB1.text);
    adoVisit.FieldByName('B2').AsString := trim(txtB2.text);
    adoVisit.FieldByName('B3').AsString := trim(txtB3.text);
    adoVisit.FieldByName('B4').AsString := trim(txtB4.text);
    adoVisit.FieldByName('B5').AsString := trim(txtB5.text);

    adoVisit.FieldByName('C1').AsString := trim(txtC1.text);
    adoVisit.FieldByName('C2').AsString := trim(txtC2.text);
    adoVisit.FieldByName('C3').AsString := trim(txtC3.text);
    adoVisit.FieldByName('C4').AsString := trim(txtC4.text);
    adoVisit.FieldByName('C5').AsString := trim(txtC5.text);

    adoVisit.FieldByName('D1').AsString := trim(memoD1.Lines.text);
    adoVisit.FieldByName('D2').AsString := trim(memoD2.Lines.text);
    adoVisit.FieldByName('E1').AsString := trim(memoE1.Lines.text);
    adoVisit.FieldByName('E2').AsString := trim(memoE2.Lines.text);
    adoVisit.FieldByName('Comment').AsString := trim(memoComment.Lines.Text);

    adoVisit.FieldByName('WriteDate').AsString := oGlobal.DateToString(now);
    adoVisit.FieldByName('Writer').AsString := oConfig.User.UserID;

    adoVisit.Post;

    adoVisit.Connection.CommitTrans;

    oGlobal.Msg('저장하였습니다!');

    ModalResult := mrOK;
  except
    adoVisit.Cancel;
    adoVisit.Connection.RollbackTrans;

    oGlobal.Msg('저장에 실패했습니다!');
  end;

  nSeq := adoVisit.FieldByName('Seq').AsInteger;
  adoVisit.Close;

  if dbMain.RemakeVisitOrder(nInOutID, sVisitDate) then
    nSeq := dbMain.GetVisitSeq(nInOutID, sVisitDate);

  adoVisit.Open;

  adoVisit.Locate('Seq', nSeq, [loCaseInsensitive]);

  adoVisit.EnableControls;
end;

procedure TfrmVisit.btnShortKeyClick(Sender: TObject);
begin
  frmShortKeyMgr.ShowModal;
end;

procedure TfrmVisit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmVisit.FormShow(Sender: TObject);
begin
  oGlobal.ClearComponents(frmVisit);

  SetControls;

  cxDateVisit.SetFocus;

  ScrollBox1.VertScrollBar.Position := 0;
end;

procedure TfrmVisit.memoD1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Sender is TMemo) and (Key = VK_RETURN) then
    dbMain.SetCurrentKeyword(TMemo(Sender));
end;

procedure TfrmVisit.SetControls;
var
  nAccompany, nPhimself, nPBohum: integer;
begin
  txtSocialWorker.Text := adoInOut.FieldByName('UserName').AsString;
  txtDoctor.Text := adoInOut.FieldByName('DoctorName').AsString;
  txtPatientID.Text := adoInOut.FieldByName('PatientID').AsString;
  txtPatientName.Text := adoInOut.FieldByName('PatientName').AsString;

  txtSexAge.Text := oGlobal.GetAge(adoInOut.FieldByName('Birthday').AsString, adoInOut.FieldByName('InDate').AsString);
  if adoInOut.FieldByName('Sex').AsString = cMale then
    txtSexAge.Text := '남 (만' + txtSexAge.Text + '세)'
  else
    txtSexAge.Text := '여 (만' + txtSexAge.Text + '세)';

  txtRoom.Text := adoInOut.FieldByName('Room').AsString;
  txtDiagName.Text := adoInOut.FieldByName('DiagName').AsString;
  txtInDate.Text := adoInOut.FieldByName('InDate').AsString;

  if EditMode = emAppend then Exit;

  cxDateVisit.Date := oGlobal.StringToDate(adoVisit.FieldByName('VisitDate').AsString);
  cxTimeVisit.Time := oGlobal.StringToTime(adoVisit.FieldByName('VisitTime').AsString);

  if trim(adoVisit.FieldByName('Accompany').AsString) = NullString then
    nAccompany := 0
  else
    nAccompany := adoVisit.FieldByName('Accompany').AsInteger;

  rAccompany1.Checked := nAccompany = 1;
  rAccompany2.Checked := nAccompany = 2;
  rAccompany3.Checked := nAccompany = 3;
  rAccompany4.Checked := nAccompany = 4;
  rAccompany5.Checked := nAccompany = 5;

  txtAccompanyETC.Text := adoVisit.FieldByName('AccompanyETC').AsString;

  txtPrognosis.Text := adoVisit.FieldByName('prognosis').AsString;
  txtOpinion.Text := adoVisit.FieldByName('Opinion').AsString;

  txtPName.Text := adoVisit.FieldByName('PName').AsString;
  cxSpinPAge.Value := adoVisit.FieldByName('PAge').AsInteger;

  if adoVisit.FieldByName('PSex').AsString = cMale then
    rMale.Checked := True
  else if adoVisit.FieldByName('PSex').AsString = cFeMale then
    rFeMale.Checked := True;


  txtPAddress.Text := adoVisit.FieldByName('PAddress').AsString;
  txtPTel.Text := adoVisit.FieldByName('PTel').AsString;

  if trim(adoVisit.FieldByName('Phimself').AsString) = NullString then
    nPhimself := 0
  else
    nPhimself := adoVisit.FieldByName('Phimself').AsInteger;

  rPhimself1.Checked := nPhimself = 1;
  rPhimself2.Checked := nPhimself = 2;
  rPhimself3.Checked := nPhimself = 3;
  rPhimself4.Checked := nPhimself = 4;
  rPhimself5.Checked := nPhimself = 5;

  txtPhimselfETC.Text := adoVisit.FieldByName('PhimselfETC').AsString;

  if trim(adoVisit.FieldByName('PBohum').AsString) = NullString then
    nPBohum := 0
  else
    nPBohum := adoVisit.FieldByName('PBohum').AsInteger;

  rPBohum1.Checked := nPBohum = 1;
  rPBohum2.Checked := nPBohum = 2;
  rPBohum3.Checked := nPBohum = 3;
  rPBohum4.Checked := nPBohum = 4;
  rPBohum5.Checked := nPBohum = 5;

  txtPBohumETC.Text := adoVisit.FieldByName('PBohumETC').AsString;

  txtA1.Text := adoVisit.FieldByName('A1').AsString;
  txtA2.Text := adoVisit.FieldByName('A2').AsString;
  txtA3.Text := adoVisit.FieldByName('A3').AsString;
  txtA4.Text := adoVisit.FieldByName('A4').AsString;

  txtB1.Text := adoVisit.FieldByName('B1').AsString;
  txtB2.Text := adoVisit.FieldByName('B2').AsString;
  txtB3.Text := adoVisit.FieldByName('B3').AsString;
  txtB4.Text := adoVisit.FieldByName('B4').AsString;
  txtB5.Text := adoVisit.FieldByName('B5').AsString;

  txtC1.Text := adoVisit.FieldByName('C1').AsString;
  txtC2.Text := adoVisit.FieldByName('C2').AsString;
  txtC3.Text := adoVisit.FieldByName('C3').AsString;
  txtC4.Text := adoVisit.FieldByName('C4').AsString;
  txtC5.Text := adoVisit.FieldByName('C5').AsString;

  memoD1.Lines.Text := adoVisit.FieldByName('D1').AsString;
  memoD2.Lines.Text := adoVisit.FieldByName('D2').AsString;
  memoE1.Lines.Text := adoVisit.FieldByName('E1').AsString;
  memoE2.Lines.Text := adoVisit.FieldByName('E2').AsString;
  memoComment.Lines.Text := adoVisit.FieldByName('Comment').AsString;
end;

end.
