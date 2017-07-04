unit uStatistics;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, DateUtils, DB, ADODB, cxControls, cxStyles, dxSkinsCore,
  dxSkinCaramel, dxSkinscxPC3Painter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxLabel, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, ExtCtrls, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxPCdxBarPopupMenu, cxPC,
  cxGroupBox, cxVGrid, cxInplaceContainer, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg,
  dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPScxPageControlProducer, dxSkinsdxBarPainter,
  dxPSCore, dxPScxCommon, dxPScxGrid7Lnk, cxCheckBox;

type
  TfrmStatistics = class(TForm)
    adoInOut: TADOQuery;
    dsInOut: TDataSource;
    cxGrid1: TcxGrid;
    cxGInOut: TcxGridDBTableView;
    cxGInOutPatientID: TcxGridDBColumn;
    cxGInOutPatientName: TcxGridDBColumn;
    cxGInOutSEX: TcxGridDBColumn;
    cxGInOutStateName: TcxGridDBColumn;
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
    Label2: TLabel;
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
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGrid2: TcxGrid;
    cxGrid2Level1: TcxGridLevel;
    Label4: TLabel;
    cboWard: TcxComboBox;
    Label5: TLabel;
    cboBohum: TcxComboBox;
    dxComponentPrinter1: TdxComponentPrinter;
    cxGMonth: TcxGridBandedTableView;
    cxGMonthColumn1: TcxGridBandedColumn;
    cxGMonthColumn2: TcxGridBandedColumn;
    cxGMonthColumn3: TcxGridBandedColumn;
    cxGMonthColumn4: TcxGridBandedColumn;
    cxGMonthColumn5: TcxGridBandedColumn;
    cxGMonthColumn6: TcxGridBandedColumn;
    cxGMonthColumn7: TcxGridBandedColumn;
    cxGMonthColumn8: TcxGridBandedColumn;
    cxGMonthColumn9: TcxGridBandedColumn;
    cxGMonthColumn10: TcxGridBandedColumn;
    cxGMonthColumn11: TcxGridBandedColumn;
    cxGrid5: TcxGrid;
    cxGMonth2: TcxGridBandedTableView;
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
    btnPringAll: TcxButton;
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
    chkViewAll: TcxCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cxDESelectedDatePropertiesChange(Sender: TObject);
    procedure cxGInOutAgeGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure cboSearchConditionPropertiesChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure txtSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsInOutDataChange(Sender: TObject; Field: TField);
    procedure cxGMonthCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cboWardPropertiesChange(Sender: TObject);
    procedure cboBohumPropertiesChange(Sender: TObject);
    procedure btnPrintOneClick(Sender: TObject);
    procedure btnPringAllClick(Sender: TObject);
    procedure cxGErrorCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure chkViewAllPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FLoaded : Boolean;
    procedure LoadPatients;
    procedure DisplayMonth;
    procedure LoadOvernight;
    function CheckOvernight(sStarttime, sFinishtime: string): Boolean;
  public
    { Public declarations }
  end;

var
  frmStatistics: TfrmStatistics;

implementation
uses uDB, uGlobal, uConfig, uPrintAll;
{$R *.dfm}

procedure TfrmStatistics.btnSearchClick(Sender: TObject);
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

  if cboSearchCondition.ItemIndex = 0 then
    adoInOut.Locate('PatientName', sSearch, [loPartialKey])
  else
    adoInOut.Locate('PatientID', sSearch, [loPartialKey]);

  adoInOut.EnableControls;
end;

procedure TfrmStatistics.cboBohumPropertiesChange(Sender: TObject);
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
  frmPrintAll.oPrinter := dxComponentPrinter1Link1;
  frmPrintAll.ShowModal;
end;

procedure TfrmStatistics.btnPrintOneClick(Sender: TObject);
begin
  if adoInOut.IsEmpty then
  begin
    oGlobal.Msg('출력할 자료가 없습니다!');
    Exit;
  end;

  dxComponentPrinter1Link1.Print(True, nil);
end;

