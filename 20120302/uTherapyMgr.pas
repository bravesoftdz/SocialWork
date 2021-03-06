unit uTherapyMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinCaramel, dxSkinscxScheduler3Painter, Menus, cxStyles,
  cxEdit, cxScheduler, cxSchedulerStorage, cxSchedulerCustomControls,
  cxSchedulerCustomResourceView, cxSchedulerDayView, cxSchedulerDateNavigator,
  cxSchedulerHolidays, cxSchedulerTimeGridView, cxSchedulerUtils,
  cxSchedulerWeekView, cxSchedulerYearView, cxSchedulerGanttView,
  dxSkinOffice2007Blue, dxSkinscxPC3Painter, cxPCdxBarPopupMenu, cxPC, ExtCtrls,
  cxContainer, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, StdCtrls,
  cxButtons, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxGridBandedTableView, cxGridDBBandedTableView, DateUtils,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, uGlobal, ADODB, cxSchedulerDBStorage, cxGroupBox,
  cxCalendar, cxRadioGroup, cxDateNavigator, dxSkinBlack, dxSkinBlue,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxSpinEdit;

type
  TfrmTherapyMgr = class(TForm)
    cxPage: TcxPageControl;
    cxTabViewTable: TcxTabSheet;
    cxTabViewSchedule: TcxTabSheet;
    cxScheduler: TcxScheduler;
    cxGrid1: TcxGrid;
    cxGInOut: TcxGridDBTableView;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dsScheduler: TDataSource;
    cxSchedulerDBStorage1: TcxSchedulerDBStorage;
    cxGroupViewType: TcxGroupBox;
    rSelectDateDay: TcxRadioButton;
    rSelectDateWeek: TcxRadioButton;
    rSelectDateMonth: TcxRadioButton;
    rSelectDateWeekTime: TcxRadioButton;
    cxGroupBox2: TcxGroupBox;
    cboWard: TcxComboBox;
    cxLabel1: TcxLabel;
    cboProgram: TcxComboBox;
    cxLabel2: TcxLabel;
    cboChairman: TcxComboBox;
    cxLabel3: TcxLabel;
    txtContent: TcxTextEdit;
    cxLabel4: TcxLabel;
    btnSearch: TcxButton;
    lblBasicYear: TcxLabel;
    adoSchedule: TADOQuery;
    btnScheduleAppend: TcxButton;
    btnScheduleUpdate: TcxButton;
    Timer1: TTimer;
    cxGInOutContent: TcxGridDBColumn;
    cxGInOutSDate: TcxGridDBColumn;
    cxGInOutSTime: TcxGridDBColumn;
    cxGInOutFTime: TcxGridDBColumn;
    cxGInOutChairmanIDs: TcxGridDBColumn;
    cxGInOutProgramName: TcxGridDBColumn;
    cxGInOutWorkerName: TcxGridDBColumn;
    cxGInOutDoctorName: TcxGridDBColumn;
    btnRatingMgr: TcxButton;
    Timer2: TTimer;
    cxSpinBasicYear: TcxSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure cxSchedulerBeforeEditing(Sender: TcxCustomScheduler;
      AEvent: TcxSchedulerControlEvent; AInplace: Boolean; var Allow: Boolean);
    procedure btnScheduleAppendClick(Sender: TObject);
    procedure btnScheduleUpdateClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGInOutCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnRatingMgrClick(Sender: TObject);
    procedure cboWardPropertiesChange(Sender: TObject);
    procedure cboChairmanPropertiesChange(Sender: TObject);
    procedure cboProgramPropertiesChange(Sender: TObject);
    procedure cxspinBasicYearPropertiesChange(Sender: TObject);
    procedure cxSchedulerDateNavigatorSelectionChanged
      (Sender: TObject; const AStart, AFinish: TDateTime);
    procedure FormCreate(Sender: TObject);
    procedure rSelectDateDayClick(Sender: TObject);
  private
    { Private declarations }
    FDateChanging: Boolean;

    function GetBasicYear: string;
    procedure SetBasicYear(sYear: string);
    function GetWardID: integer;
    function GetChairmanID: string;
    function GetProgramID: integer;
    function GetContent: string;
    procedure ChangeDate;
  public
    { Public declarations }
    property BasicYear: string read GetBasicYear write SetBasicYear;
    property WardID: integer read GetWardID;
    property ChairmanID: string read GetChairmanID;
    property ProgramID: integer read GetProgramID;
    property Content: string read GetContent;

  end;

var
  frmTherapyMgr: TfrmTherapyMgr;

implementation

uses uDB, uConfig, uSetting, uTherapyEdit, uRatingMgr, uQuery;
{$R *.dfm}

procedure TfrmTherapyMgr.btnScheduleAppendClick(Sender: TObject);
var
  oTherapyEdit: TfrmTherapyEdit;
  oInitDate: TDateTime;
