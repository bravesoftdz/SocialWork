unit uInOutFix;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, uGlobal, uConfig, uDB, cxControls, cxContainer, cxEdit,
  dxSkinsCore, dxSkinCaramel, cxStyles, dxSkinscxPC3Painter, cxCustomData,
  cxFilter, cxData, cxDataStorage, DB, cxDBData, cxLabel, cxCalendar,
  cxDBLookupComboBox, cxGridBandedTableView, cxGridLevel,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox, ADODB,
  ExtCtrls, dxGDIPlusClasses, dxSkinBlack, dxSkinBlue, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue;

type
  TfrmInOutFix = class(TForm)
    adoInOut: TADOQuery;
    dsInOut: TDataSource;
    adoWardHistory: TADOQuery;
    dsWardHistory: TDataSource;
    cxGroupBox1: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGInOut: TcxGridDBTableView;
    cxGInOutInDate: TcxGridDBColumn;
    cxGInOutOutDate: TcxGridDBColumn;
    cxGInOutBohumName: TcxGridDBColumn;
    cxGInOutWorkerName: TcxGridDBColumn;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGWardHistory: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBBandedTableView2: TcxGridDBBandedTableView;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    adoWard: TADOQuery;
    dsWard: TDataSource;
    TimerShow: TTimer;
    cxGroupBox2: TcxGroupBox;
    cxGrid5: TcxGrid;
    cxGridDBTableView7: TcxGridDBTableView;
    cxGridDBBandedTableView5: TcxGridDBBandedTableView;
    cxGridDBTableView8: TcxGridDBTableView;
    cxGUpdate: TcxGridBandedTableView;
    cxGUpdateOldDate: TcxGridBandedColumn;
    cxGUpdateOldWard: TcxGridBandedColumn;
    cxGUpdateNewDate: TcxGridBandedColumn;
    cxGUpdateNewWard: TcxGridBandedColumn;
    cxGridLevel5: TcxGridLevel;
    btnSave: TcxButton;
    cxButton1: TcxButton;
    Panel4: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure TimerShowTimer(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    function GetHospitalID: integer;
    function isValidInput: Boolean;
    { Private declarations }
  public
    { Public declarations }
    NewInOutID: integer;
    oOldWardHistory: TADOQuery;
    property HospitalID: integer read GetHospitalID;
  end;

var
  frmInOutFix: TfrmInOutFix;

implementation

{$R *.dfm}

procedure TfrmInOutFix.btnSaveClick(Sender: TObject);
var
  nNewInOutID: integer;
  nNewWardID: integer;
  sNewWardDate: string;

  nOldInOutID: integer;
  sOldWardDate: string;

  oT: TADOQuery;
  nRow: integer;
begin
  if not isValidInput then
    Exit;

  if oGlobal.YesNo('���յǸ� ���η�, ��ȸ��������, ����ġ�����α׷� ��' + #13 +
     '���������� ���� ����˴ϴ�!' + #13 +
     '�����Ͻðڽ��ϱ�?') <> mrYes then
    Exit;

  nNewInOutID := adoInOut.FieldByName('InOutID').AsInteger;
  nOldInOutID := oOldWardHistory.FieldByName('InOutID').AsInteger;

  oT := TADOQuery.Create(self);
  oT.Connection := adoWardHistory.Connection;

  try
    adoWardHistory.Connection.BeginTrans;

    for nRow := 0 to cxGUpdate.DataController.RecordCount - 1 do
    begin
      sOldWardDate := cxGUpdate.DataController.GetValue(nRow, cxGUpdateOldDate.index);

      nNewWardID := cxGUpdate.DataController.GetValue(nRow, cxGUpdateNewWard.index);
      sNewWardDate := cxGUpdate.DataController.GetValue(nRow, cxGUpdateNewDate.index);

      if not dbMain.isExistWardHistory(nNewInOutID, sNewWardDate) then
      begin
        adoWardHistory.Append;
        adoWardHistory.FieldByName('InOutID').AsInteger := nNewInOutID;
        adoWardHistory.FieldByName('WardDate').AsString := sNewWardDate;
        adoWardHistory.FieldByName('WardID').AsInteger := nNewWardID;
        adoWardHistory.Post;
      end;

      oT.SQL.Text := 'UPDATE Intake'+
                     '   SET InOutID=' + inttostr(nNewInOutID) +
                     ' WHERE InOutID=' + inttostr(nOldInOutID);
      oT.ExecSQL;

      oT.SQL.Text := 'UPDATE Survey1'+
                     '   SET InOutID=' + inttostr(nNewInOutID) +
                     ' WHERE InOutID=' + inttostr(nOldInOutID);
      oT.ExecSQL;

      oT.SQL.Text := 'UPDATE Survey2'+
                     '   SET InOutID=' + inttostr(nNewInOutID) +
                     ' WHERE InOutID=' + inttostr(nOldInOutID);
      oT.ExecSQL;

      oT.SQL.Text := 'UPDATE Counseling'+
                     '   SET InOutID=' + inttostr(nNewInOutID) +
                     ' WHERE InOutID=' + inttostr(nOldInOutID);
      oT.ExecSQL;

      oT.SQL.Text := 'UPDATE Training'+
                     '   SET InOutID=' + inttostr(nNewInOutID) +
                     ' WHERE InOutID=' + inttostr(nOldInOutID);
      oT.ExecSQL;

      oT.SQL.Text := 'UPDATE Visit'+
                     '   SET InOutID=' + inttostr(nNewInOutID) +
                     ' WHERE InOutID=' + inttostr(nOldInOutID);
      oT.ExecSQL;

      oT.SQL.Text := 'UPDATE ProgramPatients'+
                     '   SET InOutID=' + inttostr(nNewInOutID) +
                     '       ,WardDate=''' + sNewWardDate + '''' +
                     '       ,WardID=' + inttostr(nNewWardID) +
                     ' WHERE InOutID=' + inttostr(nOldInOutID) +
                     '   AND WardDate=''' + sOldWardDate + '''';
      oT.ExecSQL;

      dbMain.RemakeCounselingOrder(nNewInOutID);
      dbMain.RemakeTrainingOrder(nNewInOutID);
      dbMain.RemakeVisitOrder(nNewInOutID);

      oT.SQL.Text := 'DELETE InOut WHERE InOutID=' + inttostr(nOldInOutID);
      oT.ExecSQL;

      oT.SQL.Text := 'DELETE WardHistory WHERE INoutID=' + inttostr(nOldInOutID);
      oT.ExecSQL;
    end;
    adoWardHistory.Connection.CommitTrans;

    ModalResult := mrOK;
  except
    adoWardHistory.Connection.RollbackTrans;
    oGlobal.Msg('�������� ���߽��ϴ�!');
  end;
end;

procedure TfrmInOutFix.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmInOutFix.FormShow(Sender: TObject);
begin
  TimerShow.Enabled := True;
end;

function TfrmInOutFix.GetHospitalID: integer;
begin
  result := oConfig.User.HospitalID;
end;

function TfrmInOutFix.isValidInput: Boolean;
var
  nRow, n: integer;
  sWardID: string;
  sWardDate: string;
  sInDate, sOutDate: string;

begin
  result := False;

  sInDate := adoInOut.FieldByName('InDate').AsString;
  sOutDate := adoInOut.FieldByName('OutDate').AsString;

  if oGlobal.isNullStr(sOutDate) then
    sOutDate := '9999-99-99';

  for nRow := 0 to cxGUpdate.DataController.RecordCount - 1 do
  begin
    if VarIsNull(cxGUpdate.DataController.GetValue(nRow, cxGUpdateNewWard.index)) then
      sWardID := ''
    else
      sWardID := cxGUpdate.DataController.GetValue(nRow, cxGUpdateNewWard.index);

    if VarIsNull(cxGUpdate.DataController.GetValue(nRow, cxGUpdateNewDate.Index)) then
      sWardDate := ''
    else
      sWardDate := cxGUpdate.DataController.GetValue(nRow, cxGUpdateNewDate.Index);

    if oGlobal.isNullStr(sWardID) then
    begin
      oGlobal.Msg('[ ���������� ]�� �Է��� �ֽʽÿ�!' );
      Exit;
    end;

    if  oGlobal.isNullStr(sWardDate) then
    begin
      oGlobal.Msg('[ ���溴�� ]�� �Է��� �ֽʽÿ�!' );
      Exit;
    end;

    for n := 0 to cxGUpdate.DataController.RecordCount - 1 do
    begin
      if (n <> nRow) and
        (sWardDate = cxGUpdate.DataController.GetValue(n, cxGUpdateNewDate.Index)) then
      begin
        oGlobal.Msg('[ ' + sWardDate + ' ] ������������ �ߺ��Ǿ� �ֽ��ϴ�!');
        Exit;
      end;
    end;

    if sWardDate < sInDate then
    begin
      oGlobal.Msg('[ ' + sWardDate + ' ] ������������ �Կ��� ���� ��¥�Դϴ�!');
      Exit;
    end;

    if sWardDate > sOutDate then
    begin
      oGlobal.Msg('[ ' + sWardDate + ' ] ������������ ����� ����  ��¥�Դϴ�!');
      Exit;
    end;

    if dbMain.isExistWardHistory(NewInOutID, sWardDate) and
      (not dbMain.isExistWardHistory(NewInOutID, sWardDate, sWardID)) then
    begin
      oGlobal.Msg('[' + sWardDate + ' ] �� [ ���溴�� ]�� ���õ� �Կ������� ������ �ٸ��ϴ�!');
      Exit;
    end;
  end;

  result := True;
end;

procedure TfrmInOutFix.TimerShowTimer(Sender: TObject);
var
  nRow: integer;
  sWardDate, sWardName: string;
  nWardID: integer;
begin
  TimerShow.Enabled := False;

  adoWard.SQL.Text := 'SELECT *' +
                      '  FROM Wards' +
                      ' WHERE HospitalID=' + inttostr(HospitalID) +
                      ' ORDER BY SEQ';
  try
    adoWard.Open;
  except
    oGlobal.Msg('���� ������ ������ �� �����ϴ�!');
    ModalResult := mrClose;
    Exit;
  end;

  try
    adoInOut.SQL.Text := 'SELECT * FROM vInOut WHERE InOutID=' + inttostr(NewInOutID);
    adoInOut.Open;
  except
    oGlobal.Msg('�Կ������� ������ �� �����ϴ�!');
    ModalResult := mrClose;
    Exit;
  end;

  try
    adoWardHistory.SQL.Text := 'SELECT *' +
                               '       ,(select WardName from wards where WardID=WardHistory.WardID) as WardName' +
                               '  FROM WardHistory' +
                               ' WHERE InOutID=' + inttostr(NewInOutID);
    adoWardHistory.Open;
  except
    oGlobal.Msg('���������� ������ �� �����ϴ�!');
    ModalResult := mrClose;
    Exit;
  end;

  cxGUpdate.DataController.RecordCount := oOldWardHistory.RecordCount;

  nRow := 0;
  oOldWardHistory.First;
  while not oOldWardHistory.Eof do
  begin
    sWardDate := oOldWardHistory.FieldByName('WardDate').AsString;
    nWardID := oOldWardHistory.FieldByName('WardID').AsInteger;
    sWardName := oOldWardHistory.FieldByName('WardName').AsString;


    cxGUpdate.DataController.SetValue(nRow, cxGUpdateOldDate.Index, sWardDate);
    cxGUpdate.DataController.SetValue(nRow, cxGUpdateOldWard.Index, sWardName);

    cxGUpdate.DataController.SetValue(nRow, cxGUpdateNewDate.Index, sWardDate);
    cxGUpdate.DataController.SetValue(nRow, cxGUpdateNewWard.Index, nWardID);

    nRow := nRow + 1;
    oOldWardHistory.Next;
  end;
end;

end.