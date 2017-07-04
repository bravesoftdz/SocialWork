unit uInOutMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPC3Painter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  ADODB,
  cxContainer, StdCtrls, cxDropDownEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  ExtCtrls, uGlobal, uConfig, cxSpinEdit, cxTimeEdit, Menus, cxButtons, cxLabel;

type
  TfrmInOutMgr = class(TForm)
    dsInOut: TDataSource;
    adoInOut: TADOQuery;
    cxGrid1: TcxGrid;
    cxGInOut: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxDEInDate: TcxDateEdit;
    txtDiagName: TcxTextEdit;
    cboWard: TcxComboBox;
    cboDoctor: TcxComboBox;
    cboUser: TcxComboBox;
    Label1: TLabel;
    cxDEOutDate: TcxDateEdit;
    Label2: TLabel;
    cboState: TcxComboBox;
    Label3: TLabel;
    pnlPatientID: TPanel;
    Label4: TLabel;
    pnlPatientName: TPanel;
    cxGInOutInDate: TcxGridDBColumn;
    cxGInOutOutDate: TcxGridDBColumn;
    cxGInOutDiagName: TcxGridDBColumn;
    cxGInOutWardName: TcxGridDBColumn;
    cxGInOutStateName: TcxGridDBColumn;
    cxGInOutUserName: TcxGridDBColumn;
    cxGInOutDoctorName: TcxGridDBColumn;
    Timer1: TTimer;
    cxTEInTime: TcxTimeEdit;
    Label10: TLabel;
    cxTEOutTime: TcxTimeEdit;
    Label11: TLabel;
    btnInOutClear: TcxButton;
    btnClose: TcxButton;
    btnInOutAppend: TcxButton;
    btnInOutUpdate: TcxButton;
    Label13: TLabel;
    cboInType: TcxComboBox;
    btnInOutDelete: TcxButton;
    btnFamilyMgr: TcxButton;
    cboBohum: TcxComboBox;
    Label12: TLabel;
    cxGInOutColumn1: TcxGridDBColumn;
    Label14: TLabel;
    txtRoom: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure cxGInOutCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure cxDEInDateKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnInOutClearClick(Sender: TObject);
    procedure btnInOutAppendClick(Sender: TObject);
    procedure btnInOutUpdateClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnInOutDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFamilyMgrClick(Sender: TObject);
  private
    { Private declarations }
    procedure ClearControls;
    procedure SetQuery;
    function isValidInput: Boolean;
    function isNotModified: Boolean;
  public
    { Public declarations }
    PatientID: string;
    HospitalID: integer;
    Modified: Boolean;
  end;

var
  frmInOutMgr: TfrmInOutMgr;

implementation

uses uDB, uFamilyMgr;
{$R *.dfm}

procedure TfrmInOutMgr.btnInOutClearClick(Sender: TObject);
begin
  ClearControls;
end;

procedure TfrmInOutMgr.ClearControls;
begin
  cxDEInDate.Clear;
  cxTEInTime.Clear;
  cxDEOutDate.Clear;
  cxTEOutTime.Clear;
  txtRoom.Clear;
  txtDiagName.Clear;
  cboInType.Clear;
  cboBohum.Clear;
  cboWard.Clear;
  cboDoctor.Clear;
  cboUser.Clear;
  cboState.ItemIndex := 0;
end;

procedure TfrmInOutMgr.btnFamilyMgrClick(Sender: TObject);
var
  oFamilyMgr: TfrmFamilyMgr;
begin
  Application.CreateForm(TfrmFamilyMgr, oFamilyMgr);

  oFamilyMgr.adoInOut := adoInOut;

  oFamilyMgr.ShowModal;

  oFamilyMgr.Free;
end;

procedure TfrmInOutMgr.btnInOutAppendClick(Sender: TObject);
var
  nInOutID, nWardID, nBohumID: integer;
