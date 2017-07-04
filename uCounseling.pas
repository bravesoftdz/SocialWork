unit uCounseling;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel,
  dxSkinOffice2007Blue, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxGroupBox, cxCheckBox, DB, ADODB, uGlobal, dxSkinBlack, dxSkinBlue,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, ExtCtrls;

type
  TfrmCounseling = class(TForm)
    cxGroupBox4: TcxGroupBox;
    txtPatientName: TcxTextEdit;
    cxGroupBox6: TcxGroupBox;
    txtSexAge: TcxTextEdit;
    cxGroupBox5: TcxGroupBox;
    cxDateInDate: TcxDateEdit;
    cxGroupBox1: TcxGroupBox;
    txtDiag: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    txtDoctor: TcxTextEdit;
    cxGroupBox9: TcxGroupBox;
    cxDateMeetingDate: TcxDateEdit;
    cxGroupBox7: TcxGroupBox;
    chkA1: TcxCheckBox;
    chkA2: TcxCheckBox;
    chkA3: TcxCheckBox;
    chkA4: TcxCheckBox;
    chkA5: TcxCheckBox;
    cxGroupBox3: TcxGroupBox;
    chkB1: TcxCheckBox;
    chkB2: TcxCheckBox;
    chkB3: TcxCheckBox;
    chkB4: TcxCheckBox;
    chkB5: TcxCheckBox;
    cxGroupBox8: TcxGroupBox;
    chkC1: TcxCheckBox;
    chkC2: TcxCheckBox;
    chkC3: TcxCheckBox;
    cxGroupBox10: TcxGroupBox;
    chkD1: TcxCheckBox;
    chkD2: TcxCheckBox;
    cxGroupBox11: TcxGroupBox;
    chkE1: TcxCheckBox;
    chkE2: TcxCheckBox;
    chkE3: TcxCheckBox;
    chkE4: TcxCheckBox;
    cxGroupBox12: TcxGroupBox;
    chkF1: TcxCheckBox;
    chkF2: TcxCheckBox;
    cxGroupBox21: TcxGroupBox;
    memoWorkerOpinion: TMemo;
    btnSave: TcxButton;
    cxButton3: TcxButton;
    Panel6: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure memoWorkerOpinionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetControls;
  public
    { Public declarations }
    adoInOut: TADOQuery;
    adoCounseling: TAdoQuery;
    EditMode: TEditMode;
  end;

var
  frmCounseling: TfrmCounseling;

implementation
uses uConfig, uDB;
{$R *.dfm}

procedure TfrmCounseling.btnSaveClick(Sender: TObject);
var
  nInOutID, nSeq: integer;
  sMeetingDate: string;
begin
  if not adoCounseling.Active then Exit;

  nInOutID := adoInOut.FieldByName('InOutID').AsInteger;
  sMeetingDate := cxDateMeetingDate.Text;

  if oGlobal.isNullStr(sMeetingDate) then
  begin
    oGlobal.Msg('상담일을 선택하십시오!');
    Exit;
  end;

  if ((EditMode = emAppend) and dbMain.isExistCounselingMeetingDate(nInOutID, sMeetingDate)) or
     ((EditMode = emUpdate) and (sMeetingDate <> adoCounseling.FieldByName('MeetingDate').AsString) and
       dbMain.isExistCounselingMeetingDate(nInOutID, sMeetingDate)) then
  begin
    oGlobal.Msg('해당 입력일에 이미 입력된 상담이 있습니다!');
    Exit;
  end;

  if oGlobal.YesNo('저장하시겠습니까?') <> mrYes then Exit;

  adoCounseling.DisableControls;
  try
    adoCounseling.Connection.BeginTrans;

    if EditMode = emAppend then
    begin
      adoCounseling.Append;
      adoCounseling.FieldByName('InOutID').AsInteger := adoInOut.FieldByName('InOutID').AsInteger;
      adoCounseling.FieldByName('Seq').AsInteger := dbMain.GetLastCounselingSeq(adoInOut.FieldByName('InOutID').AsInteger) + 1;
    end
    else
      adoCounseling.Edit;

    adoCounseling.FieldByName('A1').AsBoolean := chkA1.Checked;
    adoCounseling.FieldByName('A2').AsBoolean := chkA2.Checked;
    adoCounseling.FieldByName('A3').AsBoolean := chkA3.Checked;
    adoCounseling.FieldByName('A4').AsBoolean := chkA4.Checked;
    adoCounseling.FieldByName('A5').AsBoolean := chkA5.Checked;

    adoCounseling.FieldByName('B1').AsBoolean := chkB1.Checked;
    adoCounseling.FieldByName('B2').AsBoolean := chkB2.Checked;
    adoCounseling.FieldByName('B3').AsBoolean := chkB3.Checked;
    adoCounseling.FieldByName('B4').AsBoolean := chkB4.Checked;
    adoCounseling.FieldByName('B5').AsBoolean := chkB5.Checked;

    adoCounseling.FieldByName('C1').AsBoolean := chkC1.Checked;
    adoCounseling.FieldByName('C2').AsBoolean := chkC2.Checked;
    adoCounseling.FieldByName('C3').AsBoolean := chkC3.Checked;

    adoCounseling.FieldByName('D1').AsBoolean := chkD1.Checked;
    adoCounseling.FieldByName('D2').AsBoolean := chkD2.Checked;

    adoCounseling.FieldByName('E1').AsBoolean := chkE1.Checked;
    adoCounseling.FieldByName('E2').AsBoolean := chkE2.Checked;
    adoCounseling.FieldByName('E3').AsBoolean := chkE3.Checked;
    adoCounseling.FieldByName('E4').AsBoolean := chkE4.Checked;

    adoCounseling.FieldByName('F1').AsBoolean := chkF1.Checked;
    adoCounseling.FieldByName('F2').AsBoolean := chkF2.Checked;

    adoCounseling.FieldByName('WorkerOpinion').AsString := Trim(memoWorkerOpinion.Lines.Text);

    if oGlobal.isNotNullStr(cxdateMeetingDate.Text) then
      adoCounseling.FieldByName('MeetingDate').AsString := oGlobal.DateToString(cxDateMeetingDate.Date);

    adoCounseling.FieldByName('WriteDate').AsString := oGlobal.DateToString(now);
    adoCounseling.FieldByName('Writer').AsString := oConfig.User.UserID;

    adoCounseling.Post;

    adoCounseling.Connection.CommitTrans;

    oGlobal.Msg('저장하였습니다!');

    ModalResult := mrOK;
  except
    adoCounseling.Cancel;
    adoCounseling.Connection.RollbackTrans;

    oGlobal.Msg('저장에 실패했습니다!');
  end;

  nSeq := adoCounseling.FieldByName('Seq').AsInteger;
  adoCounseling.Close;

  if dbMain.RemakeCounselingOrder(nInOutID) then
    nSeq := dbMain.GetCounselingSeq(nInOutID, sMeetingDate);

  adoCounseling.Tag := cDoing;

  adoCounseling.Open;
  adoCounseling.Locate('Seq', nSeq, [loCaseInsensitive]);

  adoCounseling.EnableControls;

  adoCounseling.Tag := cDone;
