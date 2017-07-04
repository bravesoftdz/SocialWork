unit uRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPC3Painter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLabel, cxCheckBox, StdCtrls, ADODB,
  cxGridLevel, cxGridBandedTableView, cxGridDBBandedTableView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, ExtCtrls, cxPCdxBarPopupMenu, cxPC, ActnList,
  cxContainer, cxTextEdit, cxDBEdit, cxRadioGroup, cxMaskEdit, cxDropDownEdit,
  Menus, cxButtons, QRPrntr, uGlobal, QuickRpt, QRCtrls, qrFramelines, Grids,
  DBGrids, qrpctrls, qrpBaseCtrls, cxGroupBox, Buttons, cxSpinEdit, SupComps,
  jpeg, printers;

type
  TfrmRecord = class(TForm)
    adoInOut: TADOQuery;
    dsInOut: TDataSource;
    pnlLeft: TPanel;
    ActionList1: TActionList;
    actSelectWard: TAction;
    dsIntake: TDataSource;
    dsSurvey1: TDataSource;
    dsSurvey2: TDataSource;
    dsCounseling: TDataSource;
    dsTraining: TDataSource;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Panel6: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxGrid1: TcxGrid;
    cxGInOut: TcxGridDBTableView;
    cxGInOutPatientID: TcxGridDBColumn;
    cxGInOutPatientName: TcxGridDBColumn;
    cxGInOutSEX: TcxGridDBColumn;
    cxGInOutStateName: TcxGridDBColumn;
    cxGInOutWardName: TcxGridDBColumn;
    cxGInOutintake: TcxGridDBColumn;
    cxGInOutsurvey1: TcxGridDBColumn;
    cxGInOutsurvey2: TcxGridDBColumn;
    cxGInOutcounseling: TcxGridDBColumn;
    cxGInOuttraining: TcxGridDBColumn;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    rIn: TcxRadioButton;
    btnSearch: TcxButton;
    rOut: TcxRadioButton;
    rAll: TcxRadioButton;
    cboSearchCondition: TcxComboBox;
    txtSearch: TcxTextEdit;
    Splitter1: TSplitter;
    cxPage: TcxPageControl;
    cxTabIntake: TcxTabSheet;
    Panel8: TPanel;
    btnIntakePreviewFit: TSpeedButton;
    btnIntakePreviewWidth: TSpeedButton;
    btnIntakePreview100: TSpeedButton;
    Label1: TLabel;
    Label10: TLabel;
    btnIntakeDelete: TcxButton;
    btnIntakeUpdate: TcxButton;
    btnIntakeAppend: TcxButton;
    btnIntakePrior: TcxButton;
    btnIntakeNext: TcxButton;
    pnlIntakePageNum: TPanel;
    btnIntakePrinterSetup: TcxButton;
    btnIntakePrint: TcxButton;
    cxSEIntakeZoom: TcxSpinEdit;
    QRPreviewIntake: TQRPreview;
    cxTabSurvey1: TcxTabSheet;
    Panel7: TPanel;
    btnSurvey1PreviewFit: TSpeedButton;
    btnSurvey1PreviewWidth: TSpeedButton;
    btnSurvey1Preview100: TSpeedButton;
    Label4: TLabel;
    Label11: TLabel;
    btnSurvey1Delete: TcxButton;
    btnSurvey1Update: TcxButton;
    btnSurvey1Append: TcxButton;
    btnSurvey1Prior: TcxButton;
    btnSurvey1Next: TcxButton;
    pnlSurvey1PageNum: TPanel;
    btnSurvey1PrinterSetup: TcxButton;
    btnSurvey1Print: TcxButton;
    cxSESurvey1Zoom: TcxSpinEdit;
    QRPreviewSurvey1: TQRPreview;
    cxTabSurvey2: TcxTabSheet;
    Panel9: TPanel;
    btnSurvey2PreviewFit: TSpeedButton;
    btnSurvey2PreviewWidth: TSpeedButton;
    btnSurvey2Preview100: TSpeedButton;
    Label12: TLabel;
    Label13: TLabel;
    btnSurvey2Delete: TcxButton;
    btnSurvey2Update: TcxButton;
    btnSurvey2Append: TcxButton;
    btnSurvey2Prior: TcxButton;
    btnSurvey2Next: TcxButton;
    pnlSurvey2PageNum: TPanel;
    btnSurvey2PrinterSetup: TcxButton;
    btnSurvey2Print: TcxButton;
    cxSESurvey2Zoom: TcxSpinEdit;
    QRPreviewSurvey2: TQRPreview;
    cxTabCounseling: TcxTabSheet;
    Panel10: TPanel;
    btnCounselingPreviewFit: TSpeedButton;
    btnCounselingPreviewWidth: TSpeedButton;
    btnCounselingPreview100: TSpeedButton;
    Label14: TLabel;
    Label15: TLabel;
    btnCounselingDelete: TcxButton;
    btnCounselingUpdate: TcxButton;
    btnCounselingAppend: TcxButton;
    btnCounselingPrior: TcxButton;
    btnCounselingNext: TcxButton;
    pnlCounselingPageNum: TPanel;
    btnCounselingPrinterSetup: TcxButton;
    btnCounselingPrint: TcxButton;
    cxSECounselingZoom: TcxSpinEdit;
    QRPreviewCounseling: TQRPreview;
    cxGrid2: TcxGrid;
    cxGCounseling: TcxGridDBTableView;
    cxGCounselingSeq: TcxGridDBColumn;
    cxGCounselingMeetingDate: TcxGridDBColumn;
    cxGCounselingWriteDate: TcxGridDBColumn;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxTabTraining: TcxTabSheet;
    Panel11: TPanel;
    btnTrainingPreviewFit: TSpeedButton;
    btnTrainingPreviewWidth: TSpeedButton;
    btnTrainingPreview100: TSpeedButton;
    Label16: TLabel;
    Label17: TLabel;
    btnTrainingDelete: TcxButton;
    btnTrainingUpdate: TcxButton;
    btnTrainingAppend: TcxButton;
    btnTrainingPrior: TcxButton;
    btnTrainingNext: TcxButton;
    pnlTrainingPageNum: TPanel;
    btnTrainingPrinterSetup: TcxButton;
    btnTrainingPrint: TcxButton;
    cxSETrainingZoom: TcxSpinEdit;
    QRPreviewTraining: TQRPreview;
    cxGrid3: TcxGrid;
    cxGTraining: TcxGridDBTableView;
    cxGTrainingSeq: TcxGridDBColumn;
    cxGTrainingMeetingDate: TcxGridDBColumn;
    cxGTrainingWriteDate: TcxGridDBColumn;
    cxGridDBBandedTableView2: TcxGridDBBandedTableView;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    tabPrint: TcxTabSheet;
    pagePrint: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    ScrollBox1: TScrollBox;
    QRIntake: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    qrlblIntakeSexAge: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    childIntakeInMotivation: TQRChildBand;
    cxTabSheet3: TcxTabSheet;
    ScrollBox2: TScrollBox;
    QRSurvey1: TQuickRep;
    DetailBand1: TQRBand;
    cxTabSheet1: TcxTabSheet;
    ScrollBox3: TScrollBox;
    cxTabSheet4: TcxTabSheet;
    ScrollBox4: TScrollBox;
    cxTabSheet5: TcxTabSheet;
    ScrollBox5: TScrollBox;
    actPreviewZoom: TAction;
    actPrint: TAction;
    actPrintSetup: TAction;
    actSelectPageNum: TAction;
    ScrollBox6: TScrollBox;
    QRSurvey2: TQuickRep;
    QRBand3: TQRBand;
    QRLabel21: TQRLabel;
    QRBand4: TQRBand;
    ScrollBox7: TScrollBox;
    QRCounseling: TQuickRep;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    ScrollBox8: TScrollBox;
    QRTraining: TQuickRep;
    QRBand7: TQRBand;
    QRBand8: TQRBand;
    actChangeIntake: TAction;
    actChangeSurvey1: TAction;
    actChangeSurvey2: TAction;
    actChangeCounseling: TAction;
    actChangeTraining: TAction;
    lblAddress: TLabel;
    QRLabel20: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel32: TQRLabel;
    QRDBText12: TQRDBText;
    ChildBand3: TQRChildBand;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    qrMemoSurvey1Relation: TQRMemo;
    qrMemoSurvey1Name: TQRMemo;
    qrMemoSurvey1InMate: TQRMemo;
    qrMemoSurvey1Health: TQRMemo;
    qrMemoSurvey1Pay: TQRMemo;
    QRLabel53: TQRLabel;
    ChildBand4: TQRChildBand;
    QRLabel54: TQRLabel;
    chkSurvey1Housing0: TQRPCheckBox;
    QRLabel55: TQRLabel;
    chkSurvey1Housing1: TQRPCheckBox;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    chkSurvey1Housing2: TQRPCheckBox;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    chkSurvey1Housing3: TQRPCheckBox;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    chkSurvey1Housing4: TQRPCheckBox;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    qrlblSurvey1Year1: TQRLabel;
    qrlblSurvey1Month2: TQRLabel;
    qrlblSurvey1Year3: TQRLabel;
    qrlblSurvey1Month3: TQRLabel;
    qrlblSurvey1Month4: TQRLabel;
    QRLabel65: TQRLabel;
    chkSurvey1Economic0: TQRPCheckBox;
    QRLabel66: TQRLabel;
    chkSurvey1Economic1: TQRPCheckBox;
    QRLabel67: TQRLabel;
    chkSurvey1Economic2: TQRPCheckBox;
    QRLabel69: TQRLabel;
    chkSurvey1Economic3: TQRPCheckBox;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    chkSurvey1Economic4: TQRPCheckBox;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    qrlblEconomic3: TQRLabel;
    qrlblEconomic6: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    chkSurvey1Economic5: TQRPCheckBox;
    QRLabel68: TQRLabel;
    chkSurvey1Economic6: TQRPCheckBox;
    QRLabel70: TQRLabel;
    QRLabel73: TQRLabel;
    chkSurvey1Career0: TQRPCheckBox;
    QRLabel76: TQRLabel;
    chkSurvey1Career1: TQRPCheckBox;
    QRLabel77: TQRLabel;
    chkSurvey1Career2: TQRPCheckBox;
    QRLabel79: TQRLabel;
    chkSurvey1Career3: TQRPCheckBox;
    QRLabel83: TQRLabel;
    chkSurvey1Career4: TQRPCheckBox;
    QRLabel84: TQRLabel;
    chkSurvey1Career5: TQRPCheckBox;
    QRLabel85: TQRLabel;
    chkSurvey1Career6: TQRPCheckBox;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel90: TQRLabel;
    chkSurvey1ArmyCareer0: TQRPCheckBox;
    QRLabel91: TQRLabel;
    chkSurvey1ArmyCareer1: TQRPCheckBox;
    QRLabel92: TQRLabel;
    chkSurvey1ArmyCareer2: TQRPCheckBox;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel95: TQRLabel;
    chkSurvey1Protector0: TQRPCheckBox;
    QRLabel96: TQRLabel;
    chkSurvey1Protector1: TQRPCheckBox;
    QRLabel97: TQRLabel;
    chkSurvey1Protector2: TQRPCheckBox;
    QRLabel98: TQRLabel;
    chkSurvey1Protector3: TQRPCheckBox;
    QRLabel99: TQRLabel;
    chkSurvey1Protector4: TQRPCheckBox;
    QRLabel100: TQRLabel;
    chkSurvey1Protector5: TQRPCheckBox;
    사위: TQRLabel;
    chkSurvey1Protector6: TQRPCheckBox;
    기타: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    chkSurvey1ToSolveProblem0: TQRPCheckBox;
    QRLabel103: TQRLabel;
    chkSurvey1ToSolveProblem1: TQRPCheckBox;
    QRLabel104: TQRLabel;
    chkSurvey1ToSolveProblem2: TQRPCheckBox;
    QRLabel106: TQRLabel;
    chkSurvey1ToSolveProblem3: TQRPCheckBox;
    QRLabel108: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel105: TQRLabel;
    chkSurvey1Expectation0: TQRPCheckBox;
    QRLabel109: TQRLabel;
    chkSurvey1Expectation1: TQRPCheckBox;
    QRLabel111: TQRLabel;
    chkSurvey1Expectation2: TQRPCheckBox;
    QRLabel114: TQRLabel;
    chkSurvey1Expectation3: TQRPCheckBox;
    QRLabel116: TQRLabel;
    QRLabel118: TQRLabel;
    chkSurvey1Expectation4: TQRPCheckBox;
    QRLabel119: TQRLabel;
    chkSurvey1Expectation5: TQRPCheckBox;
    QRLabel121: TQRLabel;
    QRLabel117: TQRLabel;
    QRDBText19: TQRDBText;
    childSurvey1ResourceAfterLeaving: TQRChildBand;
    QRLabel110: TQRLabel;
    qrMemoSurvey1ResourceAfterLeavingBody: TQRMemo;
    QRLabel107: TQRLabel;
    childSurvey1ETC: TQRChildBand;
    QRLabel120: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel27: TQRLabel;
    qrMemoAddress: TQRMemo;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape24: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    chkSurvey1Male: TQRPCheckBox;
    QRLabel35: TQRLabel;
    chkSurvey1FeMale: TQRPCheckBox;
    QRLabel36: TQRLabel;
    chkSurvey1Religion0: TQRPCheckBox;
    QRLabel37: TQRLabel;
    chkSurvey1Religion1: TQRPCheckBox;
    QRLabel38: TQRLabel;
    chkSurvey1Religion2: TQRPCheckBox;
    QRLabel39: TQRLabel;
    chkSurvey1Religion3: TQRPCheckBox;
    QRLabel40: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    chkSurvey1Insu0: TQRPCheckBox;
    QRLabel43: TQRLabel;
    chkSurvey1Insu1: TQRPCheckBox;
    QRLabel44: TQRLabel;
    chkSurvey1Insu2: TQRPCheckBox;
    QRLabel45: TQRLabel;
    chkSurvey1Insu3: TQRPCheckBox;
    QRLabel46: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel47: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo6: TQRMemo;
    QRMemo7: TQRMemo;
    QRMemo8: TQRMemo;
    QRMemo9: TQRMemo;
    QRMemo10: TQRMemo;
    QRMemo11: TQRMemo;
    QRMemo12: TQRMemo;
    QRMemo13: TQRMemo;
    QRMemo14: TQRMemo;
    QRMemo15: TQRMemo;
    QRMemo16: TQRMemo;
    QRMemo17: TQRMemo;
    QRMemo18: TQRMemo;
    QRMemo19: TQRMemo;
    QRMemo21: TQRMemo;
    QRMemo22: TQRMemo;
    QRMemo23: TQRMemo;
    QRLabel123: TQRLabel;
    QRMemo24: TQRMemo;
    QRLabel124: TQRLabel;
    QRMemo25: TQRMemo;
    QRLabel50: TQRLabel;
    qrMemoSurvey1FamilyTitle: TQRMemo;
    QRMemo20: TQRMemo;
    QRMemo26: TQRMemo;
    QRMemo27: TQRMemo;
    QRMemo28: TQRMemo;
    QRMemo29: TQRMemo;
    QRMemo30: TQRMemo;
    QRMemo31: TQRMemo;
    QRMemo32: TQRMemo;
    QRMemo33: TQRMemo;
    QRMemo35: TQRMemo;
    QRMemo34: TQRMemo;
    QRMemo36: TQRMemo;
    QRMemo37: TQRMemo;
    QRMemo38: TQRMemo;
    QRMemo39: TQRMemo;
    QRMemo40: TQRMemo;
    QRMemo41: TQRMemo;
    QRMemo42: TQRMemo;
    QRMemo43: TQRMemo;
    QRMemo44: TQRMemo;
    qrMemoSurvey1ResourceAfterLeavingTitle: TQRMemo;
    qrMemoSurvey1ETCTitle: TQRMemo;
    QRMemo45: TQRMemo;
    QRMemo46: TQRMemo;
    Timer1: TTimer;
    QRLabel51: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel52: TQRLabel;
    QRMemo3: TQRMemo;
    QRDBText20: TQRDBText;
    QRMemo4: TQRMemo;
    QRLabel78: TQRLabel;
    QRMemo5: TQRMemo;
    qrlblSurvey2SexAge: TQRLabel;
    QRMemo47: TQRMemo;
    QRLabel125: TQRLabel;
    QRMemo48: TQRMemo;
    QRDBText21: TQRDBText;
    QRMemo49: TQRMemo;
    QRLabel126: TQRLabel;
    QRMemo50: TQRMemo;
    QRMemo51: TQRMemo;
    QRLabel128: TQRLabel;
    QRMemo52: TQRMemo;
    QRDBText22: TQRDBText;
    QRMemo53: TQRMemo;
    QRLabel129: TQRLabel;
    QRMemo54: TQRMemo;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    ChildBand9: TQRChildBand;
    QRMemo55: TQRMemo;
    QRLabel127: TQRLabel;
    QRMemo56: TQRMemo;
    QRLabel130: TQRLabel;
    QRLabel131: TQRLabel;
    QRMemo57: TQRMemo;
    QRLabel132: TQRLabel;
    QRMemo58: TQRMemo;
    QRLabel133: TQRLabel;
    QRMemo59: TQRMemo;
    QRLabel134: TQRLabel;
    QRMemo60: TQRMemo;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRMemo61: TQRMemo;
    QRLabel137: TQRLabel;
    QRMemo62: TQRMemo;
    QRMemo63: TQRMemo;
    QRMemo64: TQRMemo;
    QRMemo65: TQRMemo;
    QRMemo66: TQRMemo;
    QRMemo67: TQRMemo;
    QRLabel138: TQRLabel;
    QRMemo68: TQRMemo;
    QRMemo69: TQRMemo;
    QRMemo70: TQRMemo;
    QRMemo71: TQRMemo;
    QRMemo72: TQRMemo;
    QRMemo73: TQRMemo;
    QRLabel139: TQRLabel;
    QRMemo74: TQRMemo;
    QRMemo75: TQRMemo;
    QRMemo76: TQRMemo;
    QRMemo77: TQRMemo;
    QRMemo78: TQRMemo;
    QRMemo79: TQRMemo;
    QRLabel140: TQRLabel;
    QRMemo80: TQRMemo;
    QRMemo81: TQRMemo;
    QRMemo82: TQRMemo;
    QRMemo83: TQRMemo;
    QRMemo84: TQRMemo;
    QRMemo85: TQRMemo;
    QRLabel141: TQRLabel;
    QRMemo86: TQRMemo;
    QRMemo87: TQRMemo;
    QRMemo88: TQRMemo;
    QRMemo89: TQRMemo;
    QRMemo90: TQRMemo;
    QRMemo91: TQRMemo;
    QRLabel142: TQRLabel;
    QRMemo92: TQRMemo;
    QRMemo93: TQRMemo;
    QRMemo94: TQRMemo;
    QRMemo95: TQRMemo;
    QRMemo96: TQRMemo;
    QRMemo97: TQRMemo;
    QRLabel143: TQRLabel;
    QRMemo98: TQRMemo;
    QRMemo99: TQRMemo;
    QRMemo100: TQRMemo;
    QRMemo101: TQRMemo;
    QRMemo102: TQRMemo;
    QRMemo103: TQRMemo;
    QRLabel144: TQRLabel;
    QRMemo104: TQRMemo;
    QRMemo105: TQRMemo;
    QRMemo106: TQRMemo;
    QRMemo107: TQRMemo;
    QRMemo108: TQRMemo;
    QRMemo109: TQRMemo;
    QRLabel145: TQRLabel;
    QRMemo110: TQRMemo;
    QRMemo111: TQRMemo;
    QRMemo112: TQRMemo;
    QRMemo113: TQRMemo;
    QRMemo114: TQRMemo;
    QRMemo115: TQRMemo;
    QRLabel146: TQRLabel;
    QRMemo116: TQRMemo;
    QRMemo117: TQRMemo;
    QRMemo118: TQRMemo;
    QRMemo119: TQRMemo;
    QRMemo120: TQRMemo;
    QRMemo121: TQRMemo;
    QRLabel147: TQRLabel;
    QRMemo122: TQRMemo;
    QRMemo123: TQRMemo;
    QRMemo124: TQRMemo;
    QRMemo125: TQRMemo;
    QRMemo126: TQRMemo;
    QRMemo127: TQRMemo;
    QRLabel148: TQRLabel;
    QRMemo128: TQRMemo;
    QRMemo129: TQRMemo;
    QRMemo130: TQRMemo;
    QRMemo131: TQRMemo;
    QRMemo133: TQRMemo;
    QRLabel149: TQRLabel;
    QRMemo134: TQRMemo;
    QRMemo135: TQRMemo;
    QRMemo136: TQRMemo;
    QRMemo137: TQRMemo;
    QRMemo138: TQRMemo;
    lblSurvey2Q11: TQRLabel;
    lblSurvey2Q12: TQRLabel;
    lblSurvey2Q13: TQRLabel;
    lblSurvey2Q14: TQRLabel;
    lblSurvey2Q15: TQRLabel;
    lblSurvey2Q21: TQRLabel;
    lblSurvey2Q22: TQRLabel;
    lblSurvey2Q23: TQRLabel;
    lblSurvey2Q24: TQRLabel;
    lblSurvey2Q25: TQRLabel;
    lblSurvey2Q31: TQRLabel;
    lblSurvey2Q32: TQRLabel;
    lblSurvey2Q33: TQRLabel;
    lblSurvey2Q34: TQRLabel;
    lblSurvey2Q35: TQRLabel;
    lblSurvey2Q41: TQRLabel;
    lblSurvey2Q42: TQRLabel;
    lblSurvey2Q43: TQRLabel;
    lblSurvey2Q44: TQRLabel;
    lblSurvey2Q45: TQRLabel;
    lblSurvey2Q51: TQRLabel;
    lblSurvey2Q52: TQRLabel;
    lblSurvey2Q53: TQRLabel;
    lblSurvey2Q54: TQRLabel;
    lblSurvey2Q55: TQRLabel;
    lblSurvey2Q61: TQRLabel;
    lblSurvey2Q62: TQRLabel;
    lblSurvey2Q63: TQRLabel;
    lblSurvey2Q64: TQRLabel;
    lblSurvey2Q65: TQRLabel;
    lblSurvey2Q71: TQRLabel;
    lblSurvey2Q72: TQRLabel;
    lblSurvey2Q73: TQRLabel;
    lblSurvey2Q74: TQRLabel;
    lblSurvey2Q75: TQRLabel;
    lblSurvey2Q81: TQRLabel;
    lblSurvey2Q82: TQRLabel;
    lblSurvey2Q83: TQRLabel;
    lblSurvey2Q84: TQRLabel;
    lblSurvey2Q85: TQRLabel;
    lblSurvey2Q91: TQRLabel;
    lblSurvey2Q92: TQRLabel;
    lblSurvey2Q93: TQRLabel;
    lblSurvey2Q94: TQRLabel;
    lblSurvey2Q95: TQRLabel;
    lblSurvey2Q101: TQRLabel;
    lblSurvey2Q102: TQRLabel;
    lblSurvey2Q103: TQRLabel;
    lblSurvey2Q104: TQRLabel;
    lblSurvey2Q105: TQRLabel;
    lblSurvey2Q111: TQRLabel;
    lblSurvey2Q112: TQRLabel;
    lblSurvey2Q113: TQRLabel;
    lblSurvey2Q114: TQRLabel;
    lblSurvey2Q115: TQRLabel;
    lblSurvey2Q121: TQRLabel;
    lblSurvey2Q122: TQRLabel;
    lblSurvey2Q123: TQRLabel;
    lblSurvey2Q124: TQRLabel;
    lblSurvey2Q125: TQRLabel;
    lblSurvey2Q131: TQRLabel;
    lblSurvey2Q132: TQRLabel;
    lblSurvey2Q133: TQRLabel;
    lblSurvey2Q134: TQRLabel;
    lblSurvey2Q135: TQRLabel;
    QRMemo139: TQRMemo;
    QRLabel215: TQRLabel;
    QRMemo140: TQRMemo;
    QRMemo141: TQRMemo;
    QRMemo142: TQRMemo;
    QRMemo143: TQRMemo;
    QRMemo144: TQRMemo;
    lblSurvey2Q141: TQRLabel;
    lblSurvey2Q142: TQRLabel;
    lblSurvey2Q143: TQRLabel;
    lblSurvey2Q144: TQRLabel;
    lblSurvey2Q145: TQRLabel;
    QRLabel221: TQRLabel;
    ChildBand10: TQRChildBand;
    qrMemoSurvey2WorkerOpinionBody: TQRMemo;
    ChildBand11: TQRChildBand;
    QRLabel222: TQRLabel;
    QRShape18: TQRShape;
    QRMemo200: TQRMemo;
    QRMemo132: TQRMemo;
    QRLabel150: TQRLabel;
    QRMemo145: TQRMemo;
    QRMemo146: TQRMemo;
    QRLabel151: TQRLabel;
    QRMemo147: TQRMemo;
    QRMemo148: TQRMemo;
    QRLabel152: TQRLabel;
    QRMemo149: TQRMemo;
    QRMemo150: TQRMemo;
    QRLabel153: TQRLabel;
    QRMemo151: TQRMemo;
    QRMemo152: TQRMemo;
    QRLabel154: TQRLabel;
    QRMemo153: TQRMemo;
    QRMemo154: TQRMemo;
    QRLabel2: TQRLabel;
    QRMemo155: TQRMemo;
    QRMemo156: TQRMemo;
    QRLabel4: TQRLabel;
    QRMemo157: TQRMemo;
    QRMemo158: TQRMemo;
    QRLabel5: TQRLabel;
    QRMemo159: TQRMemo;
    QRLabel3: TQRLabel;
    childIntakeMajorProblem: TQRChildBand;
    childIntakeInHistory: TQRChildBand;
    childIntakePersonHistory: TQRChildBand;
    childIntakeRelationship: TQRChildBand;
    qrMemoInMotivationBody: TQRMemo;
    qrMemoInMotivationTitle: TQRMemo;
    qrMemoMajorProblemBody: TQRMemo;
    qrMemoMajorProblemTitle: TQRMemo;
    QRLabel6: TQRLabel;
    qrMemoInHistoryBody: TQRMemo;
    qrMemoInHistoryTitle: TQRMemo;
    QRLabel7: TQRLabel;
    QRMemo160: TQRMemo;
    QRMemo161: TQRMemo;
    qrMemoInMotivation: TQRMemo;
    qrMemoMajorProblem: TQRMemo;
    childIntakeWorkerOpinion: TQRChildBand;
    ChildBand2: TQRChildBand;
    qrMemoPersonHistoryBody: TQRMemo;
    qrMemoPersonHistoryTitle: TQRMemo;
    QRLabel8: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel158: TQRLabel;
    qrMemoWorkerOpinionBody: TQRMemo;
    qrMemoWorkerOpinionTitle: TQRMemo;
    QRLabel157: TQRLabel;
    QRLabel10: TQRLabel;
    QRShape17: TQRShape;
    qrMemoRelationshipTitle: TQRMemo;
    QRLabel9: TQRLabel;
    QRLabel155: TQRLabel;
    QRMemoFamilyRelationship: TQRMemo;
    QRMemoFamilyName: TQRMemo;
    qrMemoRelationship: TQRMemo;
    qrMemoInHistory: TQRMemo;
    qrMemoPersonHistory: TQRMemo;
    QRMemo163: TQRMemo;
    qrMemoWorkerOpinion: TQRMemo;
    QRMemo162: TQRMemo;
    QRMemo166: TQRMemo;
    qrMemoSurvey1ResourceAfterLeaving: TQRMemo;
    qrMemoSurvey1ETC: TQRMemo;
    ChildBand1: TQRChildBand;
    qrMemoSurvey1ETCBody: TQRMemo;
    QRLabel115: TQRLabel;
    QRShape59: TQRShape;
    PageFooterBand1: TQRBand;
    QRLabel122: TQRLabel;
    qrMemoSurvey2WorkerOpinion: TQRMemo;
    lblCounselingTitle: TQRLabel;
    QRMemo167: TQRMemo;
    QRLabel11: TQRLabel;
    QRMemo168: TQRMemo;
    QRDBText25: TQRDBText;
    QRMemo169: TQRMemo;
    QRLabel13: TQRLabel;
    QRMemo170: TQRMemo;
    qrlblCounselingSexAge: TQRLabel;
    QRMemo171: TQRMemo;
    QRLabel15: TQRLabel;
    QRMemo172: TQRMemo;
    QRDBText26: TQRDBText;
    QRMemo173: TQRMemo;
    QRLabel16: TQRLabel;
    QRMemo174: TQRMemo;
    QRMemo175: TQRMemo;
    QRLabel17: TQRLabel;
    QRMemo176: TQRMemo;
    QRDBText27: TQRDBText;
    QRMemo177: TQRMemo;
    QRLabel18: TQRLabel;
    QRMemo178: TQRMemo;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRMemo179: TQRMemo;
    QRMemo180: TQRMemo;
    QRLabel19: TQRLabel;
    QRLabel22: TQRLabel;
    QRMemo181: TQRMemo;
    QRMemo182: TQRMemo;
    QRMemo183: TQRMemo;
    QRLabel159: TQRLabel;
    lblCounselingA1: TQRLabel;
    QRMemo184: TQRMemo;
    QRMemo185: TQRMemo;
    QRLabel161: TQRLabel;
    lblCounselingA2: TQRLabel;
    QRMemo186: TQRMemo;
    QRMemo187: TQRMemo;
    QRLabel163: TQRLabel;
    lblCounselingA3: TQRLabel;
    QRMemo188: TQRMemo;
    QRMemo189: TQRMemo;
    QRLabel165: TQRLabel;
    lblCounselingA4: TQRLabel;
    QRMemo190: TQRMemo;
    QRMemo191: TQRMemo;
    QRLabel167: TQRLabel;
    lblCounselingA5: TQRLabel;
    QRMemo192: TQRMemo;
    QRMemo193: TQRMemo;
    QRMemo194: TQRMemo;
    QRLabel169: TQRLabel;
    lblCounselingB1: TQRLabel;
    QRMemo195: TQRMemo;
    QRMemo196: TQRMemo;
    QRLabel171: TQRLabel;
    lblCounselingB2: TQRLabel;
    QRMemo197: TQRMemo;
    QRMemo198: TQRMemo;
    QRLabel173: TQRLabel;
    lblCounselingB3: TQRLabel;
    QRMemo199: TQRMemo;
    QRMemo201: TQRMemo;
    QRLabel175: TQRLabel;
    lblCounselingB4: TQRLabel;
    QRMemo202: TQRMemo;
    QRMemo203: TQRMemo;
    QRLabel177: TQRLabel;
    lblCounselingB5: TQRLabel;
    QRMemo204: TQRMemo;
    QRMemo205: TQRMemo;
    QRMemo206: TQRMemo;
    QRLabel12: TQRLabel;
    lblCounselingC1: TQRLabel;
    QRMemo207: TQRMemo;
    QRMemo208: TQRMemo;
    QRLabel180: TQRLabel;
    lblCounselingC2: TQRLabel;
    QRMemo209: TQRMemo;
    QRMemo210: TQRMemo;
    QRLabel182: TQRLabel;
    lblCounselingC3: TQRLabel;
    QRMemo211: TQRMemo;
    QRMemo212: TQRMemo;
    QRMemo213: TQRMemo;
    QRLabel184: TQRLabel;
    lblCounselingD1: TQRLabel;
    QRMemo214: TQRMemo;
    QRMemo215: TQRMemo;
    QRLabel186: TQRLabel;
    lblCounselingD2: TQRLabel;
    QRMemo216: TQRMemo;
    QRMemo217: TQRMemo;
    QRMemo218: TQRMemo;
    QRLabel188: TQRLabel;
    lblCounselingE1: TQRLabel;
    QRMemo219: TQRMemo;
    QRMemo220: TQRMemo;
    QRLabel190: TQRLabel;
    lblCounselingE2: TQRLabel;
    QRMemo221: TQRMemo;
    QRMemo222: TQRMemo;
    QRLabel192: TQRLabel;
    lblCounselingE3: TQRLabel;
    QRMemo223: TQRMemo;
    QRMemo224: TQRMemo;
    QRLabel194: TQRLabel;
    lblCounselingE4: TQRLabel;
    QRMemo225: TQRMemo;
    QRMemo226: TQRMemo;
    QRMemo227: TQRMemo;
    QRLabel196: TQRLabel;
    lblCounselingF1: TQRLabel;
    QRMemo228: TQRMemo;
    QRMemo229: TQRMemo;
    QRLabel198: TQRLabel;
    lblCounselingF2: TQRLabel;
    QRLabel200: TQRLabel;
    ChildBand5: TQRChildBand;
    qrMemoCounselingWorkerOpinionBody: TQRMemo;
    qrMemoCounselingWorkerOpinion: TQRMemo;
    ChildBand6: TQRChildBand;
    PageFooterBand2: TQRBand;
    QRLabel201: TQRLabel;
    QRLabel202: TQRLabel;
    QRShape1: TQRShape;
    QRLabel160: TQRLabel;
    QRLabel162: TQRLabel;
    QRLabel164: TQRLabel;
    QRLabel166: TQRLabel;
    QRLabel168: TQRLabel;
    QRLabel170: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel174: TQRLabel;
    QRLabel176: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    lblTrainingTitle: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel183: TQRLabel;
    QRMemo230: TQRMemo;
    QRLabel181: TQRLabel;
    QRMemo231: TQRMemo;
    QRDBText30: TQRDBText;
    QRMemo232: TQRMemo;
    QRLabel185: TQRLabel;
    QRMemo233: TQRMemo;
    qrlblTrainingSexAge: TQRLabel;
    QRMemo234: TQRMemo;
    QRLabel189: TQRLabel;
    QRMemo235: TQRMemo;
    QRDBText31: TQRDBText;
    QRMemo236: TQRMemo;
    QRLabel191: TQRLabel;
    QRMemo237: TQRMemo;
    QRMemo238: TQRMemo;
    QRLabel193: TQRLabel;
    QRMemo239: TQRMemo;
    QRDBText32: TQRDBText;
    QRMemo240: TQRMemo;
    QRLabel195: TQRLabel;
    QRMemo241: TQRMemo;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    childTrainingRequest: TQRChildBand;
    qrMemoTrainingRequestTitle: TQRMemo;
    qrMemoTrainingRequestBody: TQRMemo;
    QRLabel197: TQRLabel;
    qrMemoTrainingRequest: TQRMemo;
    QRMemo245: TQRMemo;
    childTrainingPurpose: TQRChildBand;
    ChildBand8: TQRChildBand;
    childTrainingIntervationCourse: TQRChildBand;
    ChildBand13: TQRChildBand;
    qrMemoTrainingPurposeTitle: TQRMemo;
    qrMemoTrainingPurposeBody: TQRMemo;
    QRLabel199: TQRLabel;
    qrMemoTrainingPurpose: TQRMemo;
    QRMemo246: TQRMemo;
    QRLabel203: TQRLabel;
    childTrainingWorkerOpinion: TQRChildBand;
    ChildBand14: TQRChildBand;
    QRLabel204: TQRLabel;
    qrMemoTrainingIntervationCourseBody: TQRMemo;
    qrMemoTrainingIntervationCourse: TQRMemo;
    qrMemoTrainingWorkerOpinionBody: TQRMemo;
    qrMemoTrainingWorkerOpinion: TQRMemo;
    QRLabel205: TQRLabel;
    QRShape2: TQRShape;
    PageFooterBand3: TQRBand;
    QRLabel206: TQRLabel;
    adoIntake: TADOQuery;
    adoSurvey1: TADOQuery;
    adoSurvey2: TADOQuery;
    adoCounseling: TADOQuery;
    adoTraining: TADOQuery;
    actChangeInOut: TAction;
    PageFooterBand4: TQRBand;
    QRLabel207: TQRLabel;
    PageFooterBand5: TQRBand;
    QRLabel208: TQRLabel;
    QRSysData1: TQRSysData;
    lblSurvey1PageCount: TQRLabel;
    QRSysData2: TQRSysData;
    lblIntakePageCount: TQRLabel;
    QRSysData3: TQRSysData;
    lblSurvey2PageCount: TQRLabel;
    QRSysData4: TQRSysData;
    lblCounselingPageCount: TQRLabel;
    QRSysData5: TQRSysData;
    lblTrainingPageCount: TQRLabel;
    Label18: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cboWard: TcxComboBox;
    cxLabel2: TcxLabel;
    cboBohum: TcxComboBox;
    memoIntake: TMemo;
    memoSurvey1: TMemo;
    memoTemp: TMemo;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialog: TPrintDialog;
    cxTabVisit: TcxTabSheet;
    cxTabSheet7: TcxTabSheet;
    Panel1: TPanel;
    btnVisitPreviewFit: TSpeedButton;
    btnVisitPreviewWidth: TSpeedButton;
    btnVisitPreview100: TSpeedButton;
    Label19: TLabel;
    Label20: TLabel;
    btnVisitDelete: TcxButton;
    btnVisitUpdate: TcxButton;
    btnVisitAppend: TcxButton;
    btnVisitPrior: TcxButton;
    btnVisitNext: TcxButton;
    pnlVisitPageNum: TPanel;
    btnVisitPrinterSetup: TcxButton;
    btnVisitPrint: TcxButton;
    cxSEVisitZoom: TcxSpinEdit;
    QRPreviewVisit: TQRPreview;
    QRDBImage1: TQRDBImage;
    adoHospital: TADOQuery;
    QRDBImage2: TQRDBImage;
    QRDBImage3: TQRDBImage;
    QRDBImage4: TQRDBImage;
    QRDBImage5: TQRDBImage;
    cxGrid4: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBBandedTableView3: TcxGridDBBandedTableView;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    adoVisit: TADOQuery;
    dsVisit: TDataSource;
    actChangeVisit: TAction;
    cxGInOutVisit: TcxGridDBColumn;
    ScrollBox9: TScrollBox;
    QRVisit: TQuickRep;
    lblFontHeight: TLabel;
    QRBand9: TQRBand;
    qrlblVisitTitle: TQRLabel;
    qrVisitFirst: TQRChildBand;
    QRMemo307: TQRMemo;
    QRMemo247: TQRMemo;
    QRMemo249: TQRMemo;
    QRDBText37: TQRDBText;
    QRLabel210: TQRLabel;
    QRMemo255: TQRMemo;
    QRLabel211: TQRLabel;
    QRMemo256: TQRMemo;
    QRMemo261: TQRMemo;
    QRLabel217: TQRLabel;
    QRMemo264: TQRMemo;
    QRLabel223: TQRLabel;
    QRLabel224: TQRLabel;
    QRDBText40: TQRDBText;
    QRLabel225: TQRLabel;
    chkAccompany5: TQRPCheckBox;
    QRLabel226: TQRLabel;
    chkAccompany4: TQRPCheckBox;
    QRLabel227: TQRLabel;
    chkAccompany3: TQRPCheckBox;
    chkAccompany2: TQRPCheckBox;
    QRDBText35: TQRDBText;
    QRMemo164: TQRMemo;
    QRLabel80: TQRLabel;
    QRMemo165: TQRMemo;
    QRDBText36: TQRDBText;
    QRLabel209: TQRLabel;
    chkVisitMale: TQRPCheckBox;
    QRLabel212: TQRLabel;
    chkVisitFeMale: TQRPCheckBox;
    chkAccompany1: TQRPCheckBox;
    QRLabel218: TQRLabel;
    QRMemo244: TQRMemo;
    QRMemo248: TQRMemo;
    QRDBText39: TQRDBText;
    QRLabel14: TQRLabel;
    QRMemo250: TQRMemo;
    QRLabel219: TQRLabel;
    QRMemo251: TQRMemo;
    QRLabel220: TQRLabel;
    QRMemo252: TQRMemo;
    QRDBText47: TQRDBText;
    QRMemo253: TQRMemo;
    QRLabel234: TQRLabel;
    QRMemo254: TQRMemo;
    qrlblVisitSexAge: TQRLabel;
    QRMemo259: TQRMemo;
    QRLabel235: TQRLabel;
    QRMemo260: TQRMemo;
    QRDBText48: TQRDBText;
    QRMemo262: TQRMemo;
    QRLabel236: TQRLabel;
    QRMemo263: TQRMemo;
    QRDBText49: TQRDBText;
    QRMemo267: TQRMemo;
    QRLabel237: TQRLabel;
    QRMemo268: TQRMemo;
    QRDBText50: TQRDBText;
    QRMemo269: TQRMemo;
    QRLabel238: TQRLabel;
    QRMemo270: TQRMemo;
    QRDBText51: TQRDBText;
    QRMemo271: TQRMemo;
    QRLabel239: TQRLabel;
    QRMemo298: TQRMemo;
    QRDBText52: TQRDBText;
    QRMemo299: TQRMemo;
    QRLabel319: TQRLabel;
    QRMemo300: TQRMemo;
    QRDBText53: TQRDBText;
    QRMemo301: TQRMemo;
    QRLabel320: TQRLabel;
    QRMemo302: TQRMemo;
    QRDBText54: TQRDBText;
    QRMemo303: TQRMemo;
    QRLabel321: TQRLabel;
    QRMemo304: TQRMemo;
    QRLabel322: TQRLabel;
    QRMemo305: TQRMemo;
    QRDBText55: TQRDBText;
    QRMemo306: TQRMemo;
    QRLabel323: TQRLabel;
    QRMemo308: TQRMemo;
    QRLabel325: TQRLabel;
    QRMemo309: TQRMemo;
    QRDBText56: TQRDBText;
    QRLabel324: TQRLabel;
    QRMemo310: TQRMemo;
    QRLabel326: TQRLabel;
    QRMemo311: TQRMemo;
    QRLabel327: TQRLabel;
    QRLabel328: TQRLabel;
    QRDBText57: TQRDBText;
    QRLabel329: TQRLabel;
    chkPhimself5: TQRPCheckBox;
    QRLabel330: TQRLabel;
    chkPhimself4: TQRPCheckBox;
    QRLabel331: TQRLabel;
    chkPhimself3: TQRPCheckBox;
    chkPhimself2: TQRPCheckBox;
    chkPhimself1: TQRPCheckBox;
    QRLabel332: TQRLabel;
    QRMemo312: TQRMemo;
    QRLabel333: TQRLabel;
    QRMemo313: TQRMemo;
    QRLabel334: TQRLabel;
    QRLabel335: TQRLabel;
    QRDBText58: TQRDBText;
    QRLabel336: TQRLabel;
    chkPBohum5: TQRPCheckBox;
    QRLabel337: TQRLabel;
    chkPBohum4: TQRPCheckBox;
    QRLabel338: TQRLabel;
    chkPBohum3: TQRPCheckBox;
    chkPBohum2: TQRPCheckBox;
    chkPBohum1: TQRPCheckBox;
    QRLabel339: TQRLabel;
    QRMemo314: TQRMemo;
    QRLabel340: TQRLabel;
    QRMemo315: TQRMemo;
    QRDBText59: TQRDBText;
    QRMemo316: TQRMemo;
    QRLabel341: TQRLabel;
    QRMemo317: TQRMemo;
    QRDBText60: TQRDBText;
    QRMemo242: TQRMemo;
    QRLabel187: TQRLabel;
    QRLabel213: TQRLabel;
    QRLabel214: TQRLabel;
    QRLabel216: TQRLabel;
    QRLabel228: TQRLabel;
    QRMemo243: TQRMemo;
    QRLabel229: TQRLabel;
    QRLabel230: TQRLabel;
    QRLabel231: TQRLabel;
    QRLabel232: TQRLabel;
    QRMemo257: TQRMemo;
    QRLabel233: TQRLabel;
    QRLabel316: TQRLabel;
    QRLabel317: TQRLabel;
    QRLabel318: TQRLabel;
    QRMemo258: TQRMemo;
    QRDBText38: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRMemo265: TQRMemo;
    QRLabel342: TQRLabel;
    QRLabel343: TQRLabel;
    QRLabel344: TQRLabel;
    QRLabel345: TQRLabel;
    QRLabel346: TQRLabel;
    QRMemo266: TQRMemo;
    QRLabel347: TQRLabel;
    QRLabel348: TQRLabel;
    QRMemo318: TQRMemo;
    QRLabel351: TQRLabel;
    QRLabel352: TQRLabel;
    QRLabel353: TQRLabel;
    QRLabel354: TQRLabel;
    QRMemo319: TQRMemo;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRLabel349: TQRLabel;
    QRDBText67: TQRDBText;
    QRMemo320: TQRMemo;
    QRLabel350: TQRLabel;
    QRLabel355: TQRLabel;
    QRMemo321: TQRMemo;
    QRLabel356: TQRLabel;
    QRLabel357: TQRLabel;
    QRLabel358: TQRLabel;
    QRLabel359: TQRLabel;
    QRMemo322: TQRMemo;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRLabel360: TQRLabel;
    QRDBText72: TQRDBText;
    qrChildVisitEconomy: TQRChildBand;
    qrMemoVisitEconomyTitle1: TQRMemo;
    QRLabel240: TQRLabel;
    qrMemoVisitEconomyBody: TQRMemo;
    qrMemoVisitEconomy: TQRMemo;
    qrMemoVisitEconomyTitle2: TQRMemo;
    QRLabel241: TQRLabel;
    qrMemoVisitEconomyLine1: TQRMemo;
    qrMemoVisitEconomyLine2: TQRMemo;
    qrChildVisitETC: TQRChildBand;
    qrMemoVisitETCTitle1: TQRMemo;
    QRLabel242: TQRLabel;
    qrMemoVisitETCBody: TQRMemo;
    qrMemoVisitETC: TQRMemo;
    qrMemoVisitETCTitle2: TQRMemo;
    QRLabel243: TQRLabel;
    qrMemoVisitETCLine1: TQRMemo;
    qrMemoVisitETCLine2: TQRMemo;
    qrChildVisitValue: TQRChildBand;
    qrMemoVisitValueTitle: TQRMemo;
    QRLabel244: TQRLabel;
    qrMemoVisitValueBody: TQRMemo;
    qrMemoVisitValue: TQRMemo;
    qrMemoVisitValueLine: TQRMemo;
    qrChildVisitAction: TQRChildBand;
    qrMemoVisitActionTitle: TQRMemo;
    QRLabel246: TQRLabel;
    qrMemoVisitActionBody: TQRMemo;
    qrMemoVisitAction: TQRMemo;
    qrMemoVisitActionLine: TQRMemo;
    QRBand10: TQRBand;
    QRLabel315: TQRLabel;
    QRSysData6: TQRSysData;
    lblVisitPageCount: TQRLabel;
    QRDBImage6: TQRDBImage;
    qrChildVisitComment: TQRChildBand;
    qrMemoVisitCommentTitle: TQRMemo;
    QRLabel248: TQRLabel;
    qrMemoVisitCommentBody: TQRMemo;
    qrMemoVisitComment: TQRMemo;
    qrMemoVisitCommentLine: TQRMemo;
    ChildBand12: TQRChildBand;
    QRLabel314: TQRLabel;
    QRShape4: TQRShape;
    procedure FormShow(Sender: TObject);
    procedure actSelectWardExecute(Sender: TObject);
    procedure dsSurvey1DataChange(Sender: TObject; Field: TField);
    procedure dsSurvey2DataChange(Sender: TObject; Field: TField);
    procedure dsCounselingDataChange(Sender: TObject; Field: TField);
    procedure dsTrainingDataChange(Sender: TObject; Field: TField);
    procedure btnIntakeAppendClick(Sender: TObject);
    procedure QRIntakePreview(Sender: TObject);
    procedure btnIntakeUpdateClick(Sender: TObject);
    procedure QRIntakeBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRPQuickrep1Preview(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSurvey1AppendClick(Sender: TObject);
    procedure btnSurvey1UpdateClick(Sender: TObject);
    procedure QRSurvey1Preview(Sender: TObject);
    procedure pnlLeftResize(Sender: TObject);
    procedure actPreviewZoomExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actPrintSetupExecute(Sender: TObject);
    procedure actSelectPageNumExecute(Sender: TObject);
    procedure QRSurvey2Preview(Sender: TObject);
    procedure QRCounselingPreview(Sender: TObject);
    procedure QRTrainingPreview(Sender: TObject);
    procedure actChangeIntakeExecute(Sender: TObject);
    procedure actChangeSurvey1Execute(Sender: TObject);
    procedure actChangeSurvey2Execute(Sender: TObject);
    procedure actChangeCounselingExecute(Sender: TObject);
    procedure actChangeTrainingExecute(Sender: TObject);
    procedure dsIntakeDataChange(Sender: TObject; Field: TField);
    procedure cboWardPropertiesChange(Sender: TObject);
    procedure QRSurvey1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure btnSurvey2AppendClick(Sender: TObject);
    procedure btnSurvey2UpdateClick(Sender: TObject);
    procedure QRSurvey2BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure btnCounselingAppendClick(Sender: TObject);
    procedure btnCounselingUpdateClick(Sender: TObject);
    procedure QRCounselingBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure btnTrainingAppendClick(Sender: TObject);
    procedure btnTrainingUpdateClick(Sender: TObject);
    procedure dsInOutDataChange(Sender: TObject; Field: TField);
    procedure actChangeInOutExecute(Sender: TObject);
    procedure QRTrainingBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure btnIntakeDeleteClick(Sender: TObject);
    procedure btnSurvey1DeleteClick(Sender: TObject);
    procedure btnSurvey2DeleteClick(Sender: TObject);
    procedure btnCounselingDeleteClick(Sender: TObject);
    procedure btnTrainingDeleteClick(Sender: TObject);
    procedure QRVisitPreview(Sender: TObject);
    procedure actChangeVisitExecute(Sender: TObject);
    procedure QRVisitBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure dsVisitDataChange(Sender: TObject; Field: TField);
    procedure btnVisitAppendClick(Sender: TObject);
    procedure btnVisitUpdateClick(Sender: TObject);
    procedure btnVisitDeleteClick(Sender: TObject);
  private
    { Private declarations }
    FClose: Boolean;
    procedure SetPreviewType(Sender: TObject);
    procedure DisplayPageNum(Sender: TObject);
    procedure SetLines(oMemo: TQRMemo; cnt: integer);
    procedure SetMemoIntake(oList: TStrings; str: string);
    procedure SetMemoSurvey1(oList: TStrings; str: string);
    procedure SetMemoTemp(oList: TStrings; str: string);
    procedure ClearSurvey1Report;
    procedure ClearSurvey2Report;
    procedure ClearCounselingReport;
    procedure ClearTrainingReport;
    procedure ClearVisitReport;
    procedure RefreshInOut(nInOutID: integer);
  public
    { Public declarations }
    FLoaded: Boolean;
  end;

var
  frmRecord: TfrmRecord;

implementation

uses uDB, uConfig, uIntake, uRecordReport, uSurvey1, uSurvey2, uCounseling,
  uTraining, uQuery, uVisit;
{$R *.dfm}

procedure TfrmRecord.SetLines(oMemo: TQRMemo; cnt: integer);
var
  i: integer;
begin
  oMemo.Lines.Clear;
  for i := 0 to cnt - 1 do
    oMemo.Lines.Add(' ');
end;

procedure TfrmRecord.SetMemoIntake(oList: TStrings; str: string);
var
  n: integer;
begin
  memoIntake.Lines.Text := str;

  oList.Clear;
  for n := 0 to memoIntake.Lines.Count - 1 do
    oList.Add(memoIntake.Lines[n]);
end;

procedure TfrmRecord.SetMemoSurvey1(oList: TStrings; str: string);
var
  n: integer;
begin
  memoSurvey1.Lines.Text := str;

  oList.Clear;
  for n := 0 to memoSurvey1.Lines.Count - 1 do
    oList.Add(memoSurvey1.Lines[n]);
end;

procedure TfrmRecord.SetMemoTemp(oList: TStrings; str: string);
var
  n: integer;
begin
  memoTemp.Lines.Text := str;

  oList.Clear;
  for n := 0 to memoTemp.Lines.Count - 1 do
    oList.Add(memoTemp.Lines[n]);
end;

procedure TfrmRecord.actChangeTrainingExecute(Sender: TObject);
begin
  btnTrainingAppend.Enabled := adoTraining.Active;
  btnTrainingUpdate.Enabled := not adoTraining.IsEmpty;
  btnTrainingDelete.Enabled := not adoTraining.IsEmpty;
  btnTrainingPrior.Enabled := not adoTraining.IsEmpty;
  btnTrainingNext.Enabled := not adoTraining.IsEmpty;
  btnTrainingPreviewFit.Enabled := not adoTraining.IsEmpty;
  btnTrainingPreviewWidth.Enabled := not adoTraining.IsEmpty;
  btnTrainingPreview100.Enabled := not adoTraining.IsEmpty;
  cxSETrainingZoom.Enabled := not adoTraining.IsEmpty;
  btnTrainingPrint.Enabled := not adoTraining.IsEmpty;
  btnTrainingPrinterSetup.Enabled := not adoTraining.IsEmpty;

  screen.Cursor := crHourGlass;
  if adoTraining.IsEmpty then
    QRPreviewTraining.QRPrinter := nil
  else
  begin
    QRTraining.Prepare;
    lblTrainingPageCount.Caption := ' / ' + inttostr
      (QRTraining.QRPrinter.PageCount);
    QRTraining.PreviewModal;
  end;

  DisplayPageNum(QRPreviewTraining);
  SetPreviewType(QRPreviewTraining);

  screen.Cursor := crDefault;
end;

procedure TfrmRecord.actChangeVisitExecute(Sender: TObject);
begin
  btnVisitAppend.Enabled := adoVisit.Active;
  btnVisitUpdate.Enabled := not adoVisit.IsEmpty;
  btnVisitDelete.Enabled := not adoVisit.IsEmpty;
  btnVisitPrior.Enabled := not adoVisit.IsEmpty;
  btnVisitNext.Enabled := not adoVisit.IsEmpty;
  btnVisitPreviewFit.Enabled := not adoVisit.IsEmpty;
  btnVisitPreviewWidth.Enabled := not adoVisit.IsEmpty;
  btnVisitPreview100.Enabled := not adoVisit.IsEmpty;
  cxSEVisitZoom.Enabled := not adoVisit.IsEmpty;
  btnVisitPrint.Enabled := not adoVisit.IsEmpty;
  btnVisitPrinterSetup.Enabled := not adoVisit.IsEmpty;

  screen.Cursor := crHourGlass;
  if adoVisit.IsEmpty then
    QRPreviewVisit.QRPrinter := nil
  else
  begin
    QRVisit.Prepare;
    lblVisitPageCount.Caption := ' / ' + inttostr(QRVisit.QRPrinter.PageCount);
    QRVisit.PreviewModal;
  end;

  DisplayPageNum(QRPreviewVisit);
  SetPreviewType(QRPreviewVisit);

  screen.Cursor := crDefault;
end;

procedure TfrmRecord.actChangeCounselingExecute(Sender: TObject);
begin
  btnCounselingAppend.Enabled := adoCounseling.Active;
  btnCounselingUpdate.Enabled := not adoCounseling.IsEmpty;
  btnCounselingDelete.Enabled := not adoCounseling.IsEmpty;
  btnCounselingPrior.Enabled := not adoCounseling.IsEmpty;
  btnCounselingNext.Enabled := not adoCounseling.IsEmpty;
  btnCounselingPreviewFit.Enabled := not adoCounseling.IsEmpty;
  btnCounselingPreviewWidth.Enabled := not adoCounseling.IsEmpty;
  btnCounselingPreview100.Enabled := not adoCounseling.IsEmpty;
  cxSECounselingZoom.Enabled := not adoCounseling.IsEmpty;
  btnCounselingPrint.Enabled := not adoCounseling.IsEmpty;
  btnCounselingPrinterSetup.Enabled := not adoCounseling.IsEmpty;

  screen.Cursor := crHourGlass;
  if adoCounseling.IsEmpty then
    QRPreviewCounseling.QRPrinter := nil
  else
  begin
    QRCounseling.Prepare;
    lblCounselingPageCount.Caption := ' / ' + inttostr
      (QRCounseling.QRPrinter.PageCount);
    QRCounseling.PreviewModal;
  end;

  DisplayPageNum(QRPreviewCounseling);
  SetPreviewType(QRPreviewCounseling);

  screen.Cursor := crDefault;
end;

procedure TfrmRecord.actChangeInOutExecute(Sender: TObject);
var
  oInOut: TID;
begin
  if not FLoaded then
    Exit;

  oInOut.ID := adoInOut.FieldByName('InOutID').AsInteger;

  adoIntake.SQL.Text := QueryIntake(oInOut);
  adoSurvey1.SQL.Text := QuerySurvey1(oInOut);
  adoSurvey2.SQL.Text := QuerySurvey2(oInOut);
  adoCounseling.SQL.Text := QueryCounseling(oInOut);
  adoTraining.SQL.Text := QueryTraining(oInOut);
  adoVisit.SQL.Text := QueryVisit(oInOut);

  FLoaded := False;
  try
    adoIntake.Open;
    adoSurvey1.Open;
    adoSurvey2.Open;
    adoCounseling.Open;
    adoTraining.Open;
    adoVisit.Open;
  except
    oGlobal.Msg('기록지 정보를 가져오지 못했습니다!');
  end;
  FLoaded := True;

  actChangeIntake.Execute;
  actChangeSurvey1.Execute;
  actChangeSurvey2.Execute;
  actChangeCounseling.Execute;
  actChangeTraining.Execute;
  actChangeVisit.Execute;
end;

procedure TfrmRecord.actChangeIntakeExecute(Sender: TObject);
begin
  btnIntakeAppend.Enabled := adoIntake.IsEmpty;
  btnIntakeUpdate.Enabled := not adoIntake.IsEmpty;
  btnIntakeDelete.Enabled := not adoIntake.IsEmpty;
  btnIntakePrior.Enabled := not adoIntake.IsEmpty;
  btnIntakeNext.Enabled := not adoIntake.IsEmpty;
  btnIntakePreviewFit.Enabled := not adoIntake.IsEmpty;
  btnIntakePreviewWidth.Enabled := not adoIntake.IsEmpty;
  btnIntakePreview100.Enabled := not adoIntake.IsEmpty;
  cxSEIntakeZoom.Enabled := not adoIntake.IsEmpty;
  btnIntakePrint.Enabled := not adoIntake.IsEmpty;
  btnIntakePrinterSetup.Enabled := not adoIntake.IsEmpty;

  screen.Cursor := crHourGlass;
  if adoIntake.IsEmpty then
    QRPreviewIntake.QRPrinter := nil
  else
  begin
    QRIntake.Prepare;
    lblIntakePageCount.Caption := ' / ' + inttostr
      (QRIntake.QRPrinter.PageCount);
    QRIntake.PreviewModal;
  end;

  DisplayPageNum(QRPreviewIntake);
  SetPreviewType(QRPreviewIntake);

  screen.Cursor := crDefault;
end;

procedure TfrmRecord.actChangeSurvey1Execute(Sender: TObject);
begin
  btnSurvey1Append.Enabled := adoSurvey1.IsEmpty;
  btnSurvey1Update.Enabled := not adoSurvey1.IsEmpty;
  btnSurvey1Delete.Enabled := not adoSurvey1.IsEmpty;
  btnSurvey1Prior.Enabled := not adoSurvey1.IsEmpty;
  btnSurvey1Next.Enabled := not adoSurvey1.IsEmpty;
  btnSurvey1PreviewFit.Enabled := not adoSurvey1.IsEmpty;
  btnSurvey1PreviewWidth.Enabled := not adoSurvey1.IsEmpty;
  btnSurvey1Preview100.Enabled := not adoSurvey1.IsEmpty;
  cxSESurvey1Zoom.Enabled := not adoSurvey1.IsEmpty;
  btnSurvey1Print.Enabled := not adoSurvey1.IsEmpty;
  btnSurvey1PrinterSetup.Enabled := not adoSurvey1.IsEmpty;

  screen.Cursor := crHourGlass;
  if adoSurvey1.IsEmpty then
    QRPreviewSurvey1.QRPrinter := nil
  else
  begin
    QRSurvey1.Prepare;
    lblSurvey1PageCount.Caption := ' / ' + inttostr
      (QRSurvey1.QRPrinter.PageCount);
    QRSurvey1.PreviewModal;
  end;

  DisplayPageNum(QRPreviewSurvey1);
  SetPreviewType(QRPreviewSurvey1);

  screen.Cursor := crDefault;
end;

procedure TfrmRecord.actChangeSurvey2Execute(Sender: TObject);
begin
  btnSurvey2Append.Enabled := adoSurvey2.IsEmpty;
  btnSurvey2Update.Enabled := not adoSurvey2.IsEmpty;
  btnSurvey2Delete.Enabled := not adoSurvey2.IsEmpty;
  btnSurvey2Prior.Enabled := not adoSurvey2.IsEmpty;
  btnSurvey2Next.Enabled := not adoSurvey2.IsEmpty;
  btnSurvey2PreviewFit.Enabled := not adoSurvey2.IsEmpty;
  btnSurvey2PreviewWidth.Enabled := not adoSurvey2.IsEmpty;
  btnSurvey2Preview100.Enabled := not adoSurvey2.IsEmpty;
  cxSESurvey2Zoom.Enabled := not adoSurvey2.IsEmpty;
  btnSurvey2Print.Enabled := not adoSurvey2.IsEmpty;
  btnSurvey2PrinterSetup.Enabled := not adoSurvey2.IsEmpty;

  screen.Cursor := crHourGlass;
  if adoSurvey2.IsEmpty then
    QRPreviewSurvey2.QRPrinter := nil
  else
  begin
    QRSurvey2.Prepare;
    lblSurvey2PageCount.Caption := ' / ' + inttostr
      (QRSurvey2.QRPrinter.PageCount);
    QRSurvey2.PreviewModal;
  end;

  DisplayPageNum(QRPreviewSurvey2);
  SetPreviewType(QRPreviewSurvey2);

  screen.Cursor := crDefault;
end;

procedure TfrmRecord.actPreviewZoomExecute(Sender: TObject);
begin
  if (Sender = btnIntakePreviewFit) or (Sender = btnIntakePreviewWidth) or
    (Sender = btnIntakePreview100) or (Sender = cxSEIntakeZoom) then
    SetPreviewType(QRPreviewIntake)
  else if (Sender = btnSurvey1PreviewFit) or (Sender = btnSurvey1PreviewWidth)
    or (Sender = btnSurvey1Preview100) or (Sender = cxSESurvey1Zoom) then
    SetPreviewType(QRPreviewSurvey1)
  else if (Sender = btnSurvey2PreviewFit) or (Sender = btnSurvey2PreviewWidth)
    or (Sender = btnSurvey2Preview100) or (Sender = cxSESurvey2Zoom) then
    SetPreviewType(QRPreviewSurvey2)
  else if (Sender = btnCounselingPreviewFit) or
    (Sender = btnCounselingPreviewWidth) or (Sender = btnCounselingPreview100)
    or (Sender = cxSECounselingZoom) then
    SetPreviewType(QRPreviewCounseling)
  else if (Sender = btnTrainingPreviewFit) or
    (Sender = btnTrainingPreviewWidth) or (Sender = btnTrainingPreview100) or
    (Sender = cxSETrainingZoom) then
    SetPreviewType(QRPreviewTraining)
  else if (Sender = btnVisitPreviewFit) or (Sender = btnVisitPreviewWidth) or
    (Sender = btnVisitPreview100) or (Sender = cxSEVisitZoom) then
    SetPreviewType(QRPreviewVisit)
end;

procedure TfrmRecord.actPrintExecute(Sender: TObject);
begin
  // if oGlobal.YesNo('출력하시겠습니까?') <> mrYes then
  // Exit;

  if Sender = btnIntakePrint then
  begin
    QRIntake.PrinterSetup;
    if QRIntake.Tag = 0 then
      QRIntake.Print;
  end
  else if Sender = btnSurvey1Print then
  begin
    QRSurvey1.PrinterSetup;
    if QRSurvey1.Tag = 0 then
      QRSurvey1.Print
  end
  else if Sender = btnSurvey2Print then
  begin
    QRSurvey2.PrinterSetup;
    if QRSurvey2.Tag = 0 then
      QRSurvey2.Print
  end
  else if Sender = btnCounselingPrint then
  begin
    QRCounseling.PrinterSetup;
    if QRCounseling.Tag = 0 then
      QRCounseling.Print
  end
  else if Sender = btnTrainingPrint then
  begin
    QRTraining.PrinterSetup;
    if QRTraining.Tag = 0 then
      QRTraining.Print
  end
  else if Sender = btnVisitPrint then
  begin
    QRVisit.PrinterSetup;
    if QRVisit.Tag = 0 then
      QRVisit.Print
  end
end;

procedure TfrmRecord.actPrintSetupExecute(Sender: TObject);
begin
  if Sender = btnIntakePrinterSetup then
    QRIntake.PrinterSetup
  else if Sender = btnSurvey1PrinterSetup then
    QRSurvey1.PrinterSetup
  else if Sender = btnSurvey2PrinterSetup then
    QRSurvey2.PrinterSetup
  else if Sender = btnCounselingPrinterSetup then
    QRCounseling.PrinterSetup
  else if Sender = btnTrainingPrinterSetup then
    QRTraining.PrinterSetup
  else if Sender = btnVisitPrinterSetup then
    QRVisit.PrinterSetup
end;

procedure TfrmRecord.actSelectPageNumExecute(Sender: TObject);
begin
  if Sender = btnIntakePrior then
  begin
    if QRPreviewIntake.PageNumber > 1 then
      QRPreviewIntake.PageNumber := QRPreviewIntake.PageNumber - 1;

    DisplayPageNum(QRPreviewIntake);
  end
  else if Sender = btnIntakeNext then
  begin
    if QRPreviewIntake.PageNumber < QRPreviewIntake.QRPrinter.PageCount then
      QRPreviewIntake.PageNumber := QRPreviewIntake.PageNumber + 1;

    DisplayPageNum(QRPreviewIntake);
  end
  else if Sender = btnSurvey1Prior then
  begin
    if QRPreviewSurvey1.PageNumber > 1 then
      QRPreviewSurvey1.PageNumber := QRPreviewSurvey1.PageNumber - 1;

    DisplayPageNum(QRPreviewSurvey1);
  end
  else if Sender = btnSurvey1Next then
  begin
    if QRPreviewSurvey1.PageNumber < QRPreviewSurvey1.QRPrinter.PageCount then
      QRPreviewSurvey1.PageNumber := QRPreviewSurvey1.PageNumber + 1;

    DisplayPageNum(QRPreviewSurvey1);
  end
  else if Sender = btnSurvey2Prior then
  begin
    if QRPreviewSurvey2.PageNumber > 1 then
      QRPreviewSurvey2.PageNumber := QRPreviewSurvey2.PageNumber - 1;

    DisplayPageNum(QRPreviewSurvey2);
  end
  else if Sender = btnSurvey2Next then
  begin
    if QRPreviewSurvey2.PageNumber < QRPreviewSurvey2.QRPrinter.PageCount then
      QRPreviewSurvey2.PageNumber := QRPreviewSurvey2.PageNumber + 1;

    DisplayPageNum(QRPreviewSurvey2);
  end
  else if Sender = btnCounselingPrior then
  begin
    if QRPreviewCounseling.PageNumber > 1 then
      QRPreviewCounseling.PageNumber := QRPreviewCounseling.PageNumber - 1;

    DisplayPageNum(QRPreviewCounseling);
  end
  else if Sender = btnCounselingNext then
  begin
    if QRPreviewCounseling.PageNumber <
      QRPreviewCounseling.QRPrinter.PageCount then
      QRPreviewCounseling.PageNumber := QRPreviewCounseling.PageNumber + 1;

    DisplayPageNum(QRPreviewCounseling);
  end
  else if Sender = btnTrainingPrior then
  begin
    if QRPreviewTraining.PageNumber > 1 then
      QRPreviewTraining.PageNumber := QRPreviewTraining.PageNumber - 1;

    DisplayPageNum(QRPreviewTraining);
  end
  else if Sender = btnTrainingNext then
  begin
    if QRPreviewTraining.PageNumber < QRPreviewTraining.QRPrinter.PageCount then
      QRPreviewTraining.PageNumber := QRPreviewTraining.PageNumber + 1;

    DisplayPageNum(QRPreviewTraining);
  end
  else if Sender = btnVisitPrior then
  begin
    if QRPreviewVisit.PageNumber > 1 then
      QRPreviewVisit.PageNumber := QRPreviewVisit.PageNumber - 1;

    DisplayPageNum(QRPreviewVisit);
  end
  else if Sender = btnVisitNext then
  begin
    if QRPreviewVisit.PageNumber < QRPreviewVisit.QRPrinter.PageCount then
      QRPreviewVisit.PageNumber := QRPreviewVisit.PageNumber + 1;

    DisplayPageNum(QRPreviewVisit);
  end
end;

procedure TfrmRecord.actSelectWardExecute(Sender: TObject);
var
  nHospitalID, nInOut, nWardID, nBohumID: integer;
  sHospitalID, str: string;
begin
  nHospitalID := oConfig.User.HospitalID;
  sHospitalID := inttostr(nHospitalID);
  nWardID := dbMain.GetWardID(nHospitalID, cboWard.Text);
  nBohumID := dbMain.GetBohumID(cboBohum.Text);

  if rIn.Checked then
    nInOut := cIn
  else if rOut.Checked then
    nInOut := cOut
  else
    nInOut := -1;

  str := 'select patients.HospitalID as HospitalID' +
    '       ,patients.PatientID as PatientID' +
    '       ,patients.PatientName as PatientName' +
    '       ,patients.Sex as Sex' + '       ,patients.Birthday as Birthday' +
    '       ,InOutID' + '       ,InDate' + '       ,InTime' +
    '       ,OutDate' + '       ,OutTime' + '       ,State' +
    '       ,DiagName' + '       ,DoctorID' + '       ,UserID' +
    '       ,WardID' + '       ,InTypeID' + '       ,Room' +
    '       ,(select InTypeName from InTypes where InTypes.InTypeID=inout.InTypeID) as InTypeName'
    + '       ,(select UserName from users where hospitalid=' + sHospitalID +
    '            and userid=inout.UserID and Worker=1) as UserName' +
    '       ,(select UserName from users where hospitalid=' + sHospitalID +
    '            and userid=inout.DoctorID and Doctor=1) as DoctorName' +
    '       ,(select WardName from Wards' +
    '                         where wards.wardid=inout.wardid) as WardName' +
    '       ,(select BohumName from Bohum where Bohum.BohumID=inout.BohumID) as BohumName'
    + '       ,case inout.state when 0 then ''입원''' +
    '                         when 1 then ''퇴원''' +
    '                         else ''에러''' + '         end as StateName' +
    '       ,(select count(*) from intake' +
    '                        where inout.InOutID=intake.InOutID) as intake' +
    '       ,(select count(*) from survey1' +
    '                         where inout.InOutID=survey1.InOutID) as survey1'
    + '       ,(select count(*) from survey2' +
    '                        where inout.InOutID=survey2.InOutID) as survey2' +
    '       ,(select count(*) from counseling' +
    '                        where inout.InOutID=counseling.InOutID) as counseling'
    + '       ,(select count(*) from training' +
    '                        where inout.InOutID=training.InOutID) as training'
    + '       ,(select count(*) from visit' +
    '                        where inout.InOutID=visit.InOutID) as Visit' +
    '       ,(select BohumName from Bohum where Bohum.BohumID=inout.BohumID) as BohumName'
    + '  from inout, patients' +
    ' where inout.hospitalid=patients.hospitalid'
    + '   and inout.patientid=patients.patientid' +
    '   and inout.hospitalid=' + sHospitalID;

  if cboWard.ItemIndex <> 0 then
    str := str + '   and inout.WardID=' + inttostr(nWardID);

  if cboBohum.ItemIndex <> 0 then
    str := str + '   and inout.BohumID=' + inttostr(nBohumID);

  if nInOut <> -1 then
    str := str + '   and state=' + inttostr(nInOut);

  if cboSearchCondition.ItemIndex = 0 then
  begin
    str := str + ' order by patients.PatientName, inout.InDate desc';
    cxGInOutPatientName.SortIndex := 0;
    cxGInOutPatientName.SortOrder := soAscending;
    cxGInOutPatientID.SortIndex := -1;
    cxGInOutPatientID.SortOrder := soNone;
  end
  else
  begin
    str := str + ' order by patients.PatientID, inout.InDate desc';
    cxGInOutPatientID.SortIndex := 0;
    cxGInOutPatientID.SortOrder := soAscending;
    cxGInOutPatientName.SortIndex := -1;
    cxGInOutPatientName.SortOrder := soNone;
  end;

  FLoaded := False;
  adoInOut.DisableControls;
  try
    screen.Cursor := crHourGlass;
    adoInOut.SQL.Text := str;
    adoInOut.Open;
    screen.Cursor := crDefault;
  except
    screen.Cursor := crDefault;
    oGlobal.Msg('환자정보를 가져올 수 없습니다!');
  end;
  adoInOut.EnableControls;
  FLoaded := True;
  actChangeInOut.Execute;
end;

procedure TfrmRecord.btnCounselingAppendClick(Sender: TObject);
begin
  frmCounseling.EditMode := emAppend;
  frmCounseling.adoInOut := adoInOut;
  frmCounseling.adoCounseling := adoCounseling;

  if frmCounseling.ShowModal = mrOK then
  begin
    RefreshInOut(adoInOut.FieldByName('InOutID').AsInteger);
    actChangeCounseling.Execute;
    SetPreviewType(QRPreviewCounseling);
  end;
end;

procedure TfrmRecord.btnCounselingDeleteClick(Sender: TObject);
var
  n: integer;
  nInOutID: integer;
  sMeetingDate: string;
begin
  if adoCounseling.IsEmpty then
    Exit;

  if oGlobal.YesNo('삭제 하시겠습니까?') <> mrYes then
    Exit;

  nInOutID := adoCounseling.FieldByName('InOutID').AsInteger;
  sMeetingDate := adoCounseling.FieldByName('MeetingDate').AsString;

  FLoaded := False;
  adoCounseling.DisableControls;
  try
    adoCounseling.Connection.BeginTrans;
    adoCounseling.Delete;

    adoCounseling.First;
    for n := 1 to adoCounseling.RecordCount do
    begin
      adoCounseling.Edit;
      adoCounseling.FieldByName('Seq').AsInteger := n;
      adoCounseling.Post;
      adoCounseling.Next;
    end;

    adoCounseling.Connection.CommitTrans;

    RefreshInOut(adoInOut.FieldByName('InOutID').AsInteger);

    oGlobal.Msg('삭제하였습니다!', 500);
  except
    adoCounseling.Connection.RollbackTrans;

    oGlobal.Msg('삭제하지 못하였습니다!');
  end;
  adoCounseling.EnableControls;
  FLoaded := True;

  dbMain.RemakeCounselingOrder(nInOutID, sMeetingDate);

  actChangeCounseling.Execute;
end;

procedure TfrmRecord.btnCounselingUpdateClick(Sender: TObject);
begin
  frmCounseling.EditMode := emUpdate;
  frmCounseling.adoInOut := adoInOut;
  frmCounseling.adoCounseling := adoCounseling;

  if frmCounseling.ShowModal = mrOK then
  begin
    actChangeCounseling.Execute;
    SetPreviewType(QRPreviewCounseling);
  end;
end;

procedure TfrmRecord.btnIntakeAppendClick(Sender: TObject);
begin
  if not adoIntake.IsEmpty then
    Exit;

  frmIntake.adoInOut := adoInOut;
  frmIntake.adoIntake := adoIntake;

  if frmIntake.ShowModal = mrOK then
  begin
    RefreshInOut(adoInOut.FieldByName('InOutID').AsInteger);
    SetPreviewType(QRPreviewIntake);
  end;

  if frmIntake.ModifiedFamily then
  begin
    adoIntake.Close;
    adoIntake.Open;
    adoSurvey1.Close;
    adoSurvey1.Open;
  end;
end;

procedure TfrmRecord.btnIntakeDeleteClick(Sender: TObject);
begin
  if adoIntake.IsEmpty then
    Exit;

  if oGlobal.YesNo('삭제 하시겠습니까?') <> mrYes then
    Exit;

  adoIntake.DisableControls;
  try
    adoIntake.Connection.BeginTrans;
    adoIntake.Delete;
    adoIntake.Connection.CommitTrans;

    RefreshInOut(adoInOut.FieldByName('InOutID').AsInteger);

    oGlobal.Msg('삭제하였습니다!', 500);
  except
    adoIntake.Connection.RollbackTrans;

    oGlobal.Msg('삭제하지 못하였습니다!');
  end;
  adoIntake.EnableControls;
end;

procedure TfrmRecord.btnIntakeUpdateClick(Sender: TObject);
begin
  if adoIntake.IsEmpty then
    Exit;

  frmIntake.adoInOut := adoInOut;
  frmIntake.adoIntake := adoIntake;

  if frmIntake.ShowModal = mrOK then
    SetPreviewType(QRPreviewIntake);

  if frmIntake.ModifiedFamily then
  begin
    adoIntake.Close;
    adoIntake.Open;
    adoSurvey1.Close;
    adoSurvey1.Open;
  end;
end;

procedure TfrmRecord.btnSearchClick(Sender: TObject);
var
  sSearch: string;
begin
  sSearch := trim(txtSearch.Text);
  if oGlobal.isNullStr(sSearch) then
  begin
    oGlobal.Msg('검색어를 입력해 주십시오!');
    txtSearch.SetFocus;
    Exit;
  end;

  adoInOut.DisableControls;

  if cboSearchCondition.ItemIndex = 0 then
    adoInOut.Locate('PatientName', sSearch, [loPartialKey])
  else
    adoInOut.Locate('PatientID', sSearch, [loPartialKey]);

  adoInOut.EnableControls;
end;

procedure TfrmRecord.btnSurvey1AppendClick(Sender: TObject);
begin
  frmSurvey1.adoInOut := adoInOut;
  frmSurvey1.adoSurvey1 := adoSurvey1;

  if frmSurvey1.ShowModal = mrOK then
  begin
    RefreshInOut(adoInOut.FieldByName('InOutID').AsInteger);
    SetPreviewType(QRPreviewSurvey1);
  end;

  if frmSurvey1.ModifiedFamily then
  begin
    adoSurvey1.Close;
    adoSurvey1.Open;
    adoIntake.Close;
    adoIntake.Open;
  end;
end;

procedure TfrmRecord.btnSurvey1DeleteClick(Sender: TObject);
begin
  if adoSurvey1.IsEmpty then
    Exit;

  if oGlobal.YesNo('삭제 하시겠습니까?') <> mrYes then
    Exit;

  adoSurvey1.DisableControls;
  try
    adoSurvey1.Connection.BeginTrans;
    adoSurvey1.Delete;
    adoSurvey1.Connection.CommitTrans;

    RefreshInOut(adoInOut.FieldByName('InOutID').AsInteger);

    oGlobal.Msg('삭제하였습니다!', 500);
  except
    adoSurvey1.Connection.RollbackTrans;

    oGlobal.Msg('삭제하지 못하였습니다!');
  end;
  adoSurvey1.EnableControls;
end;

procedure TfrmRecord.btnSurvey1UpdateClick(Sender: TObject);
begin
  frmSurvey1.adoInOut := adoInOut;
  frmSurvey1.adoSurvey1 := adoSurvey1;

  if frmSurvey1.ShowModal = mrOK then
    SetPreviewType(QRPreviewSurvey1);

  if frmSurvey1.ModifiedFamily then
  begin
    adoSurvey1.Close;
    adoSurvey1.Open;
    adoIntake.Close;
    adoIntake.Open;
  end;
end;

procedure TfrmRecord.btnSurvey2AppendClick(Sender: TObject);
begin
  frmSurvey2.adoInOut := adoInOut;
  frmSurvey2.adoSurvey2 := adoSurvey2;

  if frmSurvey2.ShowModal = mrOK then
  begin
    RefreshInOut(adoInOut.FieldByName('InOutID').AsInteger);
    SetPreviewType(QRPreviewSurvey2);
  end;
end;

procedure TfrmRecord.btnSurvey2DeleteClick(Sender: TObject);
begin
  if adoSurvey2.IsEmpty then
    Exit;

  if oGlobal.YesNo('삭제 하시겠습니까?') <> mrYes then
    Exit;

  adoSurvey2.DisableControls;
  try
    adoSurvey2.Connection.BeginTrans;
    adoSurvey2.Delete;
    adoSurvey2.Connection.CommitTrans;

    RefreshInOut(adoInOut.FieldByName('InOutID').AsInteger);

    oGlobal.Msg('삭제하였습니다!', 500);
  except
    adoSurvey2.Connection.RollbackTrans;

    oGlobal.Msg('삭제하지 못하였습니다!');
  end;
  adoSurvey2.EnableControls;
end;

procedure TfrmRecord.btnSurvey2UpdateClick(Sender: TObject);
begin
  frmSurvey2.adoInOut := adoInOut;
  frmSurvey2.adoSurvey2 := adoSurvey2;

  if frmSurvey2.ShowModal = mrOK then
    SetPreviewType(QRPreviewSurvey2);
end;

procedure TfrmRecord.btnTrainingAppendClick(Sender: TObject);
begin
  frmTraining.EditMode := emAppend;
  frmTraining.adoInOut := adoInOut;
  frmTraining.adoTraining := adoTraining;

  if frmTraining.ShowModal = mrOK then
  begin
    RefreshInOut(adoInOut.FieldByName('InOutID').AsInteger);
    actChangeTraining.Execute;
    SetPreviewType(QRPreviewTraining);
  end;
end;

procedure TfrmRecord.btnTrainingDeleteClick(Sender: TObject);
var
  n: integer;
begin
  if adoTraining.IsEmpty then
    Exit;

  if oGlobal.YesNo('삭제 하시겠습니까?') <> mrYes then
    Exit;

  FLoaded := False;
  adoTraining.DisableControls;
  try
    adoTraining.Connection.BeginTrans;

    adoTraining.Delete;

    adoTraining.First;
    for n := 1 to adoTraining.RecordCount do
    begin
      adoTraining.Edit;
      adoTraining.FieldByName('Seq').AsInteger := n;
      adoTraining.Post;
      adoTraining.Next;
    end;

    adoTraining.Connection.CommitTrans;

    RefreshInOut(adoInOut.FieldByName('InOutID').AsInteger);

    oGlobal.Msg('삭제하였습니다!', 500);
  except
    adoTraining.Connection.RollbackTrans;

    oGlobal.Msg('삭제하지 못하였습니다!');
  end;
  adoTraining.EnableControls;
  FLoaded := True;

  actChangeTraining.Execute;
end;

procedure TfrmRecord.btnTrainingUpdateClick(Sender: TObject);
begin
  frmTraining.EditMode := emUpdate;
  frmTraining.adoInOut := adoInOut;
  frmTraining.adoTraining := adoTraining;

  if frmTraining.ShowModal = mrOK then
  begin
    actChangeTraining.Execute;
    SetPreviewType(QRPreviewTraining);
  end;
end;

procedure TfrmRecord.btnVisitAppendClick(Sender: TObject);
begin
  frmVisit.EditMode := emAppend;
  frmVisit.adoInOut := adoInOut;
  frmVisit.adoVisit := adoVisit;

  if frmVisit.ShowModal = mrOK then
  begin
    RefreshInOut(adoInOut.FieldByName('InOutID').AsInteger);
    actChangeVisit.Execute;
    SetPreviewType(QRPreviewVisit);
  end;
end;

procedure TfrmRecord.btnVisitDeleteClick(Sender: TObject);
var
  n: integer;
begin
  if adoVisit.IsEmpty then
    Exit;

  if oGlobal.YesNo('삭제 하시겠습니까?') <> mrYes then
    Exit;

  FLoaded := False;
  adoVisit.DisableControls;
  try
    adoVisit.Connection.BeginTrans;

    adoVisit.Delete;

    adoVisit.First;
    for n := 1 to adoVisit.RecordCount do
    begin
      adoVisit.Edit;
      adoVisit.FieldByName('Seq').AsInteger := n;
      adoVisit.Post;
      adoVisit.Next;
    end;

    adoVisit.Connection.CommitTrans;

    RefreshInOut(adoInOut.FieldByName('InOutID').AsInteger);

    oGlobal.Msg('삭제하였습니다!', 500);
  except
    adoVisit.Connection.RollbackTrans;

    oGlobal.Msg('삭제하지 못하였습니다!');
  end;
  adoVisit.EnableControls;
  FLoaded := True;

  actChangeVisit.Execute;
end;

procedure TfrmRecord.btnVisitUpdateClick(Sender: TObject);
begin
  frmVisit.EditMode := emUpdate;
  frmVisit.adoInOut := adoInOut;
  frmVisit.adoVisit := adoVisit;

  if frmVisit.ShowModal = mrOK then
  begin
    actChangeVisit.Execute;
    SetPreviewType(QRPreviewVisit);
  end;
end;

procedure TfrmRecord.cboWardPropertiesChange(Sender: TObject);
begin
  if not FLoaded then
    Exit;

  actSelectWard.Execute;
end;

procedure TfrmRecord.ClearCounselingReport;
begin
  lblCounselingTitle.Caption := '사회사업지도';

  lblCounselingA1.Caption := NullString;
  lblCounselingA2.Caption := NullString;
  lblCounselingA3.Caption := NullString;
  lblCounselingA4.Caption := NullString;
  lblCounselingA5.Caption := NullString;

  lblCounselingB1.Caption := NullString;
  lblCounselingB2.Caption := NullString;
  lblCounselingB3.Caption := NullString;
  lblCounselingB4.Caption := NullString;
  lblCounselingB5.Caption := NullString;

  lblCounselingC1.Caption := NullString;
  lblCounselingC2.Caption := NullString;
  lblCounselingC3.Caption := NullString;

  lblCounselingD1.Caption := NullString;
  lblCounselingD2.Caption := NullString;

  lblCounselingE1.Caption := NullString;
  lblCounselingE2.Caption := NullString;
  lblCounselingE3.Caption := NullString;
  lblCounselingE4.Caption := NullString;

  lblCounselingF1.Caption := NullString;
  lblCounselingF2.Caption := NullString;

  qrMemoCounselingWorkerOpinion.Lines.Clear;
  qrMemoCounselingWorkerOpinionBody.Lines.Clear;
end;

procedure TfrmRecord.ClearSurvey1Report;
begin
  chkSurvey1Male.Checked := False;
  chkSurvey1FeMale.Checked := False;

  chkSurvey1Religion0.Checked := False;
  chkSurvey1Religion1.Checked := False;
  chkSurvey1Religion2.Checked := False;
  chkSurvey1Religion3.Checked := False;

  chkSurvey1Insu0.Checked := False;
  chkSurvey1Insu1.Checked := False;
  chkSurvey1Insu2.Checked := False;
  chkSurvey1Insu3.Checked := False;

  qrMemoSurvey1Relation.Lines.Clear;
  qrMemoSurvey1Name.Lines.Clear;
  qrMemoSurvey1InMate.Lines.Clear;
  qrMemoSurvey1Health.Lines.Clear;
  qrMemoSurvey1Pay.Lines.Clear;

  chkSurvey1Housing0.Checked := False;
  chkSurvey1Housing1.Checked := False;
  chkSurvey1Housing2.Checked := False;
  chkSurvey1Housing3.Checked := False;
  chkSurvey1Housing4.Checked := False;

  qrlblSurvey1Year1.Caption := NullString;
  qrlblSurvey1Month2.Caption := NullString;
  qrlblSurvey1Year3.Caption := NullString;
  qrlblSurvey1Month3.Caption := NullString;
  qrlblSurvey1Month4.Caption := NullString;

  chkSurvey1Economic0.Checked := False;
  chkSurvey1Economic1.Checked := False;
  chkSurvey1Economic2.Checked := False;
  chkSurvey1Economic3.Checked := False;
  chkSurvey1Economic4.Checked := False;
  chkSurvey1Economic5.Checked := False;
  chkSurvey1Economic6.Checked := False;

  qrlblEconomic3.Caption := NullString;
  qrlblEconomic6.Caption := NullString;

  chkSurvey1Career0.Checked := False;
  chkSurvey1Career1.Checked := False;
  chkSurvey1Career2.Checked := False;
  chkSurvey1Career3.Checked := False;
  chkSurvey1Career4.Checked := False;
  chkSurvey1Career5.Checked := False;
  chkSurvey1Career6.Checked := False;

  chkSurvey1ArmyCareer0.Checked := False;
  chkSurvey1ArmyCareer1.Checked := False;
  chkSurvey1ArmyCareer2.Checked := False;

  chkSurvey1Protector0.Checked := False;
  chkSurvey1Protector1.Checked := False;
  chkSurvey1Protector2.Checked := False;
  chkSurvey1Protector3.Checked := False;
  chkSurvey1Protector4.Checked := False;
  chkSurvey1Protector5.Checked := False;
  chkSurvey1Protector6.Checked := False;

  chkSurvey1ToSolveProblem0.Checked := False;
  chkSurvey1ToSolveProblem1.Checked := False;
  chkSurvey1ToSolveProblem2.Checked := False;
  chkSurvey1ToSolveProblem3.Checked := False;

  chkSurvey1Expectation0.Checked := False;
  chkSurvey1Expectation1.Checked := False;
  chkSurvey1Expectation2.Checked := False;
  chkSurvey1Expectation3.Checked := False;
  chkSurvey1Expectation4.Checked := False;
  chkSurvey1Expectation5.Checked := False;

  qrMemoSurvey1ResourceAfterLeaving.Lines.Clear;
  qrMemoSurvey1ETC.Lines.Clear;
end;

procedure TfrmRecord.ClearSurvey2Report;
begin
  lblSurvey2Q11.Caption := NullString;
  lblSurvey2Q21.Caption := NullString;
  lblSurvey2Q31.Caption := NullString;
  lblSurvey2Q41.Caption := NullString;
  lblSurvey2Q51.Caption := NullString;
  lblSurvey2Q61.Caption := NullString;
  lblSurvey2Q71.Caption := NullString;
  lblSurvey2Q81.Caption := NullString;
  lblSurvey2Q91.Caption := NullString;
  lblSurvey2Q101.Caption := NullString;
  lblSurvey2Q111.Caption := NullString;
  lblSurvey2Q121.Caption := NullString;
  lblSurvey2Q131.Caption := NullString;
  lblSurvey2Q141.Caption := NullString;

  lblSurvey2Q12.Caption := NullString;
  lblSurvey2Q22.Caption := NullString;
  lblSurvey2Q32.Caption := NullString;
  lblSurvey2Q42.Caption := NullString;
  lblSurvey2Q52.Caption := NullString;
  lblSurvey2Q62.Caption := NullString;
  lblSurvey2Q72.Caption := NullString;
  lblSurvey2Q82.Caption := NullString;
  lblSurvey2Q92.Caption := NullString;
  lblSurvey2Q102.Caption := NullString;
  lblSurvey2Q112.Caption := NullString;
  lblSurvey2Q122.Caption := NullString;
  lblSurvey2Q132.Caption := NullString;
  lblSurvey2Q142.Caption := NullString;

  lblSurvey2Q13.Caption := NullString;
  lblSurvey2Q23.Caption := NullString;
  lblSurvey2Q33.Caption := NullString;
  lblSurvey2Q43.Caption := NullString;
  lblSurvey2Q53.Caption := NullString;
  lblSurvey2Q63.Caption := NullString;
  lblSurvey2Q73.Caption := NullString;
  lblSurvey2Q83.Caption := NullString;
  lblSurvey2Q93.Caption := NullString;
  lblSurvey2Q103.Caption := NullString;
  lblSurvey2Q113.Caption := NullString;
  lblSurvey2Q123.Caption := NullString;
  lblSurvey2Q133.Caption := NullString;
  lblSurvey2Q143.Caption := NullString;

  lblSurvey2Q14.Caption := NullString;
  lblSurvey2Q24.Caption := NullString;
  lblSurvey2Q34.Caption := NullString;
  lblSurvey2Q44.Caption := NullString;
  lblSurvey2Q54.Caption := NullString;
  lblSurvey2Q64.Caption := NullString;
  lblSurvey2Q74.Caption := NullString;
  lblSurvey2Q84.Caption := NullString;
  lblSurvey2Q94.Caption := NullString;
  lblSurvey2Q104.Caption := NullString;
  lblSurvey2Q114.Caption := NullString;
  lblSurvey2Q124.Caption := NullString;
  lblSurvey2Q134.Caption := NullString;
  lblSurvey2Q144.Caption := NullString;

  lblSurvey2Q15.Caption := NullString;
  lblSurvey2Q25.Caption := NullString;
  lblSurvey2Q35.Caption := NullString;
  lblSurvey2Q45.Caption := NullString;
  lblSurvey2Q55.Caption := NullString;
  lblSurvey2Q65.Caption := NullString;
  lblSurvey2Q75.Caption := NullString;
  lblSurvey2Q85.Caption := NullString;
  lblSurvey2Q95.Caption := NullString;
  lblSurvey2Q105.Caption := NullString;
  lblSurvey2Q115.Caption := NullString;
  lblSurvey2Q125.Caption := NullString;
  lblSurvey2Q135.Caption := NullString;
  lblSurvey2Q145.Caption := NullString;

  qrMemoSurvey2WorkerOpinion.Lines.Clear;
end;

procedure TfrmRecord.ClearTrainingReport;
begin
  lblTrainingTitle.Caption := '___ session';

  qrMemoTrainingRequest.Lines.Clear;
  qrMemoTrainingRequestTitle.Lines.Clear;
  qrMemoTrainingRequestBody.Lines.Clear;

  qrMemoTrainingPurpose.Lines.Clear;
  qrMemoTrainingPurposeTitle.Lines.Clear;
  qrMemoTrainingPurposeBody.Lines.Clear;

  qrMemoTrainingIntervationCourse.Lines.Clear;
  qrMemoTrainingIntervationCourseBody.Lines.Clear;

  qrMemoTrainingWorkerOpinion.Lines.Clear;
  qrMemoTrainingWorkerOpinionBody.Lines.Clear;
end;

procedure TfrmRecord.ClearVisitReport;
begin
  qrlblVisitTitle.Caption := '가정방문 기록지';

  chkAccompany1.Checked := False;
  chkAccompany2.Checked := False;
  chkAccompany3.Checked := False;
  chkAccompany4.Checked := False;
  chkAccompany5.Checked := False;

  qrlblVisitSexAge.Caption := NullString;

  chkVisitMale.Checked := False;
  chkVisitFeMale.Checked := False;

  chkPhimself1.Checked := False;
  chkPhimself2.Checked := False;
  chkPhimself3.Checked := False;
  chkPhimself4.Checked := False;
  chkPhimself5.Checked := False;

  chkPBohum1.Checked := False;
  chkPBohum2.Checked := False;
  chkPBohum3.Checked := False;
  chkPBohum4.Checked := False;
  chkPBohum5.Checked := False;
end;

procedure TfrmRecord.DisplayPageNum(Sender: TObject);
begin
  if Sender = QRPreviewIntake then
  begin
    if QRPreviewIntake.QRPrinter = nil then
      pnlIntakePageNum.Caption := '0/0'
    else
      pnlIntakePageNum.Caption := inttostr(QRPreviewIntake.PageNumber)
        + '/' + inttostr(QRPreviewIntake.QRPrinter.PageCount);
  end
  else if Sender = QRPreviewSurvey1 then
  begin
    if QRPreviewSurvey1.QRPrinter = nil then
      pnlSurvey1PageNum.Caption := '0/0'
    else
      pnlSurvey1PageNum.Caption := inttostr(QRPreviewSurvey1.PageNumber)
        + '/' + inttostr(QRPreviewSurvey1.QRPrinter.PageCount);
  end
  else if Sender = QRPreviewSurvey2 then
  begin
    if QRPreviewSurvey2.QRPrinter = nil then
      pnlSurvey2PageNum.Caption := '0/0'
    else
      pnlSurvey2PageNum.Caption := inttostr(QRPreviewSurvey2.PageNumber)
        + '/' + inttostr(QRPreviewSurvey2.QRPrinter.PageCount);
  end
  else if Sender = QRPreviewCounseling then
  begin
    if QRPreviewCounseling.QRPrinter = nil then
      pnlCounselingPageNum.Caption := '0/0'
    else
      pnlCounselingPageNum.Caption := inttostr(QRPreviewCounseling.PageNumber)
        + '/' + inttostr(QRPreviewCounseling.QRPrinter.PageCount);
  end
  else if Sender = QRPreviewTraining then
  begin
    if QRPreviewTraining.QRPrinter = nil then
      pnlTrainingPageNum.Caption := '0/0'
    else
      pnlTrainingPageNum.Caption := inttostr(QRPreviewTraining.PageNumber)
        + '/' + inttostr(QRPreviewTraining.QRPrinter.PageCount);
  end
  else if Sender = QRPreviewVisit then
  begin
    if QRPreviewVisit.QRPrinter = nil then
      pnlVisitPageNum.Caption := '0/0'
    else
      pnlVisitPageNum.Caption := inttostr(QRPreviewVisit.PageNumber)
        + '/' + inttostr(QRPreviewVisit.QRPrinter.PageCount);
  end;
end;

procedure TfrmRecord.dsCounselingDataChange(Sender: TObject; Field: TField);
begin
  if FLoaded and (adoCounseling.Tag = cDone) then
    actChangeCounseling.Execute;
end;

procedure TfrmRecord.dsInOutDataChange(Sender: TObject; Field: TField);
begin
  if not adoInOut.Active then
    Exit;
  if not FLoaded then
    Exit;

  actChangeInOut.Execute;
end;

procedure TfrmRecord.dsIntakeDataChange(Sender: TObject; Field: TField);
begin
  if FLoaded then
    actChangeIntake.Execute;
end;

procedure TfrmRecord.dsSurvey1DataChange(Sender: TObject; Field: TField);
begin
  if FLoaded then
    actChangeSurvey1.Execute;
end;

procedure TfrmRecord.dsSurvey2DataChange(Sender: TObject; Field: TField);
begin
  if FLoaded then
    actChangeSurvey2.Execute;
end;

procedure TfrmRecord.dsTrainingDataChange(Sender: TObject; Field: TField);
begin
  if FLoaded and (adoTraining.Tag = cDone) then
    actChangeTraining.Execute;
end;

procedure TfrmRecord.dsVisitDataChange(Sender: TObject; Field: TField);
begin
  if FLoaded and (adoVisit.Tag = cDone) then
    actChangeVisit.Execute;
end;

procedure TfrmRecord.FormShow(Sender: TObject);
begin
  FClose := False;

  tabPrint.TabVisible := False;
  cxPage.ActivePage := cxTabIntake;
  pnlLeft.Width := 490;

  try
    adoHospital.SQL.Clear;
    adoHospital.SQL.Text :=
      'select * from hospitals where hospitalID = ' + inttostr
      (oConfig.User.HospitalID);
    adoHospital.Open;

    if dbMain.GetWardList(oConfig.User.HospitalID, cboWard.Properties.Items,
      True) then
      cboWard.ItemIndex := 0
    else
    begin
      oGlobal.Msg('병동정보를 가져오지 못했습니다!');
      FClose := True;
    end;
  except
    oGlobal.Msg('병동정보를 가져오지 못했습니다!');
    FClose := True;
  end;

  try
    dbMain.GetBohumList(cboBohum.Properties.Items, True);
    cboBohum.ItemIndex := 0;
    actSelectWard.Execute;
  except
    oGlobal.Msg('기록지 정보를 가져오지 못했습니다!');
    FClose := True;
  end;

  Timer1.Enabled := True;
end;

procedure TfrmRecord.pnlLeftResize(Sender: TObject);
begin
  if pnlLeft.Width < 100 then
  begin
    pnlLeft.Width := 100;
    Splitter1.Left := pnlLeft.Width + 1;
  end;
end;

procedure TfrmRecord.QRPQuickrep1Preview(Sender: TObject);
begin
  QRPreviewIntake.QRPrinter := TQRPrinter(Sender);
end;

procedure TfrmRecord.QRSurvey1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  ClearSurvey1Report;

  qrMemoAddress.Lines.Text := adoSurvey1.FieldByName('Address').AsString;
  lblAddress.Caption := adoSurvey1.FieldByName('Address').AsString;

  qrMemoAddress.Top := 8;
  qrMemoAddress.Height := 39;

  if lblAddress.Width <= qrMemoAddress.Width then
  begin
    qrMemoAddress.Top := 16;
    qrMemoAddress.Height := 21;
  end;

  chkSurvey1Male.Checked := (adoInOut.FieldByName('Sex').AsString = cMale);
  chkSurvey1FeMale.Checked := not(adoInOut.FieldByName('Sex').AsString = cMale);

  if oGlobal.isNotNullStr(adoSurvey1.FieldByName('Religion').AsString) then
  begin
    chkSurvey1Religion0.Checked := (adoSurvey1.FieldByName('Religion')
        .AsInteger = 0);
    chkSurvey1Religion1.Checked := (adoSurvey1.FieldByName('Religion')
        .AsInteger = 1);
    chkSurvey1Religion2.Checked := (adoSurvey1.FieldByName('Religion')
        .AsInteger = 2);
    chkSurvey1Religion3.Checked := (adoSurvey1.FieldByName('Religion')
        .AsInteger = 3);
  end;

  if oGlobal.isNotNullStr(adoSurvey1.FieldByName('InsuType').AsString) then
  begin
    chkSurvey1Insu0.Checked := (adoSurvey1.FieldByName('InsuType')
        .AsInteger = 0);
    chkSurvey1Insu1.Checked := (adoSurvey1.FieldByName('InsuType')
        .AsInteger = 1);
    chkSurvey1Insu2.Checked := (adoSurvey1.FieldByName('InsuType')
        .AsInteger = 2);
    chkSurvey1Insu3.Checked := (adoSurvey1.FieldByName('InsuType')
        .AsInteger = 3);
  end;

  qrMemoSurvey1Relation.Lines.Clear;
  qrMemoSurvey1Name.Lines.Clear;
  qrMemoSurvey1InMate.Lines.Clear;
  qrMemoSurvey1Health.Lines.Clear;
  qrMemoSurvey1Pay.Lines.Clear;

  dbMain.SetFamilies(adoSurvey1.FieldByName('InOutID').AsInteger,
    qrMemoSurvey1Relation.Lines, qrMemoSurvey1Name.Lines,
    qrMemoSurvey1InMate.Lines, qrMemoSurvey1Health.Lines,
    qrMemoSurvey1Pay.Lines);

  SetLines(qrMemoSurvey1FamilyTitle, qrMemoSurvey1Relation.Lines.Count);

  if oGlobal.isNotNullStr(adoSurvey1.FieldByName('HousingType').AsString) then
  begin
    chkSurvey1Housing0.Checked := (adoSurvey1.FieldByName('HousingType')
        .AsInteger = 0);
    if adoSurvey1.FieldByName('HousingType').AsInteger = 1 then
    begin
      chkSurvey1Housing1.Checked := (adoSurvey1.FieldByName('HousingType')
          .AsInteger = 1);
      qrlblSurvey1Year1.Caption := adoSurvey1.FieldByName('HousingYear')
        .AsString;
    end;
    if adoSurvey1.FieldByName('HousingType').AsInteger = 2 then
    begin
      chkSurvey1Housing2.Checked := (adoSurvey1.FieldByName('HousingType')
          .AsInteger = 2);
      qrlblSurvey1Month2.Caption := adoSurvey1.FieldByName('HousingMonth')
        .AsString;
    end;
    if adoSurvey1.FieldByName('HousingType').AsInteger = 3 then
    begin
      chkSurvey1Housing3.Checked := (adoSurvey1.FieldByName('HousingType')
          .AsInteger = 3);
      qrlblSurvey1Year3.Caption := adoSurvey1.FieldByName('HousingYear')
        .AsString;
      qrlblSurvey1Month3.Caption := adoSurvey1.FieldByName('HousingMonth')
        .AsString;
    end;
    if adoSurvey1.FieldByName('HousingType').AsInteger = 4 then
    begin
      chkSurvey1Housing4.Checked := (adoSurvey1.FieldByName('HousingType')
          .AsInteger = 4);
      qrlblSurvey1Month4.Caption := adoSurvey1.FieldByName('HousingMonth')
        .AsString;
    end;
  end;

  if oGlobal.isNotNullStr(adoSurvey1.FieldByName('Economictype').AsString) then
  begin
    chkSurvey1Economic0.Checked := (adoSurvey1.FieldByName('EconomicType')
        .AsInteger = 0);
    chkSurvey1Economic1.Checked := (adoSurvey1.FieldByName('EconomicType')
        .AsInteger = 1);
    chkSurvey1Economic2.Checked := (adoSurvey1.FieldByName('EconomicType')
        .AsInteger = 2);
    chkSurvey1Economic3.Checked := (adoSurvey1.FieldByName('EconomicType')
        .AsInteger = 3);
    chkSurvey1Economic4.Checked := (adoSurvey1.FieldByName('EconomicType')
        .AsInteger = 4);
    chkSurvey1Economic5.Checked := (adoSurvey1.FieldByName('EconomicType')
        .AsInteger = 5);
    chkSurvey1Economic6.Checked := (adoSurvey1.FieldByName('EconomicType')
        .AsInteger = 6);
    case adoSurvey1.FieldByName('EconomicType').AsInteger of
      3:
        qrlblEconomic3.Caption := adoSurvey1.FieldByName('EconomicEtc')
          .AsString;
      6:
        qrlblEconomic6.Caption := adoSurvey1.FieldByName('EconomicEtc')
          .AsString;
    end;
  end;

  if oGlobal.isNotNullStr(adoSurvey1.FieldByName('Career').AsString) then
  begin
    chkSurvey1Career0.Checked := (adoSurvey1.FieldByName('Career')
        .AsInteger = 0);
    chkSurvey1Career1.Checked := (adoSurvey1.FieldByName('Career')
        .AsInteger = 1);
    chkSurvey1Career2.Checked := (adoSurvey1.FieldByName('Career')
        .AsInteger = 2);
    chkSurvey1Career3.Checked := (adoSurvey1.FieldByName('Career')
        .AsInteger = 3);
    chkSurvey1Career4.Checked := (adoSurvey1.FieldByName('Career')
        .AsInteger = 4);
    chkSurvey1Career5.Checked := (adoSurvey1.FieldByName('Career')
        .AsInteger = 5);
    chkSurvey1Career6.Checked := (adoSurvey1.FieldByName('Career')
        .AsInteger = 6);
  end;

  if oGlobal.isNotNullStr(adoSurvey1.FieldByName('ArmyCareer').AsString) then
  begin
    chkSurvey1ArmyCareer0.Checked := (adoSurvey1.FieldByName('ArmyCareer')
        .AsInteger = 0);
    chkSurvey1ArmyCareer1.Checked := (adoSurvey1.FieldByName('ArmyCareer')
        .AsInteger = 1);
    chkSurvey1ArmyCareer2.Checked := (adoSurvey1.FieldByName('ArmyCareer')
        .AsInteger = 2);
  end;

  if oGlobal.isNotNullStr(adoSurvey1.FieldByName('Protector').AsString) then
  begin
    chkSurvey1Protector0.Checked := (adoSurvey1.FieldByName('Protector')
        .AsInteger = 0);
    chkSurvey1Protector1.Checked := (adoSurvey1.FieldByName('Protector')
        .AsInteger = 1);
    chkSurvey1Protector2.Checked := (adoSurvey1.FieldByName('Protector')
        .AsInteger = 2);
    chkSurvey1Protector3.Checked := (adoSurvey1.FieldByName('Protector')
        .AsInteger = 3);
    chkSurvey1Protector4.Checked := (adoSurvey1.FieldByName('Protector')
        .AsInteger = 4);
    chkSurvey1Protector5.Checked := (adoSurvey1.FieldByName('Protector')
        .AsInteger = 5);
    chkSurvey1Protector6.Checked := (adoSurvey1.FieldByName('Protector')
        .AsInteger = 6);
  end;

  if oGlobal.isNotNullStr(adoSurvey1.FieldByName('ToSolveProblem').AsString)
    then
  begin
    chkSurvey1ToSolveProblem0.Checked :=
      (adoSurvey1.FieldByName('ToSolveProblem').AsInteger = 0);
    chkSurvey1ToSolveProblem1.Checked :=
      (adoSurvey1.FieldByName('ToSolveProblem').AsInteger = 1);
    chkSurvey1ToSolveProblem2.Checked :=
      (adoSurvey1.FieldByName('ToSolveProblem').AsInteger = 2);
    chkSurvey1ToSolveProblem3.Checked :=
      (adoSurvey1.FieldByName('ToSolveProblem').AsInteger = 3);
  end;

  if oGlobal.isNotNullStr(adoSurvey1.FieldByName('Expectation').AsString) then
  begin
    chkSurvey1Expectation0.Checked := (adoSurvey1.FieldByName('Expectation')
        .AsInteger = 0);
    chkSurvey1Expectation1.Checked := (adoSurvey1.FieldByName('Expectation')
        .AsInteger = 1);
    chkSurvey1Expectation2.Checked := (adoSurvey1.FieldByName('Expectation')
        .AsInteger = 2);
    chkSurvey1Expectation3.Checked := (adoSurvey1.FieldByName('Expectation')
        .AsInteger = 3);
    chkSurvey1Expectation4.Checked := (adoSurvey1.FieldByName('Expectation')
        .AsInteger = 4);
    chkSurvey1Expectation5.Checked := (adoSurvey1.FieldByName('Expectation')
        .AsInteger = 5);
  end;

  SetMemoSurvey1(qrMemoSurvey1ResourceAfterLeaving.Lines, adoSurvey1.FieldByName
      ('ResourceAfterLeaving').AsString);
  // qrMemoSurvey1ResourceAfterLeaving.Lines.Text := adoSurvey1.FieldByName('ResourceAfterLeaving').AsString;
  SetLines(qrMemoSurvey1ResourceAfterLeavingTitle,
    qrMemoSurvey1ResourceAfterLeaving.Lines.Count);
  SetLines(qrMemoSurvey1ResourceAfterLeavingBody,
    qrMemoSurvey1ResourceAfterLeaving.Lines.Count);

  SetMemoSurvey1(qrMemoSurvey1ETC.Lines, adoSurvey1.FieldByName('ETC')
      .AsString);
  // qrMemoSurvey1ETC.Lines.Text := adoSurvey1.FieldByName('ETC').AsString;
  SetLines(qrMemoSurvey1ETCTitle, qrMemoSurvey1ETC.Lines.Count);
  SetLines(qrMemoSurvey1ETCBody, qrMemoSurvey1ETC.Lines.Count);
end;

procedure TfrmRecord.QRSurvey1Preview(Sender: TObject);
begin
  QRPreviewSurvey1.QRPrinter := TQRPrinter(Sender);
end;

procedure TfrmRecord.QRSurvey2BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  ClearSurvey2Report;

  qrlblSurvey2SexAge.Caption := adoInOut.FieldByName('Sex')
    .AsString + ' (' + oGlobal.GetAge(adoInOut.FieldByName('Birthday')
      .AsString, adoInOut.FieldByName('InDate').AsString) + ')';

  if (adoSurvey2.FieldByName('Q1').AsInteger = 0) then
    lblSurvey2Q11.Caption := 'O';
  if (adoSurvey2.FieldByName('Q2').AsInteger = 0) then
    lblSurvey2Q21.Caption := 'O';
  if (adoSurvey2.FieldByName('Q3').AsInteger = 0) then
    lblSurvey2Q31.Caption := 'O';
  if (adoSurvey2.FieldByName('Q4').AsInteger = 0) then
    lblSurvey2Q41.Caption := 'O';
  if (adoSurvey2.FieldByName('Q5').AsInteger = 0) then
    lblSurvey2Q51.Caption := 'O';
  if (adoSurvey2.FieldByName('Q6').AsInteger = 0) then
    lblSurvey2Q61.Caption := 'O';
  if (adoSurvey2.FieldByName('Q7').AsInteger = 0) then
    lblSurvey2Q71.Caption := 'O';
  if (adoSurvey2.FieldByName('Q8').AsInteger = 0) then
    lblSurvey2Q81.Caption := 'O';
  if (adoSurvey2.FieldByName('Q9').AsInteger = 0) then
    lblSurvey2Q91.Caption := 'O';
  if (adoSurvey2.FieldByName('Q10').AsInteger = 0) then
    lblSurvey2Q101.Caption := 'O';
  if (adoSurvey2.FieldByName('Q11').AsInteger = 0) then
    lblSurvey2Q111.Caption := 'O';
  if (adoSurvey2.FieldByName('Q12').AsInteger = 0) then
    lblSurvey2Q121.Caption := 'O';
  if (adoSurvey2.FieldByName('Q13').AsInteger = 0) then
    lblSurvey2Q131.Caption := 'O';
  if (adoSurvey2.FieldByName('Q14').AsInteger = 0) then
    lblSurvey2Q141.Caption := 'O';

  if (adoSurvey2.FieldByName('Q1').AsInteger = 1) then
    lblSurvey2Q12.Caption := 'O';
  if (adoSurvey2.FieldByName('Q2').AsInteger = 1) then
    lblSurvey2Q22.Caption := 'O';
  if (adoSurvey2.FieldByName('Q3').AsInteger = 1) then
    lblSurvey2Q32.Caption := 'O';
  if (adoSurvey2.FieldByName('Q4').AsInteger = 1) then
    lblSurvey2Q42.Caption := 'O';
  if (adoSurvey2.FieldByName('Q5').AsInteger = 1) then
    lblSurvey2Q52.Caption := 'O';
  if (adoSurvey2.FieldByName('Q6').AsInteger = 1) then
    lblSurvey2Q62.Caption := 'O';
  if (adoSurvey2.FieldByName('Q7').AsInteger = 1) then
    lblSurvey2Q72.Caption := 'O';
  if (adoSurvey2.FieldByName('Q8').AsInteger = 1) then
    lblSurvey2Q82.Caption := 'O';
  if (adoSurvey2.FieldByName('Q9').AsInteger = 1) then
    lblSurvey2Q92.Caption := 'O';
  if (adoSurvey2.FieldByName('Q10').AsInteger = 1) then
    lblSurvey2Q102.Caption := 'O';
  if (adoSurvey2.FieldByName('Q11').AsInteger = 1) then
    lblSurvey2Q112.Caption := 'O';
  if (adoSurvey2.FieldByName('Q12').AsInteger = 1) then
    lblSurvey2Q122.Caption := 'O';
  if (adoSurvey2.FieldByName('Q13').AsInteger = 1) then
    lblSurvey2Q132.Caption := 'O';
  if (adoSurvey2.FieldByName('Q14').AsInteger = 1) then
    lblSurvey2Q142.Caption := 'O';

  if (adoSurvey2.FieldByName('Q1').AsInteger = 2) then
    lblSurvey2Q13.Caption := 'O';
  if (adoSurvey2.FieldByName('Q2').AsInteger = 2) then
    lblSurvey2Q23.Caption := 'O';
  if (adoSurvey2.FieldByName('Q3').AsInteger = 2) then
    lblSurvey2Q33.Caption := 'O';
  if (adoSurvey2.FieldByName('Q4').AsInteger = 2) then
    lblSurvey2Q43.Caption := 'O';
  if (adoSurvey2.FieldByName('Q5').AsInteger = 2) then
    lblSurvey2Q53.Caption := 'O';
  if (adoSurvey2.FieldByName('Q6').AsInteger = 2) then
    lblSurvey2Q63.Caption := 'O';
  if (adoSurvey2.FieldByName('Q7').AsInteger = 2) then
    lblSurvey2Q73.Caption := 'O';
  if (adoSurvey2.FieldByName('Q8').AsInteger = 2) then
    lblSurvey2Q83.Caption := 'O';
  if (adoSurvey2.FieldByName('Q9').AsInteger = 2) then
    lblSurvey2Q93.Caption := 'O';
  if (adoSurvey2.FieldByName('Q10').AsInteger = 2) then
    lblSurvey2Q103.Caption := 'O';
  if (adoSurvey2.FieldByName('Q11').AsInteger = 2) then
    lblSurvey2Q113.Caption := 'O';
  if (adoSurvey2.FieldByName('Q12').AsInteger = 2) then
    lblSurvey2Q123.Caption := 'O';
  if (adoSurvey2.FieldByName('Q13').AsInteger = 2) then
    lblSurvey2Q133.Caption := 'O';
  if (adoSurvey2.FieldByName('Q14').AsInteger = 2) then
    lblSurvey2Q143.Caption := 'O';

  if (adoSurvey2.FieldByName('Q1').AsInteger = 3) then
    lblSurvey2Q14.Caption := 'O';
  if (adoSurvey2.FieldByName('Q2').AsInteger = 3) then
    lblSurvey2Q24.Caption := 'O';
  if (adoSurvey2.FieldByName('Q3').AsInteger = 3) then
    lblSurvey2Q34.Caption := 'O';
  if (adoSurvey2.FieldByName('Q4').AsInteger = 3) then
    lblSurvey2Q44.Caption := 'O';
  if (adoSurvey2.FieldByName('Q5').AsInteger = 3) then
    lblSurvey2Q54.Caption := 'O';
  if (adoSurvey2.FieldByName('Q6').AsInteger = 3) then
    lblSurvey2Q64.Caption := 'O';
  if (adoSurvey2.FieldByName('Q7').AsInteger = 3) then
    lblSurvey2Q74.Caption := 'O';
  if (adoSurvey2.FieldByName('Q8').AsInteger = 3) then
    lblSurvey2Q84.Caption := 'O';
  if (adoSurvey2.FieldByName('Q9').AsInteger = 3) then
    lblSurvey2Q94.Caption := 'O';
  if (adoSurvey2.FieldByName('Q10').AsInteger = 3) then
    lblSurvey2Q104.Caption := 'O';
  if (adoSurvey2.FieldByName('Q11').AsInteger = 3) then
    lblSurvey2Q114.Caption := 'O';
  if (adoSurvey2.FieldByName('Q12').AsInteger = 3) then
    lblSurvey2Q124.Caption := 'O';
  if (adoSurvey2.FieldByName('Q13').AsInteger = 3) then
    lblSurvey2Q134.Caption := 'O';
  if (adoSurvey2.FieldByName('Q14').AsInteger = 3) then
    lblSurvey2Q144.Caption := 'O';

  if (adoSurvey2.FieldByName('Q1').AsInteger = 4) then
    lblSurvey2Q15.Caption := 'O';
  if (adoSurvey2.FieldByName('Q2').AsInteger = 4) then
    lblSurvey2Q25.Caption := 'O';
  if (adoSurvey2.FieldByName('Q3').AsInteger = 4) then
    lblSurvey2Q35.Caption := 'O';
  if (adoSurvey2.FieldByName('Q4').AsInteger = 4) then
    lblSurvey2Q45.Caption := 'O';
  if (adoSurvey2.FieldByName('Q5').AsInteger = 4) then
    lblSurvey2Q55.Caption := 'O';
  if (adoSurvey2.FieldByName('Q6').AsInteger = 4) then
    lblSurvey2Q65.Caption := 'O';
  if (adoSurvey2.FieldByName('Q7').AsInteger = 4) then
    lblSurvey2Q75.Caption := 'O';
  if (adoSurvey2.FieldByName('Q8').AsInteger = 4) then
    lblSurvey2Q85.Caption := 'O';
  if (adoSurvey2.FieldByName('Q9').AsInteger = 4) then
    lblSurvey2Q95.Caption := 'O';
  if (adoSurvey2.FieldByName('Q10').AsInteger = 4) then
    lblSurvey2Q105.Caption := 'O';
  if (adoSurvey2.FieldByName('Q11').AsInteger = 4) then
    lblSurvey2Q115.Caption := 'O';
  if (adoSurvey2.FieldByName('Q12').AsInteger = 4) then
    lblSurvey2Q125.Caption := 'O';
  if (adoSurvey2.FieldByName('Q13').AsInteger = 4) then
    lblSurvey2Q135.Caption := 'O';
  if (adoSurvey2.FieldByName('Q14').AsInteger = 4) then
    lblSurvey2Q145.Caption := 'O';

  SetMemoTemp(qrMemoSurvey2WorkerOpinion.Lines, adoSurvey2.FieldByName
      ('WorkerOpinion').AsString);
  // qrMemoSurvey2WorkerOpinion.Lines.Text := adoSurvey2.FieldByName('WorkerOpinion').AsString;
  SetLines(qrMemoSurvey2WorkerOpinionBody,
    qrMemoSurvey2WorkerOpinion.Lines.Count);
end;

procedure TfrmRecord.QRSurvey2Preview(Sender: TObject);
begin
  QRPreviewSurvey2.QRPrinter := TQRPrinter(Sender);
end;

procedure TfrmRecord.QRTrainingBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  ClearTrainingReport;

  qrlblTrainingSexAge.Caption := adoInOut.FieldByName('Sex')
    .AsString + ' (' + oGlobal.GetAge(adoInOut.FieldByName('Birthday')
      .AsString, adoInOut.FieldByName('InDate').AsString) + ')';

  lblTrainingTitle.Caption := adoTraining.FieldByName('Seq')
    .AsString + ' session';

  SetMemoIntake(qrMemoTrainingRequest.Lines, adoTraining.FieldByName('Request')
      .AsString);
  // qrMemoTrainingRequest.Lines.Text := adoTraining.FieldByName('Request').AsString;
  SetLines(qrMemoTrainingRequestTitle, qrMemoTrainingRequest.Lines.Count);
  SetLines(qrMemoTrainingRequestBody, qrMemoTrainingRequest.Lines.Count);

  SetMemoIntake(qrMemoTrainingPurpose.Lines, adoTraining.FieldByName('Purpose')
      .AsString);
  // qrMemoTrainingPurpose.Lines.Text := adoTraining.FieldByName('Purpose').AsString;
  SetLines(qrMemoTrainingPurposeTitle, qrMemoTrainingPurpose.Lines.Count);
  SetLines(qrMemoTrainingPurposeBody, qrMemoTrainingPurpose.Lines.Count);

  SetMemoTemp(qrMemoTrainingIntervationCourse.Lines, adoTraining.FieldByName
      ('IntervationCourse').AsString);
  // qrMemoTrainingIntervationCourse.Lines.Text := adoTraining.FieldByName('IntervationCourse').AsString;
  SetLines(qrMemoTrainingIntervationCourseBody,
    qrMemoTrainingIntervationCourse.Lines.Count);

  SetMemoTemp(qrMemoTrainingWorkerOpinion.Lines, adoTraining.FieldByName
      ('WorkerOpinion').AsString);
  // qrMemoTrainingWorkerOpinion.Lines.Text := adoTraining.FieldByName('WorkerOpinion').AsString;
  SetLines(qrMemoTrainingWorkerOpinionBody,
    qrMemoTrainingWorkerOpinion.Lines.Count);
end;

procedure TfrmRecord.QRTrainingPreview(Sender: TObject);
begin
  QRPreviewTraining.QRPrinter := TQRPrinter(Sender);
end;

procedure TfrmRecord.QRVisitBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  nAccompany, nPhimself, nPBohum, nH: integer;
begin
  ClearVisitReport;

  qrlblVisitTitle.Caption := '가정방문 기록지 ' + adoVisit.FieldByName('Seq').AsString;

  qrlblVisitSexAge.Caption := adoInOut.FieldByName('Sex')
    .AsString + ' (' + oGlobal.GetAge(adoInOut.FieldByName('Birthday')
      .AsString, adoInOut.FieldByName('InDate').AsString) + ')';

  chkVisitMale.Checked := adoVisit.FieldByName('PSex').AsString = cMale;
  chkVisitFeMale.Checked := adoVisit.FieldByName('PSex').AsString = cFeMale;

  if adoVisit.FieldByName('Accompany').AsString = NullString then
    nAccompany := 0
  else
    nAccompany := adoVisit.FieldByName('Accompany').AsInteger;

  chkAccompany1.Checked := nAccompany = 1;
  chkAccompany2.Checked := nAccompany = 2;
  chkAccompany3.Checked := nAccompany = 3;
  chkAccompany4.Checked := nAccompany = 4;
  chkAccompany5.Checked := nAccompany = 5;

  if adoVisit.FieldByName('PHimself').AsString = NullString then
    nPhimself := 0
  else
    nPhimself := adoVisit.FieldByName('PHimself').AsInteger;

  chkPhimself1.Checked := nPhimself = 1;
  chkPhimself2.Checked := nPhimself = 2;
  chkPhimself3.Checked := nPhimself = 3;
  chkPhimself4.Checked := nPhimself = 4;
  chkPhimself5.Checked := nPhimself = 5;

  if adoVisit.FieldByName('PBohum').AsString = NullString then
    nPBohum := 0
  else
    nPBohum := adoVisit.FieldByName('PBohum').AsInteger;

  chkPBohum1.Checked := nPBohum = 1;
  chkPBohum2.Checked := nPBohum = 2;
  chkPBohum3.Checked := nPBohum = 3;
  chkPBohum4.Checked := nPBohum = 4;
  chkPBohum5.Checked := nPBohum = 5;

  qrMemoVisitEconomyLine1.Top := 30;
  qrMemoVisitEconomyLine2.Top := 30;
  qrMemoVisitETCLine1.Top := 30;
  qrMemoVisitETCLine2.Top := 30;
  qrMemoVisitValueLine.Top := 30;
  qrMemoVisitActionLine.Top := 30;
  qrMemoVisitCommentLine.Top := 30;

  SetMemoIntake(qrMemoVisitEconomy.Lines, adoVisit.FieldByName('D1').AsString);
  SetLines(qrMemoVisitEconomyTitle1, qrMemoVisitEconomy.Lines.Count);
  SetLines(qrMemoVisitEconomyTitle2, qrMemoVisitEconomy.Lines.Count);
  SetLines(qrMemoVisitEconomyBody, qrMemoVisitEconomy.Lines.Count);

  nH := lblFontHeight.Height * qrMemoVisitEconomy.Lines.Count + 16;
  if nH > qrMemoVisitEconomyTitle1.Height then
  begin
    qrMemoVisitEconomyLine1.Top := qrMemoVisitEconomyTitle1.Height -
      qrMemoVisitEconomyLine1.Height + 2;
    qrMemoVisitEconomyLine2.Top := qrMemoVisitEconomyTitle2.Height -
      qrMemoVisitEconomyLine2.Height + 2;
  end;

  SetMemoIntake(qrMemoVisitETC.Lines, adoVisit.FieldByName('D2').AsString);
  SetLines(qrMemoVisitETCTitle1, qrMemoVisitETC.Lines.Count);
  SetLines(qrMemoVisitETCTitle2, qrMemoVisitETC.Lines.Count);
  SetLines(qrMemoVisitETCBody, qrMemoVisitETC.Lines.Count);

  nH := lblFontHeight.Height * qrMemoVisitETC.Lines.Count + 16;
  if nH > qrMemoVisitETCTitle1.Height then
  begin
    qrMemoVisitETCLine1.Top := qrMemoVisitETCTitle1.Height -
      qrMemoVisitETCLine1.Height + 2;
    qrMemoVisitETCLine2.Top := qrMemoVisitETCTitle2.Height -
      qrMemoVisitETCLine2.Height + 2;
  end;

  SetMemoIntake(qrMemoVisitValue.Lines, adoVisit.FieldByName('E1').AsString);
  SetLines(qrMemoVisitValueTitle, qrMemoVisitValue.Lines.Count);
  SetLines(qrMemoVisitValueBody, qrMemoVisitValue.Lines.Count);

  nH := lblFontHeight.Height * qrMemoVisitValue.Lines.Count + 16;
  if nH > qrMemoVisitValueTitle.Height then
    qrMemoVisitValueLine.Top := qrMemoVisitValueTitle.Height -
      qrMemoVisitValueLine.Height + 2;

  SetMemoIntake(qrMemoVisitAction.Lines, adoVisit.FieldByName('E2').AsString);
  SetLines(qrMemoVisitActionTitle, qrMemoVisitAction.Lines.Count);
  SetLines(qrMemoVisitActionBody, qrMemoVisitAction.Lines.Count);

  nH := lblFontHeight.Height * qrMemoVisitAction.Lines.Count + 16;
  if nH > qrMemoVisitActionTitle.Height then
    qrMemoVisitActionLine.Top := qrMemoVisitActionTitle.Height -
      qrMemoVisitActionLine.Height + 2;

  SetMemoIntake(qrMemoVisitComment.Lines, adoVisit.FieldByName('Comment')
      .AsString);
  SetLines(qrMemoVisitCommentTitle, qrMemoVisitComment.Lines.Count);
  SetLines(qrMemoVisitCommentBody, qrMemoVisitComment.Lines.Count);

  nH := lblFontHeight.Height * qrMemoVisitComment.Lines.Count + 16;

  if nH > qrMemoVisitCommentTitle.Height then
    qrMemoVisitCommentLine.Top := qrMemoVisitCommentTitle.Height -
      qrMemoVisitCommentLine.Height + 2;
end;

procedure TfrmRecord.QRVisitPreview(Sender: TObject);
begin
  QRPreviewVisit.QRPrinter := TQRPrinter(Sender);
end;

procedure TfrmRecord.RefreshInOut(nInOutID: integer);
begin
  if adoInOut.IsEmpty then
    Exit;

  FLoaded := False;

  adoInOut.DisableControls;
  adoInOut.Close;
  adoInOut.Open;
  adoInOut.Locate('InOutID', nInOutID, [loCaseInsensitive]);
  adoInOut.EnableControls;

  FLoaded := True;
end;

procedure TfrmRecord.QRCounselingBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  ClearCounselingReport;

  qrlblCounselingSexAge.Caption := adoInOut.FieldByName('Sex')
    .AsString + ' (' + oGlobal.GetAge(adoInOut.FieldByName('Birthday')
      .AsString, adoInOut.FieldByName('InDate').AsString) + ')';

  lblCounselingTitle.Caption := '사회사업지도 ' + adoCounseling.FieldByName('Seq')
    .AsString;

  if (adoCounseling.FieldByName('A1').AsBoolean) then
    lblCounselingA1.Caption := 'O';
  if (adoCounseling.FieldByName('A2').AsBoolean) then
    lblCounselingA2.Caption := 'O';
  if (adoCounseling.FieldByName('A3').AsBoolean) then
    lblCounselingA3.Caption := 'O';
  if (adoCounseling.FieldByName('A4').AsBoolean) then
    lblCounselingA4.Caption := 'O';
  if (adoCounseling.FieldByName('A5').AsBoolean) then
    lblCounselingA5.Caption := 'O';

  if (adoCounseling.FieldByName('B1').AsBoolean) then
    lblCounselingB1.Caption := 'O';
  if (adoCounseling.FieldByName('B2').AsBoolean) then
    lblCounselingB2.Caption := 'O';
  if (adoCounseling.FieldByName('B3').AsBoolean) then
    lblCounselingB3.Caption := 'O';
  if (adoCounseling.FieldByName('B4').AsBoolean) then
    lblCounselingB4.Caption := 'O';
  if (adoCounseling.FieldByName('B5').AsBoolean) then
    lblCounselingB5.Caption := 'O';

  if (adoCounseling.FieldByName('C1').AsBoolean) then
    lblCounselingC1.Caption := 'O';
  if (adoCounseling.FieldByName('C2').AsBoolean) then
    lblCounselingC2.Caption := 'O';
  if (adoCounseling.FieldByName('C3').AsBoolean) then
    lblCounselingC3.Caption := 'O';

  if (adoCounseling.FieldByName('D1').AsBoolean) then
    lblCounselingD1.Caption := 'O';
  if (adoCounseling.FieldByName('D2').AsBoolean) then
    lblCounselingD2.Caption := 'O';

  if (adoCounseling.FieldByName('E1').AsBoolean) then
    lblCounselingE1.Caption := 'O';
  if (adoCounseling.FieldByName('E2').AsBoolean) then
    lblCounselingE2.Caption := 'O';
  if (adoCounseling.FieldByName('E3').AsBoolean) then
    lblCounselingE3.Caption := 'O';
  if (adoCounseling.FieldByName('E4').AsBoolean) then
    lblCounselingE4.Caption := 'O';

  if (adoCounseling.FieldByName('F1').AsBoolean) then
    lblCounselingF1.Caption := 'O';
  if (adoCounseling.FieldByName('F2').AsBoolean) then
    lblCounselingF2.Caption := 'O';

  SetMemoTemp(qrMemoCounselingWorkerOpinion.Lines, adoCounseling.FieldByName
      ('WorkerOpinion').AsString);
  // qrMemoCounselingWorkerOpinion.Lines.Text := adoCounseling.FieldByName('WorkerOpinion').AsString;
  SetLines(qrMemoCounselingWorkerOpinionBody,
    qrMemoCounselingWorkerOpinion.Lines.Count);
end;

procedure TfrmRecord.QRCounselingPreview(Sender: TObject);
begin
  QRPreviewCounseling.QRPrinter := TQRPrinter(Sender);
end;

procedure TfrmRecord.QRIntakeBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  qrlblIntakeSexAge.Caption := adoInOut.FieldByName('Sex')
    .AsString + ' (' + oGlobal.GetAge(adoInOut.FieldByName('Birthday')
      .AsString, adoInOut.FieldByName('InDate').AsString) + ')';

  SetMemoIntake(qrMemoInMotivation.Lines, adoIntake.FieldByName('InMotivation')
      .AsString);
  // QRMemoInMotivation.Lines.Text := adoIntake.FieldByName('InMotivation').AsString;
  SetLines(qrMemoInMotivationTitle, qrMemoInMotivation.Lines.Count);
  SetLines(qrMemoInMotivationBody, qrMemoInMotivation.Lines.Count);

  SetMemoIntake(qrMemoMajorProblem.Lines, adoIntake.FieldByName('MajorProblem')
      .AsString);
  // QRMemoMajorProblem.Lines.Text := adoIntake.FieldByName('MajorProblem').AsString;
  SetLines(qrMemoMajorProblemTitle, qrMemoMajorProblem.Lines.Count);
  SetLines(qrMemoMajorProblemBody, qrMemoMajorProblem.Lines.Count);

  SetMemoIntake(qrMemoInHistory.Lines, adoIntake.FieldByName('InHistory')
      .AsString);
  // QRMemoInHistory.Lines.Text := adoIntake.FieldByName('InHistory').AsString;
  SetLines(qrMemoInHistoryTitle, qrMemoInHistory.Lines.Count);
  SetLines(qrMemoInHistoryBody, qrMemoInHistory.Lines.Count);

  SetMemoIntake(qrMemoPersonHistory.Lines, adoIntake.FieldByName
      ('PersonHistory').AsString);
  // QRMemoPersonHistory.Lines.Text := adoIntake.FieldByName('PersonHistory').AsString;
  SetLines(qrMemoPersonHistoryTitle, qrMemoPersonHistory.Lines.Count);
  SetLines(qrMemoPersonHistoryBody, qrMemoPersonHistory.Lines.Count);

  dbMain.SetFamilies(adoIntake.FieldByName('InOutID').AsInteger,
    QRMemoFamilyRelationship.Lines, QRMemoFamilyName.Lines);
  SetLines(qrMemoRelationshipTitle, QRMemoFamilyName.Lines.Count);
  SetLines(qrMemoRelationship, QRMemoFamilyName.Lines.Count);

  SetMemoIntake(qrMemoWorkerOpinion.Lines, adoIntake.FieldByName
      ('WorkerOpinion').AsString);
  // QRMemoWorkerOpinion.Lines.Text := adoIntake.FieldByName('WorkerOpinion').AsString;
  SetLines(qrMemoWorkerOpinionTitle, qrMemoWorkerOpinion.Lines.Count);
  SetLines(qrMemoWorkerOpinionBody, qrMemoWorkerOpinion.Lines.Count);
end;

procedure TfrmRecord.QRIntakePreview(Sender: TObject);
begin
  QRPreviewIntake.QRPrinter := TQRPrinter(Sender);
end;

procedure TfrmRecord.SetPreviewType(Sender: TObject);
begin
  if Sender is TQRPreview then
    TQRPreview(Sender).VertScrollBar.Position := 0;

  if Sender = QRPreviewIntake then
  begin
    // qrPreviewIntake.VertScrollBar.Position := 0;

    if btnIntakePreviewFit.Down then
      QRPreviewIntake.ZoomToFit
    else if btnIntakePreviewWidth.Down then
      QRPreviewIntake.ZoomToWidth
    else
      QRPreviewIntake.Zoom := cxSEIntakeZoom.Value;
  end
  else if Sender = QRPreviewSurvey1 then
  begin
    if btnSurvey1PreviewFit.Down then
      QRPreviewSurvey1.ZoomToFit
    else if btnSurvey1PreviewWidth.Down then
      QRPreviewSurvey1.ZoomToWidth
    else
      QRPreviewSurvey1.Zoom := cxSESurvey1Zoom.Value;
  end
  else if Sender = QRPreviewSurvey2 then
  begin
    if btnSurvey2PreviewFit.Down then
      QRPreviewSurvey2.ZoomToFit
    else if btnSurvey2PreviewWidth.Down then
      QRPreviewSurvey2.ZoomToWidth
    else
      QRPreviewSurvey2.Zoom := cxSESurvey2Zoom.Value;
  end
  else if Sender = QRPreviewCounseling then
  begin
    if btnCounselingPreviewFit.Down then
      QRPreviewCounseling.ZoomToFit
    else if btnCounselingPreviewWidth.Down then
      QRPreviewCounseling.ZoomToWidth
    else
      QRPreviewCounseling.Zoom := cxSECounselingZoom.Value;
  end
  else if Sender = QRPreviewTraining then
  begin
    if btnTrainingPreviewFit.Down then
      QRPreviewTraining.ZoomToFit
    else if btnTrainingPreviewWidth.Down then
      QRPreviewTraining.ZoomToWidth
    else
      QRPreviewTraining.Zoom := cxSETrainingZoom.Value;
  end
  else if Sender = QRPreviewVisit then
  begin
    if btnVisitPreviewFit.Down then
      QRPreviewVisit.ZoomToFit
    else if btnVisitPreviewWidth.Down then
      QRPreviewVisit.ZoomToWidth
    else
      QRPreviewVisit.Zoom := cxSEVisitZoom.Value;
  end
end;

procedure TfrmRecord.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  cxTabIntake.Visible := False;
  cxTabIntake.Visible := True;

  // if FClose then Close;
end;

end.
