unit uPatientMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, ActnList, Grids, DBGrids, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPC3Painter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxGridBandedTableView,
  cxGridDBBandedTableView, cxLabel, cxContainer, cxTextEdit, Menus, cxButtons,
  cxRadioGroup, cxMaskEdit, cxDropDownEdit, cxGroupBox, cxCheckBox, ExtCtrls;

type
  TfrmPatientMgr = class(TForm)
    ActionList1: TActionList;
    actSelectWard: TAction;
    adoPatient: TADOQuery;
    dsPatient: TDataSource;
    Label3: TLabel;
    btnPatientAppend: TcxButton;
    btnPatientUpdate: TcxButton;
    cxButton3: TcxButton;
    btnSearch: TcxButton;
    cboSearchCondition: TcxComboBox;
    txtSearch: TcxTextEdit;
    btnPatientDelete: TcxButton;
    adoInOut: TADOQuery;
    dsInOut: TDataSource;
    cxGroupBox4: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGPatient: TcxGridDBTableView;
    cxGPatientPatientID: TcxGridDBColumn;
    cxGPatientPatientName: TcxGridDBColumn;
    cxGPatientSEX: TcxGridDBColumn;
    cxGPatientBIRTHDAY: TcxGridDBColumn;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGInOut: TcxGridDBTableView;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGInOutInDate: TcxGridDBColumn;
    cxGInOutOutDate: TcxGridDBColumn;
    cxGInOutWorkerName: TcxGridDBColumn;
    chkViewInPatient: TcxCheckBox;
    cxGInOutBohumName: TcxGridDBColumn;
    adoWardHistory: TADOQuery;
    dsWardHistory: TDataSource;
    cxGrid3: TcxGrid;
    cxGWardHistory: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBBandedTableView2: TcxGridDBBandedTableView;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    btnFamilyMgr: TcxButton;
    btnInOutAppend: TcxButton;
    btnInOutUpdate: TcxButton;
    btnInOutDelete: TcxButton;
    btnWardAppend: TcxButton;
    btnWardUpdate: TcxButton;
    btnWardDelete: TcxButton;
    Panel1: TPanel;
    btnUp: TcxButton;
    btnDown: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    cxGInOutInOutID: TcxGridDBColumn;
    cxGInOutDoctorName: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure actSelectWardExecute(Sender: TObject);
    procedure btnPatientAppendClick(Sender: TObject);
    procedure btnPatientUpdateClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPatientDeleteClick(Sender: TObject);
    procedure cboWardPropertiesChange(Sender: TObject);
    procedure chkViewInPatientClick(Sender: TObject);
    procedure dsPatientDataChange(Sender: TObject; Field: TField);
    procedure dsInOutDataChange(Sender: TObject; Field: TField);
    procedure btnFamilyMgrClick(Sender: TObject);
    procedure btnInOutAppendClick(Sender: TObject);
    procedure btnInOutUpdateClick(Sender: TObject);
    procedure btnInOutDeleteClick(Sender: TObject);
    procedure btnWardDeleteClick(Sender: TObject);
    procedure btnWardAppendClick(Sender: TObject);
    procedure btnWardUpdateClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
  private
    { Private declarations }
    FLoading: Boolean;
    procedure LoadInOut;
  public
    { Public declarations }
  end;

var
  frmPatientMgr: TfrmPatientMgr;

implementation
uses uMain, uDB, uGlobal, uConfig, uPatientNew, uPatientEdit,
  uFamilyMgr, uInOutEdit, uWardHistoryEdit, uInOutFix;
{$R *.dfm}

procedure TfrmPatientMgr.actSelectWardExecute(Sender: TObject);
var
  nHospitalID: integer;
  sHosPitalID, sSearch: string;
