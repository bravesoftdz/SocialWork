unit uPatientNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  StdCtrls, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  ExtCtrls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, ADODB,
  cxGroupBox, Menus, cxButtons, cxSpinEdit, cxTimeEdit, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  ComCtrls, dxCore, cxDateUtils;

type
  TfrmPatientNew = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblLastID: TLabel;
    cxDEBirthday: TcxDateEdit;
    txtPatientID: TcxTextEdit;
    txtPatientName: TcxTextEdit;
    rMale: TRadioButton;
    rFeMale: TRadioButton;
    cxGroupBox2: TcxGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxDEInDate: TcxDateEdit;
    txtDiagName: TcxTextEdit;
    cboWard: TcxComboBox;
    cboDoctor: TcxComboBox;
    cboUser: TcxComboBox;
    btnOK: TcxButton;
    btnClose: TcxButton;
    Label10: TLabel;
    cxTEInTime: TcxTimeEdit;
    Label11: TLabel;
    cboInType: TcxComboBox;
    cboBohum: TcxComboBox;
    Label12: TLabel;
    Label13: TLabel;
    txtRoom: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure ClearControls;
    function isValidInput: Boolean;
  public
    { Public declarations }
  end;

var
  frmPatientNew: TfrmPatientNew;

implementation
uses uDB, uGlobal, uConfig;
{$R *.dfm}

procedure TfrmPatientNew.btnOKClick(Sender: TObject);
var
  sPatientID: string;
begin
  if not isValidInput then Exit;

  sPatientID := trim(txtPatientID.Text);
  if dbMain.isDuplicatedPatientID(oConfig.User.HospitalID, sPatientID) then
    oGlobal.Msg('�ߺ��� ȯ�ڹ�ȣ�� �ֽ��ϴ�!')
  else
    ModalResult := mrOK;
end;

procedure TfrmPatientNew.ClearControls;
begin
  txtPatientID.Clear;
  txtPatientName.Clear;
  cxDEBirthday.Clear;
  rMale.Checked := true;
  cxDEInDate.Clear;
  cxTEInTime.Clear;
  txtRoom.Clear;
  txtDiagName.Clear;
  cboInTYpe.Clear;
  cboBohum.Clear;
  cboWard.Clear;
  cboDoctor.Clear;
  cboUser.Clear;
end;

procedure TfrmPatientNew.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;  
end;

procedure TfrmPatientNew.FormShow(Sender: TObject);
var
  sLastID: string;
begin
  ClearControls;

  txtPatientID.SetFocus;

  sLastID := dbMain.GetLastPatientID(oConfig.User.HospitalID);
  if sLastID = NullString then
    lblLastID.Caption := 'Last ID = ȯ������ ����'
  else
    lblLastID.Caption := 'Last ID = ' + sLastID;

  try
    dbMain.GetInTypeList(oConfig.User.HospitalID, cboInType.Properties.Items);
    dbMain.GetBohumList(cboBohum.Properties.Items, False);
    dbMain.GetWardList(oConfig.User.HospitalID, cboWard.Properties.Items, False);
    dbMain.GetDoctorList(oConfig.User.HospitalID, cboDoctor.Properties.Items);
    dbMain.GetUserList(oConfig.User.HospitalID, cboUser.Properties.Items, False);
  except
    oGlobal.Msg('��Ͽ� �ʿ��� ������ �������� ���߽��ϴ�!');
    Close;
  end;
end;

function TfrmPatientNew.isValidInput: Boolean;
var
  sPatientID, sPatientName, sBirthday, sInType, sInDate, sInTime, sWard, sRoom, sDiagName, sDoctor, sUser: string;
begin
  sPatientID := trim(txtPatientID.Text);
  sPatientName := trim(txtPatientName.Text);
  sBirthday := trim(cxDEBirthday.EditText);
  sInType := trim(cboInType.Text);
  sInDate := trim(cxDEInDate.EditText);
  sInTime := trim(cxTEInTime.EditText);
  sWard := trim(cboWard.Text);
  sRoom := trim(txtRoom.Text);
  sDiagName := trim(txtDiagName.Text);
  sDoctor := trim(cboDoctor.Text);
  sUser := trim(cboUser.Text);

  result := false;
  if oGlobal.isNullStr(sPatientID) then
  begin
    oGlobal.Msg('ȯ�ڹ�ȣ�� �Է��Ͻʽÿ�!');
    txtPatientID.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(sPatientName) then
  begin
    oGlobal.Msg('ȯ�ڼ����� �Է��Ͻʽÿ�!');
    txtPatientName.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(sBirthday) then
  begin
    oGlobal.Msg('��������� �Է��Ͻʽÿ�!');
    cxDEBirthday.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(sInType) then
  begin
    oGlobal.Msg('�Կ����¸� �Է��Ͻʽÿ�!');
    cboInType.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(sInDate) then
  begin
    oGlobal.Msg('�Կ����ڸ� �Է��Ͻʽÿ�!');
    cxDEInDate.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(sInTime) then
  begin
    oGlobal.Msg('�Կ��ð��� �Է��Ͻʽÿ�!');
    cxTEInTime.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(sWard) then
  begin
    oGlobal.Msg('������ �����Ͻʽÿ�!');
    cboWard.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(cboDoctor.Text) then
  begin
    oGlobal.Msg('����ǻ縦 �Է��Ͻʽÿ�!');
    cboDoctor.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(cboUser.Text) then
  begin
    oGlobal.Msg('����ڸ� �Է��Ͻʽÿ�!');
    cboUser.SetFocus;
    Exit;
  end;

  result := true;
end;

end.