unit uStatistics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, DateUtils, DB, ADODB, cxControls, cxStyles, dxSkinsCore,
  dxSkinCaramel, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxLabel, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, ExtCtrls, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxPCdxBarPopupMenu, cxPC,
  cxGroupBox, cxVGrid, cxInplaceContainer, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, dxSkinsdxBarPainter,
  dxPSCore, dxPScxCommon, cxCheckBox, dxSkinBlack, dxSkinBlue,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxSkinscxPCPainter,
  cxNavigator, ComCtrls, dxCore, cxDateUtils, dxBarBuiltInMenu, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxSkinsdxRibbonPainter;

type
  TfrmStatistics = class(TForm)
    adoInOut: TADOQuery;
    dsInOut: TDataSource;
    cxGrid1: TcxGrid;
    cxGInOut: TcxGridDBTableView;
    cxGInOutPatientID: TcxGridDBColumn;
    cxGInOutPatientName: TcxGridDBColumn;
    cxGInOutSEX: TcxGridDBColumn;
    cxGInOutWardName: TcxGridDBColumn;
    cxGInOutintake: TcxGridDBColumn;
    cxGInOutsurvey1: TcxGridDBColumn;
    cxGInOutsurvey2: TcxGridDBColumn;
    cxGInOutcounseling: TcxGridDBColumn;
    cxGInOuttraining: TcxGridDBColumn;
    cxGInOutVisit: TcxGridDBColumn;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    Label1: TLabel;
    lblSelectedYear: TLabel;
    cxDESelectedDate: TcxDateEdit;
    cxGInOutPP: TcxGridDBColumn;
    cxGInOutBirthday: TcxGridDBColumn;
    cxGInOutBohumName: TcxGridDBColumn;
    cxGInOutAge: TcxGridDBColumn;
    Label3: TLabel;
    cboSearchCondition: TcxComboBox;
    txtSearch: TcxTextEdit;
    btnSearch: TcxButton;
    Splitter1: TSplitter;
    pnlBody: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    adoVisit: TADOQuery;
    dsVisit: TDataSource;
    adoOvernight: TADOQuery;
    dsOvernight: TDataSource;
    cxGrid4: TcxGrid;
    cxGOvernight: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGOvernightStateName: TcxGridDBColumn;
    cxGOvernightstartdate: TcxGridDBColumn;
    cxGOvernightfinishdate: TcxGridDBColumn;
    cxGOvernightComment: TcxGridDBColumn;
    cxGInOutInDate: TcxGridDBColumn;
    cxGInOutOutDate: TcxGridDBColumn;
    cxGInOutPP1: TcxGridDBColumn;
    cxGInOutPP2: TcxGridDBColumn;
    cxGInOutPP3: TcxGridDBColumn;
    cxGInOutPP4: TcxGridDBColumn;
    cxPageControl1: TcxPageControl;
    cxTabShimsa: TcxTabSheet;
    cxTabSocialWork: TcxTabSheet;
    cxGrid2: TcxGrid;
    cxGrid2Level1: TcxGridLevel;
    Label4: TLabel;
    cboWard: TcxComboBox;
    Label5: TLabel;
    cboBohum: TcxComboBox;
    dxComponentPrinter1: TdxComponentPrinter;
    cxGSocial: TcxGridBandedTableView;
    cxGSocialColumn1: TcxGridBandedColumn;
    cxGSocialColumn2: TcxGridBandedColumn;
    cxGSocialColumn3: TcxGridBandedColumn;
    cxGSocialColumn4: TcxGridBandedColumn;
    cxGSocialColumn5: TcxGridBandedColumn;
    cxGSocialColumn6: TcxGridBandedColumn;
    cxGSocialColumn7: TcxGridBandedColumn;
    cxGSocialColumn8: TcxGridBandedColumn;
    cxGSocialColumn9: TcxGridBandedColumn;
    cxGSocialColumn10: TcxGridBandedColumn;
    cxGSocialColumn11: TcxGridBandedColumn;
    cxGrid5: TcxGrid;
    cxGShimsa: TcxGridBandedTableView;
    cxGridBandedColumn1: TcxGridBandedColumn;
    cxGridBandedColumn2: TcxGridBandedColumn;
    cxGridBandedColumn3: TcxGridBandedColumn;
    cxGridBandedColumn4: TcxGridBandedColumn;
    cxGridBandedColumn5: TcxGridBandedColumn;
    cxGridBandedColumn6: TcxGridBandedColumn;
    cxGridBandedColumn7: TcxGridBandedColumn;
    cxGridBandedColumn8: TcxGridBandedColumn;
    cxGridBandedColumn9: TcxGridBandedColumn;
    cxGridBandedColumn10: TcxGridBandedColumn;
    cxGridBandedColumn11: TcxGridBandedColumn;
    cxGridLevel2: TcxGridLevel;
    btnPrintOne: TcxButton;
    dxComponentPrinter1Link1: TdxGridReportLink;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxGrid3: TcxGrid;
    cxGError: TcxGridBandedTableView;
    cxGErrorStarttime: TcxGridBandedColumn;
    cxGErrorFinishtime: TcxGridBandedColumn;
    cxGErrorCheck: TcxGridBandedColumn;
    cxGridLevel3: TcxGridLevel;
    cxGErrorProgram: TcxGridBandedColumn;
    dxComponentPrinter1Link2: TdxGridReportLink;
    cxGShimsaWeekday: TcxGridBandedColumn;
    cxGSocialWeekday: TcxGridBandedColumn;
    cxGShimsaWeek0: TcxGridBandedColumn;
    cxGShimsaWeek1: TcxGridBandedColumn;
    cxGInOutPP5: TcxGridDBColumn;
    cxGShimsaColumn1: TcxGridBandedColumn;
    cxGSocialColumn12: TcxGridBandedColumn;
    chkViewAll: TcxCheckBox;
    cxGSocialWeek0: TcxGridBandedColumn;
    cxGSocialWeek1: TcxGridBandedColumn;
    btnPringAll: TcxButton;
    cxButton1: TcxButton;
    chkViewWeekSum: TcxCheckBox;
    ADOQuery1: TADOQuery;
    Label6: TLabel;
    cboInOut: TcxComboBox;
    chkBohoOneforDay: TcxCheckBox;
    cxGSocialColumn13: TcxGridBandedColumn;
    cxGShimsaColumn2: TcxGridBandedColumn;
    cxGInOutPP6: TcxGridDBColumn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cxDESelectedDatePropertiesChange(Sender: TObject);
    procedure cxGInOutAgeGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure cboSearchConditionPropertiesChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure txtSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGSocialCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cboWardPropertiesChange(Sender: TObject);
    procedure cboBohumPropertiesChange(Sender: TObject);
    procedure btnPrintOneClick(Sender: TObject);
    procedure btnPringAllClick(Sender: TObject);
    procedure cxGErrorCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cxGInOutFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGShimsaWeek1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxGShimsaWeek0GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxGShimsaTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure cxGShimsaTcxGridDataControllerTcxDataSummaryFooterSummaryItems5GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
    procedure cxGSocialWeek0GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxGSocialWeek1GetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure cxButton1Click(Sender: TObject);
    procedure cboInOutPropertiesChange(Sender: TObject);
    procedure chkViewWeekSumClick(Sender: TObject);
    procedure chkViewAllClick(Sender: TObject);
    procedure chkBohoOneforDayClick(Sender: TObject);
  private
    { Private declarations }
    FLoaded : Boolean;
    FPrevCount0: integer;
    FPrevCount1: integer;
    FShimsaCount0: Array of integer; // 일반 합계
    FShimsaCount1: Array of integer; // 작업 합계
    FSocialCount0: Array of integer;
    FSocialCount1: Array of integer;
    FCountSum0, FCountSum1: integer;
    FWeekCount, FMinWeek, FMaxWeek: integer;
    procedure LoadPatients;
    procedure DisplayMonth;
    procedure LoadOvernight;
    function CheckOvernight(sStarttime, sFinishtime: string): Boolean;
    procedure GetPrevWeekCount(nInOutID: integer; oDate: TDateTime;
      var nPrevCount: integer; nProgramTypeID: integer);
    function isBohum(nBohumID: integer): Boolean;
    function isBoho(nBohumID: integer): Boolean;
  public
    { Public declarations }
  end;

