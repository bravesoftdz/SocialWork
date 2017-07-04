unit uFamilyInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel, cxCheckBox, cxTextEdit,
  StdCtrls, ExtCtrls, cxButtons, cxMaskEdit, cxDropDownEdit, cxCalendar,
  uGlobal, dxSkinBlack, dxSkinBlue, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmFamilyInput = class(TForm)
    btnOK: TcxButton;
    btnClose: TcxButton;
    Panel1: TPanel;
    Label6: TLabel;
    Label9: TLabel;
    txtFamilyName: TcxTextEdit;
    chkInMate: TcxCheckBox;
    chkPay: TcxCheckBox;
    txtHealth: TcxTextEdit;
    Label1: TLabel;
    cboRelationship: TcxComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cboRelationshipKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure ClearControls;
    procedure SetControls;
    function isValidInput: Boolean;
  public
    { Public declarations }
    Relation: TRelationshipInfo;
  end;

var
  frmFamilyInput: TfrmFamilyInput;

implementation
uses uConfig, uDB;
{$R *.dfm}

{ TfrmFamilyInput }

procedure TfrmFamilyInput.btnOKClick(Sender: TObject);
begin
  if not isValidInput then Exit;

  if oGlobal.YesNo('진행하시겠습니까?') = mrYes then
  begin
    Relation.RelationshipID := dbMain.GetRelationshipID(oConfig.User.HospitalID, cboRelationship.Text);
    Relation.RelationshipName := cboRelationship.Text;
    Relation.FamilyName := trim(txtFamilyName.Text);
    Relation.Health := trim(txtHealth.Text);
    Relation.InMate := chkInMate.Checked;
    Relation.Pay := chkPay.Checked;

    ModalResult := mrOK;
  end;
end;

procedure TfrmFamilyInput.cboRelationshipKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if Sender = cboRelationship then
      txtFamilyName.SetFocus
    else if Sender = txtFamilyName then
      chkInMate.SetFocus
    else if Sender = chkInMate then
      chkPay.SetFocus
    else if Sender = chkPay then
      txtHealth.SetFocus
    else if Sender = txtHealth then         
      btnOK.SetFocus;
  end;
end;

procedure TfrmFamilyInput.ClearControls;
begin
  cboRelationship.ItemIndex := -1;
  txtFamilyName.Clear;
  txtHealth.Clear;
  chkInMate.Checked := True;
  chkPay.Checked := True;
end;

procedure TfrmFamilyInput.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then close;  
end;

procedure TfrmFamilyInput.FormShow(Sender: TObject);
begin
  ClearControls;

  if dbMain.GetRelationshipList(oConfig.User.HospitalID, cboRelationship.Properties.Items) then
    cboRelationship.ItemIndex := 0;

  SetControls;

  cboRelationship.SetFocus;
end;

function TfrmFamilyInput.isValidInput: Boolean;
begin
  result := false;

  if cboRelationship.ItemIndex < 0 then
  begin
    oGlobal.Msg('가구주와의 관계를 선택하십시오!');
    cboRelationship.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(txtFamilyName.Text) then
  begin
    oGlobal.Msg('성명을 입력하십시오!');
    txtFamilyName.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(txtHealth.Text) then
  begin
    oGlobal.Msg('건강상태를 입력하십시오!');
    txtHealth.SetFocus;
    Exit;
  end;

  result := True;
end;

procedure TfrmFamilyInput.SetControls;
begin
  cboRelationship.ItemIndex := cboRelationship.Properties.Items.IndexOf(Relation.RelationshipName);
  txtFamilyName.Text := Relation.FamilyName;
  txtHealth.Text := Relation.Health;
  chkInMate.Checked := Relation.InMate;
  chkPay.Checked := Relation.Pay;
end;

end.
