unit uFrameShortKey;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinCaramel, dxSkinscxPC3Painter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, Menus, cxContainer,
  ADODB, cxTextEdit, cxMemo, cxDBEdit, StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxTL, cxMaskEdit, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, cxDBTL, cxTLData, dxmdaset, cxGroupBox, cxRadioGroup,
  dxSkinBlack, dxSkinBlue, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue;

type
  TFrame1 = class(TFrame)
    cxDBMemo1: TcxDBMemo;
    btnClose: TcxButton;
    adoKeyword: TADOQuery;
    dsKeyword: TDataSource;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn1: TcxDBTreeListColumn;
    T1: TdxMemData;
    T1Pr_id: TAutoIncField;
    T1Pr_parent: TIntegerField;
    T1Pr_name: TStringField;
    T1Pr_bdate: TDateField;
    T1Pr_edate: TDateField;
    T1Image: TSmallintField;
    DS1: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1Pr_id: TcxGridDBColumn;
    cxGrid1DBTableView1Pr_parent: TcxGridDBColumn;
    cxGrid1DBTableView1Pr_name: TcxGridDBColumn;
    cxGrid1DBTableView1Pr_bdate: TcxGridDBColumn;
    cxGrid1DBTableView1Pr_edate: TcxGridDBColumn;
    cxGrid1DBTableView1Image: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    txtSearch: TcxTextEdit;
    Label1: TLabel;
    cxTextEdit1: TcxTextEdit;
    cxRadioGroup1: TcxRadioGroup;
    btnShortKeyAppend: TcxButton;
    btnShortKeyUpdate: TcxButton;
    btnShortKeyDelete: TcxButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
