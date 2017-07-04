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
  cxRadioGroup, cxMaskEdit, cxDropDownEdit, cxGroupBox, cxCheckBox;

type
  TfrmPatientMgr = class(TForm)
    ActionList1: TActionList;
    actSelectWard: TAction;
    adoPatient: TADOQuery;
    dsPatient: TDataSource;
    Label3: TLabel;
    btnPatientAppend: TcxButton;
    btnPatientUpdate: TcxButton;
    btnInOutMgr: TcxButton;
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
    cxGInOutStateName: TcxGridDBColumn;
    cxGInOutWorkerName: TcxGridDBColumn;
    cxGInOutWardName: TcxGridDBColumn;
    cboWard: TcxComboBox;
    cxLabel1: TcxLabel;
    chkViewInPatient: TcxCheckBox;
    cxGInOutBohumName: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure actSelectWardExecute(Sender: TObject);
    procedure btnPatientAppendClick(Sender: TObject);
    procedure btnPatientUpdateClick(Sender: TObject);
    procedure btnInOutMgrClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPatientDeleteClick(Sender: TObject);
    procedure dsPatientDataChange(Sender: TObject; Field: TField);
    procedure cboWardPropertiesChange(Sender: TObject);
    procedure chkViewInPatientClick(Sender: TObject);
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
uses uMain, uDB, uGlobal, uConfig, uPatientNew, uPatientEdit, uInOutMgr;
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
    Add('select distinct P.HospitalID, P.PatientID, P.PatientName, P.Sex, P.Birthday');
    Add('  from patients as P left join inout as I on I.PatientID=P.PatientID');
    Add(' where P.HospitalID=' + inttostr(oConfig.User.HospitalID));

    if chkViewInPatient.Checked then
      Add('   and I.State=' + IntToStr(cIn));

    if cboWard.ItemIndex > 0 then
      Add('   and I.WardID=' + IntToStr(dbMain.GetWardID(oConfig.User.HospitalID, cboWard.Text)));

    if cboSearchCondition.ItemIndex = 0 then
    begin
      Add('   and P.PatientName Like ''%' + sSearch + '%''');
      Add(' order by P.PatientName');
      cxGPatientPatientName.SortIndex := 0;
      cxGPatientPatientName.SortOrder := soAscending;
      cxGPatientPatientID.SortIndex := -1;
      cxGPatientPatientID.SortOrder := soNone;
    end
    else
    begin
      Add('   and P.PatientID Like ''%' + sSearch + '%''');
      Add(' order by P.PatientID');
      cxGPatientPatientID.SortIndex := 0;
      cxGPatientPatientID.SortOrder := soAscending;
      cxGPatientPatientName.SortIndex := -1;
      cxGPatientPatientName.SortOrder := soNone;
    end;
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

procedure TfrmPatientMgr.btnInOutMgrClick(Sender: TObject);
begin
  if adoPatient.IsEmpty then
  begin
    oGlobal.Msg('선택된 환자가 없습니다!');
    Exit;
  end;

  frmInOutMgr.HospitalID := adoPatient.FieldByName('HospitalID').AsInteger;
  frmInOutMgr.PatientID := adoPatient.fieldbyName('PatientID').AsString;
  frmInOutMgr.ShowModal;

  if frmInOutMgr.Modified then
  begin
    frmMain.ResetTables;

    adoInOut.DisableControls;
    adoInOut.Close;
    adoInOut.Open;
    adoInOut.EnableControls;
  end;
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
  sPatientID: string;
begin
  if adoPatient.IsEmpty then
  begin
    oGlobal.Msg('수정할 환자정보가 없습니다!');
    Exit;
  end;

  sPatientID := adoPatient.FieldByName('PatientID').AsString;

  frmPatientEdit.oP.nHospitalID := oConfig.User.HospitalID;
  frmPatientEdit.oP.sPatientID := adoPatient.FieldByName('PatientID').AsString;
  frmPatientEdit.oP.sPatientName := adoPatient.FieldByName('PatientName').AsString;
  frmPatientEdit.oP.sBirthday := adoPatient.FieldByName('Birthday').AsString;
  frmPatientEdit.oP.bMale := adoPatient.FieldByName('Sex').AsString = cMale;

  if frmPatientEdit.ShowModal <> mrOK then
    Exit;

  try
    adoPatient.Connection.BeginTrans;
    adoPatient.Edit;

    adoPatient.FieldByName('PatientName').AsString := frmPatientEdit.oP.sPatientName;

    if frmPatientEdit.oP.bMale then
      adoPatient.FieldByName('Sex').AsString := cMale
    else
      adoPatient.FieldByName('Sex').AsString := cFeMale;

    adoPatient.FieldByName('Birthday').AsString := frmPatientEdit.oP.sBirthday;

    adoPatient.Post;
    adoPatient.Connection.CommitTrans;
    oGlobal.Msg('수정되었습니다!');
  except
    adoPatient.Connection.RollbackTrans;
    oGlobal.Msg('수정에 실패했습니다!');
  end;
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

procedure TfrmPatientMgr.dsPatientDataChange(Sender: TObject; Field: TField);
begin
  LoadInOut;
end;

procedure TfrmPatientMgr.txtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if oGlobal.isNotNullStr(txtSearch.Text) and (Key = VK_RETURN) then
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

  if not dbMain.GetWardList(oConfig.User.HospitalID, cboWard.Properties.Items, True) then
  begin
    oGlobal.Msg('병동정보를 가져오지 못했습니다!');
    Exit;
  end;
  cboWard.ItemIndex := 0;

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
  if FLoading or adoPatient.isEmpty then Exit;

  try
    adoInOut.SQL.Text := 'select *' +
                         '       ,(select UserName from Users Where Users.HospitalID=InOut.HospitalID and Users.UserID=InOut.UserID and Worker=1) as WorkerName' +
                         '       ,(select UserName from Users where Users.hospitalID=InOut.HospitalID and Users.UserID=InOut.DoctorID and Doctor=1) as DoctorName' +
                         '       ,(select WardName from Wards where Wards.HospitalID=InOut.HospitalID and Wards.WardID=InOut.WardID) as WardName' +
                         '       ,(select BohumName from Bohum where Bohum.BohumID=inout.BohumID) as BohumName' +
                         '       ,case state when 0 then ''입원''' +
                         '                   when 1 then ''퇴원''' +
                         '                   else ''미정''' +
                         '        end as StateName' +
                         '  from inout' +
                         ' where HospitalID=' + adoPatient.FieldByName('HospitalID').AsString +
                         '   and PatientID=''' + adoPatient.FieldByName('PatientID').AsString + '''' +
                         ' order by InDate Desc';
    adoInOut.Open;
  except
    oGlobal.Msg('입원정보를 가져올 수 없습니다!');
  end;
end;

end.
