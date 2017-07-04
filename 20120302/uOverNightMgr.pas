unit uOverNightMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel, cxStyles,
  dxSkinscxPC3Painter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, ADODB, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxGroupBox, ExtCtrls, Menus, StdCtrls, cxButtons, cxCalendar, cxSpinEdit,
  cxTimeEdit, dxSkinBlack, dxSkinBlue, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmOverNightMgr = class(TForm)
    Panel1: TPanel;
    cxGroupBox6: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGInOut: TcxGridDBTableView;
    cxGInOutPatientID: TcxGridDBColumn;
    cxGInOutPatientName: TcxGridDBColumn;
    cxGInOutSex: TcxGridDBColumn;
    cxGInOutBirthday: TcxGridDBColumn;
    cxGInOutStateName: TcxGridDBColumn;
    cxGInOutInDate: TcxGridDBColumn;
    cxGInOutOutDate: TcxGridDBColumn;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    dsInOut: TDataSource;
    adoInOut: TADOQuery;
    Panel2: TPanel;
    cxGroupBox5: TcxGroupBox;
    cboOrder: TcxComboBox;
    btnSearch: TcxButton;
    txtSearch: TcxTextEdit;
    Label2: TLabel;
    cxGroupBox2: TcxGroupBox;
    cboInOut: TcxComboBox;
    cxGInOutWardName: TcxGridDBColumn;
    Panel3: TPanel;
    Panel4: TPanel;
    adoOverNight: TADOQuery;
    dsOverNight: TDataSource;
    btnAppend: TcxButton;
    btnUpdate: TcxButton;
    btnDelete: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1StartTime: TcxGridDBColumn;
    cxGridDBTableView1FinishTime: TcxGridDBColumn;
    cxGridDBTableView1Comment: TcxGridDBColumn;
    cxGridDBBandedTableView2: TcxGridDBBandedTableView;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    adoList: TADOQuery;
    dsList: TDataSource;
    cxGrid3: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBBandedTableView3: TcxGridDBBandedTableView;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cxGridDBTableView4StartTime: TcxGridDBColumn;
    cxGridDBTableView4FinishTime: TcxGridDBColumn;
    cxGridDBTableView4Comment: TcxGridDBColumn;
    cxGridDBTableView4PatientID: TcxGridDBColumn;
    cxGridDBTableView4PatientName: TcxGridDBColumn;
    Label1: TLabel;
    cxDESelectedDate: TcxDateEdit;
    lblSelectedYear: TLabel;
    Splitter1: TSplitter;
    cxGridDBTableView1StateName: TcxGridDBColumn;
    cboOvernightState: TcxComboBox;
    Label3: TLabel;
    cxGridDBTableView4StateName: TcxGridDBColumn;
    procedure cboInOutPropertiesChange(Sender: TObject);
    procedure cboOrderPropertiesChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsInOutDataChange(Sender: TObject; Field: TField);
    procedure cxDESelectedDatePropertiesChange(Sender: TObject);
    procedure btnAppendClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure cboOvernightStatePropertiesChange(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetQuery;
    procedure SetSubQuery;
    procedure LoadOvernightPatient;
  public
    { Public declarations }
  end;

var
  frmOverNightMgr: TfrmOverNightMgr;

implementation
uses uDB, uConfig, uGlobal, uOverNightMgrEdit;
{$R *.dfm}

{ TfrmOverNightMgr }
procedure TfrmOverNightMgr.btnAppendClick(Sender: TObject);
var
  sInOutID, sStartTime: string;
  oOverNightMgrEdit: TfrmOverNightMgrEdit;
begin
  if not adoInOut.Active then
  begin
    oGlobal.Msg('환자정보가 없습니다!');
    Exit;
  end;

  Application.CreateForm(TfrmOverNightMgrEdit, oOverNightMgrEdit);

  oOverNightMgrEdit.Mode := emAppend;
  oOverNightMgrEdit.adoInOut := adoInOut;
  oOverNightMgrEdit.adoList := adoList;

  adoOverNight.DisableControls;
  if oOverNightMgrEdit.ShowModal = mrOK then
  begin
    adoList.Close;
    adoList.Open;

    adoOverNight.Close;
    adoOverNight.Open;

    sInOutID := oOverNightMgrEdit.adoOverNight.FieldByName('InOutID').AsString;
    sStartTime := copy(oGlobal.DateTimeToString(oOverNightMgrEdit.adoOverNight.FieldByName('StartTime').AsDateTime), 1, 16);

    adoList.Locate('InOutID;StartTime', VarArrayOf([sInOutID, sStartTime]), [loCaseInsensitive]);
  end;

  adoOverNight.EnableControls;

  oOverNightMgrEdit.Free;
end;

procedure TfrmOverNightMgr.btnDeleteClick(Sender: TObject);
var
  oT: TADOQuery;
begin
  if adoList.IsEmpty then
  begin
    oGlobal.Msg('삭제할 외출/외박 정보가 없습니다!');
    Exit;
  end;

  if oGlobal.YesNo('삭제하시겠습니까?') <> mrYes then Exit;

  oT := TADOQuery.Create(self);
  oT.Connection := adoList.Connection;

  try
    oT.Connection.BeginTrans;
    oT.SQL.Text := 'DELETE OverNight' +
                   ' WHERE CONVERT(VARCHAR(16), starttime, 120) = ''' + adoList.FieldByName('StartTime').AsString + '''' +
                   '   AND InOutID = ' + adoList.FieldByName('InOutID').AsString;
    oT.ExecSQL;
    oT.Connection.CommitTrans;

    adoList.Close;
    adoList.Open;

    adoOverNight.Close;
    adoOverNight.Open;
  except
    oT.Connection.RollbackTrans;
  end;

  oT.Free;
end;

procedure TfrmOverNightMgr.btnSearchClick(Sender: TObject);
var
  sSearch: string;
begin
  sSearch := trim(txtSearch.Text);
  if oGlobal.isNullStr(sSearch) then
  begin
    oGlobal.Msg('검색어를 입력해 주십시오!');
    txtSearch.SetFocus;
    Exit;
  end;

  adoInOut.DisableControls;

  if cboOrder.ItemIndex = 0 then
    adoInOut.Locate('PatientName', sSearch, [loPartialKey])
  else
    adoInOut.Locate('PatientID', sSearch, [loPartialKey]);

  adoInOut.EnableControls;
end;

procedure TfrmOverNightMgr.btnUpdateClick(Sender: TObject);
var
  sInOutID, sStartTime: string;
  oOverNightMgrEdit: TfrmOverNightMgrEdit;
begin
  if adoList.IsEmpty then
  begin
    oGlobal.Msg('수정할 외출/외박 정보가 없습니다!');
    Exit;
  end;

  Application.CreateForm(TfrmOverNightMgrEdit, oOverNightMgrEdit);

  oOverNightMgrEdit.Mode := emUpdate;
  oOverNightMgrEdit.adoInOut := adoInOut;
  oOverNightMgrEdit.adoList := adoList;

  adoOverNight.DisableControls;
  if oOverNightMgrEdit.ShowModal = mrOK then
  begin
    adoList.Close;
    adoList.Open;

    adoOverNight.Close;
    adoOverNight.Open;

    sInOutID := oOverNightMgrEdit.adoOverNight.FieldByName('InOutID').AsString;
    sStartTime := copy(oGlobal.DateTimeToString(oOverNightMgrEdit.adoOverNight.FieldByName('StartTime').AsDateTime), 1, 16);

    adoList.Locate('InOutID;StartTime', VarArrayOf([sInOutID, sStartTime]), [loCaseInsensitive]);
  end;

  adoOverNight.EnableControls;

  oOverNightMgrEdit.Free;
end;

procedure TfrmOverNightMgr.cboInOutPropertiesChange(Sender: TObject);
begin
  SetQuery;
end;

procedure TfrmOverNightMgr.cboOrderPropertiesChange(Sender: TObject);
begin
  SetQuery;
end;

procedure TfrmOverNightMgr.cboOvernightStatePropertiesChange(Sender: TObject);
begin
  LoadOvernightPatient;
end;

procedure TfrmOverNightMgr.cxDESelectedDatePropertiesChange(Sender: TObject);
begin
  lblSelectedYear.Caption := '(' + Copy(cxDESelectedDate.EditText, 1, 4) + ' 년도)';
  LoadOvernightPatient;
end;

procedure TfrmOverNightMgr.dsInOutDataChange(Sender: TObject; Field: TField);
begin
  SetSubQuery;
end;

procedure TfrmOverNightMgr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoInOut.Close;
  adoOverNight.Close;
end;

procedure TfrmOverNightMgr.FormShow(Sender: TObject);
begin
  cxDESelectedDate.EditText := oGlobal.DateToString(Now);
  lblSelectedYear.Caption := '(' + Copy(cxDESelectedDate.EditText, 1, 4) + ' 년도)';
  LoadOvernightPatient;

  SetQuery;
end;

procedure TfrmOverNightMgr.LoadOvernightPatient;
var
  sDate: string;
begin
  adoList.Close;

  if oGlobal.isNullStr(cxDESelectedDate.EditText) then
  begin
    oGlobal.Msg('일자가 선택되지 않았습니다!');
    Exit;
  end;

  sDate := Copy(oGlobal.DateToString(cxDESelectedDate.Date), 1, 4);

  with adoList.SQL do
  begin
    Clear;
    Add('SELECT PatientID, Comment, o.InOutID as InOutID');
    Add('       ,OverNightState');
    Add('       ,CONVERT(VARCHAR(16), starttime, 120) as starttime');
    Add('       ,CONVERT(VARCHAR(16), finishtime, 120) as finishtime');
    Add('       ,CASE OverNightState WHEN 0 THEN ''외출/외박''');
    Add('                            WHEN 1 THEN ''CR''');
    Add('        END AS StateName');
    Add('       ,(select PatientName from Patients where Patients.Hospitalid=i.HospitalID and Patients.PatientID = i.PatientID) as PatientName');
    Add('  from overnight as o, inout as i');
    Add(' where o.inoutid = i.inoutid');
    Add('   and i.hospitalid = ' + inttostr(oConfig.User.HospitalID));
    Add('   and convert(varchar(4), o.starttime, 120) = ''' + sDate + '''');

    if cboOverNightState.ItemIndex > 0 then
      Add('   and OverNightState = ' + inttostr(cboOverNightState.ItemIndex-1));

    Add(' order by StartTime Desc');
  end;

  try
    adoList.Open;
  except
    oGlobal.Msg('선택일자의 외출/외박 내역을 가져오지 못했습니다!');
  end;
end;

procedure TfrmOverNightMgr.SetQuery;
var
  sState, sOrder, sHospitalID: string;
begin
  case cboInOut.ItemIndex of
    0: sState := inttostr(cIn);
    1: sState := inttostr(cOut)
    else sState := NullString;
  end;

  case cboOrder.ItemIndex of
    0: sOrder := ' order by P.patientname';
    1: sOrder := ' order by I.patientid';
    else sOrder := '';
  end;

  sHospitalID := inttostr(oConfig.User.HospitalID);

  adoInOut.SQL.Clear;
  adoInOut.SQL.Add('select *');
  adoInOut.SQL.Add('       ,case I.state when 0 then ''입원''');
  adoInOut.SQL.Add('                     when 1 then ''퇴원''');
  adoInOut.SQL.Add('                     else ''미정''');
  adoInOut.SQL.Add('        end as StateName');
  adoInOut.SQL.Add('       ,(select UserName from users where hospitalid=' + sHospitalID + ' and userid=I.UserID and Worker=1) as WorkerName');
  adoInOut.SQL.Add('       ,(select UserName from users where hospitalid=' + sHospitalID + ' and userid=I.DoctorID and Doctor=1) as DoctorName');
  adoInOut.SQL.Add('       ,(select WardName from Wards where wards.wardid=I.wardid) as WardName');
  adoInOut.SQL.Add('  from InOut As I inner join patients as P on I.hospitalID=P.hospitalID and I.patientID=P.PatientID');
  adoInOUt.SQL.Add(' where I.HospitalID=' + sHospitalID);

  if oGlobal.isNotNullStr(sState) then
    adoInOut.SQL.Add('   and state=' + sState);

  adoInOut.SQL.Add(sOrder);

  adoInOut.DisableControls;
  try
    adoInOut.Open;

    case cboOrder.ItemIndex of
      0:
      begin
        cxGInOutPatientName.SortIndex := 0;
        cxGInOutPatientName.SortOrder := soAscending;
        cxGInOutPatientID.SortIndex := -1;
        cxGInOutPatientID.SortOrder := soNone;
        cxGInOutInDate.SortIndex := -1;
        cxGInOutInDate.SortOrder := soNone;
      end;
      1:
      begin
        cxGInOutPatientName.SortIndex := -1;
        cxGInOutPatientName.SortOrder := soNone;
        cxGInOutPatientID.SortIndex := 0;
        cxGInOutPatientID.SortOrder := soAscending;
        cxGInOutInDate.SortIndex := -1;
        cxGInOutInDate.SortOrder := soNone;
      end;
      2:
      begin
        cxGInOutPatientName.SortIndex := -1;
        cxGInOutPatientName.SortOrder := soNone;
        cxGInOutPatientID.SortIndex := -1;
        cxGInOutPatientID.SortOrder := soNone;
        cxGInOutInDate.SortIndex := 0;
        cxGInOutInDate.SortOrder := soDescending;
      end;
    end;
  except
    oGlobal.Msg('입원정보를 가져올 수 없습니다!');
  end;
  adoInOut.EnableControls;
end;

procedure TfrmOverNightMgr.SetSubQuery;
var
  sInOutID: string;
begin
  adoOverNight.Close;

  if adoInOut.IsEmpty then Exit;

  sInOutID := adoInOut.FieldByName('InOutID').AsString;

  with adoOverNight.SQL do
  begin
    Clear;
    Add('SELECT InOutID');
    Add('       ,CONVERT(VARCHAR(16), starttime, 120) as starttime');
    Add('       ,CONVERT(VARCHAR(16), finishtime, 120) as finishtime');
    Add('       ,CASE OverNightState WHEN 0 THEN ''외출/외박''');
    Add('                            WHEN 1 THEN ''CR''');
    Add('        END AS StateName');
    Add('       ,Comment');
    Add('  FROM OverNight');
    Add(' WHERE InOutID=''' + sInOutID + '''');
    Add(' ORDER BY StartTime DESC');
  end;

  try
    adoOVerNight.Open;
  except
    oGlobal.Msg('외출/외박 내역을 가져올 수 없습니다!');
  end;
end;

procedure TfrmOverNightMgr.txtSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and oGlobal.isNotNullStr(txtSearch.Text) then
    btnSearch.Click;
end;

end.
