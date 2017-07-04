unit uSelectList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, uGlobal, cxControls, dxSkinsCore, dxSkinCaramel,
  dxSkinOffice2007Blue, cxContainer, cxEdit, cxListBox, ExtCtrls, cxLabel;

type
  TfrmSelectList = class(TForm)
    btnOK: TcxButton;
    btnClose: TcxButton;
    Panel1: TPanel;
    ListBoxAll: TcxListBox;
    ListBoxSelected: TcxListBox;
    btnRight: TcxButton;
    btnLeft: TcxButton;
    cxLabel6: TcxLabel;
    cxLabel1: TcxLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRightClick(Sender: TObject);
    procedure btnLeftClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    procedure SortList(oList: TStrings);
  public
    { Public declarations }
  end;

var
  frmSelectList: TfrmSelectList;

implementation
uses uDB, uConfig;
{$R *.dfm}

procedure TfrmSelectList.btnLeftClick(Sender: TObject);
var
  str: string;
begin
  if ListBoxSelected.ItemIndex < 0 then
    Exit;

  str := ListBoxSelected.Items[ListBoxSelected.ItemIndex];

  ListBoxSelected.Items.Delete(ListBoxSelected.ItemIndex);
  ListBoxAll.Items.Add(str);
  SortList(ListBoxAll.Items);
end;

procedure TfrmSelectList.btnOKClick(Sender: TObject);
begin
  if ListBoxSelected.Items.Count > 0 then
    ModalResult := mrOK
  else
    oGlobal.Msg('선택된 내용이 없습니다!');
end;

procedure TfrmSelectList.btnRightClick(Sender: TObject);
var
  str: string;
begin
  if ListBoxAll.ItemIndex < 0 then
    Exit;

  str := ListBoxAll.Items[ListBoxAll.ItemIndex];

  ListBoxAll.Items.Delete(ListBoxAll.ItemIndex);
  ListBoxSelected.Items.Add(str);
  SortList(ListBoxSelected.Items);
end;

procedure TfrmSelectList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmSelectList.FormShow(Sender: TObject);
var
  n, nIndex: integer;
begin
  if ListBoxSelected.Items.Count < 1 then
    Exit;

  for n := 0 to ListBoxSelected.Items.Count - 1 do
  begin
    nIndex := ListBoxAll.Items.IndexOf(ListBoxSelected.Items[n]);
    if nIndex >= 0 then
      ListBoxAll.Items.Delete(nIndex);
  end;
end;

procedure TfrmSelectList.SortList(oList: TStrings);
var
  sTemp: string;
  i, j: integer;
begin
  for i := 0 to oList.Count - 1 do
    for j := 0 to oList.Count - 1 do
      if oList[i] > oList[j] then
      begin
        sTemp := oList[j];
        oList[j] := oList[i];
        oList[i] := sTemp;
      end;
end;

end.
