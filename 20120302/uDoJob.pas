unit uDoJob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, uGlobal, DB, ADODB, cxControls, cxStyles, dxSkinsCore,
  dxSkinCaramel, dxSkinOffice2007Blue, dxSkinscxPC3Painter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, ExtCtrls, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxGroupBox, cxTextEdit, cxMemo, cxDBEdit, cxCheckListBox,
  CheckLst, cxCheckBox, cxLabel, DBCtrls, cxRichEdit, cxMRUEdit, cxDropDownEdit,
  dxLayoutContainer, cxGridLayoutView, cxGridDBLayoutView,
  cxGridCustomLayoutView, dxSkinBlack, dxSkinBlue, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxMaskEdit;

type
  TfrmDoJob = class(TForm)
    btnClose: TcxButton;
    dsPP: TDataSource;
    adoPP: TADOQuery;
    dsInOut: TDataSource;
    adoInOut: TADOQuery;
    Panel1: TPanel;
    btnRight: TcxButton;
    btnLeft: TcxButton;
    cxGroupBox4: TcxGroupBox;
    ListBoxInPatient: TcxCheckListBox;
    pnlRight: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxGrid: TcxGrid;
    cxGList: TcxGridDBTableView;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    Timer1: TTimer;
    cxGListInDate: TcxGridDBColumn;
    cxGListPatientName: TcxGridDBColumn;
    cxGListSex: TcxGridDBColumn;
    cxGListBirthday: TcxGridDBColumn;
    ListBoxInOutID: TListBox;
    cxGListSelect: TcxGridDBColumn;
    cxGListOutDate: TcxGridDBColumn;
    cxGListInState: TcxGridDBColumn;
    cxGListAge: TcxGridDBColumn;
    chkSelectAllInPatient: TcxCheckBox;
    chkSelectAllList: TcxCheckBox;
    btnShortKey: TcxButton;
    dbMemoResult: TDBMemo;
    Panel2: TPanel;
    cxButton1: TcxButton;
    Panel3: TPanel;
    cxGroupBox3: TcxGroupBox;
    cxCheckBox1: TcxCheckBox;
    cxGroupBox5: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGPatient: TcxGridTableView;
    cxGPatientSelect: TcxGridColumn;
    cxGPatientID: TcxGridColumn;
    cxGPatientName: TcxGridColumn;
    cxGPatientSex: TcxGridColumn;
    cxGPatientBirthday: TcxGridColumn;
    cxGPatientAge: TcxGridColumn;
    cxGPatientWard: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    Label3: TLabel;
    btnSearch: TcxButton;
    cboSearchCondition: TcxComboBox;
    txtSearch: TcxTextEdit;
    cboInOut: TcxComboBox;
    cboBohum: TcxComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cxGPatientState: TcxGridColumn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxGListAgeGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: string);
    procedure chkSelectAllInPatientClick(Sender: TObject);
    procedure chkSelectAllListClick(Sender: TObject);
    procedure btnRightClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLeftClick(Sender: TObject);
    procedure btnShortKeyClick(Sender: TObject);
    procedure dbMemoResultKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure adoPPBeforePost(DataSet: TDataSet);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadInPatient;
    procedure SetInPatientList;
    function MakeNameSexAge(sName, sSex, sBirthday, sInDate: string): string;
    function GetSelectedCountInListBoxInPatient: integer;
    function GetSelectedCountInPP: integer;
  public
    { Public declarations }
    FScheduleID: integer;
    FWardID: integer;
  end;

var
  frmDoJob: TfrmDoJob;

implementation
uses uConfig, uDB, uShortKeyMgr, uQuery, uDoJobAll;
{$R *.dfm}

procedure TfrmDoJob.adoPPBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('Result').AsString := trim(DataSet.FieldByName('Result').AsString);
end;

procedure TfrmDoJob.btnLeftClick(Sender: TObject);
var
  oT: TAdoQuery;
begin
  if adoPP.IsEmpty then Exit;

  if GetSelectedCountInPP < 1 then
  begin
    oGlobal.Msg('선택된 환자가 없습니다!');
    Exit;
  end;

  if oGlobal.YesNo('선택된 환자의 프로그램 참여 내용을 삭제하시겠습니까?') <> mrYes then
    Exit;


  oT := TAdoQuery.Create(self);
  oT.Connection := adoPP.Connection;

  screen.Cursor := crHourGlass;
  adoPP.DisableControls;
  try
    if adoPP.State in [dsInsert, dsEdit] then
      adoPP.Post;

    oT.Connection.BeginTrans;

    oT.SQL.Text := 'DELETE FROM PROGRAMPATIENTS WHERE SELECTED=1';
    oT.ExecSQL;

    oT.Connection.CommitTrans;

    adoPP.Close;
    adoPP.Open;
  except
    oT.Connection.RollbackTrans;
    screen.Cursor := crDefault;
    oGlobal.Msg('문제가 발생하여 삭제하지 못하였습니다!');
  end;
  adoPP.EnableControls;
  screen.Cursor := crDefault;

  SetInPatientList;

  oT.Free;