end;

procedure TfrmCounseling.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmCounseling.FormShow(Sender: TObject);
begin
  oGlobal.ClearComponents(self);
  SetControls;
end;

procedure TfrmCounseling.memoWorkerOpinionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Sender is TMemo) then
  begin
    if (Key = VK_RETURN) then
      dbMain.SetCurrentKeyword(TMemo(Sender))
    else if Key = VK_F1 then         
      oGlobal.GetKeywordContent(TMemo(Sender));
  end;
end;

procedure TfrmCounseling.SetControls;
begin
  txtPatientName.Text := adoInOut.FieldByName('PatientName').AsString;
  txtSexAge.Text := oGlobal.GetAge(adoInOut.FieldByName('Birthday').AsString, adoInOut.FieldByName('InDate').AsString);

  if adoInOut.FieldByName('Sex').AsString = cMale then
    txtSexAge.Text := '남 (만' + txtSexAge.Text + '세)'
  else
    txtSexAge.Text := '여 (만' + txtSexAge.Text + '세)';


  txtDiag.Text := adoInOut.FieldByName('DiagName').AsString;
  txtDoctor.Text := adoInOut.FieldByName('DoctorName').AsString;
  cxDateInDate.EditText := adoInOut.FieldByName('InDate').AsString;

  if EditMode = emAppend then Exit;

  if oGlobal.isDateString(adoCounseling.FieldByName('MeetingDate').AsString) then
    cxDateMeetingDate.EditValue := adoCounseling.FieldByName('MeetingDate').AsString;

  chkA1.Checked := adoCounseling.FieldByName('A1').AsBoolean;
  chkA2.Checked := adoCounseling.FieldByName('A2').AsBoolean;
  chkA3.Checked := adoCounseling.FieldByName('A3').AsBoolean;
  chkA4.Checked := adoCounseling.FieldByName('A4').AsBoolean;
  chkA5.Checked := adoCounseling.FieldByName('A5').AsBoolean;

  chkB1.Checked := adoCounseling.FieldByName('B1').AsBoolean;
  chkB2.Checked := adoCounseling.FieldByName('B2').AsBoolean;
  chkB3.Checked := adoCounseling.FieldByName('B3').AsBoolean;
  chkB4.Checked := adoCounseling.FieldByName('B4').AsBoolean;
  chkB5.Checked := adoCounseling.FieldByName('B5').AsBoolean;

  chkC1.Checked := adoCounseling.FieldByName('C1').AsBoolean;
  chkC2.Checked := adoCounseling.FieldByName('C2').AsBoolean;
  chkC3.Checked := adoCounseling.FieldByName('C3').AsBoolean;

  chkD1.Checked := adoCounseling.FieldByName('D1').AsBoolean;
  chkD2.Checked := adoCounseling.FieldByName('D2').AsBoolean;

  chkE1.Checked := adoCounseling.FieldByName('E1').AsBoolean;
  chkE2.Checked := adoCounseling.FieldByName('E2').AsBoolean;
  chkE3.Checked := adoCounseling.FieldByName('E3').AsBoolean;
  chkE4.Checked := adoCounseling.FieldByName('E4').AsBoolean;

  chkF1.Checked := adoCounseling.FieldByName('F1').AsBoolean;
  chkF2.Checked := adoCounseling.FieldByName('F2').AsBoolean;

  memoWorkerOpinion.Lines.Text := adoCounseling.FieldByName('WorkerOpinion').AsString;
end;

end.
