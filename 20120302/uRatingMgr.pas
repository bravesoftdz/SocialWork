unit uRatingMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGlobal, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel, Menus,
  cxStyles, dxSkinscxPC3Painter, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxLabel, cxCheckBox, ADODB, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxDBEdit, cxTextEdit,
  StdCtrls, cxButtons, cxRadioGroup, cxMaskEdit, cxDropDownEdit, ExtCtrls,
  dxSkinOffice2007Blue, cxSpinEdit, Buttons, cxGroupBox, QRPrntr, jpeg, QRCtrls,
  QuickRpt, cxCalendar, dxSkinBlack, dxSkinBlue, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmRatingMgr = class(TForm)
    Panel1: TPanel;
    adoInOut: TADOQuery;
    dsInOut: TDataSource;
    Panel8: TPanel;
    btnPreviewFit: TSpeedButton;
    btnPreviewWidth: TSpeedButton;
    btnPreview100: TSpeedButton;
    Label1: TLabel;
    Label10: TLabel;
    btnPrior: TcxButton;
    btnNext: TcxButton;
    pnlPageNum: TPanel;
    btnPrinterSetup: TcxButton;
    btnPrint: TcxButton;
    cxSEZoom: TcxSpinEdit;
    cxButton1: TcxButton;
    cxGroupBox1: TcxGroupBox;
    lblWardName: TLabel;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    Timer1: TTimer;
    cxGroupBox5: TcxGroupBox;
    cboOrder: TcxComboBox;
    QRPP: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    bandFirst: TQRBand;
    QRMemo6: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRMemo14: TQRMemo;
    QRLabel33: TQRLabel;
    QRMemo15: TQRMemo;
    QRDBText1: TQRDBText;
    QRMemo1: TQRMemo;
    QRLabel2: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel4: TQRLabel;
    QRMemo5: TQRMemo;
    QRLabel5: TQRLabel;
    subbandResult: TQRSubDetail;
    qrMemoProgramBody: TQRMemo;
    qrMemoResultTitle: TQRMemo;
    QRDBText7: TQRDBText;
    qrMemoResult: TQRMemo;
    PageFooterBand1: TQRBand;
    QRLabel122: TQRLabel;
    QRPreview: TQRPreview;
    QRMemo9: TQRMemo;
    QRLabel14: TQRLabel;
    QRMemo10: TQRMemo;
    QRDBText9: TQRDBText;
    lblSexAge: TQRLabel;
    QRDBText2: TQRDBText;
    QRMemo11: TQRMemo;
    QRMemo16: TQRMemo;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRMemo17: TQRMemo;
    QRMemo18: TQRMemo;
    QRLabel15: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText10: TQRDBText;
    QRMemo19: TQRMemo;
    QRMemo20: TQRMemo;
    QRLabel16: TQRLabel;
    QRDBText11: TQRDBText;
    bandSubTitle: TQRChildBand;
    QRMemo7: TQRMemo;
    QRLabel6: TQRLabel;
    QRMemo8: TQRMemo;
    QRLabel17: TQRLabel;
    qrMemoProgram: TQRMemo;
    QRMemo22: TQRMemo;
    QRLabel18: TQRLabel;
    qrMemoResultBody: TQRMemo;
    memoProgram: TMemo;
    memoResult: TMemo;
    adoPP: TADOQuery;
    dsPP: TDataSource;
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
    cboInOut: TcxComboBox;
    cxDate: TcxDateEdit;
    QRSysData1: TQRSysData;
    lblPageCount: TQRLabel;
    QRDBImage1: TQRDBImage;
    adoHospital: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure rInClick(Sender: TObject);
    procedure dsInOutDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cboOrderPropertiesChange(Sender: TObject);
    procedure QRPPBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRPPPreview(Sender: TObject);
    procedure cxDatePropertiesChange(Sender: TObject);
    procedure subbandResultBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviewFitClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPrinterSetupClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
  private
    { Private declarations }
    FLoading: Boolean;
    procedure SetQuery;
    procedure SetLines(oMemo: TQRMemo; cnt: integer);
    procedure ChangeInOut;
    procedure DisplayPageNum;
    procedure SetPreviewType;
  public
    { Public declarations }
    FYear: string;
    FContent: string;
    oWard: TID;
  end;