procedure TfrmStatistics.chkViewAllPropertiesChange(Sender: TObject);
begin
  if not FLoaded then Exit;

  LoadPatients;
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

procedure TfrmStatistics.cxGMonthCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  if (not VarIsNull(AViewInfo.Value)) and (AViewInfo.Item.Index <> 0) then
    ACanvas.Brush.Color := clMoneyGreen;
end;

procedure TfrmStatistics.DisplayMonth;
var
  n: integer;
  oT: TADOQuery;
  oIntake, oCounseling, oSurvey1, oSurvey2, oTraining, oVisit: TADOQuery;
  sInOutID, sDate: string;
  nday, cnt, row: integer;
  bError: Boolean;
  nErrorCnt: integer;
begin
  if not FLoaded then Exit;

  if adoInOut.IsEmpty then Exit;


  screen.Cursor := crHourGlass;

  cxGMonth.Bands[0].Caption := lblSelectedYear.Caption + ' ' + adoInOut.FieldByName('PatientID').AsString + ' ' +
                               adoInOut.FieldByName('PatientName').AsString + ' ' +
                               '(' + adoInOut.FieldByName('Sex').AsString + '/' +
                               oGlobal.GetAge(adoInOut.FieldByName('Birthday').AsString, oGlobal.DateToString(cxDESelectedDate.Date))+ '세) ' +
                               '(입원일: ' + adoInout.FieldByName('InDate').AsString + ') ' +
                               adoInOut.FieldByName('WardName').AsString + ' ' +
                               adoInOut.FieldByName('BohumName').AsString;

  cxGMonth2.Bands[0].Caption := lblSelectedYear.Caption + ' ' + adoInOut.FieldByName('PatientID').AsString + ' ' +
                                adoInOut.FieldByName('PatientName').AsString + ' ' +
                                '(' + adoInOut.FieldByName('Sex').AsString + '/' +
                                oGlobal.GetAge(adoInOut.FieldByName('Birthday').AsString, oGlobal.DateToString(cxDESelectedDate.Date))+ '세) ' +
                               '(입원일: ' + adoInout.FieldByName('InDate').AsString + ') ' +
                                adoInOut.FieldByName('WardName').AsString + ' ' +
                                adoInOut.FieldByName('BohumName').AsString;

  cxGMonth.DataController.RecordCount := DaysInMonth(cxDESelectedDate.Date);
  cxGMonth2.DataController.RecordCount := DaysInMonth(cxDESelectedDate.Date);

  for n := 0 to cxGMonth.DataController.RecordCount - 1 do
  begin
    cxGMonth.DataController.SetValue(n, 0, n+1);
    cxGMonth2.DataController.SetValue(n, 0, n+1);
  end;

  oT := TADOQuery.Create(self);
  oT.Connection := adoInOut.Connection;

  sInOutID := adoInOut.FieldByName('InOutID').AsString;
  sDate := copy(oGlobal.DateToString(cxDESelectedDate.Date),1,7);

  oT.SQL.Clear;
  oT.SQL.Add('SELECT SDate, sTime, ProgramTypeID');
  oT.SQL.Add('       ,ProgramName');
  oT.SQL.Add('       ,CONVERT(char(16), starttime, 120) as StartDate');
  oT.SQL.Add('       ,CONVERT(char(16), finishtime, 120) as FinishDate');
  oT.SQL.Add('  FROM ProgramPatients, Schedule INNER JOIN Programs ON Programs.ProgramID=Schedule.ProgramID');
  oT.SQL.Add(' WHERE InOutID=' + sInOutID);
  oT.SQL.Add('   AND ProgramPatients.ScheduleID=Schedule.ScheduleID');
  oT.SQL.Add('   AND SDATE LIKE ''' + sDate + '%''');
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
    nday := strtoint(copy(oT.FieldByName('sDate').AsString,9,2))-1;

    if VarIsNull(cxGMonth.DataController.GetValue(nday, oT.FieldByName('ProgramTypeID').AsInteger)) then
      cnt := 0
    else
      cnt := cxGMonth.DataController.GetValue(nday, oT.FieldByName('ProgramTypeID').AsInteger);
    cxGMonth.DataController.SetValue(nday, oT.FieldByName('ProgramTypeID').AsInteger, cnt+1);

    cxGMonth2.DataController.SetValue(nday, oT.FieldByName('ProgramTypeID').AsInteger, 1);

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

  cxGError.Bands[0].Caption := '시간중복갯수 : ' + inttostr(nErrorCnt) + ' 개';

  if nErrorCnt > 0 then
  begin
    cxGMonth.Bands[0].Caption := cxGMonth.Bands[0].Caption + '  [시간중복 :'  + inttostr(nErrorCnt) + ' 개]';
    cxGMonth2.Bands[0].Caption := cxGMonth2.Bands[0].Caption + '  [시간중복 : ' + inttostr(nErrorCnt) + ' 개]';
  end;

  oIntake := TADOQuery.Create(self);
  oCounseling := TADOQuery.Create(self);
  oSurvey1 := TADOQuery.Create(self);
  oSurvey2 := TADOQuery.Create(self);
  oTraining := TADOQuery.Create(self);
  oVisit := TADOQuery.Create(self);

  oIntake.Connection := adoInOut.Connection;
  oCounseling.Connection := adoInOut.Connection;
  oSurvey1.Connection := adoInOut.Connection;
  oSurvey2.Connection := adoInOut.Connection;
  oTraining.Connection := adoInOut.Connection;
  oVisit.Connection := adoInOut.Connection;

  oIntake.SQL.Text := 'SELECT MeetingDate FROM Intake WHERE InOutID=' + sInOutID + ' AND MeetingDate LIKE ''' + sDate + '%''';
  oCounseling.SQL.Text := 'SELECT MeetingDate, seq FROM counseling WHERE InOutID=' + sInOutID + ' AND MeetingDate LIKE ''' + sDate + '%''';
  oSurvey1.SQL.Text := 'SELECT SurveyDate FROM survey1 WHERE InOutID=' + sInOutID + ' AND SurveyDate LIKE ''' + sDate + '%''';
  oSurvey2.SQL.Text := 'SELECT MeetingDate FROM survey2 WHERE InOutID=' + sInOutID + ' AND MeetingDate LIKE ''' + sDate + '%''';
  oTraining.SQL.Text := 'SELECT MeetingDate, seq FROM training WHERE InOutID=' + sInOutID + ' AND MeetingDate LIKE ''' + sDate + '%''';
  oVisit.SQL.Text := 'SELECT VisitDate, seq FROM visit WHERE InOutID=' + sInOutID + ' AND VisitDate LIKE ''' + sDate + '%''';

  try
    oIntake.Open;
    oCounseling.Open;
    oSurvey1.Open;
    oSurvey2.Open;
    oTraining.Open;
    oVisit.Open;
  except
    oGlobal.Msg('데이터를 읽어올 수 없습니다!');
    screen.Cursor := crDefault;
    Exit;
  end;

  while not oIntake.Eof do
  begin
    nday := strtoint(copy(oIntake.FieldByName('MeetingDate').AsString,9,2))-1;
    cxGMonth.DataController.SetValue(nday, 5, 1);
    cxGMonth2.DataController.SetValue(nday, 5, 1);
    oIntake.Next;
  end;

  while not oCounseling.Eof do
  begin
    nday := strtoint(copy(oCounseling.FieldByName('MeetingDate').AsString,9,2))-1;

    cxGMonth.DataController.SetValue(nday,6, oCounseling.FieldByName('seq').AsString + '차');
    cxGMonth2.DataController.SetValue(nday,6, oCounseling.FieldByName('seq').AsString + '차');

    oCounseling.Next;
  end;

  while not oSurvey1.Eof do
  begin
    nday := strtoint(copy(oSurvey1.FieldByName('SurveyDate').AsString,9,2))-1;
    cxGMonth.DataController.SetValue(nday,7,1);
    cxGMonth2.DataController.SetValue(nday,7,1);
    oSurvey1.Next;
  end;

  while not oSurvey2.Eof do
  begin
    nday := strtoint(copy(oSurvey2.FieldByName('MeetingDate').AsString,9,2))-1;
    cxGMonth.DataController.SetValue(nday,8,1);
    cxGMonth2.DataController.SetValue(nday,8,1);
    oSurvey2.Next;
  end;

  while not oTraining.Eof do
  begin
    nday := strtoint(copy(oTraining.FieldByName('MeetingDate').AsString,9,2))-1;

    cxGMonth.DataController.SetValue(nday,9, oTraining.FieldByName('seq').AsString + '차');
    cxGMonth2.DataController.SetValue(nday,9, oTraining.FieldByName('seq').AsString + '차');

    oTraining.Next;
  end;

  while not oVisit.Eof do
  begin
    nday := strtoint(copy(oVisit.FieldByName('VisitDate').AsString,9,2))-1;

    cxGMonth.DataController.SetValue(nday,10, oVisit.FieldByName('seq').AsString + '차');
    cxGMonth2.DataController.SetValue(nday,10, oVisit.FieldByName('seq').AsString + '차');

    oVisit.Next;
  end;

  screen.Cursor := crDefault;

  oT.Close;
  oT.Free;

  oIntake.Close; oIntake.Free;
  oCounseling.Close; oCounseling.Free;
  oSurvey1.Close; oSurvey1.Free;
  oSurvey2.Close; oSurvey2.Free;
  oTraining.Close; oTraining.Free;
  oVisit.Close; oVisit.Free;
