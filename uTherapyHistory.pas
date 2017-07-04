unit uTherapyHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, uDB, uGlobal, cxControls, cxContainer, cxEdit, dxSkinsCore,
  dxSkinCaramel, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, ExtCtrls, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGroupBox, ADODB, DBCtrls,
  cxCheckBox, dxSkinBlack, dxSkinBlue, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
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
  TfrmTherapyHistory = class(TForm)
    btnOK: TcxButton;
    btnClose: TcxButton;
    adoSchedule: TADOQuery;
    cxGroupBox1: TcxGroupBox;
    cxGrid: TcxGrid;
    cxGList: TcxGridDBTableView;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    dsSchedule: TDataSource;
    cxGroupBox22: TcxGroupBox;
    cxGroupBox10: TcxGroupBox;
    cxGroupBox11: TcxGroupBox;
    TimerShow: TTimer;
    cxGListContent: TcxGridDBColumn;
    cxGListSDate: TcxGridDBColumn;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    chkContent: TcxCheckBox;
    chkChairmanOpinion: TcxCheckBox;
    chkWorkerOpinion: TcxCheckBox;
    chkDoctorOpinion: TcxCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure TimerShowTimer(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    HospitalID: string;
    ProgramID: string;
    procedure CloseAll;
  end;

var
  frmTherapyHistory: TfrmTherapyHistory;

implementation

{$R *.dfm}

procedure TfrmTherapyHistory.btnOKClick(Sender: TObject);
begin
  if adoSchedule.IsEmpty then
  begin
    oGlobal.Msg('������ ������ �����ϴ�!');
    Exit;
  end;

  if oGlobal.YesNo('�����Ͻðڽ��ϱ�?') = mrYes then
    ModalResult := mrOK;
end;

procedure TfrmTherapyHistory.CloseAll;
begin
  adoSchedule.Close;
end;

procedure TfrmTherapyHistory.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmTherapyHistory.FormShow(Sender: TObject);
begin
  TimerShow.Enabled := True;
end;

procedure TfrmTherapyHistory.TimerShowTimer(Sender: TObject);
begin
  TimerShow.Enabled := False;

  adoSchedule.SQL.Text := 'SELECT *' +
                          '  FROM Schedule' +
                          ' WHERE ProgramID=' + ProgramID +
                          '   AND HospitalID=' + HospitalID +
                          ' ORDER BY SDate DESC';
  try
    adoSchedule.Open;
  except
    oGlobal.Msg('���� �������⿡ �����߽��ϴ�!');
    Close;
  end;
end;

end.