unit uFrameInOutSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, cxControls,
  cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, StdCtrls, cxButtons, ADODB, uGlobal, uConfig, uDB, cxLabel,
  dxSkinBlack, dxSkinBlue, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TframeInOutSearch = class(TFrame)
    Label3: TLabel;
    btnSearch: TcxButton;
    cboCondition: TcxComboBox;
    txtSearch: TcxTextEdit;
    cboInOut: TcxComboBox;
    cboBohum: TcxComboBox;
    Label1: TLabel;
    Label2: TLabel;
    cboWard: TcxComboBox;
    lblWard: TLabel;
    cboSort: TcxComboBox;
    Label4: TLabel;
    procedure btnSearchClick(Sender: TObject);
    procedure cboWardPropertiesChange(Sender: TObject);
    procedure cboInOutPropertiesChange(Sender: TObject);
    procedure cboBohumPropertiesChange(Sender: TObject);
    procedure cboSortPropertiesChange(Sender: TObject);
    procedure txtSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FDate: string;
    FPPYearMonth: string;
    FLoaded: Boolean;
    FWardID: integer;
  public
    { Public declarations }
    FInOut: TADOStoredProc;
    procedure LoadInOut;
    procedure ClearControls;
    procedure SetValue(oT: TADOStoredProc; nWardID: integer; sDate, sPPYearMonth: string);
  end;

implementation

{$R *.dfm}
{ TframeInOutSearch }

procedure TframeInOutSearch.btnSearchClick(Sender: TObject);
begin
  LoadInOut;
end;

procedure TframeInOutSearch.cboBohumPropertiesChange(Sender: TObject);
begin
  LoadInOut;
end;

procedure TframeInOutSearch.cboInOutPropertiesChange(Sender: TObject);
begin
  LoadInOut;
end;

procedure TframeInOutSearch.cboSortPropertiesChange(Sender: TObject);
begin
  LoadInOut;
end;

procedure TframeInOutSearch.cboWardPropertiesChange(Sender: TObject);
begin
  LoadInOut;
end;

procedure TframeInOutSearch.ClearControls;
begin
  cboSort.ItemIndex := 0;
  cboCondition.ItemIndex := 0;
  txtSearch.Clear;
  cboInOut.ItemIndex := 0;

  dbMain.GetWardList(oConfig.User.HospitalID, cboWard.Properties.Items, True);
  if cboWard.Properties.Items.Count > 0 then
  begin
    if FWardID > -1 then
      cboWard.ItemIndex := cboWard.Properties.Items.IndexOf
        (dbMain.GetWardName(oConfig.User.HospitalID, FWardID))
    else
      cboWard.ItemIndex := 0;
  end;

  dbMain.GetBohumList(cboBohum.Properties.Items, True);
  if cboBohum.Properties.Items.Count > 0 then
    cboBohum.ItemIndex := 0;
end;

procedure TframeInOutSearch.LoadInOut;
var
  nHospitalID: integer;
  sSearch: string;
begin
  if not FLoaded then
    Exit;

  FLoaded := False;

  nHospitalID := oConfig.User.HospitalID;
  sSearch := trim(txtSearch.Text);

  FInOut.DisableControls;

  FInOut.Close;
  FInOut.Parameters.ParamValues['@HospitalID'] := nHospitalID;
  FInOut.Parameters.ParamValues['@CurDate'] := FDate;
  FInOut.Parameters.ParamValues['@PPYearMonth'] := FPPYearMonth;
  FInOut.Parameters.ParamValues['@SearchCondition'] := cboCondition.ItemIndex;
  FInOut.Parameters.ParamValues['@SearchText'] := sSearch;

  if cboWard.ItemIndex > 0 then
    FInOut.Parameters.ParamValues['@WardID'] := dbMain.GetWardID
      (nHospitalID, cboWard.Text)
  else
    FInOut.Parameters.ParamValues['@WardID'] := -1;

  if cboInOut.ItemIndex > 0 then
    FInOut.Parameters.ParamValues['@InOutState'] := cboInOut.ItemIndex - 1
  else
    FInOut.Parameters.ParamValues['@InOutState'] := -1;

  if cboBohum.ItemIndex > 0 then
    FInOut.Parameters.ParamValues['@BohumID'] := dbMain.GetBohumID
      (cboBohum.Text)
  else
    FInOut.Parameters.ParamValues['@BohumID'] := -1;

  FInOut.Parameters.ParamValues['@Order'] := cboSort.ItemIndex;

  try
    FInOut.Open;
  except
    oGlobal.Msg('입원정보에 접근할 수 없습니다!');
  end;

  FInOut.EnableControls;

  FLoaded := True;
end;

procedure TframeInOutSearch.SetValue(oT: TADOStoredProc; nWardID: integer;
  sDate, sPPYearMonth: string);
begin
  FLoaded := False;

  FInOut := oT;
  FWardID := nWardID;
  FDate := sDate;
  FPPYearMonth := sPPYearMonth;

  ClearControls;

  FLoaded := True;

  LoadInOut;
end;

procedure TframeInOutSearch.txtSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSearch.Click;
end;

end.
