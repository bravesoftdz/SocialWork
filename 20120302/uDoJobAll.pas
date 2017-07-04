unit uDoJobAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, DB, ADODB, ExtCtrls, DBCtrls, DBCGrids, cxControls, cxStyles,
  dxSkinsCore, dxSkinCaramel, dxSkinscxPC3Painter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxMemo, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, dxLayoutContainer, cxGridLayoutView, cxGridDBLayoutView,
  cxGridCustomLayoutView, cxLabel, dxSkinBlack, dxSkinBlue, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue;

type
  TfrmDoJobAll = class(TForm)
    btnClose: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1PatientName: TcxGridDBColumn;
    cxGrid1DBTableView1Sex: TcxGridDBColumn;
    cxGrid1DBTableView1Birthday: TcxGridDBColumn;
    cxGrid1DBTableView1Result: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1EditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDoJobAll: TfrmDoJobAll;

implementation
uses uDB, uConfig, uDoJob;
{$R *.dfm}

procedure TfrmDoJobAll.cxGrid1DBTableView1EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
  begin
    if (ssShift in Shift) and (not frmDoJob.adoPP.Bof) then
    begin
      frmDoJob.adoPP.Prior;
      cxGrid1DBTableView1.Controller.FocusedColumnIndex := cxGrid1DBTableView1Result.Index;
      cxGrid1DBTableView1.Controller.FocusedColumn.Editing := True;

      Key := 0;
    end
    else if (not (ssShift in Shift)) and not frmDoJob.adoPP.eof then
    begin
      frmDoJob.adoPP.Next;
      cxGrid1DBTableView1.Controller.FocusedColumnIndex := cxGrid1DBTableView1Result.Index;
      cxGrid1DBTableView1.Controller.FocusedColumn.Editing := True;

      Key := 0;
    end;
  end;
end;

procedure TfrmDoJobAll.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if frmDoJob.adoPP.State in [dsInsert, dsEdit] then
    frmDoJob.adoPP.Post;
end;

procedure TfrmDoJobAll.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

end.
