unit uTraining;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel,
  dxSkinOffice2007Blue, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxGroupBox, DB, ADODB, uGlobal;

type
  TfrmTraining = class(TForm)
    btnSave: TcxButton;
    cxButton3: TcxButton;
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
    cxGroupBox21: TcxGroupBox;
    memoRequest: TMemo;
    cxGroupBox3: TcxGroupBox;
    memoPurpose: TMemo;
    cxGroupBox7: TcxGroupBox;
    memoIntervationCourse: TMemo;
    cxGroupBox8: TcxGroupBox;
    memoWorkerOpinion: TMemo;
    btnShortKey: TcxButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnShortKeyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure memoRequestKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetControls;
  public
    { Public declarations }
    adoInOut: TADOQuery;
    adoTraining: TAdoQuery;
    EditMode: TEditMode;
  end;

var
  frmTraining: TfrmTraining;

implementation
uses uDB, uConfig, uShortKeyMgr;

{$R *.dfm}

procedure TfrmTraining.btnSaveClick(Sender: TObject);
var
  nInOutID, nSeq: integer;
  sMeetingDate: string;
begin
  if not adoTraining.Active then Exit;

  nInOutID := adoInOut.FieldByName('InOutID').AsInteger;
  sMeetingDate := cxDateMeetingDate.Text;

  if oGlobal.isNullStr(sMeetingDate) then
  begin
    oGlobal.Msg('면담일을 선택하십시오!');
    Exit;
  end;

  if ((EditMode = emAppend) and dbMain.isExistTrainingMeetingDate(nInOutID, sMeetingDate)) or
     ((EditMode = emUpdate) and (sMeetingDate <> adoTraining.FieldByName('MeetingDate').AsString) and
       dbMain.isExistTrainingMeetingDate(nInOutID, sMeetingDate)) then
  begin
    oGlobal.Msg('해당 입력일에 이미 입력된 내용이 있습니다!');
    Exit;
  end;

  if oGlobal.YesNo('저장하시겠습니까?') <> mrYes then Exit;

  adoTraining.DisableControls;
  try
    adoTraining.Connection.BeginTrans;

    if EditMode = emAppend then
    begin
      adoTraining.Append;
      adoTraining.FieldByName('InOutID').AsInteger := adoInOut.FieldByName('InOutID').AsInteger;
      adoTraining.FieldByName('Seq').AsInteger := dbMain.GetLastTrainingSeq(adoInOut.FieldByName('InOutID').AsInteger) + 1;
    end
    else
      adoTraining.Edit;

    adoTraining.FieldByName('Request').AsString := Trim(memoRequest.Lines.Text);
    adoTraining.FieldByName('Purpose').AsString := Trim(memoPurpose.Lines.Text);
    adoTraining.FieldByName('IntervationCourse').AsString := Trim(memoIntervationCourse.Lines.Text);
    adoTraining.FieldByName('WorkerOpinion').AsString := Trim(memoWorkerOpinion.Lines.Text);

    if oGlobal.isNotNullStr(cxdateMeetingDate.Text) then
      adoTraining.FieldByName('MeetingDate').AsString := oGlobal.DateToString(cxDateMeetingDate.Date);

    adoTraining.FieldByName('WriteDate').AsString := oGlobal.DateToString(now);
    adoTraining.FieldByName('Writer').AsString := oConfig.User.UserID;

    adoTraining.Post;

    adoTraining.Connection.CommitTrans;

    oGlobal.Msg('저장하였습니다!');

    ModalResult := mrOK;
  except
    adoTraining.Cancel;
    adoTraining.Connection.RollbackTrans;

    oGlobal.Msg('저장에 실패했습니다!');
  end;

  nSeq := adoTraining.FieldByName('Seq').AsInteger;
  adoTraining.Close;

  if dbMain.RemakeTrainingOrder(nInOutID, sMeetingDate) then
    nSeq := dbMain.GetTrainingSeq(nInOutID, sMeetingDate);

  adoTraining.Open;

  adoTraining.Locate('Seq', nSeq, [loCaseInsensitive]);

  adoTraining.EnableControls;
end;

procedure TfrmTraining.btnShortKeyClick(Sender: TObject);
begin
  frmShortKeyMgr.ShowModal;
end;

procedure TfrmTraining.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmTraining.FormShow(Sender: TObject);
begin
  oGlobal.ClearComponents(self);
  SetControls;
end;

procedure TfrmTraining.memoRequestKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Sender is TMemo) and (Key = VK_RETURN) then
    dbMain.SetCurrentKeyword(TMemo(Sender));
end;

procedure TfrmTraining.SetControls;
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

  if oGlobal.isDateString(adoTraining.FieldByName('MeetingDate').AsString) then
    cxDateMeetingDate.EditValue := adoTraining.FieldByName('MeetingDate').AsString;

  memoRequest.Lines.Text := adoTraining.FieldByName('Request').AsString;
  memoPurpose.Lines.Text := adoTraining.FieldByName('Purpose').AsString;
  memoIntervationCourse.Lines.Text := adoTraining.FieldByName('IntervationCourse').AsString;
  memoWorkerOpinion.Lines.Text := adoTraining.FieldByName('WorkerOpinion').AsString;
end;

end.