end;

procedure TfrmDoJob.btnRightClick(Sender: TObject);
var
  n: integer;
  nInOutID: integer;
begin
  if GetSelectedCountInListBoxInPatient < 1  then
  begin
    oGlobal.Msg('선택된 환자가 없습니다!');
    Exit;
  end;

  nInOutID := -1;

  screen.Cursor := crHourGlass;

  adoPP.DisableControls;
  try
    adoPP.Connection.BeginTrans;

    for n := 0 to ListBoxInPatient.Count - 1 do
    begin
      if ListBoxInPatient.Items[n].Checked then
      begin
        ListBoxInPatient.Items[n].Checked := False;
        ListBoxInPatient.Items[n].Enabled := False;
        nInOutID := strtoint(ListBoxInOutID.Items[n]);

        adoPP.Append;
        adoPP.FieldByName('ScheduleID').AsInteger := FScheduleID;
        adoPP.FieldByName('InOutID').AsInteger := nInOutID;
        adoPP.Post;
      end;
    end;

    adoPP.Connection.CommitTrans;

    adoPP.Close;
    adoPP.Open;
    adoPP.Locate('InOutID', nInOutID, [loCaseInsensitive]);
  except
    adoPP.Connection.RollbackTrans;
    screen.Cursor := crDefault;
    oGlobal.Msg('문제가 발생하여 이동할 수 없습니다!');
  end;
  adoPP.EnableControls;
  screen.Cursor := crDefault;
end;

procedure TfrmDoJob.btnShortKeyClick(Sender: TObject);
begin
  frmShortKeyMgr.ShowModal;
end;

procedure TfrmDoJob.chkSelectAllInPatientClick(Sender: TObject);
var
  n: integer;
begin
  for n := 0 to ListBoxInPatient.Count - 1 do
    if ListBoxInPatient.Items[n].Enabled then
      ListBoxInPatient.Items[n].Checked := chkSelectAllInPatient.Checked;
end;

procedure TfrmDoJob.chkSelectAllListClick(Sender: TObject);
begin
  if adoPP.IsEmpty then Exit;

  screen.Cursor := crHourGlass;
  adoPP.DisableControls;
  try
    adoPP.Connection.BeginTrans;

    adoPP.First;
    while not adoPP.Eof do
    begin
      if adoPP.FieldByName('Selected').AsBoolean <> chkSelectAllList.Checked then
      begin
        adoPP.Edit;
        adoPP.FieldByName('Selected').AsBoolean := chkSelectAllList.Checked;
        adoPP.Post;
      end;
      adoPP.Next;
    end;

    adoPP.Connection.CommitTrans;
  except
    adoPP.Connection.RollbackTrans;
    screen.Cursor := crDefault;
  end;
  adoPP.EnableControls;
  screen.Cursor := crDefault;
end;

procedure TfrmDoJob.cxButton1Click(Sender: TObject);
var
  oDoJobAll: TfrmDoJobAll;
begin
  if adoPP.IsEmpty then
  begin
    oGlobal.Msg('참여환자가 없습니다!');
    Exit;
  end;

  Application.CreateForm(TfrmDoJobAll, oDoJobAll);
  oDoJobAll.ShowModal;
  oDoJobAll.Free;
end;

procedure TfrmDoJob.cxGListAgeGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: string);
begin
  if VarIsNull(cxGList.DataController.Values[ARecordIndex, cxGListBirthday.Index]) or
     VarIsNull(cxGList.DataController.Values[ARecordIndex, cxGListInDate.Index]) then
    Exit;

  AText := oGlobal.GetAge(cxGList.DataController.Values[ARecordIndex, cxGListBirthday.Index],
                          cxGList.DataController.Values[ARecordIndex, cxGListInDate.Index]);
end;

procedure TfrmDoJob.dbMemoResultKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Sender is TDBMemo) and (Key = VK_RETURN) then
    dbMain.SetCurrentKeyword(TMemo(Sender));
end;

