unit uSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinCaramel, cxPCdxBarPopupMenu, cxPC,
  Menus, StdCtrls, cxButtons, dxSkinBlack, dxSkinBlue, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, ImgList, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxSkinscxPCPainter,
  dxBarBuiltInMenu;

type
  TfrmSetting = class(TForm)
    cxPageControl1: TcxPageControl;
    tabWardMgr: TcxTabSheet;
    tabLocationMgr: TcxTabSheet;
    tabInTypeMgr: TcxTabSheet;
    cxButton3: TcxButton;
    tabRelationshipMgr: TcxTabSheet;
    tabProgramMgr: TcxTabSheet;
    tabUserMgr: TcxTabSheet;
    cxImageList1: TcxImageList;
    tabShortKeyMgr: TcxTabSheet;
    tabRecordName: TcxTabSheet;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure TabAllVisible(bVisible: Boolean);
  public
    { Public declarations }
    procedure CloseTabsWithoutShortKeyMgr;
    procedure OpenTabs;
  end;

var
  frmSetting: TfrmSetting;

implementation
uses uConfig, uWardMgr, uLocationMgr, uUserMgr, uInTypeMgr,
  uRelationshipMgr, uProgramMgr, uKeywordSettingMgr, uRecordNameMgr;
{$R *.dfm}

procedure TfrmSetting.CloseTabsWithoutShortKeyMgr;
begin
  TabAllVisible(False);
  tabShortKeyMgr.TabVisible := True;
  cxPageControl1.ActivePage := tabShortKeyMgr;
end;

procedure TfrmSetting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmWardMgr.Close;
  frmLocationMgr.Close;
  frmInTypeMgr.Close;
  frmRelationshipMgr.Close;
  frmProgramMgr.Close;
  frmKeywordSettingMgr.Close;
  frmRecordNameMgr.Close;

  if oConfig.User.Admin then
    frmUserMgr.Close;
end;

procedure TfrmSetting.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmSetting.FormShow(Sender: TObject);
begin
  frmWardMgr.Parent := tabWardMgr;
  frmWardMgr.Align := alClient;
  frmWardMgr.BorderStyle := bsNone;

  frmLocationMgr.Parent := tabLocationMgr;
  frmLocationMgr.Align := alClient;
  frmLocationMgr.BorderStyle := bsNone;

  frmInTypeMgr.Parent := tabInTypeMgr;
  frmInTypeMgr.Align := alClient;
  frmInTypeMgr.BorderStyle := bsNone;

  frmRelationshipMgr.Parent := tabRelationshipMgr;
  frmRelationshipMgr.Align := alClient;
  frmRelationshipMgr.BorderStyle := bsNone;

  frmProgramMgr.Parent := tabProgramMgr;
  frmProgramMgr.Align := alClient;
  frmProgramMgr.BorderStyle := bsNone;

  frmKeywordSettingMgr.Parent := tabShortKeyMgr;
  frmKeywordSettingMgr.Align := alClient;
  frmKeywordSettingMgr.BorderStyle := bsNone;

  frmWardMgr.Visible := True;
  frmLocationMgr.Visible := True;
  frmInTypeMgr.Visible := True;
  frmRelationshipMgr.Visible := True;
  frmProgramMgr.Visible := True;
  frmKeywordSettingMgr.Visible := True;

  frmUserMgr.Parent := tabUserMgr;
  frmUserMgr.Align := alClient;
  frmUserMgr.BorderStyle := bsNone;
  frmUserMgr.Visible := True;

  frmRecordNameMgr.Parent := tabRecordName;
  frmRecordNameMgr.Align := alClient;
  frmRecordNameMgr.BorderStyle := bsNone;
  frmRecordNameMgr.Visible := True;
end;

procedure TfrmSetting.OpenTabs;
begin
  TabAllVisible(True);
end;

procedure TfrmSetting.TabAllVisible(bVisible: Boolean);
begin
  tabWardMgr.TabVisible := bVisible;
  tabLocationMgr.TabVisible := bVisible;
  tabInTypeMgr.TabVisible := bVisible;
  tabRelationshipMgr.TabVisible := bVisible;
  tabProgramMgr.TabVisible := bVisible;
  tabUserMgr.TabVisible := bVisible;
  tabShortKeyMgr.TabVisible := bVisible;
  tabRecordName.TabVisible := bVisible;
end;

end.
