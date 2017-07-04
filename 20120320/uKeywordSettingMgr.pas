unit uKeywordSettingMgr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, uFrameKeyword;

type
  TfrmKeywordSettingMgr = class(TForm)
    frameKeyword: TframeKeyword;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKeywordSettingMgr: TfrmKeywordSettingMgr;

implementation

{$R *.dfm}

procedure TfrmKeywordSettingMgr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frameKeyword.Close;
end;

procedure TfrmKeywordSettingMgr.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmKeywordSettingMgr.FormShow(Sender: TObject);
begin
  frameKeyword.Open(True);
end;

end.
