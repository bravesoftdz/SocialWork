unit uIntake;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uConfig, uGlobal, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPC3Painter, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, cxMaskEdit, cxDropDownEdit, cxCalendar,
  dxLayoutContainer, cxTextEdit, dxLayoutControl, dxLayoutLookAndFeels, cxMemo,
  cxRichEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls, Menus, cxButtons,
  cxLabel, ADODB;

type
  TfrmIntake = class(TForm)
    memoInMotivation: TMemo;
    txtDiag: TcxTextEdit;
    txtInfoDonor: TcxTextEdit;
    txtPatientName: TcxTextEdit;
    cxDateInDate: TcxDateEdit;
    txtSexAge: TcxTextEdit;
    txtDoctor: TcxTextEdit;
    cxDateMeetingDate: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    memoMajorProblem: TMemo;
    Label10: TLabel;
    memoInHistory: TMemo;
    Label11: TLabel;
    memoPersonHistory: TMemo;
    Label12: TLabel;
    memoWorkerOpinion: TMemo;
    Label13: TLabel;
    btnShortKey: TcxButton;
    cxGFamily: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxButton2: TcxButton;
    btnFamilyMgr: TcxButton;
    cxButton3: TcxButton;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    txtWorker: TcxTextEdit;
    Label8: TLabel;
    txtInType: TcxTextEdit;
    adoFamily: TADOQuery;
    dsFamily: TDataSource;
    procedure memoInMotivationKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure btnShortKeyClick(Sender: TObject);
    procedure btnFamilyMgrClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    oIntake: TIntake;
  end;

var
  frmIntake: TfrmIntake;

implementation

uses uMain, uDB, uSetting, uFamilyMgr, uRecord;
{$R *.dfm}

procedure TfrmIntake.btnShortKeyClick(Sender: TObject);
begin
  frmSetting.cxPageControl1.ActivePage := frmSetting.tabShortKeyMgr;
  frmSetting.ShowModal;
end;

procedure TfrmIntake.btnFamilyMgrClick(Sender: TObject);
var
  oFamilyMgr: TfrmFamilyMgr;
begin
  Application.CreateForm(TfrmFamilyMgr, oFamilyMgr);

  oFamilyMgr.oInOut.Clear;
  oFamilyMgr.oInOut.Copy(oIntake.oInOut);
    
  oFamilyMgr.ShowModal;

  if oFamilyMgr.Modified then
  begin
    adoFamily.Close;
    adoFamily.Open;
  end;

  oFamilyMgr.Free;  
end;

procedure TfrmIntake.cxButton2Click(Sender: TObject);
begin
  if trim(cxDateMeetingDate.EditText) = NULLString then
  begin
    oGlobal.Msg('면담일시를 기록하십시오!');
    Exit;
  end;

  if oGlobal.YesNo('저장하시겠습니까?') = mrYes then
    ModalResult := mrOK;
end;

procedure TfrmIntake.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmIntake.FormShow(Sender: TObject);
var
  sAge: string;
begin
  sAge := oGlobal.GetAge(oIntake.oPatient.sBirthday, oIntake.oInOut.sInDate);

  if oIntake.oPatient.bMale then
    txtSexAge.Text := '남 (만' + sAge + '세)'
  else
    txtSexAge.Text := '여 (만' + sAge + '세)';

  txtPatientName.Text := oIntake.oPatient.sPatientName;
  txtDiag.Text := oIntake.oInOut.sDiagName;
  txtInType.Text := dbMain.GetInTypeName(oIntake.oInOut.nInTypeID);
  txtDoctor.Text := oIntake.oInOut.sDoctorName;
  txtInfoDonor.Text := oIntake.InfoDonor;
  cxDateInDate.EditText := oIntake.oInOut.sInDate;
  cxDateMeetingDate.EditText := oIntake.MeetingDate;
  txtWorker.Text := oIntake.oInOut.sUserName;
  memoInMotivation.Text := oIntake.InMotivation;
  memoMajorProblem.Text := oIntake.MajorProblem;
  memoInHistory.Text := oIntake.InHistory;
  memoPersonHistory.Text := oIntake.PersonHistory;
  memoWorkerOpinion.Text := oIntake.WorkerOpinion;

  if oIntake.Mode = emAppend then
    cxDateMeetingDate.EditText := oGlobal.DateToString(Now);

  txtInfoDonor.SetFocus;
  txtInfoDonor.SelStart := 0;

  try
    adoFamily.SQL.Text := 'select *' +
                          '       ,(select RelationshipName from Relationships where Relationships.RelationshipID = families.RelationshipID) as RelationshipName' +
                          '  from families' +
                          ' where InOutID=' + inttostr(oIntake.oInOut.InOutID);
     adoFamily.Open;
  except
    oGlobal.Msg('가족관계정보에 접근할 수 없습니다!');
    Close;
  end;
end;

procedure TfrmIntake.memoInMotivationKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Line: integer;
  str, keyword, content: string;
begin
  if (Sender is TMemo) and (Key = VK_RETURN) then
  begin
    Line := TMemo(Sender).Perform(EM_LINEFROMCHAR, TMemo(Sender).SelStart, 0);
    str := trim(TMemo(Sender).Lines[Line]);
    if (Length(str) > 0) and (str[1] = '/') and (Length(str) > 1) then
    begin
      keyword := copy(str, 2, Length(str) - 1);

      if dbMain.isKeyword(oConfig.User.HospitalID, keyword, content) then
        TMemo(Sender).Lines[Line] := content;
    end;
  end;
end;

end.
