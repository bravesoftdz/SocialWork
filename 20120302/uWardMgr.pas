unit uWardMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPC3Painter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, StdCtrls, Menus, cxButtons, cxContainer, cxCheckBox, cxLabel;

type
  TfrmWardMgr = class(TForm)
    adoWard: TADOQuery;
    dsWard: TDataSource;
    cxGWard: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGWardWardName: TcxGridDBColumn;
    cxGWardUsed: TcxGridDBColumn;
    btnWardAppend: TcxButton;
    btnWardUpdate: TcxButton;
    chkUsed: TcxCheckBox;
    cxGWardUseAll: TcxGridDBColumn;
    cxGWardSeq: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure adoWardAfterOpen(DataSet: TDataSet);
    procedure adoWardAfterClose(DataSet: TDataSet);
    procedure cxGWardCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnWardAppendClick(Sender: TObject);
    procedure btnWardUpdateClick(Sender: TObject);
    procedure chkUsedClick(Sender: TObject);
  private
    { Private declarations }
    function LoadWard: Boolean;
    procedure SetControls;
  public
    { Public declarations }
  end;

var
  frmWardMgr: TfrmWardMgr;

implementation

uses uConfig, uGlobal, uDB, uQuery;
{$R *.dfm}

procedure TfrmWardMgr.adoWardAfterClose(DataSet: TDataSet);
begin
  SetControls;
end;

procedure TfrmWardMgr.adoWardAfterOpen(DataSet: TDataSet);
begin
  SetControls;
end;

procedure TfrmWardMgr.btnWardAppendClick(Sender: TObject);
var
  oInput: TInputResult;
  nSeq: integer;
  nWardID: integer;
begin
  if not adoWard.Active then
    Exit;

  nSeq := dbMain.getLastWardSeq(oConfig.User.HospitalID) + 1;
  oInput := oGlobal.InputMsg('�����̸�', '', 20, True, True, False, nSeq);

  while oInput.Result = mrOK do
  begin
    if dbMain.isDuplicatedWardName(oConfig.User.HospitalID, oInput.Text) then
    begin
      oGlobal.Msg('���� �����̸��� �ֽ��ϴ�!');
      oInput := oGlobal.InputMsg('�����̸�', oInput.Text, 20, True);
    end
    else
      break;
  end;

  if oInput.Result <> mrOK then
    Exit;

  screen.Cursor := crHourGlass;
  adoWard.DisableControls;
  try
    adoWard.Connection.BeginTrans;
    adoWard.Append;
    adoWard.FieldByName('HospitalID').AsInteger := oConfig.User.HospitalID;
    adoWard.FieldByName('WardName').AsString := oInput.Text;
    adoWard.FieldByName('Used').AsBoolean := oInput.Used;
    adoWard.FieldByName('UseAll').AsBoolean := oInput.UseAll;
    adoWard.FieldByName('Seq').AsInteger := oInput.Seq;
    adoWard.Post;

    adoWard.Connection.CommitTrans;
    screen.Cursor := crDefault;

    nWardID := adoWard.FieldByName('WardID').AsInteger;
    adoWard.Close;
    adoWard.Open;
    adoWard.Locate('WardID', nWardID, [loCaseInSensitive]);

    oGlobal.Msg('�߰��Ǿ����ϴ�!');
  except
    adoWard.Cancel;
    adoWard.Connection.RollbackTrans;
    screen.Cursor := crDefault;
  end;
  adoWard.EnableControls;
end;

procedure TfrmWardMgr.btnWardUpdateClick(Sender: TObject);
var
  sWardName: string;
  bUsed, bUseAll: Boolean;
  nSeq: integer;
  oInput: TInputResult;
  nWardID: integer;
begin
  if adoWard.IsEmpty then
    Exit;

  sWardName := adoWard.FieldByName('WardName').AsString;
  bUsed := adoWard.FieldByName('Used').AsBoolean;
  bUseAll := adoWard.FieldByName('UseAll').AsBoolean;
  nSeq := adoWard.FieldByName('Seq').AsInteger;

  oInput := oGlobal.InputMsg('�����̸�', sWardName, 20, bUsed, True, bUseAll, nSeq);

  while oInput.Result = mrOK do
  begin
    if (sWardName <> oInput.Text) and dbMain.isDuplicatedWardName(oConfig.User.HospitalID, oInput.Text) then
    begin
      oGlobal.Msg('���� �����̸��� �ֽ��ϴ�!');
      oInput := oGlobal.InputMsg('�����̸�', oInput.Text, 20, oInput.Used);
    end
    else
      break;
  end;

  if oInput.Result <> mrOK then
    Exit;

  screen.Cursor := crHourGlass;
  adoWard.DisableControls;
  try
    adoWard.Connection.BeginTrans;
    adoWard.Edit;
    adoWard.FieldByName('WardName').AsString := oInput.Text;
    adoWard.FieldByName('Used').AsBoolean := oInput.Used;
    adoWard.FieldByName('UseAll').AsBoolean := oInput.UseAll;
    adoWard.FieldByName('Seq').AsInteger := oInput.Seq;
    adoWard.Post;

    adoWard.Connection.CommitTrans;
    screen.Cursor := crDefault;

    nWardID := adoWard.FieldByName('WardID').AsInteger;
    adoWard.Close;
    adoWard.Open;
    adoWard.Locate('WardID', nWardID, [loCaseInSensitive]);
  except
    adoWard.Cancel;
    adoWard.Connection.RollbackTrans;
    screen.Cursor := crDefault;
    oGlobal.Msg('�������� ���߽��ϴ�!');
  end;
  adoWard.EnableControls;
end;

procedure TfrmWardMgr.chkUsedClick(Sender: TObject);
begin
  LoadWard;
end;

procedure TfrmWardMgr.cxGWardCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  iIndex: integer;
begin
  iIndex := AViewInfo.RecordViewInfo.GridRecord.Index;

  if Sender.DataController.GetValue(iIndex, cxGWardUsed.Index) = False then
    ACanvas.Font.Color := clSilver;
end;

procedure TfrmWardMgr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoWard.Close;
end;

procedure TfrmWardMgr.FormShow(Sender: TObject);
begin
  chkUsed.Checked := True;

  if LoadWard then
    SetControls
  else
    Close;
end;

function TfrmWardMgr.LoadWard: Boolean;
begin
  try
    adoWard.SQL.Text := QueryWard(oConfig.User.HospitalID, chkUsed.Checked);
    adoWard.Open;

    Result := True;
  except
    oGlobal.Msg('���������� ������ �� �����ϴ�!');
    Result := False;
  end;
end;

procedure TfrmWardMgr.SetControls;
begin
  btnWardAppend.Enabled := adoWard.Active;
  btnWardUpdate.Enabled := not adoWard.IsEmpty;
end;

end.