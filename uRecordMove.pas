unit uRecordMove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGlobal, uConfig, uDB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxLabel, cxCalendar, cxDBLookupComboBox, Menus, cxGridDBTableView,
  ExtCtrls, ADODB, StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, cxClasses,
  cxGridCustomView, cxGrid, cxGroupBox, dxGDIPlusClasses, dxSkinBlueprint,
  dxSkinCaramel, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinscxPCPainter, cxNavigator;

type
  TfrmRecordMove = class(TForm)
    Image1: TImage;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGrid5: TcxGrid;
    cxGridDBTableView7: TcxGridDBTableView;
    cxGridDBBandedTableView5: TcxGridDBBandedTableView;
    cxGridDBTableView8: TcxGridDBTableView;
    cxGUpdate: TcxGridBandedTableView;
    cxGUpdateOldDate: TcxGridBandedColumn;
    cxGUpdateOldWard: TcxGridBandedColumn;
    cxGUpdateNewDate: TcxGridBandedColumn;
    cxGUpdateNewWard: TcxGridBandedColumn;
    cxGridLevel5: TcxGridLevel;
    btnSave: TcxButton;
    cxButton1: TcxButton;
    Panel1: TPanel;
    adoWard: TADOQuery;
    dsWard: TDataSource;
    TimerShow: TTimer;
    adoInOut: TADOQuery;
    dsInOut: TDataSource;
    adoWardHistory: TADOQuery;
    dsWardHistory: TDataSource;
    cxGrid2: TcxGrid;
    cxGInOut: TcxGridDBTableView;
    cxGInOutInDate: TcxGridDBColumn;
    cxGInOutOutDate: TcxGridDBColumn;
    cxGInOutBohumName: TcxGridDBColumn;
    cxGInOutWorkerName: TcxGridDBColumn;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGWardHistory: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBBandedTableView2: TcxGridDBBandedTableView;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecordMove: TfrmRecordMove;

implementation

{$R *.dfm}

end.