var
  frmStatistics: TfrmStatistics;

implementation
uses uDB, uGlobal, uConfig, uPrintAll, uMonthReport;
{$R *.dfm}

procedure TfrmStatistics.btnSearchClick(Sender: TObject);
//var
//  sSearch: string;
begin
  LoadPatients;
//  sSearch := trim(txtSearch.Text);
//  if oGlobal.isNullStr(sSearch) then
//  begin
//    oGlobal.Msg('검색어를 입력해 주십시오!');
//    txtSearch.SetFocus;
//    Exit;
//  end;

//  adoInOut.DisableControls;
//
//
//  if cboSearchCondition.ItemIndex = 0 then
//  begin
//    adoInOut.Filter := 'PatientName Like ''%' + sSearch + '%''';
////    adoInOut.Locate('PatientName', sSearch, [loPartialKey])
//  end
//  else
//  begin
//    adoInOut.Filter := 'PatientID Like ''%' + sSearch + '%''';
////    adoInOut.Locate('PatientID', sSearch, [loPartialKey]);
//  end;

//  adoInOut.EnableControls;
end;

procedure TfrmStatistics.cboBohumPropertiesChange(Sender: TObject);
begin
  if not FLoaded then Exit;

  LoadPatients;
end;

procedure TfrmStatistics.cboInOutPropertiesChange(Sender: TObject);
begin
  if not FLoaded then Exit;

  LoadPatients;
end;

procedure TfrmStatistics.cboSearchConditionPropertiesChange(Sender: TObject);
begin
  if cboSearchCondition.ItemIndex = 0 then
  begin
    cxGInOutPatientName.SortIndex := 0;
    cxGInOutPatientName.SortOrder := soAscending;
    cxGInOutPatientID.SortIndex := -1;
    cxGInOutPatientID.SortOrder := soNone;
  end
  else
  begin
    cxGInOutPatientID.SortIndex := 0;
    cxGInOutPatientID.SortOrder := soAscending;
    cxGInOutPatientName.SortIndex := -1;
    cxGInOutPatientName.SortOrder := soNone;
  end;
end;

procedure TfrmStatistics.cboWardPropertiesChange(Sender: TObject);
begin
  if not FLoaded then Exit;

  LoadPatients;
end;

function TfrmStatistics.CheckOvernight(sStarttime,
  sFinishtime: string): Boolean;
var
  row: integer;
  sS, sF: string;
begin
  result := False;

  if adoOvernight.IsEmpty then Exit;

  for row := 0 to cxGOverNight.DataController.RecordCount - 1 do
  begin
    sS := cxGOverNight.DataController.GetValue(row,1);
    sF := cxGOverNight.DataController.GetValue(row,2);

    if ((sS>=sStarttime) and (sS<=sFinishtime)) or
       ((sF>=sStarttime) and (sF<=sFinishtime)) or
       ((sS<=sStarttime) and (sF>=sFinishtime)) then
    begin
      result := True;
      break;
    end;
  end;
end;

procedure TfrmStatistics.btnPringAllClick(Sender: TObject);
begin
  if adoInOut.IsEmpty then
  begin
    oGlobal.Msg('출력할 자료가 없습니다!');
    Exit;
  end;

  frmPrintAll.oInOut := adoInOut;
  if cxPageControl1.ActivePage = cxTabShimsa then
    frmPrintAll.oPrinter := dxComponentPrinter1Link1
  else
    frmPrintAll.oPrinter := dxComponentPrinter1Link2;

  frmPrintAll.ShowModal;
end;

procedure TfrmStatistics.btnPrintOneClick(Sender: TObject);
begin
  if adoInOut.IsEmpty then
  begin
    oGlobal.Msg('출력할 자료가 없습니다!');
    Exit;
  end;

  if True then

  if cxPageControl1.ActivePage = cxTabShimsa then
    dxComponentPrinter1Link1.Print(True, nil)
  else
    dxComponentPrinter1Link2.Print(True, nil);
