unit uLocationIDs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, uGlobal, cxControls, dxSkinsCore, dxSkinCaramel,
  dxSkinOffice2007Blue, cxContainer, cxEdit, cxListBox, ExtCtrls;

type
  TfrmSelectList = class(TForm)
    btnOK: TcxButton;
    btnClose: TcxButton;
    Panel1: TPanel;
    ListBoxAll: TcxListBox;
    ListBoxSelected: TcxListBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectList: TfrmSelectList;

implementation
uses uDB, uConfig;
{$R *.dfm}

procedure TfrmSelectList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

end.