begin
  // if dbMain.isExistsIn(oInOut.nHospitalID, PatientID) then
  // begin
  // oGlobal.Msg('입원으로 설정된 정보가 있습니다!');
  // Exit;
  // end;

  if oGlobal.YesNo('입원등록을 하시겠습니까?') <> mrYes then
    Exit;

  if not isValidInput then
    Exit;

  nWardID := dbMain.GetWardID(HospitalID, cboWard.Text);

  // if dbMain.isDuplicatedInOut(oInOut.nHospitalID, PatientID, cxDEInDate.Text) then
  // begin
  // oGlobal.Msg('같은 입원일자가 있습니다');
  // Exit;
  // end;
  //

  if dbMain.isDuplicatedInWard(HospitalID, PatientID, nWardID) then
  begin
    oGlobal.Msg('같은 병동에 등록된 입원이 있습니다!');
    Exit;
  end;

  adoInOut.DisableControls;
  try
    adoInOut.Connection.BeginTrans;

    adoInOut.Append;
    adoInOut.FieldByName('HospitalID').AsInteger := HospitalID;
    adoInOut.FieldByName('PatientID').AsString := PatientID;
    adoInOut.FieldByName('InDate').AsString := oGlobal.DateToString
      (cxDEInDate.Date);
    adoInOut.FieldByName('InTime').AsString := oGlobal.TimeToString
      (cxTEInTime.Time);

    if oGlobal.isNotNullStr(cxDEOutDate.Text) then
      adoInOut.FieldByName('OutDate').AsString := oGlobal.DateToString
        (cxDEOutDate.Date)
    else
      adoInOut.FieldByName('OutDate').AsString := NullString;

    adoInOut.FieldByName('State').AsInteger := 0; // cboState.ItemIndex;
    adoInOut.FieldByName('Room').AsString := trim(txtRoom.Text);
    adoInOut.FieldByName('DiagName').AsString := trim(txtDiagName.Text);
    adoInOut.FieldByName('InTypeID').AsInteger := dbMain.GetInTypeID
      (HospitalID, cboInType.Text);

    nBohumID := dbMain.GetBohumID(cboBohum.Text);
    if nBohumID > -1 then
      adoInOut.FieldByName('BohumID').AsInteger := nBohumID;

    adoInOut.FieldByName('DoctorID').AsString := dbMain.GetDoctorID
      (HospitalID, cboDoctor.Text);
    adoInOut.FieldByName('UserID').AsString := dbMain.GetUserID
      (HospitalID, cboUser.Text);
    adoInOut.FieldByName('WardID').AsInteger := dbMain.GetWardID
      (HospitalID, cboWard.Text);
    adoInOut.Post;

    adoInOut.Connection.CommitTrans;
    oGlobal.Msg('입원등록이 되었습니다!');

    nInOutID := adoInOut.FieldByName('InOutID').AsInteger;

    adoInOut.Close;
    adoInOut.Open;
    adoInOut.Locate('InOutID', nInOutID, [loCaseInsensitive]);

    Modified := True;
  except
    adoInOut.Cancel;
    adoInOut.Connection.RollbackTrans;
    oGlobal.Msg('입원등록에 실패했습니다!');
  end;
  adoInOut.EnableControls;
end;

procedure TfrmInOutMgr.btnInOutUpdateClick(Sender: TObject);
var
  nInOutID, nWardID, nBohumID: integer;