begin
  if not adoSchedule.Active then
  begin
    oGlobal.Msg('스케쥴 정보가 열리지 않았습니다!');
    Exit;
  end;

  Application.CreateForm(TfrmTherapyEdit, oTherapyEdit);
  oTherapyEdit.Parent := frmTherapyMgr;

  oGlobal.StringToDate(oGlobal.DateToString(now), oInitDate);

  if cxPage.ActivePage = cxTabViewSchedule then
  begin
    if Sender = btnScheduleAppend then
    begin
      oTherapyEdit.FNotFixed := True;
      oTherapyEdit.FSelStart := oInitDate;
      oTherapyEdit.FSelFinish := oInitDate;
    end
    else
    begin
      oTherapyEdit.FNotFixed := False;
      oTherapyEdit.FSelStart := cxScheduler.SelStart;
      oTherapyEdit.FSelFinish := cxScheduler.SelFinish;
    end;
  end
  else
  begin
    oTherapyEdit.FNotFixed := True;
    oTherapyEdit.FSelStart := oInitDate;
    oTherapyEdit.FSelFinish := oInitDate;
  end;

  oTherapyEdit.adoSchedule := adoSchedule;
  oTherapyEdit.FEditMode := emAppend;
  oTherapyEdit.FWardID := WardID;
  oTherapyEdit.FProgramName := cboProgram.Text;
  oTherapyEdit.ShowModal;

  oTherapyEdit.Free;
end;

procedure TfrmTherapyMgr.btnSearchClick(Sender: TObject);
begin
  screen.Cursor := crHourGlass;
  try
    adoSchedule.SQL.Text := QuerySchedule(BasicYear, Content, ChairmanID,
      oConfig.User.HospitalID, WardID, ProgramID);

    adoSchedule.Open;
  except
    Timer1.Enabled := True;
  end;
  screen.Cursor := crDefault;
end;

procedure TfrmTherapyMgr.btnScheduleUpdateClick(Sender: TObject);
var
  nID: integer;
  oTherapyEdit: TfrmTherapyEdit;
begin
  if adoSchedule.IsEmpty then
  begin
    oGlobal.Msg('수정할 스케쥴이 없습니다!');
    Exit;
  end;

  if cxPage.ActivePage = cxTabViewSchedule then
  begin
    if cxScheduler.SelectedEventCount < 1 then
    begin
      oGlobal.Msg('선택된 스케쥴이 없습니다!');
      Exit;
    end
    else
    begin
      nID := cxScheduler.SelectedEvents[0].ID;
      adoSchedule.Locate('ScheduleID', nID, [loCaseInSensitive]);

      if nID <> adoSchedule.FieldByName('ScheduleID').AsInteger then
      begin
        oGlobal.Msg('문제가 발생하여 수정할 수 없습니다!');
        Exit;
      end;
    end;
  end;

  Application.CreateForm(TfrmTherapyEdit, oTherapyEdit);
  oTherapyEdit.Parent := frmTherapyMgr;

  oTherapyEdit.adoSchedule := adoSchedule;
  oTherapyEdit.FEditMode := emUpdate;
  oTherapyEdit.FWardID := adoSchedule.FieldByName('WardID').AsInteger;
  oTherapyEdit.FProgramName := adoSchedule.FieldByName('ProgramName').AsString;
  oTherapyEdit.FNotFixed := adoSchedule.FieldByName('Options')
    .AsInteger = cAllDayEvent;
  oTherapyEdit.FSelStart := adoSchedule.FieldByName('StartTime').AsDateTime;
  oTherapyEdit.FSelFinish := adoSchedule.FieldByName('FinishTime').AsDateTime;
  oTherapyEdit.ShowModal;

  oTherapyEdit.Free;
end;

procedure TfrmTherapyMgr.btnRatingMgrClick(Sender: TObject);
var
  oRatingMgr: TfrmRatingMgr;
begin
  if not adoSchedule.Active then
  begin
    oGlobal.Msg('스케쥴 정보가 열리지 않았습니다!');
    Exit;
  end;

  Application.CreateForm(TfrmRatingMgr, oRatingMgr);
  oRatingMgr.Parent := frmTherapyMgr;

  oRatingMgr.FYear := BasicYear;
  oRatingMgr.oWard.Name := cboWard.Text;
  oRatingMgr.oWard.ID := WardID;
  oRatingMgr.ShowModal;
end;

procedure TfrmTherapyMgr.cboChairmanPropertiesChange(Sender: TObject);
begin
  if not FDateChanging then
    btnSearch.Click;
end;

procedure TfrmTherapyMgr.cboProgramPropertiesChange(Sender: TObject);
begin
  if not FDateChanging then
    btnSearch.Click;
end;

