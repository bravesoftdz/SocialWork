unit uInOutMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPC3Painter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  ADODB,
  cxContainer, StdCtrls, cxDropDownEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  ExtCtrls, uGlobal, uConfig, cxSpinEdit, cxTimeEdit, Menus, cxButtons, cxLabel;

type
  TfrmInOutMgr = class(TForm)
    dsInOut: TDataSource;
    adoInOut: TADOQuery;
    cxGrid1: TcxGrid;
    cxGInOut: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Label3: TLabel;
    pnlPatientID: TPanel;
    Label4: TLabel;
    pnlPatientName: TPanel;
    cxGInOutInDate: TcxGridDBColumn;
    cxGInOutOutDate: TcxGridDBColumn;
    cxGInOutDiagName: TcxGridDBColumn;
    cxGInOutStateName: TcxGridDBColumn;
    cxGInOutUserName: TcxGridDBColumn;
    cxGInOutDoctorName: TcxGridDBColumn;
    Timer1: TTimer;
    btnClose: TcxButton;
    btnInOutAppend: TcxButton;
    btnInOutUpdate: TcxButton;
    btnInOutDelete: TcxButton;
    cxGInOutBohum: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnInOutAppendClick(Sender: TObject);
    procedure btnInOutUpdateClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnInOutDeleteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure SetQuery;
  public
    { Public declarations }
    PatientID: string;
    HospitalID: integer;
    Modified: Boolean;
  end;

var
  frmInOutMgr: TfrmInOutMgr;

implementation

uses uDB, uInOutEdit;
{$R *.dfm}

procedure TfrmInOutMgr.btnInOutAppendClick(Sender: TObject);
begin
  frmInOutEdit.EditMode := emAppend;
  frmInOutEdit.HospitalID := HospitalID;
  frmInOutEdit.PatientID := PatientID;
  frmInOutEdit.oInOut := TADOQuery(adoInOut);

  frmInOutEdit.ShowModal;
end;

procedure TfrmInOutMgr.btnInOutUpdateClick(Sender: TObject);
begin
  frmInOutEdit.EditMode := emUpdate;
  frmInOutEdit.oInOut := TADOQuery(adoInOut);

  frmInOutEdit.ShowModal;
end;

procedure TfrmInOutMgr.btnInOutDeleteClick(Sender: TObject);
var
  oT: TADOQuery;
  nInOutID: integer;
  rt: TRecordType;
  Msg: string;
begin
  if adoInOut.IsEmpty then
  begin
    oGlobal.Msg('������ ����� ������ �����ϴ�!');
    Exit;
  end;

  nInOutID := adoInOut.FieldByName('InOutID').AsInteger;

  Msg := '';
  rt := dbMain.UsedRecord(nInOutID);
  case rt of
    rtIntake:
      Msg := 'Intake';
    rtSurvey1:
      Msg := '��ȸ��������I';
    rtSurvey2:
      Msg := '��ȸ��������II';
    rtCounseling:
      Msg := '��ȸ�������';
    rtTraining:
      Msg := '��ȸ��Ȱ�Ʒ�';
    rtProgram:
      Msg := '����ġ�����';
    rtVisit:
      Msg := '�����湮�����';
    rtFamily:
      Msg := '��������';
    rtError:
      Msg := '������ �߻��߽��ϴ�';
  end;

  if Msg <> NullString then
  begin
    if rt = rtError then
      oGlobal.Msg(Msg)
    else
      oGlobal.Msg(Msg + ' �� ����� ������ �ֽ��ϴ�!' + #13 + '�ش系���� ���� �� �� �ٽ� ������ �ֽʽÿ�!');

    Exit;
  end;

  if oGlobal.YesNo('���� �Ͻðڽ��ϱ�?') <> mrYes then
    Exit;

  oT := TADOQuery.Create(self);
  oT.Connection := adoInOut.Connection;

  try
    oT.Connection.BeginTrans;

    oT.SQL.Text := 'DELETE InOut' +
                   ' WHERE InOutID=' + adoInOut.FieldByName('InOutID').AsString;
    oT.ExecSQL;

    oT.SQL.Text := 'DELETE WardHistory' +
                   ' WHERE InOutID=' + adoInOut.FieldByName('InOutID').AsString;
    oT.ExecSQL;

    oT.Connection.CommitTrans;

    adoInOut.DisableControls;
    adoInOut.Close;
    adoInOut.Open;
    adoInOut.EnableControls;

    oGlobal.Msg('�����Ͽ����ϴ�!', 500);
  except
    oT.Connection.RollbackTrans;
    oGlobal.Msg('���� �� ������ �߻��߽��ϴ�!');
  end;
end;

procedure TfrmInOutMgr.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  oGlobal.Msg(inttostr(Key));
end;

procedure TfrmInOutMgr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoInOut.Close;
end;

procedure TfrmInOutMgr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmInOutMgr.FormShow(Sender: TObject);
begin
  pnlPatientID.Caption := '';
  pnlPatientName.Caption := '';
  pnlPatientID.Caption := PatientID;
  pnlPatientName.Caption := dbMain.GetPatientName(HospitalID, PatientID);

  SetQuery;
end;

procedure TfrmInOutMgr.SetQuery;
begin
  adoInOut.SQL.Text
    := 'SELECT *' +
       '  FROM vInOut' +
       ' WHERE HospitalID=' + inttostr(HospitalID) +
       '   AND PatientID=''' + PatientID + '''' +
       ' ORDER BY InDate DESC';
  try
    adoInOut.Open;
  except
    oGlobal.Msg('����������� ������ �� �����ϴ�!');
    Timer1.Enabled := True;
  end;
end;

procedure TfrmInOutMgr.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  Close;
end;

end.