begin
  nHospitalID := oConfig.User.HospitalID;
  sHospitalID := inttostr(nHospitalID);

  sSearch := trim(txtSearch.Text);

  adoPatient.Close;
  with adoPatient.SQL do
  begin
    Clear;
    Add('SELECT HospitalID, PatientID, PatientName, Sex, Birthday');
    ADD('  FROM vInOut');
    ADD(' WHERE HospitalID=' + inttostr(oConfig.User.HospitalID));

    if chkViewInPatient.Checked then
      Add('   AND State=' + IntToStr(cIn));

    if cboSearchCondition.ItemIndex = 0 then
    begin
      Add('   AND PatientName Like ''%' + sSearch + '%''');
      ADD(' GROUP BY HospitalID, PatientID, PatientName, Sex, Birthday');
      Add(' ORDER BY PatientName');
      cxGPatientPatientName.SortIndex := 0;
      cxGPatientPatientName.SortOrder := soAscending;
      cxGPatientPatientID.SortIndex := -1;
      cxGPatientPatientID.SortOrder := soNone;
    end
    else
    begin
      Add('   AND PatientID Like ''%' + sSearch + '%''');
      ADD(' GROUP BY HospitalID, PatientID, PatientName, Sex, Birthday');
      Add(' ORDER BY PatientID');
      cxGPatientPatientID.SortIndex := 0;
      cxGPatientPatientID.SortOrder := soAscending;
      cxGPatientPatientName.SortIndex := -1;
      cxGPatientPatientName.SortOrder := soNone;
    end;

//    Add('select distinct P.HospitalID, P.PatientID, P.PatientName, P.Sex, P.Birthday');
//    Add('  from patients as P left join inout as I on I.PatientID=P.PatientID');
//    Add(' where P.HospitalID=' + inttostr(oConfig.User.HospitalID));
//
//    if chkViewInPatient.Checked then
//      Add('   and I.State=' + IntToStr(cIn));
//
//    if cboWard.ItemIndex > 0 then
//      Add('   and I.WardID=' + IntToStr(dbMain.GetWardID(oConfig.User.HospitalID, cboWard.Text)));
//
//    if cboSearchCondition.ItemIndex = 0 then
//    begin
//      Add('   and P.PatientName Like ''%' + sSearch + '%''');
//      Add(' order by P.PatientName');
//      cxGPatientPatientName.SortIndex := 0;
//      cxGPatientPatientName.SortOrder := soAscending;
//      cxGPatientPatientID.SortIndex := -1;
//      cxGPatientPatientID.SortOrder := soNone;
//    end
//    else
//    begin
//      Add('   and P.PatientID Like ''%' + sSearch + '%''');
//      Add(' order by P.PatientID');
//      cxGPatientPatientID.SortIndex := 0;
//      cxGPatientPatientID.SortOrder := soAscending;
//      cxGPatientPatientName.SortIndex := -1;
//      cxGPatientPatientName.SortOrder := soNone;
//    end;
  end;

  FLoading := True;
  try
    screen.Cursor := crHourGlass;
    adoPatient.Open;
    screen.Cursor := crDefault;
  except
    screen.Cursor := crDefault;
    oGlobal.Msg('환자정보를 가져올 수 없습니다!');
  end;
  FLoading := False;

  LoadInOut;
end;

procedure TfrmPatientMgr.btnFamilyMgrClick(Sender: TObject);
var
  oFamilyMgr: TfrmFamilyMgr;
begin
  Application.CreateForm(TfrmFamilyMgr, oFamilyMgr);

  oFamilyMgr.adoInOut := adoInOut;

  oFamilyMgr.ShowModal;

  oFamilyMgr.Free;
end;

procedure TfrmPatientMgr.btnInOutAppendClick(Sender: TObject);
begin
  if adoPatient.IsEmpty then
  begin
    oGlobal.Msg('선택된 환자가 없습니다!');
    Exit;
  end;

  frmInOutEdit.EditMode := emAppend;
  frmInOutEdit.HospitalID := adoPatient.FieldByName('HospitalID').AsInteger;
  frmInOutEdit.PatientID := adoPatient.fieldbyName('PatientID').AsString;
  frmInOutEdit.oInOut := TADOQuery(adoInOut);

  frmInOutEdit.ShowModal;
