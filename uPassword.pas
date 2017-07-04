unit uPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxButtons, ExtCtrls, cxControls, cxContainer,
  cxEdit, dxSkinsCore, dxSkinCaramel, cxTextEdit, dxSkinOffice2007Blue,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint;

type
  TfrmPassword = class(TForm)
    btnChangePassword: TcxButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    txtPwd1: TcxTextEdit;
    txtPwd2: TcxTextEdit;
    btnClose: TcxButton;
    procedure btnChangePasswordClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txtPwd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtPwd2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPassword: TfrmPassword;

implementation
uses uGlobal, uDB, uConfig;
{$R *.dfm}

procedure TfrmPassword.btnChangePasswordClick(Sender: TObject);
var
  sPwd1, sPwd2: string;
begin
  sPwd1 := trim(txtPwd1.Text);
  sPwd2 := trim(txtPwd2.Text);

  if oGlobal.isNullStr(sPwd1) then
  begin
    oGlobal.Msg('암호를 입력하십시오!');
    txtPwd1.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(sPwd2) then
  begin
    oGlobal.Msg('암호를 입력하십시오!');
    txtPwd2.SetFocus;
    Exit;
  end;

  if sPwd1 <> sPwd2 then
  begin
    oGlobal.Msg('입력된 암호가 일치하지 않습니다!');
    txtPwd1.SetFocus;
    Exit;
  end;

  if oGlobal.YesNo('암호를 변경하시겠습니까?') = mrYes then
  begin
    if dbMain.SetPassword(oConfig.User.HospitalID, oConfig.User.UserID, sPwd1) then
    begin
      txtPwd1.Clear;
      txtPwd2.Clear;
      txtPwd1.SetFocus;
      oGlobal.Msg('변경되었습니다!');
      ModalResult := mrOK;
    end
    else
      oGlobal.Msg('변경하지 못했습니다!');
  end;
end;

procedure TfrmPassword.FormShow(Sender: TObject);
begin
  txtPwd1.Clear;
  txtPwd2.Clear;
  txtPwd1.SetFocus;
end;

procedure TfrmPassword.txtPwd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and oGlobal.isNotNullStr(txtPwd1.Text) then
    txtPwd2.SetFocus;
end;

procedure TfrmPassword.txtPwd2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and oGlobal.isNotNullStr(txtPwd2.Text) then
    btnChangePassword.SetFocus;
end;

end.
