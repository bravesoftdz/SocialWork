unit uFamilyMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGlobal, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinCaramel,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, cxLabel, ADODB, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  Menus, StdCtrls, cxButtons, dxSkinOffice2007Blue, dxSkinBlack, dxSkinBlue,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinscxPCPainter, cxNavigator;

type
  TfrmFamilyMgr = class(TForm)
    cxGrid1: TcxGrid;
    cxGFamily: TcxGridDBTableView;
    cxGFamilyRelationshipName: TcxGridDBColumn;
    cxGFamilyFamilyName: TcxGridDBColumn;
    cxGFamilyInMate: TcxGridDBColumn;
    cxGFamilyHealth: TcxGridDBColumn;
    cxGFamilyETC: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    adoFamily: TADOQuery;
    dsFamily: TDataSource;
    btnFamilyAppend: TcxButton;
    btnFamilyUpdate: TcxButton;
    btnFamilyDelete: TcxButton;
    btnClose: TcxButton;
    procedure btnFamilyAppendClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFamilyUpdateClick(Sender: TObject);
    procedure dsFamilyDataChange(Sender: TObject; Field: TField);
    procedure btnFamilyDeleteClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure SetControls;
  public
    { Public declarations }
    Modified: Boolean;
    adoInOut: TAdoQuery;
  end;

var
  frmFamilyMgr: TfrmFamilyMgr;

implementation
uses uConfig, uDB, uFamilyInput, uQuery;
{$R *.dfm}

procedure TfrmFamilyMgr.btnFamilyAppendClick(Sender: TObject);
var
  oInput: TfrmFamilyInput;
  nFamilyID: integer;
begin
  if not adoFamily.Active then Exit;  

  Application.CreateForm(TfrmFamilyInput, oInput);
  oInput.Relation.Clear;

  if oInput.ShowModal = mrOK then
  begin
    try
      adoFamily.Connection.BeginTrans;
      adoFamily.Append;

      adoFamily.FieldByName('InOutID').AsInteger := adoInOut.FieldByName('InOutID').AsInteger;// oInOut.InOutID;
      adoFamily.FieldByName('FamilyName').AsString := oInput.Relation.FamilyName;
      adoFamily.FieldByName('InMate').AsBoolean := oInput.Relation.InMate;
      adoFamily.FieldByName('Health').AsString := oInput.Relation.Health;
      adoFamily.FieldByName('Pay').AsBoolean := oInput.Relation.Pay;
      adoFamily.FieldByName('RelationshipID').AsInteger := oInput.Relation.RelationshipID;

      adoFamily.Post;
      adoFamily.Connection.CommitTrans;

      nFamilyID := adoFamily.FieldByName('FamilyID').AsInteger;

      adoFamily.Close;
      adoFamily.Open;
      adoFamily.Locate('FamilyID', nFamilyID, [loCaseInsensitive]);

      oGlobal.Msg('추가하였습니다!');

      Modified := True;
    except
      adoFamily.Cancel;
      adoFamily.Connection.RollbackTrans;

      oGlobal.Msg('추가하지 못햇습니다!');
    end;
  end;
  oInput.Free;
end;

procedure TfrmFamilyMgr.btnFamilyDeleteClick(Sender: TObject);
var
  oT: TADOQuery;
begin
  if adoFamily.IsEmpty then Exit;

  if oGlobal.YesNo('삭제하시겠습니까?') <> mrYes then
    Exit;

  oT := TADOQuery.Create(self);
  oT.Connection := adoFamily.Connection;
  oT.SQL.Text := 'DELETE Families WHERE FamilyID=' + adoFamily.FieldByName('FamilyID').AsString;

  try
    oT.Connection.BeginTrans;
    oT.ExecSQL;
    oT.Connection.CommitTrans;

    adoFamily.Close;
    adoFamily.Open;

    oGlobal.Msg('삭제하였습니다!');

    Modified := True;
  except
    oT.Connection.RollbackTrans;
    oGlobal.Msg('삭제하지 못했습니다!');
  end;

  oT.Free;
end;

procedure TfrmFamilyMgr.btnFamilyUpdateClick(Sender: TObject);
var
  oInput: TfrmFamilyInput;
  nFamilyID: integer;
begin
  if adoFamily.IsEmpty then Exit;
  
  Application.CreateForm(TfrmFamilyInput, oInput);
  oInput.Relation.Clear;
  oInput.Relation.FamilyName := adoFamily.FieldByName('FamilyName').AsString;
  oInput.Relation.Health := adoFamily.FieldByName('Health').AsString;
  oInput.Relation.InMate := adoFamily.FieldByName('InMate').AsBoolean;
  oInput.Relation.Pay := adoFamily.FieldByName('Pay').AsBoolean;
  oInput.Relation.RelationshipID := adoFamily.FieldByName('RelationshipID').AsInteger;
  oInput.Relation.RelationshipName := adoFamily.FieldByName('RelationshipName').AsString;

  if oInput.ShowModal = mrOK then
  begin
    try
      adoFamily.Connection.BeginTrans;
      adoFamily.Edit;

      adoFamily.FieldByName('FamilyName').AsString := oInput.Relation.FamilyName;
      adoFamily.FieldByName('InMate').AsBoolean := oInput.Relation.InMate;
      adoFamily.FieldByName('Health').AsString := oInput.Relation.Health;
      adoFamily.FieldByName('Pay').AsBoolean := oInput.Relation.Pay;
      adoFamily.FieldByName('RelationshipID').AsInteger := oInput.Relation.RelationshipID;

      adoFamily.Post;
      adoFamily.Connection.CommitTrans;

      nFamilyID := adoFamily.FieldByName('FamilyID').AsInteger;

      adoFamily.Close;
      adoFamily.Open;
      adoFamily.Locate('FamilyID', nFamilyID, [loCaseInsensitive]);

      oGlobal.Msg('수정하였습니다!');

      Modified := True;
    except
      adoFamily.Cancel;
      adoFamily.Connection.RollbackTrans;

      oGlobal.Msg('수정하지 못햇습니다!');
    end;
  end;
  oInput.Free;
end;

procedure TfrmFamilyMgr.dsFamilyDataChange(Sender: TObject; Field: TField);
begin
  SetControls;
end;

procedure TfrmFamilyMgr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoInOut := nil;
end;

procedure TfrmFamilyMgr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmFamilyMgr.FormShow(Sender: TObject);
begin
  Modified := False;
  try
    adoFamily.SQL.Text := QueryFamily(adoInOut.FieldByName('InOutID').AsInteger);
    adoFamily.Open;
  except
    oGlobal.Msg('가족관계정보에 접근할 수 없습니다!');
    Close;
  end;
end;

procedure TfrmFamilyMgr.SetControls;
begin
  btnFamilyAppend.Enabled := adoFamily.Active;
  btnFamilyUpdate.Enabled := not adoFamily.IsEmpty;
  btnFamilyDelete.Enabled := not adoFamily.IsEmpty;
end;

end.
