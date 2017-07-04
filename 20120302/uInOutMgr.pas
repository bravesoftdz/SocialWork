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
  // oGlobal.Msg('�Կ����� ������ ������ �ֽ��ϴ�!');
  // Exit;
  // end;

  if oGlobal.YesNo('�Կ������ �Ͻðڽ��ϱ�?') <> mrYes then
    Exit;

  if not isValidInput then
    Exit;

  nWardID := dbMain.GetWardID(HospitalID, cboWard.Text);

  // if dbMain.isDuplicatedInOut(oInOut.nHospitalID, PatientID, cxDEInDate.Text) then
  // begin
  // oGlobal.Msg('���� �Կ����ڰ� �ֽ��ϴ�');
  // Exit;
  // end;
  //

  if dbMain.isDuplicatedInWard(HospitalID, PatientID, nWardID) then
  begin
    oGlobal.Msg('���� ������ ��ϵ� �Կ��� �ֽ��ϴ�!');
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
    oGlobal.Msg('�Կ������ �Ǿ����ϴ�!');

    nInOutID := adoInOut.FieldByName('InOutID').AsInteger;

    adoInOut.Close;
    adoInOut.Open;
    adoInOut.Locate('InOutID', nInOutID, [loCaseInsensitive]);

    Modified := True;
  except
    adoInOut.Cancel;
    adoInOut.Connection.RollbackTrans;
    oGlobal.Msg('�Կ���Ͽ� �����߽��ϴ�!');
  end;
  adoInOut.EnableControls;
end;

procedure TfrmInOutMgr.btnInOutUpdateClick(Sender: TObject);
var
  nInOutID, nWardID, nBohumID: integer;
begin
  if adoInOut.IsEmpty or isNotModified then
  begin
    oGlobal.Msg('������ ������ �����ϴ�!');
    Exit;
  end;

  nWardID := dbMain.GetWardID(HospitalID, cboWard.Text);
  if nWardID <> adoInOut.FieldByName('WardID').AsInteger then
  begin
    oGlobal.Msg('������ ������ �� �����ϴ�!' + #13 + '�űԷ� �Կ���� �Ͻʽÿ�!');
    Exit;
  end;

  if oGlobal.YesNo('���������� �Ͻðڽ��ϱ�?') <> mrYes then
    Exit;

  if (cboState.ItemIndex = cIn) and
    (adoInOut.FieldByName('State').AsInteger = cOut) and dbMain.isExistsIn
    (HospitalID, PatientID) then
  begin
    oGlobal.Msg('�̹� �Կ����� ������ ������ �ֽ��ϴ�!');
    Exit;
  end;

  if not isValidInput then
    Exit;

  if (adoInOut.FieldByName('InDate').AsString <> oGlobal.DateToString
      (cxDEInDate.Date)) and dbMain.isDuplicatedInOut
    (HospitalID, PatientID, cxDEInDate.Text) then
  begin
    oGlobal.Msg('���� �Կ����ڰ� �ֽ��ϴ�');
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
    oGlobal.Msg('���������� �Ǿ����ϴ�!');

    nInOutID := adoInOut.FieldByName('InOutID').AsInteger;

    adoInOut.Close;
    adoInOut.Open;
    adoInOut.Locate('InOutID', nInOutID, [loCaseInsensitive]);

    Modified := True;
  except
    adoInOut.Cancel;
    adoInOut.Connection.RollbackTrans;
    oGlobal.Msg('���������� �����߽��ϴ�!');
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
    oGlobal.Msg('������ ����� ������ �����ϴ�!');
    Exit;
  end;

  nInOutID := adoInOut.FieldByName('InOutID').AsInteger;

  Msg := '';
  rt := dbMain.UsedRecord(nInOutID);
  case rt of
    rtIntake:
      Msg := 'Intake';
    rtSurvey1:
      Msg := '��ȸ��������I';
    rtSurvey2:
      Msg := '��ȸ��������II';
    rtCounseling:
      Msg := '��ȸ�������';
    rtTraining:
      Msg := '��ȸ��Ȱ�Ʒ�';
    rtProgram:
      Msg := '����ġ�����';
    rtFamily:
      Msg := '��������';
    rtError:
      Msg := '������ �߻��߽��ϴ�';
  end;

  if Msg <> NullString then
  begin
    if rt = rtError then
      oGlobal.Msg(Msg)
    else
      oGlobal.Msg(Msg + ' �� ����� ������ �ֽ��ϴ�!' + #13 + '�ش系���� ���� �� �� �ٽ� ������ �ֽʽÿ�!');

    Exit;
  end;

  if oGlobal.YesNo('���� �Ͻðڽ��ϱ�?') <> mrYes then
    Exit;

  adoInOut.DisableControls;
  try
    adoInOut.Connection.BeginTrans;
    adoInOut.Delete;
    adoInOut.Connection.CommitTrans;

    Modified := True;

    oGlobal.Msg('�����Ͽ����ϴ�!', 500);
  except
    adoInOut.Connection.RollbackTrans;
    oGlobal.Msg('���� �� ������ �߻��߽��ϴ�!');
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
    oGlobal.Msg('�Կ����ڸ� �Է��Ͻʽÿ�!');
    cxDEInDate.SetFocus;
  end
  else if (cboState.ItemIndex = cOut) and oGlobal.isNullStr(cxDEOutDate.Text)
    then
  begin
    oGlobal.Msg('������ڸ� �Է��Ͻʽÿ�!');
    cxDEOutDate.SetFocus;
  end
  else if oGlobal.isNullStr(cboWard.Text) then
  begin
    oGlobal.Msg('������ �����Ͻʽÿ�!');
    cboWard.SetFocus;
  end
  else if oGlobal.isNullStr(cboUser.Text) then
  begin
    oGlobal.Msg('����ڸ� �����Ͻʽÿ�!');
    cboUser.SetFocus;
  end
  else if oGlobal.isNullStr(cboDoctor.Text) then
  begin
    oGlobal.Msg('����ǻ縦 �����Ͻʽÿ�!');
    cboDoctor.SetFocus;
  end
  else if oGlobal.isNullStr(cboState.Text) then
  begin
    oGlobal.Msg('��/��� ������ �����Ͻʽÿ�!');
    cboState.SetFocus;
  end
  else
    result := True;
end;

procedure TfrmInOutMgr.SetQuery;
begin
  adoInOut.SQL.Text := 'select *' +
    '       ,(select WardName from Wards as W where W.WardID=I.WardID) as WardName'
    + '       , case state when 0 then ''�Կ�''' +
    '                    when 1 then ''���''' +
    '                    else ''����''' + '         end as StateName' +
    '       ,(select UserName from Users as U Where U.HospitalID=I.HospitalID and U.UserID=I.UserID and Worker=1) as UserName'
    + '       ,(select UserName from Users as U where u.hospitalID=I.HospitalID and U.UserID=I.DoctorID and Doctor=1) as DoctorName' + '       ,(select BohumName from Bohum where Bohum.BohumID=I.BohumID) as BohumName' + '  from inout as I' + ' where HospitalID=' + inttostr(HospitalID) + '   and PatientID=''' + PatientID + '''' + ' order by InDate desc';
  try
    adoInOut.Open;
  except
    oGlobal.Msg('����������� ������ �� �����ϴ�!');
    Timer1.Enabled := True;
  end;
end;

procedure TfrmInOutMgr.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  Close;
end;

end.
