unit uPersonRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uGlobal, uConfig, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel, Menus,
  cxStyles, dxSkinscxPC3Painter, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxLabel, cxCheckBox, ADODB, cxGridLevel, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxDBEdit, cxTextEdit,
  StdCtrls, cxButtons, cxRadioGroup, cxMaskEdit, cxDropDownEdit, ExtCtrls;

type
  TfrmRatingMgr = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    cxLabel1: TcxLabel;
    cboWard: TcxComboBox;
    rIn: TcxRadioButton;
    btnSearch: TcxButton;
    rOut: TcxRadioButton;
    rAll: TcxRadioButton;
    cboSearchCondition: TcxComboBox;
    txtSearch: TcxTextEdit;
    cxGrid1: TcxGrid;
    cxGInOut: TcxGridDBTableView;
    cxGInOutPatientID: TcxGridDBColumn;
    cxGInOutPatientName: TcxGridDBColumn;
    cxGInOutSEX: TcxGridDBColumn;
    cxGInOutBIRTHDAY: TcxGridDBColumn;
    cxGInOutStateName: TcxGridDBColumn;
    cxGInOutOutDate: TcxGridDBColumn;
    cxGInOutDiagName: TcxGridDBColumn;
    cxGInOutWardName: TcxGridDBColumn;
    cxGInOutUserID: TcxGridDBColumn;
    cxGInOutDoctorID: TcxGridDBColumn;
    cxGInOutUsed: TcxGridDBColumn;
    cxGInOutHospitalID: TcxGridDBColumn;
    cxGInOutState: TcxGridDBColumn;
    cxGInOutWardID: TcxGridDBColumn;
    cxGInOutUserID1: TcxGridDBColumn;
    cxGInOutDoctorID1: TcxGridDBColumn;
    cxGInOutHospitalID_1: TcxGridDBColumn;
    cxGInOutPatientID_1: TcxGridDBColumn;
    cxGInOutUsed_1: TcxGridDBColumn;
    cxGInOutintake: TcxGridDBColumn;
    cxGInOutsurvey1: TcxGridDBColumn;
    cxGInOutsurvey2: TcxGridDBColumn;
    cxGInOutBed: TcxGridDBColumn;
    cxGInOutcounseling: TcxGridDBColumn;
    cxGInOuttraining: TcxGridDBColumn;
    cxGInOutInDate: TcxGridDBColumn;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    adoInOut: TADOQuery;
    dsInOut: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRatingMgr: TfrmRatingMgr;

implementation
uses uDB;

{$R *.dfm}

end.