end;

procedure TfrmStatistics.chkBohoOneforDayClick(Sender: TObject);
begin
  oConfig.Option.bBohoOneforDay := chkBohoOneforDay.Checked;
  oConfig.SaveServerConfiguration(oConfig.SWServer, oConfig.FTPServer);

  if not FLoaded then Exit;

  LoadPatients;
end;

procedure TfrmStatistics.chkViewAllClick(Sender: TObject);
begin
  oConfig.Option.bViewAll := chkViewAll.Checked;
  oConfig.SaveServerConfiguration(oConfig.SWServer, oConfig.FTPServer);

  if not FLoaded then Exit;

  LoadPatients;
end;

procedure TfrmStatistics.chkViewWeekSumClick(Sender: TObject);
begin
  oConfig.Option.bViewWeekSum := chkViewWeekSum.Checked;
  oConfig.SaveServerConfiguration(oConfig.SWServer, oConfig.FTPServer);

  cxGShimsaWeek0.Visible := chkViewWeekSum.Checked;
  cxGShimsaWeek1.Visible := chkViewWeekSum.Checked;

  cxGSocialWeek0.Visible := chkViewWeekSum.Checked;
  cxGSocialWeek1.Visible := chkViewWeekSum.Checked;
end;

procedure TfrmStatistics.cxButton1Click(Sender: TObject);
begin
  frmMonthReport.CurDate.Date := cxDESelectedDate.Date;
  frmMonthReport.MinWeek := FMinWeek;
  frmMonthReport.MaxWeek := FMaxWeek;
  frmMonthReport.WeekCount := FWeekCount;
  frmMonthReport.ShowModal;
end;

procedure TfrmStatistics.cxDESelectedDatePropertiesChange(Sender: TObject);
begin
  lblSelectedYear.Caption := '(' + Copy(cxDESelectedDate.EditText, 1, 4) + '년 ' + Copy(cxDESelectedDate.EditText,6,2) + '월 )';

  if not FLoaded then Exit;

  LoadPatients;
end;

procedure TfrmStatistics.cxGErrorCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if not VarIsNull(cxGError.DataController.GetValue(AViewInfo.GridRecord.Index, cxGErrorCheck.Index)) then
  begin
    if Boolean(cxGError.DataController.GetValue(AViewInfo.GridRecord.Index, cxGErrorCheck.Index)) then
      ACanvas.Font.Color := clRed;
  end;
end;

procedure TfrmStatistics.cxGInOutAgeGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
begin
  AText := oGlobal.GetAge(cxGInOut.DataController.Values[ARecordIndex, cxGInOutBirthday.Index], oGlobal.DateToString(cxDESelectedDate.Date));
end;

procedure TfrmStatistics.cxGInOutFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if not adoInOut.Active then Exit;

  cxGSocial.DataController.RecordCount := 0;
  cxGShimsa.DataController.RecordCount := 0;
  cxGError.DataController.RecordCount := 0;

  cxGSocial.Bands[0].Caption := '';
  cxGShimsa.Bands[0].Caption := '';
  cxGError.Bands[0].Caption := '';

  if not FLoaded then Exit;

  if adoInOut.IsEmpty then Exit;

  LoadOvernight;
  DisplayMonth;
end;

procedure TfrmStatistics.cxGShimsaTcxGridDataControllerTcxDataSummaryFooterSummaryItems4GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  AText := inttostr(FCountSum0);
end;

procedure TfrmStatistics.cxGShimsaTcxGridDataControllerTcxDataSummaryFooterSummaryItems5GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  AText := inttostr(FCountSum1);
end;

procedure TfrmStatistics.cxGShimsaWeek0GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var
  nWeek: integer;
  sD: string;
begin
  if oGlobal.isNotNullStr(AText) then
  begin
    nWeek := strtoint(AText);

    if (nWeek mod 2) = 0 then
      sD := #255
    else
      sD := '';

    AText := sD + inttostr(FShimsaCount0[nWeek - FMinWeek]) + sD;
  end;
end;

procedure TfrmStatistics.cxGShimsaWeek1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var
  nWeek: integer;
  sD: string;
begin
  if oGlobal.isNotNullStr(AText) then
  begin
    nWeek := StrtoInt(AText);

    if (nWeek mod 2) = 0 then
      sD := #255
    else
      sD := '';

    AText := sD + inttostr(FShimsaCount1[nWeek - FMinWeek]) + sD;
  end;
end;

procedure TfrmStatistics.cxGSocialCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  iIndex: integer;
  nValue: integer;
begin
  if (not VarIsNull(AViewInfo.Value)) and (AViewInfo.Item.Index <> 0) then
    ACanvas.Brush.Color := clMoneyGreen;

  iIndex := AViewInfo.RecordViewInfo.GridRecord.Index;

  nValue := Sender.DataController.GetValue(iIndex, cxGShimsaWeekday.Index);

  if nValue=6 then
    ACanvas.Font.Color := clBlue
  else if nValue = 7 then
    ACanvas.Font.Color := clRed;
end;

procedure TfrmStatistics.cxGSocialWeek0GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var
  nWeek: integer;
  sD: string;
begin
  if oGlobal.isNotNullStr(AText) then
  begin
    nWeek := strtoint(AText);

    if (nWeek mod 2) = 0 then
      sD := #255
    else
      sD := '';

    AText := sD + inttostr(FSocialCount0[nWeek - FMinWeek]) + sD;
  end;
end;

procedure TfrmStatistics.cxGSocialWeek1GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
var
  nWeek: integer;
  sD: string;
begin
  if oGlobal.isNotNullStr(AText) then
  begin
    nWeek := StrtoInt(AText);

    if (nWeek mod 2) = 0 then
      sD := #255
    else
      sD := '';

    AText := sD + inttostr(FSocialCount1[nWeek - FMinWeek]) + sD;
  end;
end;

procedure TfrmStatistics.GetPrevWeekCount(nInOutID: integer; oDate: TDateTime;
  var nPrevCount: integer; nProgramTypeID: integer);