end;

procedure TfrmPatientMgr.btnInOutDeleteClick(Sender: TObject);
var
  oT: TADOQuery;
  nInOutID: integer;
  rt: TRecordType;
  Msg: string;
begin
  if adoInOut.IsEmpty then
  begin
    oGlobal.Msg('삭제할 입/퇴원 내역이 없습니다!');
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
    rtVisit:
      Msg := '가족방문기록지';
    rtFamily:
      Msg := '가족관계';
    rtOverNight:
      Msg := '입/퇴원, CR';
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

  oT := TADOQuery.Create(self);
  oT.Connection := adoInOut.Connection;

  try
    oT.Connection.BeginTrans;

    oT.SQL.Text := 'DELETE InOut' +
                   ' WHERE InOutID=' + adoInOut.FieldByName('InOutID').AsString;
    oT.ExecSQL;

    oT.SQL.Text := 'DELETE WardHistory' +
                   ' WHERE InOutID=' + adoInOut.FieldByName('InOutID').AsString;
    oT.ExecSQL;

    oT.Connection.CommitTrans;

    adoInOut.DisableControls;
    adoInOut.Close;
    adoInOut.Open;
    adoInOut.EnableControls;

    oGlobal.Msg('삭제하였습니다!', 500);
  except
    oT.Connection.RollbackTrans;
    oGlobal.Msg('삭제 중 에러가 발생했습니다!');
  end;
end;

procedure TfrmPatientMgr.btnInOutUpdateClick(Sender: TObject);
begin
  if adoInOut.IsEmpty then
  begin
    oGlobal.Msg('수정할 입/퇴원 내역이 없습니다!');
    Exit;
  end;

  frmInOutEdit.EditMode := emUpdate;
  frmInOutEdit.oInOut := TADOQuery(adoInOut);

  frmInOutEdit.ShowModal;
end;

procedure TfrmPatientMgr.btnPatientAppendClick(Sender: TObject);
var
  oP: TNewPatientInfo;
  sPatientID: string;
begin
  if frmPatientNew.ShowModal <> mrOK then Exit;

  sPatientID := trim(frmPatientNew.txtPatientID.Text);
  oP := TNewPatientInfo.Create(oConfig.User.HospitalID, sPatientID);

  oP.oPatient.sPatientName := trim(frmPatientNew.txtPatientName.Text);
  oP.oPatient.sBirthday := oGlobal.DateToString(frmPatientNew.cxDEBirthday.Date);
  oP.oPatient.bMale := frmPatientNew.rMale.Checked;

  oP.oInOut.nIntypeID := dbMain.GetInTypeID(oConfig.User.HospitalID, frmPatientNew.cboInType.Text);
  oP.oInOut.nBohumID := dbMain.GetBohumID(frmPatientNew.cboBohum.Text);
  oP.oInOut.sInDate := oGlobal.DateToString(frmPatientNew.cxDEInDate.Date);
  oP.oInOut.sInTime := oGlobal.TimeToString(frmPatientNew.cxTEInTime.Time);
  oP.oInOut.sOutDate := '';
  oP.oInOut.sOutTime := '00:00:00';
  oP.oInOut.sWardName := trim(frmPatientNew.cboWard.Text);
  oP.oInOut.sRoom := trim(frmPatientNew.txtRoom.Text);
  oP.oInOut.sDiagName := trim(frmPatientNew.txtDiagName.Text);
  oP.oInOut.sDoctorName := trim(frmPatientNew.cboDoctor.Text);
  oP.oInOut.sUserName := trim(frmPatientNew.cboUser.Text);
  oP.oInOut.bUsed := True;

  oP.oInOut.InOutID := dbMain.SaveNewPatient(oP);
  if oP.oInOut.InOutID <> -1 then
  begin
    adoPatient.DisableControls;
    adoPatient.Close;
    adoPatient.Open;
    adoPatient.Locate('PatientID', sPatientID, [loCaseInsensitive]);
    adoPatient.EnableControls;
    oGlobal.Msg('등록되었습니다!');
  end
  else
    oGlobal.Msg('신규환자 등록에 실패했습니다!');