end;

procedure TfrmStatistics.dsInOutDataChange(Sender: TObject; Field: TField);
begin
  cxGMonth.DataController.RecordCount := 0;
  cxGMonth2.DataController.RecordCount := 0;
  cxGError.DataController.RecordCount := 0;

  cxGMonth.Bands[0].Caption := '';
  cxGMonth2.Bands[0].Caption := '';
  cxGError.Bands[0].Caption := '';

  if not FLoaded then Exit;

  if adoInOut.IsEmpty then Exit;

  LoadOvernight;
  DisplayMonth;
end;

procedure TfrmStatistics.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmStatistics.FormShow(Sender: TObject);
begin
  FLoaded := False;

  if not dbMain.GetWardList(oConfig.User.HospitalID, cboWard.Properties.Items, True) then
    oGlobal.Msg('병동정보를 가져올 수 없습니다!')
  else
    cboWard.ItemIndex := 0;

  if not dbMain.GetBohumList(cboBohum.Properties.Items, True) then
    oGlobal.Msg('보험정보를 가져올 수 없습니다!')
  else
    cboBohum.ItemIndex := 0;

  cxDESelectedDate.Date := now;

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

  with adoInOut.SQL do
  begin
    Clear;
    Add('select * from');
    Add('(');
    Add('select Patients.PatientName as PatientName, Patients.Sex as SEX, Patients.Birthday as Birthday');
    ADd('       ,inout.*');
    Add('       , case inout.state when 0 then ''입원''');
    Add('                          when 1 then ''퇴원''');
    Add('                          else ''에러''');
    Add('         end as StateName');
    Add('       ,(select WardName');
    Add('           from Wards');
    Add('           where wards.wardid=inout.wardid) as WardName');
    Add('       ,(select BohumName');
    Add('           from Bohum');
    Add('          where Bohum.BohumID=inout.BohumID) as BohumName');
    Add('       ,(select count(*)');
    Add('           from intake');
    Add('          where inout.inoutid=intake.inoutid');
    Add('            and intake.MeetingDate between ' + sStartDate + ' and ' + sFinishDate + ') as intake');
    Add('       ,(select count(*)');
    Add('           from survey1');
    Add('          where inout.inoutid=survey1.inoutid');
    Add('            and survey1.SurveyDate between ' + sStartDate + ' and ' + sFinishDate + ') as survey1');
    Add('       ,(select count(*)');
    Add('           from survey2');
    Add('          where inout.inoutid=survey2.inoutid');
    Add('            and survey2.MeetingDate between ' + sStartDate + ' and ' + sFinishDate + ') as survey2');
    Add('       ,(select count(*)');
    Add('           from counseling');
    Add('          where inout.inoutid=counseling.inoutid');
    Add('            and counseling.MeetingDate between ' + sStartDate + ' and ' + sFinishDate + ') as counseling');
    Add('       ,(select count(*)');
    Add('           from training');
    Add('          where inout.inoutid=training.inoutid');
    Add('            and training.MeetingDate between ' + sStartDate + ' and ' + sFinishDate + ') as training');
    Add('       ,(select count(*)');
    Add('           from visit');
    Add('          where inout.inoutid=visit.inoutid');
    Add('            and visit.VisitDate between ' + sStartDate + ' and ' + sFinishDate + ') as Visit');
    Add('       ,(select count(*)');
    Add('           from programpatients as PP');
    Add('                inner join Schedule on Schedule.ScheduleID=PP.ScheduleID');
    Add('          where inout.inoutid=PP.inoutid and convert(char(10),Schedule.StartTime,120) between ' + sStartDate + ' and ' + sFinishDate + ') as PP');

    Add('       ,(select count(*)');
    Add('           from programpatients as PP');
    Add('                inner join Schedule on Schedule.ScheduleID=PP.ScheduleID');
    Add('                inner join programs on schedule.programid=programs.programid and programs.programtypeid=1');
    Add('          where inout.inoutid=PP.inoutid and convert(char(10),Schedule.StartTime,120) between ' + sStartDate + ' and ' + sFinishDate + ') as PP1');

    Add('       ,(select count(*)');
    Add('           from programpatients as PP');
    Add('                inner join Schedule on Schedule.ScheduleID=PP.ScheduleID');
    Add('                inner join programs on schedule.programid=programs.programid and programs.programtypeid=2');
    Add('          where inout.inoutid=PP.inoutid and convert(char(10),Schedule.StartTime,120) between ' + sStartDate + ' and ' + sFinishDate + ') as PP2');

    Add('       ,(select count(*)');
    Add('           from programpatients as PP');
    Add('                inner join Schedule on Schedule.ScheduleID=PP.ScheduleID');
    Add('                inner join programs on schedule.programid=programs.programid and programs.programtypeid=3');
    Add('          where inout.inoutid=PP.inoutid and convert(char(10),Schedule.StartTime,120) between ' + sStartDate + ' and ' + sFinishDate + ') as PP3');

    Add('       ,(select count(*)');
    Add('           from programpatients as PP');
    Add('                inner join Schedule on Schedule.ScheduleID=PP.ScheduleID');
    Add('                inner join programs on schedule.programid=programs.programid and programs.programtypeid=4');
    Add('          where inout.inoutid=PP.inoutid and convert(char(10),Schedule.StartTime,120) between ' + sStartDate + ' and ' + sFinishDate + ') as PP4');

    Add('  from inout as inout inner join patients on patients.hospitalid=inout.hospitalid and patients.patientid=inout.patientid');
    Add(' where inout.hospitalid=patients.hospitalid');
    Add('   and inout.patientid=patients.patientid');
    Add('   and inout.hospitalid=' + inttostr(oConfig.User.HospitalID));

    Add('   and ((indate between ' + sStartDate + ' and ' + sFinishDate + ') or');
    Add('        (outdate between ' + sStartDate + ' and ' + sFinishDate + ') or');
    Add('        (indate <= ' + sStartDate + ' and outdate >= ' + sFinishDate + ') or');
    Add('        (state = ' + inttostr(cIn) + '))');

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
      Add(' order by patientid');
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

    FLoaded := True;
    LoadOvernight;
    DisplayMonth;
  except
    oGlobal.Msg('환자정보를 가져오지 못했습니다!');
  end;
end;

procedure TfrmStatistics.txtSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and oGlobal.isNotNullStr(txtSearch.Text) then
    btnSearch.Click;
end;

end.