var
  oPrevDate, oCurDate: TDateInfo;
  nYear: integer;
begin
  oCurDate.Date := oDate;

  if (oCurDate.Month=1) and (WeekOf(oCurDate.FirstDay)>10) then // 1월1일 이 월요일이 아닐 경우
    nYear := oCurDate.Year - 1
  else
    nYear := oCurDate.Year;

  oPrevDate.Date := EncodeDateWeek(nYear, WeekOf(oCurDate.FirstDay), 1);

  if (oPrevDate.Year = oCurDate.Year) and (oPrevDate.Month=oCurDate.Month) then
    nPrevCount := 0
  else
  begin
    oPrevDate.StartDate := oPrevDate.Date;
    oPrevDate.FinishDate := EncodeDate(oPrevDate.Year, oPrevDate.Month, oPrevDate.Days);
    nPrevCount := dbMain.GetProgramCount(nInOutID, oPrevDate.SDate, oPrevDate.FDate, nProgramTypeID);
  end;
end;

function TfrmStatistics.isBoho(nBohumID: integer): Boolean;
begin
  result := nBohumID in [3, 4, 5];
end;

function TfrmStatistics.isBohum(nBohumID: integer): Boolean;
begin
  result := nBohumID in [1, 2, 7];
end;

procedure TfrmStatistics.DisplayMonth;
const
  colNo=0;
  col일반=1;
  col작업=2;
  col분석=3;
  col치료극=4;
  col가족치료=5;
  col개인력=6;
  col사업지도=7;
  col조사I=8;
  col조사II=9;
  col재활=10;
  col방문=11;
  col분석비=15;
var
  nInOutID, nCol: integer;
  tempDate: TDateTime;
  n, nYear, nMonth, nWeek : integer;
  oT: TADOQuery;
  oIntake, oCounseling, oSurvey1, oSurvey2, oTraining, oVisit: TADOQuery;
  oRecordCounseling, oRecordTraining: TADOQuery;
  sInOutID, sDate: string;
  nday, cnt, row, nDayInWeek: integer;
  bError: Boolean;
  nErrorCnt: integer;
  sValue: string;
begin
  if not FLoaded then Exit;

  if adoInOut.IsEmpty then Exit;

  nInOutID := adoInOut.FieldByName('InOutID').AsInteger;

  screen.Cursor := crHourGlass;
  cxGSocial.DataController.BeginUpdate;
  cxGShimsa.DataController.BeginUpdate;
  cxGError.DataController.BeginUpdate;

  cxGSocial.Bands[0].Caption
    := lblSelectedYear.Caption + ' ' + adoInOut.FieldByName('PatientID').AsString + ' ' +
       adoInOut.FieldByName('PatientName').AsString + ' ' +
       '(' + adoInOut.FieldByName('Sex').AsString + '/' +
       oGlobal.GetAge(adoInOut.FieldByName('Birthday').AsString, oGlobal.DateToString(cxDESelectedDate.Date))+ '세) ' +
       '(입원일: ' + adoInout.FieldByName('InDate').AsString + ') ' +
       adoInOut.FieldByName('WardName').AsString + ' ' +
       adoInOut.FieldByName('BohumName').AsString;

  cxGShimsa.Bands[0].Caption := cxGSocial.Bands[0].Caption;

  nYear := YearOf(cxDESelectedDate.Date);
  nMonth := MonthOf(cxDESelectedDate.Date);

  FMinWeek := WeekOf(EncodeDate(nYear, nMonth, 1));
  FMaxWeek := WeekOf(EncodeDate(nYear, nMonth, DaysInMonth(cxDESelectedDate.Date)));

  // 년도 가 바뀔 경우 겹치는 주의 수 가 1월은 이전해의 마지막 주로, 12월 은 다음해의 첫번째 주가 된다
  if (nMonth=1) and (FMinWeek > 6) then
    FMinWeek := 0;

  if (nMonth=12) and (FMaxWeek=1) then
    FMaxWeek := WeekOf(EncodeDate(nYear, nMonth, 31-7)) + 1;

  FWeekCount := FMaxWeek - FMinWeek + 1;

  SetLength(FShimsaCount0, 0);
  SetLength(FShimsaCount1, 0);
  SetLength(FShimsaCount0, FWeekCount);
  SetLength(FShimsaCount1, FWeekCount);

  SetLength(FSocialCount0, 0);
  SetLength(FSocialCount1, 0);
  SetLength(FSocialCount0, FWeekCount);
  SetLength(FSocialCount1, FWeekCount);

  FPrevCount0 := 0;
  FPrevCount1 := 0;
  if isBohum(adoInOut.FieldByName('BohumID').AsInteger) then
  begin
    GetPrevWeekCount(nInOutID, cxDESelectedDate.Date, FPrevCount0, col일반);
    GetPrevWeekCount(nInOutID, cxDESelectedDate.Date, FPrevCount1, col작업);
  end;

  cxGSocial.DataController.RecordCount := DaysInMonth(cxDESelectedDate.Date);
  cxGShimsa.DataController.RecordCount := DaysInMonth(cxDESelectedDate.Date);

  for n := 0 to cxGSocial.DataController.RecordCount - 1 do
  begin
    nDayInWeek := DayOfTheWeek(EncodeDate(nYear, nMonth, n+1));
    cxGSocial.DataController.SetValue(n, cxGSocialWeekday.Index, nDayInWeek);
    cxGShimsa.DataController.SetValue(n, cxGShimsaWeekday.Index, nDayInWeek);

    cxGSocial.DataController.SetValue(n, colNo, inttostr(n+1));
    cxGShimsa.DataController.SetValue(n, colNo, inttostr(n+1));

    nWeek := WeekOf(EncodeDate(nYear, nMonth, n+1));

    if (nMonth=1) and (nWeek > 6) then
      nWeek := 0;

    if (nMonth=12) and (nWeek=1) then
      nWeek := WeekOf(EncodeDate(nYear, nMonth, 31-7)) + 1;

    cxGShimsa.DataController.SetValue(n, cxGShimsaWeek0.Index, nWeek);
    cxGShimsa.DataController.SetValue(n, cxGShimsaWeek1.Index, nWeek);
    cxGSocial.DataController.SetValue(n, cxGSocialWeek0.Index, nWeek);
    cxGSocial.DataController.SetValue(n, cxGSocialWeek1.Index, nWeek);
  end;

  oT := TADOQuery.Create(self);
  oT.Connection := adoInOut.Connection;

  sInOutID := adoInOut.FieldByName('InOutID').AsString;
  sDate := copy(oGlobal.DateToString(cxDESelectedDate.Date),1,7);

  oT.SQL.Add('SELECT CONVERT(VARCHAR(16), starttime, 120) as startdate');
  oT.SQL.Add('       ,CONVERT(VARCHAR(16), finishtime, 120) as finishdate');
  oT.SQL.Add('       ,ProgramTypeID');
  oT.SQL.Add('       ,ProgramName');
  oT.SQL.Add('  FROM vPPSchedule');
  oT.SQL.Add(' WHERE InOutID=' + sInOutID);
  oT.SQL.Add('   AND SDATE LIKE ''' + sDate + '%''');
  oT.SQL.Add('   AND LinkRecord=0');
  oT.SQL.Add(' ORDER BY SDate DESC, sTime');

  try
    oT.Open;
  except
    oGlobal.Msg('데이터를 가져오지 못했습니다!');
    oT.Close;
    oT.Free;

    screen.Cursor := crDefault;
    Exit;
  end;

  cxGError.DataController.RecordCount := oT.RecordCount;

  oT.First;
  row := 0;
  nErrorCnt := 0;
  while not oT.Eof do
  begin
    nday := strtoint(copy(oT.FieldByName('StartDate').AsString,9,2))-1;

    //showmessage(oT.FieldByName('ProgramTypeID').AsString);

    nCol := 0;
    case oT.FieldByName('ProgramTypeID').AsInteger of
      1: nCol := col일반;
      2: nCol := col작업;
      3: nCol := col치료극;
      4: nCol := col가족치료;
      6: nCol := col분석;
      7: nCol := col분석비;
    end;