begin
  if adoInOut.IsEmpty or isNotModified then
  begin
    oGlobal.Msg('수정할 정보가 없습니다!');
    Exit;
  end;

  nWardID := dbMain.GetWardID(HospitalID, cboWard.Text);
  if nWardID <> adoInOut.FieldByName('WardID').AsInteger then
  begin
    oGlobal.Msg('병동은 수정할 수 없습니다!' + #13 + '신규로 입원등록 하십시오!');
    Exit;
  end;

  if oGlobal.YesNo('정보수정을 하시겠습니까?') <> mrYes then
    Exit;

  if (cboState.ItemIndex = cIn) and
    (adoInOut.FieldByName('State').AsInteger = cOut) and dbMain.isExistsIn
    (HospitalID, PatientID) then
  begin
    oGlobal.Msg('이미 입원으로 설정된 정보가 있습니다!');
    Exit;
  end;

  if not isValidInput then
    Exit;

  if (adoInOut.FieldByName('InDate').AsString <> oGlobal.DateToString
      (cxDEInDate.Date)) and dbMain.isDuplicatedInOut
    (HospitalID, PatientID, cxDEInDate.Text) then
  begin
    oGlobal.Msg('같은 입원일자가 있습니다');
    Exit;
  end;

  adoInOut.DisableControls;
  try
    adoInOut.Connection.BeginTrans;

    adoInOut.Edit;
    adoInOut.FieldByName('HospitalID').AsInteger := HospitalID;
    adoInOut.FieldByName('PatientID').AsString := PatientID;
    adoInOut.FieldByName('InDate').AsString := oGlobal.DateToString
      (cxDEInDate.Date);

    if oGlobal.isNotNullStr(cxDEOutDate.Text) then
    begin
      adoInOut.FieldByName('OutDate').AsString := oGlobal.DateToString
        (cxDEOutDate.Date);
      adoInOut.FieldByName('OutTime').AsString := oGlobal.TimeToString
        (cxTEOutTime.Time);
    end
    else
    begin
      adoInOut.FieldByName('OutDate').AsString := NullString;
      adoInOut.FieldByName('OutTime').AsString := NullString;
    end;

    adoInOut.FieldByName('State').AsInteger := cboState.ItemIndex;
    adoInOut.FieldByName('Room').AsString := trim(txtRoom.Text);
    adoInOut.FieldByName('DiagName').AsString := trim(txtDiagName.Text);

    adoInOut.FieldByName('InTypeID').AsInteger := dbMain.GetInTypeID
      (HospitalID, cboInType.Text);

    nBohumID := dbMain.GetBohumID(cboBohum.Text);
    if nBohumID > -1 then
      adoInOut.FieldByName('BohumID').AsInteger := nBohumID
    else
      adoInOut.FieldByName('BohumID').AsString := NullString;

    adoInOut.FieldByName('DoctorID').AsString := dbMain.GetDoctorID
      (HospitalID, cboDoctor.Text);
    adoInOut.FieldByName('UserID').AsString := dbMain.GetUserID
      (HospitalID, cboUser.Text);
    adoInOut.FieldByName('WardID').AsInteger := dbMain.GetWardID
      (HospitalID, cboWard.Text);
    adoInOut.Post;

    adoInOut.Connection.CommitTrans;
    oGlobal.Msg('정보수정이 되었습니다!');

    nInOutID := adoInOut.FieldByName('InOutID').AsInteger;

    adoInOut.Close;
    adoInOut.Open;
    adoInOut.Locate('InOutID', nInOutID, [loCaseInsensitive]);

    Modified := True;
  except
    adoInOut.Cancel;
    adoInOut.Connection.RollbackTrans;
    oGlobal.Msg('정보수정에 실패했습니다!');
  end;
  adoInOut.EnableControls;
end;

procedure TfrmInOutMgr.btnInOutDeleteClick(Sender: TObject);
var
  nInOutID: integer;
  rt: TRecordType;
  Msg: string;
begin
  if adoInOut.IsEmpty then
  begin
    oGlobal.Msg('삭제할 입퇴원 내역이 없습니다!');
    Exit;
  end;

  nInOutID := adoInOut.FieldByName('InOutID').AsInteger;

  Msg := '';
  rt := dbMain.UsedRecord(nInOutID);
  case rt of
    rtIntake:
      Msg := 'Intake';
    rtSurvey1:
      Msg := '사회조사기록지I';
    rtSurvey2:
      Msg := '사회조사기록지II';
    rtCounseling:
      Msg := '사회사업지도';
    rtTraining:
      Msg := '사회재활훈련';
    rtProgram:
      Msg := '정신치료관리';
    rtFamily:
      Msg := '가족관계';
    rtError:
      Msg := '에러가 발생했습니다';
  end;

  if Msg <> NullString then
  begin
    if rt = rtError then
      oGlobal.Msg(Msg)
    else
      oGlobal.Msg(Msg + ' 에 저장된 내역이 있습니다!' + #13 + '해당내역을 삭제 한 후 다시 실행해 주십시오!');

    Exit;
  end;

  if oGlobal.YesNo('삭제 하시겠습니까?') <> mrYes then
    Exit;

  adoInOut.DisableControls;
  try
    adoInOut.Connection.BeginTrans;
    adoInOut.Delete;
    adoInOut.Connection.CommitTrans;

    Modified := True;

    oGlobal.Msg('삭제하였습니다!', 500);
  except
    adoInOut.Connection.RollbackTrans;
    oGlobal.Msg('삭제 중 에러가 발생했습니다!');
  end;
  adoInOut.EnableControls;
end;

procedure TfrmInOutMgr.cxDEInDateKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if Sender = cboInType then
      cxDEInDate.SetFocus
    else if Sender = cxDEInDate then
      cxTEInTime.SetFocus
    else if Sender = cxTEInTime then
      cxDEOutDate.SetFocus
    else if Sender = cxDEOutDate then
      cxTEOutTime.SetFocus
    else if Sender = cxTEOutTime then
      cboWard.SetFocus
    else if Sender = cboWard then
      txtRoom.SetFocus
    else if Sender = txtRoom then
      txtDiagName.SetFocus
    else if Sender = txtDiagName then
      cboDoctor.SetFocus
    else if Sender = cboDoctor then
      cboUser.SetFocus
    else if Sender = cboUser then
      cboState.SetFocus;
  end;
end;

procedure TfrmInOutMgr.cxGInOutCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  oD: TDateTime;
  oT: TTime;
  sInTypeName: string;
  sBohumName: string;
begin
  ClearControls;

  if adoInOut.IsEmpty then
    Exit;

  if oGlobal.StringToDate(adoInOut.FieldByName('InDate').AsString, oD) then
    cxDEInDate.Date := oD;
  if oGlobal.StringToTime(adoInOut.FieldByName('InTime').AsString, oT) then
    cxTEInTime.Time := oT;
  if oGlobal.StringToDate(adoInOut.FieldByName('OutDate').AsString, oD) then
    cxDEOutDate.Date := oD;
  if oGlobal.StringToTime(adoInOut.FieldByName('OutTime').AsString, oT) then
    cxTEOutTime.Time := oT;

  txtRoom.Text := adoInOut.FieldByName('Room').AsString;
  txtDiagName.Text := adoInOut.FieldByName('DiagName').AsString;

  sInTypeName := dbMain.GetInTypeName
    (adoInOut.FieldByName('InTypeID').AsInteger);
  cboInType.ItemIndex := cboInType.Properties.Items.IndexOf(sInTypeName);

  sBohumName := dbMain.GetBohumName(adoInOut.FieldByName('BohumID').AsInteger);
  cboBohum.ItemIndex := cboBohum.Properties.Items.IndexOf(sBohumName);

  if oGlobal.isNotNullStr(adoInOut.FieldByName('WardName').AsString) then
    cboWard.Text := adoInOut.FieldByName('WardName').AsString;
  if oGlobal.isNotNullStr(adoInOut.FieldByName('DoctorName').AsString) then
    cboDoctor.Text := adoInOut.FieldByName('DoctorName').AsString;
  if oGlobal.isNotNullStr(adoInOut.FieldByName('UserName').AsString) then
    cboUser.Text := adoInOut.FieldByName('UserName').AsString;

  cboState.ItemIndex := adoInOut.FieldByName('State').AsInteger;
end;

procedure TfrmInOutMgr.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  oGlobal.Msg(inttostr(Key));
end;

procedure TfrmInOutMgr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoInOut.Close;
end;

procedure TfrmInOutMgr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmInOutMgr.FormShow(Sender: TObject);
begin
  pnlPatientID.Caption := '';
  pnlPatientName.Caption := '';
  ClearControls;
  pnlPatientID.Caption := PatientID;
  pnlPatientName.Caption := dbMain.GetPatientName(HospitalID, PatientID);
  dbMain.GetInTypeList(oConfig.User.HospitalID, cboInType.Properties.Items);
  dbMain.GetBohumList(cboBohum.Properties.Items, False);
  dbMain.GetWardList(oConfig.User.HospitalID, cboWard.Properties.Items, False);
  dbMain.GetDoctorList(oConfig.User.HospitalID, cboDoctor.Properties.Items);
  dbMain.GetUserList(oConfig.User.HospitalID, cboUser.Properties.Items, False);
  SetQuery;
end;

function TfrmInOutMgr.isNotModified: Boolean;
var
  sOutDate: string;
begin
  if oGlobal.isNotNullStr(cxDEOutDate.Text) then
    sOutDate := oGlobal.DateToString(cxDEOutDate.Date)
  else
    sOutDate := NullString;

  result := (adoInOut.FieldByName('InDate').AsString = oGlobal.DateToString
      (cxDEInDate.Date)) and (adoInOut.FieldByName('InTime')
      .AsString = oGlobal.TimeToString(cxTEInTime.Time)) and
    (adoInOut.FieldByName('OutDate').AsString = sOutDate) and
    (adoInOut.FieldByName('OutTime').AsString = oGlobal.TimeToString
      (cxTEOutTime.Time)) and (adoInOut.FieldByName('State')
      .AsInteger = cboState.ItemIndex) and
    (adoInOut.FieldByName('Room').AsString = trim
      (txtRoom.Text)) and (adoInOut.FieldByName('DiagName').AsString = trim
      (txtDiagName.Text)) and (adoInOut.FieldByName('InTypeID')
      .AsInteger = dbMain.GetInTypeID(HospitalID, cboInType.Text)) and
    (adoInOut.FieldByName('DoctorID').AsString = dbMain.GetDoctorID
      (HospitalID, cboDoctor.Text)) and
    (adoInOut.FieldByName('UserID').AsString = dbMain.GetUserID
      (HospitalID, cboUser.Text)) and
    (adoInOut.FieldByName('WardID').AsInteger = dbMain.GetWardID
      (HospitalID, cboWard.Text));
end;

function TfrmInOutMgr.isValidInput: Boolean;
begin
  result := False;

  if oGlobal.isNullStr(cxDEInDate.Text) then
  begin
    oGlobal.Msg('입원일자를 입력하십시오!');
    cxDEInDate.SetFocus;
  end
  else if (cboState.ItemIndex = cOut) and oGlobal.isNullStr(cxDEOutDate.Text)
    then
  begin
    oGlobal.Msg('퇴원일자를 입력하십시오!');
    cxDEOutDate.SetFocus;
  end
  else if oGlobal.isNullStr(cboWard.Text) then
  begin
    oGlobal.Msg('병동을 선택하십시오!');
    cboWard.SetFocus;
  end
  else if oGlobal.isNullStr(cboUser.Text) then
  begin
    oGlobal.Msg('담당자를 선택하십시오!');
    cboUser.SetFocus;
  end
  else if oGlobal.isNullStr(cboDoctor.Text) then
  begin
    oGlobal.Msg('담당의사를 선택하십시오!');
    cboDoctor.SetFocus;
  end
  else if oGlobal.isNullStr(cboState.Text) then
  begin
    oGlobal.Msg('입/퇴원 구분을 선택하십시오!');
    cboState.SetFocus;
  end
  else
    result := True;
end;

procedure TfrmInOutMgr.SetQuery;
begin
  adoInOut.SQL.Text := 'select *' +
    '       ,(select WardName from Wards as W where W.WardID=I.WardID) as WardName'
    + '       , case state when 0 then ''입원''' +
    '                    when 1 then ''퇴원''' +
    '                    else ''에러''' + '         end as StateName' +
    '       ,(select UserName from Users as U Where U.HospitalID=I.HospitalID and U.UserID=I.UserID and Worker=1) as UserName'
    + '       ,(select UserName from Users as U where u.hospitalID=I.HospitalID and U.UserID=I.DoctorID and Doctor=1) as DoctorName' + '       ,(select BohumName from Bohum where Bohum.BohumID=I.BohumID) as BohumName' + '  from inout as I' + ' where HospitalID=' + inttostr(HospitalID) + '   and PatientID=''' + PatientID + '''' + ' order by InDate desc';
  try
    adoInOut.Open;
  except
    oGlobal.Msg('입퇴원정보를 가져올 수 없습니다!');
    Timer1.Enabled := True;
  end;
end;

procedure TfrmInOutMgr.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  Close;
end;

end.