end;

procedure TfrmPatientMgr.btnPatientDeleteClick(Sender: TObject);
begin
  if adoPatient.IsEmpty then
  begin
    oGlobal.Msg('삭제할 정보가 없습니다!');
    Exit;
  end;

  if not adoInOut.IsEmpty then
  begin
    oGlobal.Msg('해당 환자의 입원정보가 존재합니다.' + #13 + '입원정보 삭제 후 다시 시도하십시오!');
    Exit;
  end;

  if oGlobal.YesNo('삭제하시겠습니까?') <> mrYes then
    Exit;

  adoPatient.DisableControls;
  try
    adoPatient.Connection.BeginTrans;
    adoPatient.Delete;
    adoPatient.Connection.CommitTrans;
    oGlobal.Msg('삭제하였습니다!');
  except
    adoPatient.Cancel;
    adoPatient.Connection.RollbackTrans;
    oGlobal.Msg('삭제하지 못하였습니다!');
  end;
  adoPatient.EnableControls;
end;

procedure TfrmPatientMgr.btnPatientUpdateClick(Sender: TObject);
var
  sSex: string;
begin
  if adoPatient.IsEmpty then
  begin
    oGlobal.Msg('수정할 환자정보가 없습니다!');
    Exit;
  end;

  frmPatientEdit.oP.nHospitalID := oConfig.User.HospitalID;
  frmPatientEdit.oP.sPatientID := adoPatient.FieldByName('PatientID').AsString;
  frmPatientEdit.oP.sPatientName := adoPatient.FieldByName('PatientName').AsString;
  frmPatientEdit.oP.sBirthday := adoPatient.FieldByName('Birthday').AsString;
  frmPatientEdit.oP.bMale := adoPatient.FieldByName('Sex').AsString = cMale;

  if frmPatientEdit.ShowModal <> mrOK then
    Exit;

  if frmPatientEdit.oP.bMale then
    sSex := cMale
  else
    sSex := cFeMale;

  if dbMain.UpdatePatient(frmPatientEdit.oP.nHospitalID,
                          frmPatientEdit.oP.sPatientID,
                          frmPatientEdit.oP.sPatientName,
                          sSex,
                          frmPatientEdit.oP.sBirthday) then
  begin
    adoPatient.DisableControls;
    adoPatient.Close;
    adoPatient.Open;
    adoPatient.Locate('PatientID', frmPatientEdit.oP.sPatientID, [loCaseInsensitive]);
    adoPatient.EnableControls;
  end
  else
    oGlobal.Msg('수정하지 못하였습니다!');
end;

procedure TfrmPatientMgr.btnUpClick(Sender: TObject);
var
  nOldInOutID, nNewInOutID: integer;
  sOldInDate, sNewInDate: string;
  nRow: integer;
  nNo, nCount: integer;
begin
  if adoInOut.RecordCount < 2 then
  begin
    oGlobal.Msg('2개 이상의 입원정보가 있어야 입원정보 통합이 됩니다!');
    Exit;
  end;


  nNo := adoInOut.RecNo;
  nCount := adoInOut.RecordCount;

  nOldInOutID := adoInOut.FieldByName('InOutID').AsInteger;
  sOldInDate := adoInOut.FieldByName('InDate').AsString;

  nRow := cxGInOut.Controller.FocusedRecordIndex;

  if ((Sender=btnUp) and (nNo=1)) or (Sender=btnDown) and (nNo=nCount) then
  begin
    oGlobal.Msg('통합할 대상이 없습니다!');
    Exit;
  end;

  if Sender = btnUp then
    nNewInOutID := cxGInOut.DataController.GetValue(nRow-1, cxGInOutInOutID.Index)
  else
    nNewInOutID := cxGInOut.DataController.GetValue(nRow+1, cxGInOutInOutID.Index);

  if Sender = btnUp then
    sNewInDate := cxGInOut.DataController.GetValue(nRow-1, cxGInOutInDate.Index)
  else
    sNewInDate := cxGInOut.DataController.GetValue(nRow+1, cxGInOutInDate.Index);

  if dbMain.isExistsInFamilies(adoInOut.FieldByName('InOutID').AsInteger) then
  begin
    oGlobal.Msg('가족관계가 존재합니다.' + #13 + '삭제후 다시 시도해 주십시오!');
    Exit;
  end;

  if dbMain.isExistsInOverNight(adoInOut.FieldByName('InOutID').AsInteger) then
  begin
    oGlobal.Msg('외출/외박, CR 기록이 존재합니다.' + #13 + '삭제후 다시 시도해 주십시오!');
    Exit;
  end;

  if dbMain.isExistInIntake(nOldInOutID) and dbMain.isExistInIntake(nNewInOutID) then
  begin
    oGlobal.Msg('[ ' + sOldInDate + ' , ' + sNewInDate + ' ]의 ''개인력''이 중복됩니다!');
    Exit;
  end;

  if dbMain.isExistInSurvey1(nOldInOutID) and dbMain.isExistInSurvey1(nNewInOutID) then
  begin
    oGlobal.Msg('[ ' + sOldInDate + ' , ' + sNewInDate + ' ]의 ''사회조사기록지I''이 중복됩니다!');
    Exit;
  end;

  if dbMain.isExistInSurvey2(nOldInOutID) and dbMain.isExistInSurvey2(nNewInOutID) then
  begin
    oGlobal.Msg('[ ' + sOldInDate + ' , ' + sNewInDate + ' ]의 ''사회조사기록지II''이 중복됩니다!');
    Exit;
  end;

  frmInOutFix.NewInOutID := nNewInOutID;
  frmInOutFix.oOldWardHistory := adoWardHistory;
  if frmInOutFix.ShowModal = mrOK then
  begin
    adoInOut.DisableControls;
    adoInOut.Close;
    adoInOut.Open;
    adoInOut.Locate('InOutID', frmInOutFix.NewInOutID, [loCaseInsensitive]);
    adoInOut.EnableControls;
  end;
end;

procedure TfrmPatientMgr.btnWardAppendClick(Sender: TObject);
begin
  if not adoWardHistory.Active then
  begin
    oGlobal.Msg('병동정보에 연결되지 않았습니다!');
    Exit;
  end;

  frmWardHistoryEdit.EditMode := emAppend;
  frmWardHistoryEdit.InOut.ID := adoInOut.FieldByName('InOutID').AsInteger;
  frmWardHistoryEdit.oWardHistory := adoWardHistory;
  frmWardHistoryEdit.ShowModal;
end;

procedure TfrmPatientMgr.btnWardDeleteClick(Sender: TObject);
var
  oT: TADOQuery;
begin
  if adoWardHistory.RecordCount = 1 then
  begin
    oGlobal.Msg('최소 1개의 병동정보가 있어야 합니다!');
    Exit;
  end;

  if adoWardHistory.FieldByName('WardDate').AsString = adoInOut.FieldByName('InDate').AsString then
  begin
    oGlobal.Msg('입원시작일에 발생된 적용일자는 삭제할 수 없습니다!');
    Exit;
  end;

  oT := TADOQuery.Create(self);
  oT.Connection := adoWardHistory.Connection;
  try
    oT.SQL.Text := 'SELECT * FROM vProgramPatients' +
                   ' WHERE InOutID=' + adoWardHistory.FieldByName('InOutID').AsString +
                   '   AND WardDate=''' + adoWardHistory.FieldByName('WardDate').AsString + '''';
    oT.Open;
  finally
  end;

  if not oT.IsEmpty then
  begin
    oGlobal.Msg(oT.FieldByName('SDate').AsString + '의 [ ' +
                oT.FieldByName('ProgramName').AsString + ' - ' +
                oT.FieldByName('Content').AsString + ' ] 프로그램에 참여 되어있습니다!' + #13 +
                '해당 내용을 삭제한 후 다시 시도해 주십시오!');
    oT.Close;
    oT.Free;

    Exit;
  end;

  oT.Close;
  oT.Free;

  if oGlobal.YesNo('삭제하시겠습니까?') <> mrYes then
    Exit;

  try
    adoWardHistory.DisableControls;
    adoWardHistory.Connection.BeginTrans;

    adoWardHistory.Delete;

    adoWardHistory.Connection.CommitTrans;
    adoWardHistory.EnableControls;
  except
    adoWardHistory.Connection.RollbackTrans;
    adoWardHistory.EnableControls;
    oGlobal.Msg('삭제에 실패하였습니다!');
  end;
end;

procedure TfrmPatientMgr.btnWardUpdateClick(Sender: TObject);
begin
  if adoWardHistory.IsEmpty then
  begin
    oGlobal.Msg('수정할 정보가 없습니다!');
    Exit;
  end;

  frmWardHistoryEdit.EditMode := emUpdate;
  frmWardHistoryEdit.InDate := adoInOut.FieldByName('InDate').AsString;
  frmWardHistoryEdit.InOut.ID := adoInOut.FieldByName('InOutID').AsInteger;
  frmWardHistoryEdit.oWardHistory := adoWardHistory;
  frmWardHistoryEdit.ShowModal;
end;

procedure TfrmPatientMgr.cboWardPropertiesChange(Sender: TObject);
begin
  if FLoading then Exit;
  
  actSelectWard.Execute;
end;

procedure TfrmPatientMgr.chkViewInPatientClick(Sender: TObject);
begin
  actSelectWard.Execute;
end;

procedure TfrmPatientMgr.dsInOutDataChange(Sender: TObject; Field: TField);
var
  nInOutID: integer;
begin
  adoWardHistory.Close;

  if adoInOut.IsEmpty then
    Exit;

  nInOutID := adoInOut.FieldByName('InOutID').AsInteger;

  adoWardHistory.SQL.Text
    := 'SELECT *' +
       '       ,(select WardName from Wards where WardID=WardHistory.WardID) as WardName' +
       ' FROM WardHistory' +
       ' WHERE InOutID=' + inttostr(nInOutID) +
       ' ORDER BY WardDate DESC';

  adoWardHistory.Open;
end;

procedure TfrmPatientMgr.dsPatientDataChange(Sender: TObject; Field: TField);
begin
  LoadInOut;
end;

procedure TfrmPatientMgr.txtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSearch.Click;
end;

procedure TfrmPatientMgr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmPatientMgr.FormShow(Sender: TObject);
begin
  FLoading := True;
  chkViewInPatient.Checked := True;

  FLoading := False;

  try
    actSelectWard.Execute;
  except
    oGlobal.Msg('병동정보를 가져오지 못했습니다!');
  end;
end;

procedure TfrmPatientMgr.LoadInOut;
begin
  adoInOut.Close;
  if FLoading then

  if adoPatient.isEmpty then
    Exit;

  FLoading := True;

  try
    adoInOut.SQL.Text := 'SELECT *' +
                         '  FROM vInOut' +
                         ' WHERE HospitalID=' + adoPatient.FieldByName('HospitalID').AsString +
                         '   AND PatientID=''' + adoPatient.FieldByName('PatientID').AsString + '''' +
                         ' ORDER BY InDate Desc';
    adoInOut.Open;
  except
    oGlobal.Msg('입원정보를 가져올 수 없습니다!');
  end;

  FLoading := False;
end;

end.
