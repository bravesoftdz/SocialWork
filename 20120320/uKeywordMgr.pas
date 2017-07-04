unit uKeywordMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrameKeyword, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, StdCtrls, cxButtons;

type
  TfrmKeywordMgr = class(TForm)
    frameKeyword: TframeKeyword;
    btnClose: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure frameKeywordcxKeywordTreeDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKeywordMgr: TfrmKeywordMgr;

implementation
uses uGlobal, uConfig;
{$R *.dfm}

procedure TfrmKeywordMgr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    ModalResult := mrClose;
end;

procedure TfrmKeywordMgr.FormShow(Sender: TObject);
begin
  frameKeyword.Open;
end;

procedure TfrmKeywordMgr.frameKeywordcxKeywordTreeDblClick(Sender: TObject);
begin
  if not frameKeyword.adoKeyword.isEmpty then
    ModalResult := mrOK;
end;

end.
