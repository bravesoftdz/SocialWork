unit uTherapyPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, uGlobal, cxControls, cxContainer, cxEdit, dxSkinsCore,
  dxSkinCaramel, dxSkinOffice2007Blue, QRPrntr, cxTextEdit, cxMaskEdit,
  cxSpinEdit, Buttons, ExtCtrls, QuickRpt, ADODB, DB, QRCtrls, jpeg,
  dxSkinBlack, dxSkinBlue, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmTherapyPrint = class(TForm)
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
    QRPreview: TQRPreview;
    cxButton1: TcxButton;
    QRSchedule: TQuickRep;
    adoSchedule: TADOQuery;
    dsSchedule: TDataSource;
    PageHeaderBand1: TQRBand;
    Timer1: TTimer;
    qrlblTitle: TQRLabel;
    bandFirst: TQRBand;
    QRDBText1: TQRDBText;
    QRMemo14: TQRMemo;
    QRLabel33: TQRLabel;
    QRMemo15: TQRMemo;
    QRDBText2: TQRDBText;
    QRMemo1: TQRMemo;
    QRLabel2: TQRLabel;
    QRMemo2: TQRMemo;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRMemo3: TQRMemo;
    QRLabel4: TQRLabel;
    QRMemo4: TQRMemo;
    QRMemo5: TQRMemo;
    QRLabel5: TQRLabel;
    QRMemo6: TQRMemo;
    qrlblLocationNames: TQRLabel;
    qrlblChairmanNames: TQRLabel;
    bandPatient: TQRChildBand;
    qrMemoPatientTitle: TQRMemo;
    qrMemoPatientBody: TQRMemo;
    QRLabel120: TQRLabel;
    qrMemoPatient: TQRMemo;
    QRMemo166: TQRMemo;
    memoTemp: TMemo;
    bandContent: TQRChildBand;
    QRMemo7: TQRMemo;
    QRLabel6: TQRLabel;
    QRMemo8: TQRMemo;
    QRDBText5: TQRDBText;
    subbandResult: TQRSubDetail;
    QRDBText7: TQRDBText;
    bandChairmanOpinion: TQRSubDetail;
    qrMemoResultTitle: TQRMemo;
    qrMemoResultBody: TQRMemo;
    qrMemoResult: TQRMemo;
    bandWorkerOpinion: TQRChildBand;
    bandDoctorOpinion: TQRChildBand;
    qrMemoChairmanOpinionTitle: TQRMemo;
    qrMemoChairmanOpinionBody: TQRMemo;
    QRLabel7: TQRLabel;
    qrMemoChairmanOpinion: TQRMemo;
    qrMemoWorkerOpinionTitle: TQRMemo;
    qrMemoWorkerOpinionBody: TQRMemo;
    QRLabel8: TQRLabel;
    qrMemoWorkerOpinion: TQRMemo;
    QRLabel9: TQRLabel;
    qrMemoDoctorOpinionTitle: TQRMemo;
    qrMemoDoctorOpinionBody: TQRMemo;
    QRLabel10: TQRLabel;
    qrMemoDoctorOpinion: TQRMemo;
    QRLabel11: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    PageFooterBand1: TQRBand;
    qrlblFooterTitle: TQRLabel;
    QRSysData1: TQRSysData;
    lblPageCount: TQRLabel;
    adoPP: TADOQuery;
    adoHospital: TADOQuery;
    QRDBImage1: TQRDBImage;
    qrMemoChairmanOpinionLine: TQRMemo;
    qrMemoWorkerOpinionLine: TQRMemo;
    qrMemoDoctorOpinionLine: TQRMemo;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure QRSchedulePreview(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPrinterSetupClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviewFitClick(Sender: TObject);
    procedure QRScheduleBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure subbandResultBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsScheduleDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure DisplayPageNum;
    procedure SetPreviewType;
    procedure SetLines(oMemo: TQRMemo; cnt: integer);
    procedure SetMemoTemp(oList: TStrings; str: string);
  public
    { Public declarations }
    FScheduleID: integer;
  end;

var
  frmTherapyPrint: TfrmTherapyPrint;

implementation
uses uDB, uConfig;
{$R *.dfm}

procedure TfrmTherapyPrint.btnNextClick(Sender: TObject);
begin
  if QRPreview.PageNumber < QRPreview.QRPrinter.PageCount then
    QRPreview.PageNumber := QRPreview.PageNumber + 1;

  DisplaypageNum;
end;

procedure TfrmTherapyPrint.btnPreviewFitClick(Sender: TObject);
begin
  SetPreviewType;
end;

procedure TfrmTherapyPrint.btnPrintClick(Sender: TObject);
begin
//  if oGlobal.YesNo('출력하시겠습니까?') <> mrYes then
//    Exit;

  QRSchedule.PrinterSetup;
  if QRSchedule.Tag = 0 then
    QRSchedule.Print;
end;

procedure TfrmTherapyPrint.btnPrinterSetupClick(Sender: TObject);
begin
  QRSchedule.PrinterSetup;
end;

procedure TfrmTherapyPrint.btnPriorClick(Sender: TObject);
begin
  if QRPreview.PageNumber > 1 then
    QRPreview.PageNumber := QRPreview.PageNumber - 1;

  DisplayPageNum;
end;

procedure TfrmTherapyPrint.DisplayPageNum;
begin
  pnlPageNum.Caption := inttostr(QRPreview.PageNumber) + '/' + inttostr(QRPreview.QRPrinter.PageCount);
end;

procedure TfrmTherapyPrint.dsScheduleDataChange(Sender: TObject; Field: TField);
begin
  adoPP.Close;

  if adoSchedule.IsEmpty then Exit;

  adoPP.SQL.Text := 'SELECT PP.ScheduleID' +
                    '      ,PP.InOutID' +
                    '      ,PP.Result' +
                    '      ,PP.Selected' +
                    '      ,Patients.PatientName' +
                    '  FROM ProgramPatients AS PP INNER JOIN InOut ON PP.InOutID = InOut.InOutID' +
                    '                             INNER JOIN Patients ON InOut.HospitalID = Patients.HospitalID AND InOut.PatientID = Patients.PatientID' +
                    ' WHERE PP.ScheduleID = ' + adoSchedule.FieldByName('ScheduleID').AsString +
                    ' ORDER BY Patients.PatientName';
  adoPP.Open;
end;

procedure TfrmTherapyPrint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoSchedule.Close;
  adoPP.Close;
end;

procedure TfrmTherapyPrint.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmTherapyPrint.FormShow(Sender: TObject);
begin
  QRPreview.Align := alClient;

  try
    adoHospital.SQL.Text := 'select * from hospitals where hospitalid=' + inttostr(oConfig.User.HospitalID);
    adoHospital.Open;

    adoSchedule.SQL.Text := 'select *' +
                            '       ,(select UserName from users where users.HospitalID=Schedule.HospitalID and users.UserID=Schedule.WorkerID) as WorkerName' +
                            '       ,(select UserName from users where users.HospitalID=Schedule.HospitalID and users.UserID=Schedule.DoctorID) as DoctorName' +
                            '       ,(select ProgramName from programs where programID=schedule.programID) as ProgramName' +
                            '       ,(select ProgramTypeID from programs where programID=schedule.programID) as ProgramTypeID' +
                            '  from schedule' +
                            ' where scheduleID = ' + inttostr(FScheduleID);
    adoSchedule.Open;
    adoPP.Open;

    btnPrior.Enabled := not adoSchedule.IsEmpty;
    btnNext.Enabled := not adoSchedule.IsEmpty;
    btnPreviewFit.Enabled := not adoSchedule.IsEmpty;
    btnPreviewWidth.Enabled := not adoSchedule.IsEmpty;
    btnPreview100.Enabled := not adoSchedule.IsEmpty;
    cxSEZoom.Enabled := not adoSchedule.IsEmpty;
    btnPrint.Enabled := not adoSchedule.IsEmpty;
    btnPrinterSetup.Enabled := not adoSchedule.IsEmpty;

    QRSchedule.Prepare;
    lblPageCount.Caption := ' / ' + inttostr(QRSChedule.QRPrinter.PageCount);

    QRSchedule.PreviewModal;

    DisplayPageNum;
    SetPreviewType;
  except
    Timer1.Enabled := True;
  end;
end;

procedure TfrmTherapyPrint.QRScheduleBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if adoSchedule.IsEmpty then Exit;

  qrlblTitle.Caption := dbMain.GetProgramTypeName(adoSchedule.FieldByName('ProgramTypeID').AsString);
  qrlblFooterTitle.Caption := '사회사업실 - ' + qrlblTitle.Caption;

  qrlblLocationNames.Caption := dbMain.GetLocationNames(oConfig.User.HospitalID, adoSchedule.FieldByName('LocationIDs').AsString);
  qrlblChairmanNames.Caption := dbMain.GetChairmanNames(oConfig.User.HospitalID, adoSchedule.FieldByName('ChairmanIDs').AsString);

  SetMemoTemp(qrMemoPatient.Lines, dbMain.getProgramPatientNames(FScheduleID));
//  memoTemp.Lines.Text := dbMain.getProgramPatientNames(FScheduleID);
//  qrMemoPatient.Lines.Text := memoTemp.Lines.Text;
  SetLines(qrMemoPatientTitle, memoTemp.Lines.Count);
  SetLines(qrMemoPatientBody, memoTemp.Lines.Count);

  SetMemoTemp(qrMemoChairmanOpinion.Lines, adoSchedule.FieldByName('ChairmanOpinion').AsString);
//  qrMemoChairmanOpinion.Lines.Text := adoSchedule.FieldByName('ChairmanOpinion').AsString;
  SetLines(qrMemoChairmanOpinionTitle, qrMemoChairmanOpinion.Lines.Count);
  SetLines(qrMemoChairmanOpinionBody, qrMemoChairmanOpinion.Lines.Count);

  if QRSchedule.TextHeight(QRSchedule.Font, 'AAA') * qrMemoChairmanOpinion.Lines.Count >
    qrMemoChairmanOpinionTitle.Height then
    qrMemoChairmanOpinionLine.Top := 38
  else
    qrMemoChairmanOpinionLine.Top := 28;

  SetMemoTemp(qrMemoWorkerOpinion.Lines, adoSchedule.FieldByName('WorkerOpinion').AsString);
//  qrMemoWorkerOpinion.Lines.Text := adoSchedule.FieldByName('WorkerOpinion').AsString;
  SetLines(qrMemoWorkerOpinionTitle, qrMemoWorkerOpinion.Lines.Count);
  SetLines(qrMemoWorkerOpinionBody, qrMemoWorkerOpinion.Lines.Count);

  if QRSchedule.TextHeight(QRSchedule.Font, 'AAA') * qrMemoWorkerOpinion.Lines.Count >
    qrMemoWorkerOpinionTitle.Height then
    qrMemoWorkerOpinionLine.Top := 38
  else
    qrMemoWorkerOpinionLine.Top := 28;

  SetMemoTemp(qrMemoDoctorOpinion.Lines, adoSchedule.FieldByName('DoctorOpinion').AsString);
//  qrMemoDoctorOpinion.Lines.Text := adoSchedule.FieldByName('DoctorOpinion').AsString;
  SetLines(qrMemoDoctorOpinionTitle, qrMemoDoctorOpinion.Lines.Count);
  SetLines(qrMemoDoctorOpinionBody, qrMemoDoctorOpinion.Lines.Count);

  if QRSchedule.TextHeight(QRSchedule.Font, 'AAA') * qrMemoDoctorOpinion.Lines.Count >
    qrMemoDoctorOpinionTitle.Height then
    qrMemoDoctorOpinionLine.Top := 38
  else
    qrMemoDoctorOpinionLine.Top := 28;
end;

procedure TfrmTherapyPrint.QRSchedulePreview(Sender: TObject);
begin
  QRPreview.QRPrinter := TQRPrinter(Sender);
end;

procedure TfrmTherapyPrint.SetLines(oMemo: TQRMemo; cnt: integer);
var
  i: integer;
begin
  oMemo.Lines.Clear;
  for i := 0 to cnt-1 do
    oMemo.Lines.Add(' ');
end;

procedure TfrmTherapyPrint.SetMemoTemp(oList: TStrings; str: string);
var
  n: integer;
begin
  memoTemp.Lines.Text := str;

  oList.Clear;
  for n := 0 to memoTemp.Lines.Count - 1 do
    oList.Add(memoTemp.Lines[n]);
end;

procedure TfrmTherapyPrint.SetPreviewType;
begin
  if btnPreviewFit.Down then
    QRPreview.ZoomToFit
  else if btnPreviewWidth.Down then
    QRPreview.ZoomToWidth
  else
    QRPreview.Zoom := cxSEZoom.Value;
end;

procedure TfrmTherapyPrint.subbandResultBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  SetMemoTemp(qrMemoResult.Lines, adoPP.FieldByName('Result').AsString);
//  qrMemoResult.Lines.Text := adoPP.FieldByName('Result').AsString;
  SetLines(qrMemoResultTitle, qrMemoResult.Lines.Count);
  SetLines(qrMemoResultBody, qrMemoResult.Lines.Count);
end;

procedure TfrmTherapyPrint.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  oGlobal.Msg('출력 정보를 읽어오지 못했습니다!');
  Close;
end;

end.
