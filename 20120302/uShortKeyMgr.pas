unit uShortKeyMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGlobal, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinCaramel,
  dxSkinscxPC3Painter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  DB, cxDBData, Menus, ADODB, StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxContainer, cxTextEdit, cxMemo, cxDBEdit,
  dxSkinOffice2007Blue;

type
  TfrmShortKeyMgr = class(TForm)
    cxG: TcxGrid;
    cxGShortKey: TcxGridDBTableView;
    cxGLevel1: TcxGridLevel;
    btnShortKeyAppend: TcxButton;
    btnShortKeyUpdate: TcxButton;
    adoShortKey: TADOQuery;
    dsShortKey: TDataSource;
    cxGShortKeyKeyword: TcxGridDBColumn;
    cxDBMemo1: TcxDBMemo;
    btnShortKeyDelete: TcxButton;
    btnClose: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnShortKeyAppendClick(Sender: TObject);
    procedure btnShortKeyUpdateClick(Sender: TObject);
    procedure dsShortKeyDataChange(Sender: TObject; Field: TField);
    procedure btnShortKeyDeleteClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetControls;
  public
    { Public declarations }
  end;

var
  frmShortKeyMgr: TfrmShortKeyMgr;

implementation
uses uConfig, uDB, uShortKeyInput;
{$R *.dfm}

procedure TfrmShortKeyMgr.btnShortKeyAppendClick(Sender: TObject);
var
  oInput: TfrmShortKeyInput;
begin
  if not adoShortKey.Active then
  begin
    oGlobal.Msg('����Ű������ ������� ���߽��ϴ�!');
    Exit;
  end;

  Application.CreateForm(TfrmShortKeyInput, oInput);

  oInput.ShortKey.Mode := emAppend;
  oInput.ShortKey.Clear;

  if oInput.ShowModal = mrOK then
  begin
    adoShortKey.DisableControls;
    try
      adoShortKey.Connection.BeginTrans;
      adoShortKey.Append;

      adoShortKey.FieldByName('HospitalID').AsInteger := oConfig.User.HospitalID;
      adoShortKey.FieldByName('Keyword').AsString := oInput.ShortKey.Keyword;
      adoShortKey.FieldByName('Content').AsString := oInput.ShortKey.Content;

      adoShortKey.Post;
      adoShortKey.Connection.CommitTrans;

      screen.Cursor := crDefault;
      oGlobal.Msg('�߰��Ͽ����ϴ�!');
    except
      adoShortKey.Cancel;
      adoShortKey.Connection.RollbackTrans;
      screen.Cursor := crDefault;
      oGlobal.Msg('�߰����� ���߽��ϴ�!');
    end;
    adoShortKey.EnableControls;
  end;

  oInput.Free;
end;

procedure TfrmShortKeyMgr.btnShortKeyDeleteClick(Sender: TObject);
begin
  if adoShortKey.IsEmpty then Exit;

  if oGlobal.YesNo('�����Ͻðڽ��ϱ�?') = mrYes then
    adoShortKey.Delete;
end;

procedure TfrmShortKeyMgr.btnShortKeyUpdateClick(Sender: TObject);
var
  oInput: TfrmShortKeyInput;
begin
  if adoShortKey.IsEmpty then Exit;

  Application.CreateForm(TfrmShortKeyInput, oInput);

  oInput.ShortKey.Mode := emUpdate;
  oInput.ShortKey.Clear;
  oInput.ShortKey.Keyword := adoShortKey.FieldByName('Keyword').AsString;
  oInput.ShortKey.Content := adoShortKey.FieldByName('Content').AsString;

  if oInput.ShowModal = mrOK then
  begin
    adoShortKey.DisableControls;
    try
      adoShortKey.Connection.BeginTrans;
      adoShortKey.Edit;

      adoShortKey.FieldByName('Keyword').AsString := oInput.ShortKey.Keyword;
      adoShortKey.FieldByName('Content').AsString := oInput.ShortKey.Content;

      adoShortKey.Post;
      adoShortKey.Connection.CommitTrans;

      screen.Cursor := crDefault;
      oGlobal.Msg('�����Ͽ����ϴ�!');
    except
      adoShortKey.Cancel;
      adoShortKey.Connection.RollbackTrans;
      screen.Cursor := crDefault;
      oGlobal.Msg('�������� ���߽��ϴ�!');
    end;
    adoShortKey.EnableControls;
  end;

  oInput.Free;
end;

procedure TfrmShortKeyMgr.dsShortKeyDataChange(Sender: TObject; Field: TField);
begin
  SetControls;
end;

procedure TfrmShortKeyMgr.FormShow(Sender: TObject);
begin
  adoShortKey.SQL.Text := 'SELECT *' +
                          '  FROM SHORTKEYS' +
                          ' WHERE HOSPITALID=' + IntToStr(oConfig.User.HospitalID) +
                          ' ORDER BY KEYWORD';
  adoShortKey.DisableControls;
  try
    adoShortKey.Open;
  except
    oGlobal.Msg('����Ű ������ �������� ���߽��ϴ�!');
    Close;
  end;
  adoShortKey.EnableControls;

  SetControls;
end;

procedure TfrmShortKeyMgr.SetControls;
begin
  btnShortKeyAppend.Enabled := adoShortKey.Active;
  btnShortKeyUpdate.Enabled := not adoShortKey.IsEmpty;
  btnShortKeyDelete.Enabled := not adoShortKey.IsEmpty;
end;

end.