{  colNo=0;
  col일반=1;
  col작업=2;
  col분석=3;
  col치료극=4;
  col가족치료=5;
  col개인력=6;
  col사업지도=7;
  col조사I=8;
  col조사II=9;
  col재활=10;
  col방문=11;
  col분석비=15;
 }
    if VarIsNull(cxGSocial.DataController.GetValue(nday, nCol)) then
      cnt := 0
    else
      cnt := cxGSocial.DataController.GetValue(nday, nCol);

    if isBohum(adoInOut.FieldByName('BohumID').AsInteger) then
      cxGShimsa.DataController.SetValue(nday, nCol, 1)
    else if chkBohoOneforDay.Checked and isBoho(adoInOut.FieldByName('BohumID').AsInteger) then
      cxGShimsa.DataController.SetValue(nday, nCol, 1)
    else
      cxGShimsa.DataController.SetValue(nday, nCol, cnt+1);

    cxGSocial.DataController.SetValue(nday, nCol, cnt+1);

    cxGError.DataController.SetValue(row, 0, oT.FieldByName('ProgramName').AsString);
    cxGError.DataController.SetValue(row, 1, oT.FieldByName('StartDate').AsString);
    cxGError.DataController.SetValue(row, 2, oT.FieldByName('FinishDate').AsString);
    bError := CheckOvernight(oT.FieldByName('StartDate').AsString, oT.FieldByName('FinishDate').AsString);
    if bError then
      inc(nErrorCnt);
    cxGError.DataController.SetValue(row, 3, bError);
    inc(row);

   oT.Next;
  end;

  // 일반/작업에 대한 각 주별 건수 합계를 구한다
  for n := 0 to cxGShimsa.DataController.RecordCount - 1 do
  begin
    if not VarIsNull(cxGShimsa.DataController.GetValue(n, col일반)) then
    begin
      nWeek := cxGShimsa.DataController.GetValue(n, cxGShimsaWeek0.index);
      FShimsaCount0[nWeek - FMinWeek] := FShimsaCount0[nWeek - FMinWeek] +
        cxGShimsa.DataController.GetValue(n, col일반);
      FSocialCount0[nWeek - FMinWeek] := FSocialCount0[nWeek - FMinWeek] +
        cxGSocial.DataController.GetValue(n, col일반);
    end;

    if not VarIsNull(cxGShimsa.DataController.GetValue(n, col작업)) then
    begin
      nWeek := cxGShimsa.DataController.GetValue(n, cxGShimsaWeek1.index);
      FShimsaCount1[nWeek - FMinWeek] := FShimsaCount1[nWeek - FMinWeek] +
        cxGShimsa.DataController.GetValue(n, col작업);
      FSocialCount1[nWeek - FMinWeek] := FSocialCount1[nWeek - FMinWeek] +
        cxGSocial.DataController.GetValue(n, col작업);
    end;
  end;

  if isBohum(adoInOut.FieldByName('BohumID').AsInteger) then
  begin
    if FPrevCount0 > 2 then
      FPrevCount0 := 2;

    if FPrevCount1 > 5 then
      FPrevCount1 := 5;

    if FPrevCount0 + FShimsaCount0[0] > 2 then
      FShimsaCount0[0] := 2 - FPrevCount0;

    if FPrevCount1 + FShimsaCount1[0] > 5 then
      FShimsaCount1[0] := 5 - FPrevCount1;

    for n := 0 to FWeekCount - 1 do
    begin
      if FShimsaCount0[n] > 2 then
        FShimsaCount0[n] := 2;

      if FShimsaCount1[n] > 5 then
        FShimsaCount1[n] := 5;
    end;
  end;

  FCountSum0 := 0;
  FCountSum1 := 0;
  for n := 0 to FWeekCount - 1 do
  begin
    FCountSum0 := FCountSum0 + FShimsaCount0[n];
    FCountSum1 := FCountSum1 + FShimsaCount1[n];
  end;

