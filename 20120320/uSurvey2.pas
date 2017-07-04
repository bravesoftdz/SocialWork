unit uSurvey2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel,
  dxSkinOffice2007Blue, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxGroupBox, cxRadioGroup, uGlobal, DB, ADODB, dxSkinBlack, dxSkinBlue,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, ExtCtrls;

type
  TfrmSurvey2 = class(TForm)
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
    memoWorkerOpinion: TMemo;
    btnSave: TcxButton;
    cxButton3: TcxButton;
    rg1: TcxRadioGroup;
    rg2: TcxRadioGroup;
    rg3: TcxRadioGroup;
    rg4: TcxRadioGroup;
    rg5: TcxRadioGroup;
    rg6: TcxRadioGroup;
    rg7: TcxRadioGroup;
    rg8: TcxRadioGroup;
    rg9: TcxRadioGroup;
    rg10: TcxRadioGroup;
    rg11: TcxRadioGroup;
    rg12: TcxRadioGroup;
    rg13: TcxRadioGroup;
    rg14: TcxRadioGroup;
    Panel6: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure memoWorkerOpinionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetControls;
  public
    { Public declarations }
    adoSurvey2: TAdoQuery;
    adoInOut: TADOQuery;
  end;

var
  frmSurvey2: TfrmSurvey2;

implementation
uses uConfig, uDB;
{$R *.dfm}

procedure TfrmSurvey2.btnSaveClick(Sender: TObject);
begin
  if not adoSurvey2.Active then Exit;

  if oGlobal.isNullStr(cxDateMeetingDate.Text) then
  begin
    oGlobal.Msg('면담일을 선택하십시오!');
    Exit;
  end;

  if oGlobal.YesNo('저장하시겠습니까?') <> mrYes then Exit;

  adoSurvey2.DisableControls;
  try
    adoSurvey2.Connection.BeginTrans;
    if adoSurvey2.IsEmpty then
    begin
      adoSurvey2.Append;
      adoSurvey2.FieldByName('InOutID').AsInteger := adoInOut.FieldByName('InOutID').AsInteger;
    end
    else
      adoSurvey2.Edit;

    adoSurvey2.FieldByName('Q1').AsInteger := rg1.ItemIndex;
    adoSurvey2.FieldByName('Q2').AsInteger := rg2.ItemIndex;
    adoSurvey2.FieldByName('Q3').AsInteger := rg3.ItemIndex;
    adoSurvey2.FieldByName('Q4').AsInteger := rg4.ItemIndex;
    adoSurvey2.FieldByName('Q5').AsInteger := rg5.ItemIndex;
    adoSurvey2.FieldByName('Q6').AsInteger := rg6.ItemIndex;
    adoSurvey2.FieldByName('Q7').AsInteger := rg7.ItemIndex;
    adoSurvey2.FieldByName('Q8').AsInteger := rg8.ItemIndex;
    adoSurvey2.FieldByName('Q9').AsInteger := rg9.ItemIndex;
    adoSurvey2.FieldByName('Q10').AsInteger := rg10.ItemIndex;
    adoSurvey2.FieldByName('Q11').AsInteger := rg11.ItemIndex;
    adoSurvey2.FieldByName('Q12').AsInteger := rg12.ItemIndex;
    adoSurvey2.FieldByName('Q13').AsInteger := rg13.ItemIndex;
    adoSurvey2.FieldByName('Q14').AsInteger := rg14.ItemIndex;
    adoSurvey2.FieldByName('WorkerOpinion').AsString := Trim(memoWorkerOpinion.Lines.Text);

    if oGlobal.isNotNullStr(cxdateMeetingDate.Text) then
      adoSurvey2.FieldByName('MeetingDate').AsString := oGlobal.DateToString(cxDateMeetingDate.Date);

    adoSurvey2.FieldByName('WriteDate').AsString := oGlobal.DateToString(now);
    adoSurvey2.FieldByName('Writer').AsString := oConfig.User.UserID;

    adoSurvey2.Post;

    adoSurvey2.Connection.CommitTrans;

    oGlobal.Msg('저장하였습니다!');

    ModalResult := mrOK;
  except
    adoSurvey2.Cancel;
    adoSurvey2.Connection.RollbackTrans;

    oGlobal.Msg('저장에 실패했습니다!');
  end;
  adoSurvey2.EnableControls;
end;

procedure TfrmSurvey2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;  
end;

procedure TfrmSurvey2.FormShow(Sender: TObject);
begin
  oGlobal.ClearComponents(self);
  SetControls;
end;

procedure TfrmSurvey2.memoWorkerOpinionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Sender is TMemo) then
  begin
    if (Key = VK_RETURN) then
      dbMain.SetCurrentKeyword(TMemo(Sender))
    else if Key = VK_F1 then
      oGlobal.GetKeywordContent(TMemo(Sender));
  end;
end;

procedure TfrmSurvey2.SetControls;
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

  if adoSurvey2.IsEmpty then Exit;

  if oGlobal.isDateString(adoSurvey2.FieldByName('MeetingDate').AsString) then
    cxDateMeetingDate.EditValue := adoSurvey2.FieldByName('MeetingDate').AsString;

  rg1.ItemIndex := adoSurvey2.FieldByName('Q1').AsInteger;
  rg2.ItemIndex := adoSurvey2.FieldByName('Q2').AsInteger;
  rg3.ItemIndex := adoSurvey2.FieldByName('Q3').AsInteger;
  rg4.ItemIndex := adoSurvey2.FieldByName('Q4').AsInteger;
  rg5.ItemIndex := adoSurvey2.FieldByName('Q5').AsInteger;
  rg6.ItemIndex := adoSurvey2.FieldByName('Q6').AsInteger;
  rg7.ItemIndex := adoSurvey2.FieldByName('Q7').AsInteger;
  rg8.ItemIndex := adoSurvey2.FieldByName('Q8').AsInteger;
  rg9.ItemIndex := adoSurvey2.FieldByName('Q9').AsInteger;
  rg10.ItemIndex := adoSurvey2.FieldByName('Q10').AsInteger;
  rg11.ItemIndex := adoSurvey2.FieldByName('Q11').AsInteger;
  rg12.ItemIndex := adoSurvey2.FieldByName('Q12').AsInteger;
  rg13.ItemIndex := adoSurvey2.FieldByName('Q13').AsInteger;
  rg14.ItemIndex := adoSurvey2.FieldByName('Q14').AsInteger;
  memoWorkerOpinion.Lines.Text := adoSurvey2.FieldByName('WorkerOpinion').AsString;
end;

end.