var
  frmRatingMgr: TfrmRatingMgr;

implementation
uses uDB, uConfig;

{$R *.dfm}

procedure TfrmRatingMgr.btnNextClick(Sender: TObject);
begin
  if QRPreview.PageNumber < QRPreview.QRPrinter.PageCount then
    QRPreview.PageNumber := QRPreview.PageNumber + 1;

  DisplaypageNum;
end;

procedure TfrmRatingMgr.btnPreviewFitClick(Sender: TObject);
begin
  SetPreviewType;
end;

procedure TfrmRatingMgr.btnPrintClick(Sender: TObject);
begin
//  if oGlobal.YesNo('출력하시겠습니까?') <> mrYes then
//    Exit;

  QRPP.PrinterSetup;
  if QRPP.Tag = 0 then
    QRPP.Print;
end;

procedure TfrmRatingMgr.btnPrinterSetupClick(Sender: TObject);
begin
  QRPP.PrinterSetup;
end;

procedure TfrmRatingMgr.btnPriorClick(Sender: TObject);
begin
  if QRPreview.PageNumber > 1 then
    QRPreview.PageNumber := QRPreview.PageNumber - 1;

  DisplayPageNum;
end;

procedure TfrmRatingMgr.cboOrderPropertiesChange(Sender: TObject);
begin
  SetQuery;
end;

procedure TfrmRatingMgr.ChangeInOut;
begin
  btnPrior.Enabled := not adoInOut.IsEmpty;
  btnNext.Enabled := not adoInOut.IsEmpty;
  btnPreviewFit.Enabled := not adoInOut.IsEmpty;
  btnPreviewWidth.Enabled := not adoInOut.IsEmpty;
  btnPreview100.Enabled := not adoInOut.IsEmpty;
  cxSEZoom.Enabled := not adoInOut.IsEmpty;
  btnPrint.Enabled := not adoInOut.IsEmpty;
  btnPrinterSetup.Enabled := not adoInOut.IsEmpty;

  adoPP.Close;
  QRPreview.QRPrinter := nil;

  if adoInOut.IsEmpty then Exit;

  try
    with adoPP.SQL do
    begin
      Clear;
      Add('select PP.*');
      Add('       ,SDate');
      Add('       ,(select ProgramName from Programs where Programs.ProgramID=Schedule.ProgramID) as ProgramName');
      Add('  from ProgramPatients as PP INNER JOIN Schedule ON Schedule.ScheduleID=PP.ScheduleID');
      Add(' where InOutID=' + adoInOut.FieldByName('InOutID').AsString);
      Add('   and Schedule.SDate like ''' + oGlobal.DateToString(cxDate.Date,1,7) + '%''');
      Add(' order by SDate');
    end;
    adoPP.Open;

    QRPP.Prepare;
    lblPageCount.Caption := ' / ' + inttostr(QRPP.QRPrinter.PageCount);

    QRPP.PreviewModal;

    DisplayPageNum;
    SetPreviewType;
  except
    oGlobal.Msg('평가정보를 가져올 수 없습니다!');
  end;
end;

procedure TfrmRatingMgr.cxDatePropertiesChange(Sender: TObject);
begin
  SetQuery;
end;

procedure TfrmRatingMgr.DisplayPageNum;
begin
  if QRPreview.QRPrinter = nil then
    pnlPageNum.Caption := '0/0'
  else
    pnlPageNum.Caption := inttostr(QRPreview.PageNumber) + '/' + inttostr(QRPreview.QRPrinter.PageCount);
end;

procedure TfrmRatingMgr.dsInOutDataChange(Sender: TObject; Field: TField);
begin
  if FLoading then Exit;

  ChangeInOut;
end;

procedure TfrmRatingMgr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoInOut.Close;
  adoPP.Close;
end;

procedure TfrmRatingMgr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then Close;
end;

procedure TfrmRatingMgr.FormShow(Sender: TObject);
begin
  FLoading := True;

  QRPP.Visible := False;
  QRPreview.Align := alClient;

  lblWardName.Caption := oWard.Name;

  cxDate.EditText := oGlobal.DateToString(Now);

  FLoading := False;

  SetQuery;

  DisplayPageNum;
  SetPreviewType;