//  cxGShimsa.DataController.Refresh;

  cxGError.Bands[0].Caption := '시간중복갯수 : ' + inttostr(nErrorCnt) + ' 개';

  if nErrorCnt > 0 then
  begin
    cxGSocial.Bands[0].Caption := cxGSocial.Bands[0].Caption + '  [시간중복 :'  + inttostr(nErrorCnt) + ' 개]';
    cxGShimsa.Bands[0].Caption := cxGSocial.Bands[0].Caption;
  end;

  oIntake := TADOQuery.Create(self);
  oCounseling := TADOQuery.Create(self);
  oSurvey1 := TADOQuery.Create(self);
  oSurvey2 := TADOQuery.Create(self);
  oTraining := TADOQuery.Create(self);
  oVisit := TADOQuery.Create(self);

  oRecordCounseling := TADOQuery.Create(self);
  oRecordTraining := TADOQuery.Create(self);

  oIntake.Connection := adoInOut.Connection;
  oCounseling.Connection := adoInOut.Connection;
  oSurvey1.Connection := adoInOut.Connection;
  oSurvey2.Connection := adoInOut.Connection;
  oTraining.Connection := adoInOut.Connection;
  oVisit.Connection := adoInOut.Connection;

  oRecordCounseling.Connection := adoInOut.Connection;
  oRecordTraining.Connection := adoInOut.Connection;

  oIntake.SQL.Text := 'SELECT MeetingDate FROM Intake WHERE InOutID=' + sInOutID + ' AND MeetingDate LIKE ''' + sDate + '%''';
  oCounseling.SQL.Text := 'SELECT MeetingDate, seq FROM counseling WHERE InOutID=' + sInOutID + ' AND MeetingDate LIKE ''' + sDate + '%''';

  oRecordCounseling.SQL.Text
    := 'SELECT SDate FROM vProgramPatients WHERE InOutID=' + sInOutID + ' AND LinkRecordID=0 AND SDate LIKE ''' + sDate + '%''';

  oRecordTraining.SQL.Text
    := 'SELECT SDate FROM vProgramPatients WHERE InOutID=' + sInOutID + ' AND LinkRecordID=1 AND SDate LIKE ''' + sDate + '%''';

  oSurvey1.SQL.Text := 'SELECT SurveyDate FROM survey1 WHERE InOutID=' + sInOutID + ' AND SurveyDate LIKE ''' + sDate + '%''';
  oSurvey2.SQL.Text := 'SELECT MeetingDate FROM survey2 WHERE InOutID=' + sInOutID + ' AND MeetingDate LIKE ''' + sDate + '%''';
  oTraining.SQL.Text := 'SELECT MeetingDate, seq FROM training WHERE InOutID=' + sInOutID + ' AND MeetingDate LIKE ''' + sDate + '%''';
  oVisit.SQL.Text := 'SELECT VisitDate, seq FROM visit WHERE InOutID=' + sInOutID + ' AND VisitDate LIKE ''' + sDate + '%''';

  try
    oIntake.Open;
    oCounseling.Open;
    oTraining.Open;

    oRecordCounseling.Open;
    oRecordTraining.Open;

    oSurvey1.Open;
    oSurvey2.Open;
    oVisit.Open;
  except
    oGlobal.Msg('데이터를 읽어올 수 없습니다!');
    screen.Cursor := crDefault;
    Exit;
  end;

  while not oIntake.Eof do
  begin
    nday := strtoint(copy(oIntake.FieldByName('MeetingDate').AsString,9,2))-1;
    cxGSocial.DataController.SetValue(nday, col개인력, 1);
    cxGShimsa.DataController.SetValue(nday, col개인력, 1);
    oIntake.Next;
  end;

  while not oCounseling.Eof do
  begin
    nday := strtoint(copy(oCounseling.FieldByName('MeetingDate').AsString,9,2))-1;

    cxGSocial.DataController.SetValue(nday, col사업지도, oCounseling.FieldByName('seq').AsString + '차');
    cxGShimsa.DataController.SetValue(nday, col사업지도, oCounseling.FieldByName('seq').AsString + '차');

    oCounseling.Next;
  end;

  while not oRecordCounseling.Eof do
  begin
    nday := strtoint(copy(oRecordCounseling.FieldByName('SDate').AsString,9,2))-1;

    if VarIsNull(cxGSocial.DataController.GetValue(nday,col사업지도)) then
      sValue := ''
    else
      sValue := cxGSocial.DataController.GetValue(nday,col사업지도);
    cxGSocial.DataController.SetValue(nday,col사업지도, sValue + '(1)');

    if VarIsNull(cxGShimsa.DataController.GetValue(nday,col사업지도)) then
      sValue := ''
    else
      sValue := cxGShimsa.DataController.GetValue(nday,col사업지도);

    cxGShimsa.DataController.SetValue(nday,col사업지도, sValue + '(1)');

    oRecordCounseling.Next;
  end;

  while not oTraining.Eof do
  begin
    nday := strtoint(copy(oTraining.FieldByName('MeetingDate').AsString,9,2))-1;

    cxGSocial.DataController.SetValue(nday,col재활, oTraining.FieldByName('seq').AsString + '차');
    cxGShimsa.DataController.SetValue(nday,col재활, oTraining.FieldByName('seq').AsString + '차');

    oTraining.Next;
  end;

  while not oRecordTraining.Eof do
  begin
    nday := strtoint(copy(oRecordTraining.FieldByName('SDate').AsString,9,2))-1;
//    nday := strtoint(copy(oRecordCounseling.FieldByName('SDate').AsString,9,2))-1;
//    2011-11-27 글로리병원에서 수정요청이 있어 들어와 보니 이곳이 잘못된 것 같음.

    if VarIsNull(cxGSocial.DataController.GetValue(nday,col재활)) then
      sValue := ''
    else
      sValue := cxGSocial.DataController.GetValue(nday,col재활);
    cxGSocial.DataController.SetValue(nday,col재활, sValue + '(1)');

    if VarIsNull(cxGShimsa.DataController.GetValue(nday,col재활)) then
      sValue := ''
    else
      sValue := cxGShimsa.DataController.GetValue(nday,col재활);
    cxGShimsa.DataController.SetValue(nday,col재활, sValue + '(1)');

    oRecordTraining.Next;