procedure TfrmDoJob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if adoPP.State in [dsInsert, dsEdit] then
    adoPP.Post;

  adoPP.DisableControls;

  try
    adoPP.Connection.BeginTrans;
    adoPP.First;
    while not adoPP.Eof do
    begin
      if adoPP.FieldByName('Selected').AsBoolean then
      begin
        adoPP.Edit;
        adoPP.FieldByName('Selected').AsBoolean := False;
        adoPP.Post;
      end;
      adoPP.Next;
    end;
    adoPP.Connection.CommitTrans;
  except
    adoPP.Connection.RollbackTrans;
  end;

  adoPP.EnableControls;

  adoInPatient.Close;
  adoPP.Close;
end;

procedure TfrmDoJob.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmDoJob.FormShow(Sender: TObject);
begin
  ListBoxInPatient.Items.Clear;
  ListBoxInOutID.Items.Clear;
  chkSelectAllInPatient.Checked := False;
  chkSelectAllList.Checked := False;

  dbMain.GetBohumList(cboBohum.Properties.Items, True);
  if cboBohum.Properties.Items.Count > 0 then
    cboBohum.ItemIndex := 0;

  try
    adoPP.SQL.Text := QueryProgramPatients(FScheduleID);
    adoPP.Open;
  except
    oGlobal.Msg('프로그램 결과를 읽어올 수 없습니다!');
    Timer1.Enabled := True;
    Exit;
  end;

  try
    LoadInPatient;
  except
    oGlobal.Msg('입원환자 정보를 읽어올 수 없습니다!');
    Timer1.Enabled := True;
    Exit;
  end;

  SetInPatientList;
end;

function TfrmDoJob.GetSelectedCountInListBoxInPatient: integer;
var
  n: integer;
begin
  result := 0;
  for n := 0 to ListBoxInPatient.Count - 1 do
    if ListBoxInPatient.Items[n].Checked then
      inc(Result);
end;

function TfrmDoJob.GetSelectedCountInPP: integer;
var
  n: integer;
begin
  result := 0;
  for n := 0 to cxGList.DataController.RecordCount - 1 do
    if cxGList.DataController.Values[n, cxGListSelect.Index] then
      inc(Result);
end;

procedure TfrmDoJob.LoadInPatient;
begin
  adoInPatient.SQL.Text := 'SELECT *' +
                           '  FROM InOut inner join Patients on InOut.HospitalID=Patients.HospitalID and InOut.PatientID=Patients.PatientID' +
                           ' WHERE InOut.WardID = ' + inttostr(FWardID) +
                           '   AND State = ' + inttostr(cIn) +
                           ' ORDER BY PatientName';
  adoInPatient.Open;
end;

function TfrmDoJob.MakeNameSexAge(sName, sSex, sBirthday,
  sInDate: string): string;
begin
  result := sName + ' (' + sSex + '/' + oGlobal.GetAge(sBirthday, sInDate) + ')';
end;

procedure TfrmDoJob.SetInPatientList;
  function FindListInPP(sList: string): Boolean;
  var
    nRow: integer;
    sText: string;
  begin
    for nRow := 0 to cxGList.DataController.RecordCount - 1 do
    begin
      sText := MakeNameSexAge(cxGList.DataController.Values[nRow, cxGListPatientName.Index],
                              cxGList.DataController.Values[nRow, cxGListSex.Index],
                              cxGList.DataController.Values[nRow, cxGListBirthday.Index],
                              cxGList.DataController.Values[nRow, cxGListInDate.Index]);
      if sText = sList then
      begin
        result := true;
        Exit;
      end;
    end;
    result := false;
  end;
var
  sItem: string;
begin
  screen.Cursor := crHourGlass;

  ListBoxInPatient.Items.Clear;
  ListBoxInOutID.Items.Clear;

  adoInPatient.First;
  while not adoInPatient.Eof do
  begin
    sItem := MakeNameSexAge(adoInPatient.FieldbyName('PatientName').AsString,
                            adoInPatient.FieldbyName('Sex').AsString,
                            adoInPatient.FieldbyName('Birthday').AsString,
                            adoInPatient.FieldbyName('InDate').AsString);

    ListBoxInPatient.Items.Add;
    ListBoxInPatient.Items[ListBoxInPatient.Items.Count-1].Checked := False;
    ListBoxInPatient.Items[ListBoxInPatient.Items.Count-1].Text := sItem;

    ListBoxInPatient.Items[ListBoxInPatient.Items.Count-1].Enabled := not FindListInPP(sItem);

    ListBoxInOutID.Items.Add(adoInPatient.FieldByName('InOutID').AsString);

    adoInPatient.Next;
  end;

  screen.Cursor := crDefault;
end;

procedure TfrmDoJob.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  Close;
end;

end.
