unit uMonthReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, cxControls, cxStyles, dxSkinsCore, dxSkinCaramel,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxLabel, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxClasses, cxGridCustomView, cxGrid, uDB, uGlobal,
  uConfig, ExtCtrls, DB, ADODB, cxContainer, cxGroupBox, cxPCdxBarPopupMenu,
  cxPC, DateUtils, cxDBData, cxGridDBTableView, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxNavigator;

const
  cBohum  = 0;
  cBoho   = 1;

type
  TfrmMonthReport = class(TForm)
    btnClose: TcxButton;
    adoWards: TADOQuery;
    TimerShow: TTimer;
    cxPageControl1: TcxPageControl;
    cxTabBohum: TcxTabSheet;
    cxTabBoho: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    cxGrid5: TcxGrid;
    cxGBohum0: TcxGridBandedTableView;
    cxGridLevel2: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGBohum1: TcxGridBandedTableView;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGBoho1: TcxGridBandedTableView;
    cxGridLevel3: TcxGridLevel;
    cxGroupBox4: TcxGroupBox;
    cxGrid3: TcxGrid;
    cxGBoho0: TcxGridBandedTableView;
    cxGridLevel4: TcxGridLevel;
    adopSum: TADOStoredProc;
    btnCopyBohum1: TcxButton;
    btnCopyBohum0: TcxButton;
    btnCopyBoho1: TcxButton;
    btnCopyBoho0: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure TimerShowTimer(Sender: TObject);
    procedure btnCopyBohum0Click(Sender: TObject);
  private
    { Private declarations }
    FPrevDate: TDateInfo;
    FWeeks: Array of TDateInfo;
    procedure MakeColumn;
    procedure MakeWeeks;
    procedure LoadData(oGrid: TcxGridBandedTableView; nBohumType, nProgramTypeID: integer);
    procedure SetColumnDefault(col: TcxGridBandedColumn;
      sColName: string; nBandIndex: integer);
  public
    { Public declarations }
    CurDate: TDateInfo;
    MinWeek, MaxWeek: integer;
    WeekCount: integer;
  end;

var
  frmMonthReport: TfrmMonthReport;

implementation

{$R *.dfm}

procedure TfrmMonthReport.btnCopyBohum0Click(Sender: TObject);
begin
  if Sender = btnCopyBohum0 then
  begin
    cxGBohum0.CopyToClipboard(True);
    oGlobal.Msg('건강보험 일반집단치료 자료가 복사되었습니다!', 1000);
  end
  else if Sender = btnCopyBohum1 then
  begin
    cxGBohum1.CopyToClipboard(True);
    oGlobal.Msg('건강보험 작업및 오락요법 자료가 복사되었습니다!', 1000);
  end
  else if Sender = btnCopyBoho0 then
  begin
    cxGBoho0.CopyToClipboard(True);
    oGlobal.Msg('보험급여 일반집단치료 자료가 복사되었습니다!', 1000);
  end
  else if Sender = btnCopyBoho1 then
  begin
    cxGBoho1.CopyToClipboard(True);
    oGlobal.Msg('보험급여 작업및 오락요법 자료가 복사되었습니다!', 1000);
  end;
end;

procedure TfrmMonthReport.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmMonthReport.FormShow(Sender: TObject);
begin
  cxPageControl1.ActivePage := cxTabBohum;
  cxGBohum0.ClearItems;
  cxGBohum1.ClearItems;
  cxGBoho0.ClearItems;
  cxGBoho1.ClearItems;
  TimerShow.Enabled := True;
end;

procedure TfrmMonthReport.LoadData(oGrid: TcxGridBandedTableView;
   nBohumType, nProgramTypeID: integer);
var
  nRow, nCol: integer;
  nSum: integer;
  nWardID: integer;
