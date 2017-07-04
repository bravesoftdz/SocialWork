unit uProgramInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel, cxCheckBox, cxTextEdit,
  StdCtrls, ExtCtrls, cxButtons, uGlobal, cxMaskEdit, cxDropDownEdit, cxLabel,
  cxColorComboBox, dxSkinOffice2007Blue, dxSkinBlack, dxSkinBlue, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmProgramInput = class(TForm)
    btnOK: TcxButton;
    btnClose: TcxButton;
    Panel1: TPanel;
    Label6: TLabel;
    chkUsed: TcxCheckBox;
    cxLabel1: TcxLabel;
    cboProgram: TcxComboBox;
    cxLabel2: TcxLabel;
    cboWard: TcxComboBox;
    txtProgramName: TcxTextEdit;
    Label1: TLabel;
    cxColor: TcxColorComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure SetControls;
    function isValidInput: Boolean;
  public
    { Public declarations }
    ProgramInfo: TProgramInfo;
  end;

var
  frmProgramInput: TfrmProgramInput;

implementation
uses uConfig, uDB;
{$R *.dfm}

procedure TfrmProgramInput.btnOKClick(Sender: TObject);
begin
  if not isValidInput then Exit;

  if oGlobal.YesNo('진행하시겠습니까?') = mrYes then
  begin
    if ProgramInfo.Mode = emAppend then
    begin
      ProgramInfo.ProgramTypeID := dbMain.GetProgramTypeID(cboProgram.Text);
      ProgramInfo.ProgramTypeName := cboProgram.Text;
    end;

    ProgramInfo.ProgramName := trim(txtProgramName.Text);
    ProgramInfo.Color := cxColor.ColorValue;
    ProgramInfo.WardID := dbMain.GetWardID(ProgramInfo.HospitalID, cboWard.Text);
    ProgramInfo.WardName := cboWard.Text;
    ProgramInfo.UseAll := cboWard.ItemIndex = 0;
    ProgramInfo.Used := chkUsed.Checked;

    ModalResult := mrOK;
  end;
end;

procedure TfrmProgramInput.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmProgramInput.FormShow(Sender: TObject);
begin
  if dbMain.GetWardList(ProgramInfo.HospitalID, cboWard.Properties.Items, True) then
    cboWard.ItemIndex := 0;

  if dbMain.GetProgramTypeList(cboProgram.Properties.Items, False) then
    cboProgram.ItemIndex := 0;

  SetControls;

  if ProgramInfo.Mode = emAppend then
    cboProgram.SetFocus
  else
    txtProgramName.SetFocus;
end;

function TfrmProgramInput.isValidInput: Boolean;
begin
  result := false;

  if cboProgram.ItemIndex < 0 then
  begin
    oGlobal.Msg('구분을 선택하십시오!');
    cboProgram.SetFocus;
    Exit;
  end;

  if cboWard.ItemIndex < 0 then
  begin
    oGlobal.Msg('사용병동을 선택하십시오!');
    cboWard.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(txtProgramName.Text) then
  begin
    oGlobal.Msg('프로그램이름을 입력하십시오!');
    txtProgramName.SetFocus;
    Exit;
  end;

  result := True;
end;

procedure TfrmProgramInput.SetControls;
begin
  cboProgram.ItemIndex := cboProgram.Properties.Items.IndexOf(ProgramInfo.ProgramTypeName);
  cboWard.ItemIndex := cboWard.Properties.Items.IndexOf(ProgramInfo.WardName);

  txtProgramName.Text := ProgramInfo.ProgramName;
  chkUsed.Checked := ProgramInfo.Used;

  cxColor.ColorValue := ProgramInfo.Color;

  cboProgram.Enabled := ProgramInfo.Mode = emAppend;
end;

end.