//    oRecordCounseling.Next;
//    2011-11-27 글로리병원에서 수정요청이 있어 들어와 보니 이곳이 잘못된 것 같음.
  end;

  while not oSurvey1.Eof do
  begin
    nday := strtoint(copy(oSurvey1.FieldByName('SurveyDate').AsString,9,2))-1;
    cxGSocial.DataController.SetValue(nday,col조사I,1);
    cxGShimsa.DataController.SetValue(nday,col조사I,1);
    oSurvey1.Next;
  end;

  while not oSurvey2.Eof do
  begin
    nday := strtoint(copy(oSurvey2.FieldByName('MeetingDate').AsString,9,2))-1;
    cxGSocial.DataController.SetValue(nday,col조사II,1);
    cxGShimsa.DataController.SetValue(nday,col조사II,1);
    oSurvey2.Next;
  end;

  while not oVisit.Eof do
  begin
    nday := strtoint(copy(oVisit.FieldByName('VisitDate').AsString,9,2))-1;

    cxGSocial.DataController.SetValue(nday,col방문, oVisit.FieldByName('seq').AsString + '차');
    cxGShimsa.DataController.SetValue(nday,col방문, oVisit.FieldByName('seq').AsString + '차');

    oVisit.Next;
  end;

  cxGSocial.DataController.EndUpdate;
  cxGShimsa.DataController.EndUpdate;
  cxGError.DataController.EndUpdate;

  screen.Cursor := crDefault;

  oT.Close;
  oT.Free;

  oIntake.Close; oIntake.Free;

  oCounseling.Close; oCounseling.Free;
  oTraining.Close; oTraining.Free;

  oRecordCounseling.Close; oRecordCounseling.Free;
  oRecordTraining.Close; oRecordTraining.Free;

  oSurvey1.Close; oSurvey1.Free;
  oSurvey2.Close; oSurvey2.Free;
  oVisit.Close; oVisit.Free;
end;

procedure TfrmStatistics.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmStatistics.FormShow(Sender: TObject);
var
  is7: Boolean;
begin
  FLoaded := False;

  chkViewAll.Checked := oConfig.Option.bViewAll;
  chkViewWeekSum.Checked := oConfig.Option.bViewWeekSum;
  chkBohoOneforDay.Checked := oConfig.Option.bBohoOneforDay;

  is7 := dbMain.isHas7;

  cxGInOutPP6.Visible := is7;
  cxGShimsaColumn2.Visible := is7;
  cxGSocialColumn13.Visible := is7;

  if not dbMain.GetWardList(oConfig.User.HospitalID, cboWard.Properties.Items, True) then
    oGlobal.Msg('병동정보를 가져올 수 없습니다!')
  else
    cboWard.ItemIndex := 0;

  if not dbMain.GetBohumList(cboBohum.Properties.Items, True) then
    oGlobal.Msg('보험정보를 가져올 수 없습니다!')
  else
    cboBohum.ItemIndex := 0;

  cxDESelectedDate.EditText := oGlobal.DateToString(now);

  LoadPatients;
end;

procedure TfrmStatistics.LoadOvernight;
var
  sYearMonth: string;