begin
  screen.Cursor := crHourGlass;
  oGrid.BeginUpdate;

  try
    for nRow := 0 to WeekCount - 1 do
    begin
      nCol := 0;

      adoWards.First;
      while not adoWards.Eof do
      begin
        nWardID := adoWards.FieldByName('WardID').AsInteger;
        adopSum.Close;
        adopSum.Parameters.ParamByName('@HospitalID').Value := oConfig.User.HospitalID;
        adopSum.Parameters.ParamByName('@BohumType').Value := nBohumType;
        adopSum.Parameters.ParamByName('@ProgramTypeID').Value := nProgramTypeID;
        adopSum.Parameters.ParamByName('@WardID').Value := nWardID;
        adopSum.Parameters.ParamByName('@StartDate').Value := FWeeks[nRow].SDate;
        adopSum.Parameters.ParamByName('@FinishDate').Value := FWeeks[nRow].FDate;

        if (nBohumType = cBohum) then
        begin
          if (nRow=0) and (FPrevDate.Month <> FWeeks[0].Month) then
          begin
            adopSum.Parameters.ParamByName('@ExecuteType').Value := 3; // 날짜중복회피, MaxNum, PrevDate
            adopSum.Parameters.ParamByName('@PrevStartDate').Value := FPrevDate.SDate;
            adopSum.Parameters.ParamByName('@PrevFinishDate').Value := FPrevDate.FDate;
            adopSum.ExecProc;
            nSum := adopSum.Parameters.ParamByName('@RETURN_VALUE').Value;
          end
          else
          begin
            adopSum.Parameters.ParamByName('@ExecuteType').Value := 2; // 날짜중복회피, MaxNum
            adopSum.ExecProc;
            nSum := adopSum.Parameters.ParamByName('@RETURN_VALUE').Value;
          end;

          oGrid.DataController.SetValue(nRow, nCol+1, nSum);
        end
        else
        begin
          adopSum.Parameters.ParamByName('@ExecuteType').Value := 0; // 합계
          adopSum.ExecProc;
          nSum := adopSum.Parameters.ParamByName('@RETURN_VALUE').Value;

          oGrid.DataController.SetValue(nRow, nCol+1, nSum);
        end;

        adopSum.Parameters.ParamByName('@ExecuteType').Value := 0; // 합계
        adopSum.ExecProc;
        nSum := adopSum.Parameters.ParamByName('@RETURN_VALUE').Value;

        oGrid.DataController.SetValue(nRow, nCol+1+adoWards.RecordCount, nSum);

        nCol := nCol + 1;
        adoWards.Next;
      end;        
    end;
  except

  end;

  oGrid.EndUpdate;
  screen.Cursor := crDefault;
end;

procedure TfrmMonthReport.MakeColumn;
var
  n: integer;
  colName: string;
  col: TcxGridBandedColumn;
begin
  cxGBohum0.BeginUpdate;
  cxGBohum1.BeginUpdate;
  cxGBoho0.BeginUpdate;
  cxGBoho1.BeginUpdate;

  cxGBohum0.DataController.RecordCount := 6;
  cxGBohum1.DataController.RecordCount := 6;
  cxGBoho0.DataController.RecordCount := 6;
  cxGBoho1.DataController.RecordCount := 6;

  col := cxGBohum0.CreateColumn;
  SetColumnDefault(col, '기간', 0);
  col := cxGBohum1.CreateColumn;
  SetColumnDefault(col, '기간', 0);
  col := cxGBoho0.CreateColumn;
  SetColumnDefault(col, '기간', 0);
  col := cxGBoho1.CreateColumn;
  SetColumnDefault(col, '기간', 0);

  adoWards.First;
  while not adoWards.Eof do
  begin
    colName := adoWards.FieldByName('WardName').AsString;

    col := cxGBohum0.CreateColumn;
    SetColumnDefault(col, colName, 1);

    col := cxGBohum1.CreateColumn;
    SetColumnDefault(col, colName, 1);

    col := cxGBoho0.CreateColumn;
    SetColumnDefault(col, colName, 1);

    col := cxGBoho1.CreateColumn;
    SetColumnDefault(col, colName, 1);

    adoWards.Next;
  end;

  adoWards.First;
  while not adoWards.Eof do
  begin
    colName := adoWards.FieldByName('WardName').AsString;

    col := cxGBohum0.CreateColumn;
    SetColumnDefault(col, colName, 2);

    col := cxGBohum1.CreateColumn;
    SetColumnDefault(col, colName, 2);

    col := cxGBoho0.CreateColumn;
    SetColumnDefault(col, colName, 2);

    col := cxGBoho1.CreateColumn;
    SetColumnDefault(col, colName, 2);

    adoWards.Next;
  end;

  for n := 0 to WeekCount - 1 do
  begin
    cxGBohum0.DataController.SetValue(n, 0, FWeeks[n].SDate + ' ~ ' + FWeeks[n].FDate);
    cxGBohum1.DataController.SetValue(n, 0, FWeeks[n].SDate + ' ~ ' + FWeeks[n].FDate);
    cxGBoho0.DataController.SetValue(n, 0, FWeeks[n].SDate + ' ~ ' + FWeeks[n].FDate);
    cxGBoho1.DataController.SetValue(n, 0, FWeeks[n].SDate + ' ~ ' + FWeeks[n].FDate);
  end;
  
  cxGBohum0.EndUpdate;
  cxGBohum1.EndUpdate;
  cxGBoho0.EndUpdate;
  cxGBoho1.EndUpdate;
