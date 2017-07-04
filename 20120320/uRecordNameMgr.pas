unit uRecordNameMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, uGlobal, uConfig, uDB, cxControls, cxStyles, dxSkinsCore,
  dxSkinCaramel, dxSkinscxPC3Painter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLabel, ADODB, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid;

type
  TfrmRecordNameMgr = class(TForm)
    btnWardUpdate: TcxButton;
    cxGrid1: TcxGrid;
    cxGRecordName: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dsRecordName: TDataSource;
    adoRecordName: TADOQuery;
    cxGRecordNameName: TcxGridDBColumn;
    cxGRecordNameCustomName: TcxGridDBColumn;
    procedure btnWardUpdateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecordNameMgr: TfrmRecordNameMgr;

implementation
uses uInputName;
{$R *.dfm}

procedure TfrmRecordNameMgr.btnWardUpdateClick(Sender: TObject);
var
  oT: TADOQuery;
  oInputForm: TfrmInputName;
begin
  oT := TADOQuery.Create(self);
  oT.Connection := adoRecordName.Connection;

  Application.CreateForm(TfrmInputName, oInputForm);

  oInputForm.oInput.InputTitle := '기록지명';
  oInputForm.oInput.InputField.Name := adoRecordName.FieldByName('CustomName').AsString;
  oInputForm.oInput.InputField.Size := adoRecordName.FieldByName('CustomName').Size;

  oInPutForm.lblSeq.Visible := False;
  oInputForm.spinSeq.Visible := False;
  oInputForm.chkUsed.Visible := False;

  if oInputForm.ShowModal = mrOK then
  begin
    adoRecordName.DisableControls;
    try
      adoRecordName.Connection.BeginTrans;

      oT.SQL.Text := 'SELECT *' +
                     '  FROM RecordName' +
                     ' WHERE HospitalID=' + inttostr(oConfig.User.HospitalID) +
                     '   AND ID=' + adoRecordName.FieldByName('ID').AsString;
      oT.Open;

      if oT.IsEmpty then
      begin
        oT.Append;
        oT.FieldByName('HospitalID').AsInteger := oConfig.User.HospitalID;
        oT.FieldByName('ID').AsInteger := adoRecordName.FieldByName('ID').AsInteger;
      end
      else
        oT.Edit;

      oT.FieldByName('CustomName').AsString := trim(oInputForm.txtInput.Text);
      oT.Post;

      adoRecordName.Close;
      adoRecordName.Open;
      adoRecordName.Locate('ID', oT.FieldByName('ID').AsString, [loCaseInsensitive]);

      adoRecordName.Connection.CommitTrans;
    except
      adoRecordName.Connection.RollbackTrans;

      oGlobal.Msg('수정하지 못했습니다!');
    end;
    adoRecordName.EnableControls;
  end;

  oInPutForm.lblSeq.Visible := True;
  oInputForm.spinSeq.Visible := True;
  oInputForm.chkUsed.Visible := True;

  oInputForm.Free;
end;

procedure TfrmRecordNameMgr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  adoRecordName.Close;
end;

procedure TfrmRecordNameMgr.FormShow(Sender: TObject);
begin
  adoRecordName.SQL.Text := 'select RecordNameDefault.ID as ID' +
                            '       ,Name, CustomName, HospitalID' +
                            '  from RecordNameDefault' +
                            '       left join RecordName' +
                            '              on RecordName.ID=RecordNameDefault.ID' +
                            '             and HospitalID=' + inttostr(oConfig.User.HospitalID);
  try
    adoRecordName.Open;
  except
    oGlobal.Msg('기록지명 정보에 접근하지 못했습니다!');
  end;
end;

end.
