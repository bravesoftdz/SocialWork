unit uDoJobAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, DB, ADODB, ExtCtrls, DBCtrls, DBCGrids, cxControls, cxStyles,
  dxSkinsCore, dxSkinCaramel, cxCustomData, cxFilter,
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
  dxSkinXmas2008Blue, ActnList, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxSkinscxPCPainter,
  cxNavigator, dxCore;

type
  TfrmDoJobAll = class(TForm)
    btnClose: TcxButton;
    cxGrid1: TcxGrid;
    cxGWrite: TcxGridDBTableView;
    cxGWritePatientName: TcxGridDBColumn;
    cxGWriteSex: TcxGridDBColumn;
    cxGWriteBirthday: TcxGridDBColumn;
    cxGWriteResult: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Label1: TLabel;
    Label2: TLabel;
    cxGWritePatientID: TcxGridDBColumn;
    Panel5: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGWriteEditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDoJobAll: TfrmDoJobAll;

implementation
uses uDB, uConfig, uDoJob, uGlobal;
{$R *.dfm}

procedure TfrmDoJobAll.cxGWriteEditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_TAB) then
  begin
    if (ssShift in Shift) and (not frmDoJob.adoPP.Bof) then
    begin
      frmDoJob.adoPP.Prior;
      cxGWrite.Controller.FocusedColumnIndex := cxGWriteResult.Index;
      cxGWrite.Controller.FocusedColumn.Editing := True;

      Key := 0;
    end
    else if (not (ssShift in Shift)) and not frmDoJob.adoPP.eof then
    begin
      frmDoJob.adoPP.Next;
      cxGWrite.Controller.FocusedColumnIndex := cxGWriteResult.Index;
      cxGWrite.Controller.FocusedColumn.Editing := True;

      Key := 0;
    end;
  end
  else if (AItem = cxGWriteResult) and (Key=VK_F1) then
    oGlobal.GetKeywordContent(TcxMemo(AEdit));
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

procedure TfrmDoJobAll.FormShow(Sender: TObject);
begin
  cxGWritePatientName.SortIndex := 0;
  cxGWritePatientName.SortOrder := soAscending;
end;

end.
