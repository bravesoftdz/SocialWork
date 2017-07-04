unit uShortKeyInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLabel, cxCheckBox, StdCtrls, ExtCtrls, cxButtons, cxMemo,
  uGlobal, dxSkinOffice2007Blue, dxSkinBlack, dxSkinBlue, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmShortKeyInput = class(TForm)
    btnOK: TcxButton;
    btnClose: TcxButton;
    Panel1: TPanel;
    Label6: TLabel;
    txtKeyword: TcxTextEdit;
    memoContent: TcxMemo;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    procedure ClearControls;
    procedure SetControls;
    function isValidInput: Boolean;
  public
    { Public declarations }
    ShortKey: TShortKeyInfo;
  end;

var
  frmShortKeyInput: TfrmShortKeyInput;

implementation
uses uConfig, uDB;
{$R *.dfm}

{ TfrmShortKeyInput }

procedure TfrmShortKeyInput.btnOKClick(Sender: TObject);
var
  sKeyword: string;
begin
  if isValidInput then
  begin
    sKeyword := trim(txtKeyword.Text);
    if (ShortKey.Mode = emAppend) and dbMain.isDuplicatedShortkey(oConfig.User.HospitalID, sKeyword) then
    begin
        oGlobal.Msg('같은 단축키가 있습니다!');
        txtKeyword.SetFocus;
        Exit;
    end;

    if (ShortKey.Mode = emUpdate) and (ShortKey.Keyword <> sKeyword) and
      dbMain.isDuplicatedShortkey(oConfig.User.HospitalID, sKeyword) then
    begin
      oGlobal.Msg('같은 단축키가 있습니다!');
      txtKeyword.SetFocus;
      Exit;
    end;

    if oGlobal.YesNo('진행하시겠습니까?') = mrYes then
    begin
      ShortKey.Keyword := sKeyword;
      ShortKey.Content := trim(memoContent.Lines.Text);
      ModalResult := mrOK;
    end;
  end;
end;

procedure TfrmShortKeyInput.ClearControls;
begin
  txtKeyword.Clear;
  memoContent.Lines.Clear;
end;

procedure TfrmShortKeyInput.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;  
end;

procedure TfrmShortKeyInput.FormShow(Sender: TObject);
begin
  ClearControls;
  SetControls;

  txtKeyword.SetFocus;
end;

function TfrmShortKeyInput.isValidInput: Boolean;
begin
  result := False;

  if oGlobal.isNullStr(txtKeyword.Text) then
  begin
    oGlobal.Msg('단축키를 입력하십시오!');
    txtKeyword.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(memoContent.Lines.Text) then
  begin
    oGlobal.Msg('내용을 입력하십시오!');
    memoContent.SetFocus;
    Exit;
  end;

  result := True;
end;

procedure TfrmShortKeyInput.SetControls;
begin
  txtKeyword.Text := ShortKey.Keyword;
  memoContent.Lines.Text := ShortKey.Content;
end;

end.