end;

procedure TfrmRatingMgr.QRPPBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  sAge: string;
begin
  sAge := oGlobal.GetAge(adoInOut.FieldByName('Birthday').AsString, adoInOut.FieldByName('InDate').AsString);

  if adoInOut.FieldByName('Sex').AsString = cMale then
    lblSexAge.Caption := '남 (만' + sAge + '세)'
  else
    lblSexAge.Caption := '여 (만' + sAge + '세)';

//  Sender.Prepare;
//  lblPageCount.Caption := ' / ' + inttostr(Sender.QRPrinter.PageCount);
end;

procedure TfrmRatingMgr.QRPPPreview(Sender: TObject);
begin
  QRPreview.QRPrinter := TQRPrinter(Sender);
end;

procedure TfrmRatingMgr.rInClick(Sender: TObject);
begin
  SetQuery;
end;

procedure TfrmRatingMgr.SetLines(oMemo: TQRMemo; cnt: integer);
var
  i: integer;
begin
  oMemo.Lines.Clear;
  for i := 0 to cnt-1 do
    oMemo.Lines.Add(' ');
end;

procedure TfrmRatingMgr.SetPreviewType;
begin
  if btnPreviewFit.Down then
    QRPreview.ZoomToFit
  else if btnPreviewWidth.Down then
    QRPreview.ZoomToWidth
  else
    QRPreview.Zoom := cxSEZoom.Value;
end;

procedure TfrmRatingMgr.SetQuery;
var
  sState, sOrder, sYearMonth, sHospitalID: string;
begin
  if FLoading then Exit;

  case cboInOut.ItemIndex of
    0: sState := inttostr(cIn);
    1: sState := inttostr(cOut)
    else sState := NullString;
  end;

  case cboOrder.ItemIndex of
    0: sOrder := ' order by P.patientname';
    1: sOrder := ' order by I.patientid';
    2: sOrder := ' order by I.indate desc';
    else sOrder := '';
  end;

  sHospitalID := inttostr(oConfig.User.HospitalID);
  sYearMonth := oGlobal.DateToString(cxDate.Date, 1, 7);

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
  adoInOut.SQL.Add('   and I.WardID=' + oWard.ToString);

  if oGlobal.isNotNullStr(sState) then
    adoInOut.SQL.Add('   and state=' + sState);

  adoInOut.SQL.Add('   and I.InOutID in (select distinct InOutID');
  adoInOut.SQL.Add('                       from ProgramPatients as PP');
  adoInOut.SQL.Add('                            inner join Schedule as S on S.ScheduleID=PP.ScheduleID and S.SDate like ''' + sYearMonth + '%'')');

  adoInOut.SQL.Add(sOrder);

  FLoading := True;
  adoInOut.DisableControls;
  try
    adoHospital.SQL.Text := 'select * from hospitals where hospitalid=' + inttostr(oConfig.User.HospitalID);
    adoHospital.Open;

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
    Timer1.Enabled := True;
  end;
  adoInOut.EnableControls;
  FLoading := False;

  ChangeInOut;
end;

procedure TfrmRatingMgr.subbandResultBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  n, nCount: integer;
begin
  memoProgram.Lines.Text := adoPP.FieldByName('ProgramName').AsString;
  memoResult.Lines.Text := adoPP.FieldByName('Result').AsString;

  if memoProgram.Lines.Count > memoResult.Lines.Count then
    nCount := memoProgram.Lines.Count
  else
    nCount := memoResult.Lines.Count;

  SetLines(qrMemoResultTitle, nCount);

  qrMemoProgram.Lines.Text := memoProgram.Lines.Text;

  // 2011.12.05 줄 바뀜 안되는 것 수정
  qrMemoResult.Lines.Clear;
  for n := 0 to nCount - 1 do
    qrMemoResult.Lines.Add(memoResult.Lines[n]);
//  qrMemoResult.Lines.Text := memoResult.Lines.Text;

  SetLines(qrMemoProgramBody, nCount);
  SetLines(qrMemoResultBody, nCount);
end;

procedure TfrmRatingMgr.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Close;
end;

end.