procedure TfrmTherapyMgr.cboWardPropertiesChange(Sender: TObject);
begin
  if not FDateChanging then
  begin
    FDateChanging := True;
    dbMain.GetProgramList(oConfig.User.HospitalID, WardID,
    cboProgram.Properties.Items, False);
    btnSearch.Click;
    FDateChanging := False;
  end;
end;

procedure TfrmTherapyMgr.ChangeDate;
var
  oDate, BeginDate, EndDate: TDateTime;
begin
  FDateChanging := True;

  oDate := cxScheduler.DateNavigator.Date;

  if rSelectDateDay.Checked then
  begin
    cxScheduler.ViewTimeGrid.Active := True;
    cxScheduler.ViewDay.Active := True;
  end
  else if rSelectDateWeek.Checked then
  begin
    cxScheduler.ViewWeek.Active := True;

    BeginDate := StartOfTheWeek(oDate);
    EndDate := EndofTheWeek(oDate);

    cxScheduler.SelectDays(BeginDate, EndDate);
  end
  else if rSelectDateWeekTime.Checked then
  begin
    BeginDate := StartOfTheWeek(oDate);
    EndDate := EndofTheWeek(oDate);

    cxScheduler.SelectDays(BeginDate, EndDate);

    cxScheduler.ViewDay.Active := True;
  end
  else
  begin
    cxScheduler.ViewWeeks.Active := True;

    BeginDate := StartOfTheMonth(oDate);
    EndDate := EndofTheMonth(oDate);

    cxScheduler.SelectDays(BeginDate, EndDate);
  end;

  FDateChanging := False;
end;

procedure TfrmTherapyMgr.cxGInOutCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if adoSchedule.IsEmpty then
    btnScheduleAppend.Click
  else
    btnScheduleUpdate.Click;
end;

procedure TfrmTherapyMgr.cxSchedulerBeforeEditing(Sender: TcxCustomScheduler;
  AEvent: TcxSchedulerControlEvent; AInplace: Boolean; var Allow: Boolean);
begin
  if VarisNull(AEvent.ID) then
    btnScheduleAppend.OnClick(Sender)
  else
    btnScheduleUpdate.OnClick(Sender);

  Allow := False;
end;

procedure TfrmTherapyMgr.cxSchedulerDateNavigatorSelectionChanged
  (Sender: TObject; const AStart, AFinish: TDateTime);
begin
  if FDateChanging then
    Exit;

  if rSelectDateMonth.Checked then
  begin
    FDateChanging := True;
    cxScheduler.DateNavigator.Date := AFinish;
    FDateChanging := False;
  end;

  ChangeDate;
end;

procedure TfrmTherapyMgr.cxspinBasicYearPropertiesChange(Sender: TObject);
begin
  if not FDateChanging then
    btnSearch.Click;
end;

procedure TfrmTherapyMgr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoSchedule.Close;
end;

procedure TfrmTherapyMgr.FormCreate(Sender: TObject);
begin
  FDateChanging := True;
end;

procedure TfrmTherapyMgr.FormShow(Sender: TObject);
begin
  if not dbMain.GetWardList(oConfig.User.HospitalID, cboWard.Properties.Items,
    False) then
  begin
    showmessage('get ward list');
    Timer1.Enabled := True;
    Exit;
  end;
  cboWard.ItemIndex := 0;

  cxSpinBasicYear.Value := YearOf(now);

  ChangeDate;

  dbMain.GetUserList(oConfig.User.HospitalID, cboChairman.Properties.Items,
    False);
  dbMain.GetProgramList(oConfig.User.HospitalID, WardID,
    cboProgram.Properties.Items, False);

  btnSearch.Click;
end;

function TfrmTherapyMgr.GetBasicYear: string;
begin
  result := oGlobal.FillZero(cxSpinBasicYear.Value, 4); // copy(oGlobal.DateToString(cxDateBasic.date),1,4);// cboBasicYear.Text;
end;

function TfrmTherapyMgr.GetChairmanID: string;
begin
  result := dbMain.GetUserID(oConfig.User.HospitalID, cboChairman.Text);
end;

function TfrmTherapyMgr.GetContent: string;
begin
  result := trim(txtContent.Text);
end;

function TfrmTherapyMgr.GetProgramID: integer;
begin
  result := dbMain.GetProgramID(oConfig.User.HospitalID, cboProgram.Text);
end;

function TfrmTherapyMgr.GetWardID: integer;
begin
  result := dbMain.GetWardID(oConfig.User.HospitalID, cboWard.Text);
end;

procedure TfrmTherapyMgr.rSelectDateDayClick(Sender: TObject);
begin
  ChangeDate;
end;

procedure TfrmTherapyMgr.SetBasicYear(sYear: string);
begin
  cxSpinBasicYear.Value := strtoint(sYear);
end;

procedure TfrmTherapyMgr.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  oGlobal.Msg('정보 검색 오류가 발생했습니다!');
  // Close;
end;

end.
