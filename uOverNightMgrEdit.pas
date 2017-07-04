unit uOverNightMgrEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, uGlobal, DB, ADODB, cxControls, cxContainer, cxEdit, dxSkinsCore,
  dxSkinCaramel, cxMemo, cxDropDownEdit, cxCalendar, cxLabel, cxTextEdit,
  cxMaskEdit, cxSpinEdit, cxTimeEdit, cxGroupBox, ExtCtrls, dxSkinBlack,
  dxSkinBlue, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmOverNightMgrEdit = class(TForm)
    btnOK: TcxButton;
    btnClose: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxTimeStart: TcxTimeEdit;
    cxTimeFinish: TcxTimeEdit;
    cxLabel6: TcxLabel;
    cxDEStart: TcxDateEdit;
    cxDEFinish: TcxDateEdit;
    cxMemoComment: TcxMemo;
    Label1: TLabel;
    lblPatientID: TLabel;
    lblPatientName: TLabel;
    Timer1: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    adoOverNight: TADOQuery;
    cboOvernightState: TcxComboBox;
    Label4: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetControls;
  public
    { Public declarations }
    adoInOut: TADOQuery;
    adoList: TADOQuery;
    Mode: TEditMode;
  end;

var
  frmOverNightMgrEdit: TfrmOverNightMgrEdit;

implementation
uses uConfig, uDB;
{$R *.dfm}

procedure TfrmOverNightMgrEdit.btnOKClick(Sender: TObject);
var
  sInOutID: string;
  oStartTime, oFinishTime: TDateTime;
begin
  if oGlobal.isNullStr(cxDEStart.EditText) then
  begin
    oGlobal.Msg('시작일자를 입력하십시오!');
    cxDEStart.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(cxDEFinish.EditText) then
  begin
    oGlobal.Msg('종료일자를 입력하십시오!');
    cxDEFinish.SetFocus;
    Exit;
  end;

  sInOutID := adoInOut.FieldByName('InOutID').AsString;

  oStartTime := oGlobal.DateAndTimeToDateTime(cxDEStart.Date, cxTimeStart.Time);
  oFinishTime := oGlobal.DateAndTimeToDateTime(cxDEFinish.Date, cxTimeFinish.Time);

  if oStartTime > oFinishtime then
  begin
    oGlobal.Msg('[시작일시]가 [종료일시]보다 늦은 시간입니다!');
    Exit;
  end;

  if Mode = emAppend then
  begin
    if dbMain.isExistOverNight(sInOutID, oStartTime, oFinishTime) then
    begin
      oGlobal.Msg('이미 입력된 외출/외박 기록이 있습니다!' );
      Exit;
    end;
  end
  else
  begin
    if (adoList.FieldByName('StartTime').AsDateTime <> oStartTime) and
      dbMain.isExistOverNight(sInOutID, oStartTime, oFinishTime) then
    begin
      oGlobal.Msg('이미 입력된 외출/외박 기록이 있습니다!' );
      Exit;
    end;
  end;

  try
    adoOverNight.Connection.BeginTrans;

    if Mode = emAppend then
    begin
      adoOverNight.Append;
      adoOverNight.FieldByName('InOutID').AsString := sInOutID;
    end
    else
    begin
      adoOverNight.Edit;
    end;

    adoOverNight.FieldByName('StartTime').AsDateTime :=  oStartTime;
    adoOverNight.FieldByName('FinishTime').AsDateTime := oFinishTime;
    adoOverNight.FieldByName('Comment').AsString := trim(cxMemoComment.Lines.Text);

    adoOverNight.FieldByName('OverNightState').AsInteger := cboOverNightState.ItemIndex;

    adoOverNight.Post;

    adoOverNight.Connection.CommitTrans;

    ModalResult := mrOK;
  except
    adoOverNight.Connection.RollbackTrans;

    oGlobal.Msg('저장할 수 없습니다!');
  end;
end;

procedure TfrmOverNightMgrEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmOverNightMgrEdit.SetControls;
begin
  if Mode = emAppend then
  begin
    caption := '외출/외박 편집 (추가)';

    lblPatientID.Caption := adoInOut.FieldByName('PatientID').AsString;
    lblPatientName.Caption := adoInOut.FieldByName('PatientName').AsString;

    cxDEStart.EditText := oGlobal.DateToString(Now);
    cxTimeStart.EditText := copy(oGlobal.TimeToString(Now),1,5);
    cxDEFinish.EditText := oGlobal.DateToString(Now);
    cxTimeFinish.EditText := copy(oGlobal.TimeToString(Now),1,5);

    cxMemoComment.Lines.Clear;
  end
  else
  begin
    caption := '외출/외박 편집 (수정)';

    lblPatientID.Caption := adoList.FieldByName('PatientID').AsString;
    lblPatientName.Caption := adoList.FieldByName('PatientName').AsString;

    cxDEStart.EditText := oGlobal.DateToString(adoList.FieldByName('StartTime').AsDateTime);
    cxTimeStart.Time := adoList.FieldByName('StartTime').AsDateTime;
    cxDEFinish.EditText := oGlobal.DateToString(adoList.FieldByName('FinishTime').AsDateTime);
    cxTimeFinish.Time := adoList.FieldByName('FinishTime').AsDateTime;

    cboOverNightState.ItemIndex := adoList.FieldByName('OverNightState').AsInteger;

    cxMemoComment.Lines.Text := adoList.FieldByName('Comment').AsString;
  end;
end;

procedure TfrmOverNightMgrEdit.Timer1Timer(Sender: TObject);
var
  sInOutID, sStartTime: string;
begin
  Timer1.Enabled := False;

  SetControls;

  if Mode = emAppend then
  begin
    sInOutID := adoInOut.FieldByName('InOutID').AsString;

    with adoOverNight.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM OverNight');
      Add(' WHERE InOutID=' + sInOutID);
    end;
  end
  else
  begin
    sInOutID := adoList.FieldByName('InOutID').AsString;
    sStartTime := oGlobal.DateTimeToString(adoList.FieldByName('StartTime').AsDateTime);

    with adoOverNight.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM OverNight');
      Add(' WHERE InOutID=' + sInOutID);
      Add('   AND StartTime=''' + sStartTime + '''');
    end;
  end;

  try
    adoOverNight.Open;
  except
    oGlobal.Msg('외출/외박 내역을 읽어오지 못했습니다!');
    Close;
  end;

  if (Mode = emUpdate) and adoOverNight.IsEmpty then
  begin
    oGlobal.Msg('편집할 외출/외박 내역이 없습니다!');
    Close;
  end;

  cxDEStart.SetFocus;
end;

end.