end;

procedure TfrmMonthReport.MakeWeeks;
var
  n: integer;
begin
  SetLength(FWeeks, 0);
  SetLength(FWeeks, WeekCount);

  FPrevDate.Date := EncodeDateWeek(CurDate.Year, WeekOf(CurDate.FirstDay), 1);
  FPrevDate.StartDate := FPrevDate.Date;
  FPrevDate.FinishDate := EncodeDate(FPrevDate.Year, FPrevDate.Month, FPrevDate.Days);

  for n := 0 to WeekCount - 1 do
  begin
    if n = 0 then
    begin
      FWeeks[n].Date := EncodeDate(CurDate.Year, CurDate.Month, 1);
      FWeeks[n].StartDate := FWeeks[n].Date;
    end
    else
    begin
      if n = WeekCount-1 then
        FWeeks[n].Date := EncodeDate(CurDate.Year, CurDate.Month, CurDate.Days)
      else
        FWeeks[n].Date := EncodeDateWeek(CurDate.Year, MinWeek+n, 1);

      FWeeks[n].StartDate := EncodeDateWeek(FWeeks[n].Year, WeekOf(FWeeks[n].Date), 1);
    end;

    if n=0 then
    begin
      if MinWeek = 0 then      
        FWeeks[n].FinishDate := EncodeDateWeek(CurDate.Year, 1, 1) - 1
      else
        FWeeks[n].FinishDate := EncodeDateWeek(CurDate.Year, MinWeek, 7);
    end
    else if n = WeekCount-1 then
      FWeeks[n].FinishDate := EncodeDate(CurDate.Year, CurDate.Month, CurDate.Days)
    else
      FWeeks[n].FinishDate := EncodeDateWeek(CurDate.Year, MinWeek+n, 7);
  end;
end;

procedure TfrmMonthReport.SetColumnDefault(col: TcxGridBandedColumn;
  sColName: string; nBandIndex: integer);
begin
  col.Caption := sColName;
  col.HeaderAlignmentHorz := taCenter;
  col.Options.Editing := False;
  col.Options.Filtering := False;
  col.Options.Sorting := False;
  col.PropertiesClass := TcxLabelProperties;
  col.Properties.Alignment.Horz := taCenter;
  col.Position.BandIndex := nBandIndex;

  if nBandIndex > 0 then
  begin
    col.DataBinding.ValueType := 'Integer';
    col.FooterAlignmentHorz := taCenter;
    col.Summary.FooterKind := skSum;
    col.Summary.FooterFormat := '0.;';
  end;
end;

procedure TfrmMonthReport.TimerShowTimer(Sender: TObject);
begin
  TimerShow.Enabled := False;

  try
    adoWards.SQL.Text
      := 'SELECT *' +
         '  FROM Wards' +
         '  WHERE HospitalID=' + inttostr(oConfig.User.HospitalID) +
         '    AND Used=1' +
         ' order by seq';
    adoWards.Open;

    MakeWeeks;
    MakeColumn;
    LoadData(cxGBohum0, cBohum, 1);
    LoadData(cxGBohum1, cBohum, 2);
    LoadData(cxGBoho0, cBoho, 1);
    LoadData(cxGBoho1, cBoho, 2);
  except
    oGlobal.Msg('병동정보에 접근할 수 없습니다!');
    Close;
  end;
end;

end.