begin
  adoOvernight.Close;

  if not FLoaded then Exit;
  if adoInOut.IsEmpty then Exit;

  sYearMonth := copy(cxDESelectedDate.Text, 1, 7);

  with adoOvernight.SQL do
  begin
    Clear;
    Add('SELECT InOutID');
    Add('       ,OvernightState');
    Add('       ,CASE overnightstate WHEN 0 THEN ''외출/외박''');
    Add('                            WHEN 1 THEN ''CR''');
    Add('        END AS StateName');
    Add('       ,CONVERT(VARCHAR(16), starttime, 120) as startdate');
    Add('       ,CONVERT(VARCHAR(16), finishtime, 120) as finishdate');
    Add('       ,Comment');
    Add('  FROM overnight');
    Add(' WHERE InOutID=' + adoInOut.FieldByName('InOutID').AsString);
    Add('   AND (CONVERT(VARCHAR(7), starttime, 120)=''' + sYearMonth + ''' OR');
    Add('        CONVERT(VARCHAR(7), finishtime, 120)=''' + sYearMonth + ''')');
    Add(' ORDER BY starttime, finishtime');
  end;

  try
    adoOvernight.Open;
  except
    oGlobal.Msg('외박외출,CR 정보를 읽어올 수 없습니다!');
  end;
end;

procedure TfrmStatistics.LoadPatients;
var
  sStartDate, sFinishDate: string;
  nWardID, nBohumID: integer;
begin
  FLoaded := False;

  sStartDate :=  '''' + Copy(cxDESelectedDate.EditText, 1, 8) + '01''';
  sFinishDate := '''' + Copy(cxDESelectedDate.EditText, 1, 8) + inttostr(DaysInMonth(cxDeSelectedDate.Date)) + '''';
  nWardID := dbMain.GetWardID(oConfig.User.HospitalID, cboWard.Text);
  nBohumID := dbMain.GetBohumID(cboBohum.Text);

  adoInOut.DisableControls;

  with adoInOut.SQL do
  begin
    Clear;

    Add('select * from');
    Add('(');
    Add('select InOut.InOutID');
    Add('       , InOut.PatientID');
    Add('       , Patients.PatientName');
    Add('       , Patients.Birthday');
    Add('       , Patients.Sex');
    Add('       , InOut.InDate');
    Add('       , InOut.OutDate');
    Add('       , InOut.BohumID');
    Add('       ,(select BohumName from Bohum where BohumID=InOut.BohumID) as BohumName');
    Add('       , WardID');
    Add('       ,(select WardName from Wards where WardId=W.WardId) as WardName');
    Add('       ,(select count(InOutID)');
    Add('           from intake');
    Add('          where InOutID=InOut.inoutid');
    Add('            and MeetingDate between ' + sStartDate + ' and ' + sFinishDate + ') as intake');
    Add('       ,(select count(InOutID)');
    Add('           from survey1');
    Add('          where InOutID=InOut.inoutid');
    Add('            and SurveyDate between ' + sStartDate + ' and ' + sFinishDate + ') as survey1');
    Add('       ,(select count(InOutID)');
    Add('           from survey2');
    Add('          where InOutID=InOut.inoutid');
    Add('            and MeetingDate between ' + sStartDate + ' and ' + sFinishDate + ') as survey2');

    Add('       ,(select count(InOutID)');
    Add('           from counseling');
    Add('          where InOutID=InOut.inoutid');
    Add('            and MeetingDate between ' + sStartDate + ' and ' + sFinishDate + ') +');

    Add('        (select count(InOutID)');
    Add('           from vPPSchedule');
    Add('          where InOutID=InOut.InOutID');
    Add('            and LinkRecordID=0');
    Add('            and SDate Between ' + sStartDate + ' and ' + sFinishDate + ') as counseling');

    Add('       ,(select count(InOutID)');
    Add('           from training');
    Add('          where InOutID=InOut.inoutid');
    Add('            and MeetingDate between ' + sStartDate + ' and ' + sFinishDate + ') +');

    Add('        (select count(InOutID)');
    Add('           from vPPSchedule');
    Add('          where InOutID=InOut.InOutID');
    Add('            and LinkRecordID=1');
    Add('            and SDate Between ' + sStartDate + ' and ' + sFinishDate + ') as training');

    Add('       ,(select count(InOutID)');
    Add('           from visit');
    Add('          where InOutID=InOut.inoutid');
    Add('            and VisitDate between ' + sStartDate + ' and ' + sFinishDate + ') as Visit');

    Add('       ,(select count(InOutID)');
    Add('           from vPPSchedule');
    Add('          where InOutID=InOut.inoutid and SDate between ' + sStartDate + ' and ' + sFinishDate + ') as PP');

    Add('       ,(select count(InOutID)');
    Add('           from vPPSchedule');
    Add('          where InOutID=InOut.inoutid and ProgramTypeID=1 and SDate between ' + sStartDate + ' and ' + sFinishDate + ') as PP1');

    Add('       ,(select count(InOutID)');
    Add('           from vPPSchedule');
    Add('          where InOutID=InOut.inoutid and ProgramTypeID=2 and SDate between ' + sStartDate + ' and ' + sFinishDate + ') as PP2');

    Add('       ,(select count(InOutID)');
    Add('           from vPPSchedule');
    Add('          where InOutID=InOut.inoutid and ProgramTypeID=6 and SDate between ' + sStartDate + ' and ' + sFinishDate + ') as PP5');

    Add('       ,(select count(InOutID)');
    Add('           from vPPSchedule');
    Add('          where InOutID=InOut.inoutid and ProgramTypeID=3 and SDate between ' + sStartDate + ' and ' + sFinishDate + ') as PP3');

    Add('       ,(select count(InOutID)');
    Add('           from vPPSchedule');
    Add('          where InOutID=InOut.inoutid and ProgramTypeID=4 and SDate between ' + sStartDate + ' and ' + sFinishDate + ') as PP4');

    Add('       ,(select count(InOutID)');
    Add('           from vPPSchedule');
    Add('          where InOutID=InOut.inoutid and ProgramTypeID=7 and SDate between ' + sStartDate + ' and ' + sFinishDate + ') as PP6');

    Add('  from InOut');
    Add('       INNER JOIN Patients ON Patients.HospitalID=InOut.HospitalID and Patients.PatientID=InOut.PatientID');
    Add('    	  INNER JOIN WardHistory AS W');
    Add('  			        ON W.InOutID=InOut.InOutID');
    Add(' 	  	       AND W.WardDate = (select max(WardDate)');
    Add('                                  from WardHistory');
    Add('                                 where InOutID=W.InOutID');
    Add('                                   and WardDate <= ' + sFinishDate + ')');

    Add(' where InOut.HospitalID=' + inttostr(oConfig.User.HospitalID));
    Add('   and ((indate between ' + sStartDate + ' and ' + sFinishDate + ') or');
    Add('        (outdate between ' + sStartDate + ' and ' + sFinishDate + ') or');
    Add('        (indate <= ' + sStartDate + ' and outdate >= ' + sFinishDate + ') or');
    Add('        (state = ' + inttostr(cIn) + '))');

    if cboSearchCondition.ItemIndex = 0 then
      Add('    and PatientName LIKE ''%' + trim(txtSearch.Text) + '%''')
    else
      Add('    and InOut.PatientID LIKE ''%' + trim(txtSearch.Text) + '%''');

    if cboInOut.ItemIndex = 1 then
      Add('    and outdate = ''''')
    else if cboInout.ItemIndex = 2 then
      Add('    and outdate > ''''');

    if nWardID <> -1 then
      Add('   and WardID=' + inttostr(nWardID));

    if nBohumID <> -1 then
      Add('   and BohumID=' + inttostr(nBohumID));

    Add(') AS A');

    if not chkViewAll.Checked then
      Add(' where intake>0 or survey1>0 or survey2>0 or counseling>0 or training>0 or visit>0 or PP>0');

    if cboSearchCondition.ItemIndex = 0 then
      Add('  order by PatientName')
    else
      Add(' order by PatientId');

  end;

  try
    adoInout.Open;

    if cboSearchCondition.ItemIndex = 0 then
    begin
      cxGInOutPatientName.SortIndex := 0;
      cxGInOutPatientName.SortOrder := soAscending;
      cxGInOutPatientID.SortIndex := -1;
      cxGInOutPatientID.SortOrder := soNone;
    end
    else
    begin
      cxGInOutPatientID.SortIndex := 0;
      cxGInOutPatientID.SortOrder := soAscending;
      cxGInOutPatientName.SortIndex := -1;
      cxGInOutPatientName.SortOrder := soNone;
    end;

    adoInOut.EnableControls;
    FLoaded := True;

    LoadOvernight;
    DisplayMonth;
  except
    adoInOut.EnableControls;
    oGlobal.Msg('환자정보를 가져오지 못했습니다!');
  end;
end;

procedure TfrmStatistics.txtSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSearch.Click;
end;

end.
