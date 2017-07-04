unit uInTypeMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGlobal, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinCaramel,
  dxSkinscxPC3Painter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, Menus, StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, ADODB,
  dxSkinOffice2007Blue, dxSkinBlack, dxSkinBlue, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmInTypeMgr = class(TForm)
    adoInType: TADOQuery;
    dsInType: TDataSource;
    cxGrid1: TcxGrid;
    cxGInType: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    btnInTypeAppend: TcxButton;
    btnInTypeUpdate: TcxButton;
    cxGInTypeInTypeName: TcxGridDBColumn;
    cxGInTypeUsed: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGInTypeCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btnInTypeAppendClick(Sender: TObject);
    procedure btnInTypeUpdateClick(Sender: TObject);
    procedure dsInTypeDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInTypeMgr: TfrmInTypeMgr;

implementation
uses uDB, uConfig;
{$R *.dfm}

procedure TfrmInTypeMgr.btnInTypeAppendClick(Sender: TObject);
var
  oInput: TInputResult;
begin
  if not adoInType.active then Exit;

  oInput := oGlobal.InputMsg('�Կ�����', '', 20, True);

  while  oInput.Result = mrOK do
  begin
    if dbMain.isDuplicatedInTypeName(oConfig.User.HospitalID, oInput.Text) then
    begin
      oGlobal.Msg('���� �Կ����°� �ֽ��ϴ�!');
      oInput := oGlobal.InputMsg('�Կ�����', oInput.Text, 20, True);
    end
    else
      break;
  end;

  if oInput.Result <> mrOK then Exit;

  adoInType.DisableControls;
  try
    adoInType.Connection.BeginTrans;
    adoInType.Append;
    adoInType.FieldByName('HospitalID').AsInteger := oConfig.User.HospitalID;
    adoInType.FieldByName('InTypeName').AsString := oInput.Text;
    adoInType.FieldByName('Used').AsBoolean := oInput.Used;
    adoInType.Post;
    adoInType.Connection.CommitTrans;
    oGlobal.Msg('����߽��ϴ�!');
  except
    adoInType.Connection.RollbackTrans;
    adoInType.Cancel;
    oGlobal.Msg('�űԵ�Ͽ� �����߽��ϴ�!');
  end;
  adoInType.EnableControls;
end;

procedure TfrmInTypeMgr.btnInTypeUpdateClick(Sender: TObject);
var
  sInTypeName: string;
  bUsed: Boolean;
  oInput: TInputResult;
begin
  if adoInType.IsEmpty then Exit;

  sInTypeName := adoInType.FieldByName('InTypeName').AsString;
  bUsed := adoInType.FieldByName('Used').AsBoolean;

  oInput := oGlobal.InputMsg('�Կ�����', sInTypeName, 20, bUsed);

  while oInput.Result = mrOK do
  begin
    if (sInTypeName <> oInput.Text) and
      dbMain.isDuplicatedInTypeName(oConfig.User.HospitalID, sInTypeName) then
    begin
      oGlobal.Msg('���� �Կ����°� �ֽ��ϴ�!');
      oInput := oGlobal.InputMsg('�Կ�����', oInput.Text, 20, oInput.Used);
    end
    else
      break;
  end;

  if oInput.Result <> mrOK then Exit;

  adoInType.DisableControls;
  try
    adoInType.Connection.BeginTrans;
    adoInType.Edit;
    adoInType.FieldByName('InTypeName').AsString := oInput.Text;
    adoInType.FieldByName('Used').AsBoolean := oInput.Used;
    adoInType.Post;
    adoInType.Connection.CommitTrans;
    oGlobal.Msg('�����߽��ϴ�!');
  except
    adoInType.Connection.RollbackTrans;
    adoInType.Cancel;
    oGlobal.Msg('������ �����߽��ϴ�!');
  end;
  adoInType.EnableControls;
end;

procedure TfrmInTypeMgr.cxGInTypeCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  iIndex: integer;
begin
  iIndex := AViewInfo.RecordViewInfo.GridRecord.Index;

  if Sender.DataController.GetValue(iIndex, cxGInTypeUsed.Index) = False then
    ACanvas.Font.Color := clSilver;
end;

procedure TfrmInTypeMgr.dsInTypeDataChange(Sender: TObject; Field: TField);
begin
  btnInTypeUpdate.Enabled := not adoInType.IsEmpty;
end;

procedure TfrmInTypeMgr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoInType.Close;
end;

procedure TfrmInTypeMgr.FormShow(Sender: TObject);
begin
  adoInType.Close;
  adoInType.Parameters.ParamByName('HospitalID').Value := oConfig.User.HospitalID;
  adoInType.Open;
end;

end.