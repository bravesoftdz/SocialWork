unit uAdminMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RHEncryption, DB, ADODB, uGlobal, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPC3Painter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPCdxBarPopupMenu, cxContainer,
  cxGroupBox, cxPC, Menus, cxButtons, cxCheckBox, cxTextEdit, cxMaskEdit,
  cxSpinEdit;

type
  TfrmMain = class(TForm)
    ADOConnection: TADOConnection;
    dsHospital: TDataSource;
    dsUser: TDataSource;
    cxPageControl1: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtServerName: TEdit;
    txtDBUserID: TEdit;
    txtDBPassword: TEdit;
    btnConnect: TButton;
    btnDisconnect: TButton;
    cxGrid1: TcxGrid;
    cxGPType: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    adoPType: TADOQuery;
    dsPType: TDataSource;
    cxGPTypeProgramTypeName: TcxGridDBColumn;
    cxGPTypeUsed: TcxGridDBColumn;
    Label10: TLabel;
    txtPTypeName: TEdit;
    btnPTypeAppend: TButton;
    btnPTypeUpdate: TButton;
    chkPTypeUsed: TCheckBox;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    cxGHospital: TcxGrid;
    cxGHospitalView: TcxGridDBTableView;
    cxGHospitalViewHospitalName: TcxGridDBColumn;
    cxGHospitalViewHospitalNo: TcxGridDBColumn;
    cxGHospitalViewUsed: TcxGridDBColumn;
    cxGHospitalLevel1: TcxGridLevel;
    txtHospitalName: TEdit;
    txtHospitalNo: TEdit;
    chkHospitalUsed: TCheckBox;
    btnHospitalAppend: TButton;
    btnHospitalUpdate: TButton;
    cxGroupBox3: TcxGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    cxGUser: TcxGrid;
    cxGUserView: TcxGridDBTableView;
    cxGUserViewUserID: TcxGridDBColumn;
    cxGUserViewUserName: TcxGridDBColumn;
    cxGUserViewWorker: TcxGridDBColumn;
    cxGUserViewDoctor: TcxGridDBColumn;
    cxGUserViewAdmin: TcxGridDBColumn;
    cxGUserViewUsed: TcxGridDBColumn;
    cxGUserLevel1: TcxGridLevel;
    txtUserID: TEdit;
    txtPassword: TEdit;
    txtPassword2: TEdit;
    chkWorker: TCheckBox;
    chkDoctor: TCheckBox;
    chkAdmin: TCheckBox;
    chkUserUsed: TCheckBox;
    txtUserName: TEdit;
    btnUserAppend: TButton;
    btnUserUpdate: TButton;
    cxTabSheet1: TcxTabSheet;
    cxGrid2: TcxGrid;
    cxGRelationship: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Label11: TLabel;
    txtRelationship: TEdit;
    btnRelationshipAppend: TButton;
    btnRelationshipUpdate: TButton;
    adoRelationship: TADOQuery;
    dsRelationship: TDataSource;
    cxGRelationshipRelationshipName: TcxGridDBColumn;
    chkRelationshipUsed: TCheckBox;
    cxGRelationshipUsed: TcxGridDBColumn;
    txtHospitalImage: TEdit;
    btnBrowseHospitalImage: TButton;
    Label12: TLabel;
    OpenDialog: TOpenDialog;
    cxGPTypeSeq: TcxGridDBColumn;
    lblSeq: TLabel;
    spinSeq: TcxSpinEdit;
    cxGPTypeLinkRecord: TcxGridDBColumn;
    chkLinkRecord: TCheckBox;
    adoUser: TADOQuery;
    adoHospital: TADOQuery;
    Label13: TLabel;
    txtAppTitle: TEdit;
    procedure btnConnectClick(Sender: TObject);
    procedure dsUserDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure ADOConnectionAfterConnect(Sender: TObject);
    procedure ADOConnectionAfterDisconnect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDisconnectClick(Sender: TObject);
    procedure adoRecordNameAfterOpen(DataSet: TDataSet);
    procedure dsHospitalDataChange(Sender: TObject; Field: TField);
    procedure btnHospitalAppendClick(Sender: TObject);
    procedure btnHospitalUpdateClick(Sender: TObject);
    procedure cxGHospitalViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGUserViewCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGHospitalViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btnUserAppendClick(Sender: TObject);
    procedure btnUserUpdateClick(Sender: TObject);
    procedure cxGUserViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cxGPTypeCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGPTypeCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure btnPTypeAppendClick(Sender: TObject);
    procedure btnPTypeUpdateClick(Sender: TObject);
    procedure dsPTypeDataChange(Sender: TObject; Field: TField);
    procedure dsRelationshipDataChange(Sender: TObject; Field: TField);
    procedure btnRelationshipAppendClick(Sender: TObject);
    procedure btnRelationshipUpdateClick(Sender: TObject);
    procedure cxGRelationshipCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cxGRelationshipCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnBrowseHospitalImageClick(Sender: TObject);
  private
    { Private declarations }
    oCon: TDBServerConfig;

    procedure SelectHospital;
    procedure SelectUser(nHospitalID: integer);
    procedure SelectPType;
    procedure SelectRelationship;
    procedure ClearControls;
    procedure ClearHospitalControls;
    procedure ClearUserControls;
    procedure ClearPTypeControls;
    procedure ClearRelationshipControls;
    procedure SetControls;
    function isValidInput: Boolean;
    function isValidHospitalInput: Boolean;
    function isValidUserInput(bAppend: Boolean): Boolean;
    function isValidPTypeInput: Boolean;
    function isValidRelationshipInput: Boolean;
    function isDuplicatedHospitalName(sHospitalName: string): Boolean;
    function isDuplicatedUserID(nHospitalID: integer; sUserID: string): Boolean;
    function isDuplicatedPTypeName(sPTypeName: string): Boolean;
    function isDuplicatedRelationshipName(sRelationshipName: string): Boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses uEncryption;
{$R *.dfm}

procedure TfrmMain.ClearControls;
begin
  ClearHospitalControls;
  ClearUserControls;
  ClearPTypeControls;
  ClearRelationshipControls;
end;

procedure TfrmMain.ClearHospitalControls;
begin
  txtHospitalName.Clear;
  txtHospitalNo.Clear;
  txtHospitalImage.Clear;
  chkHospitalUsed.Checked := True;
end;

procedure TfrmMain.ClearPTypeControls;
begin
  txtPTypeName.Clear;
  chkPTypeUsed.Checked := True;
  spinSEQ.Clear;
  chkLinkRecord.Checked := False;
end;

procedure TfrmMain.ClearRelationshipControls;
begin
  txtRelationship.Clear;
  chkRelationshipUsed.Checked := True;
end;

procedure TfrmMain.ClearUserControls;
begin
  txtUserID.Clear;
  txtUserName.Clear;
  txtPassword.Clear;
  txtPassword2.Clear;
  chkWorker.Checked := False;
  chkDoctor.Checked := False;
  chkAdmin.Checked := False;
  chkUserUsed.Checked := True;
end;

procedure TfrmMain.cxGHospitalViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if not adoHospital.IsEmpty then
  begin
    txtHospitalName.Text := adoHospital.FieldByName('HospitalName').AsString;
    txtHospitalNo.Text := adoHospital.FieldByName('HospitalNo').AsString;
    txtAppTitle.Text := adoHospital.FieldByName('AppTitle').AsString;
    chkHospitalUsed.Checked := adoHospital.FieldByName('Used').AsBoolean;
  end
  else
    ClearHospitalControls;
end;

procedure TfrmMain.cxGHospitalViewCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  iIndex: integer;
begin
  iIndex := AViewInfo.RecordViewInfo.GridRecord.Index;

  if Sender.DataController.GetValue(iIndex, cxGHospitalViewUsed.Index) = False then
    ACanvas.Font.Color := clSilver;
end;

procedure TfrmMain.cxGPTypeCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if not adoPType.IsEmpty then
  begin
    txtPTypeName.Text := adoPType.FieldByName('ProgramTypeName').AsString;
    chkPTypeUsed.Checked := adoPType.FieldByName('Used').AsBoolean;
    spinSEQ.Value := adoPType.FieldByName('SEQ').AsInteger;
    chkLinkRecord.Checked := adoPTYpe.FieldByName('LinkRecord').AsBoolean;
  end
  else
    ClearPTypeControls;
end;

procedure TfrmMain.cxGPTypeCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  iIndex: integer;
begin
  iIndex := AViewInfo.RecordViewInfo.GridRecord.Index;

  if Sender.DataController.GetValue(iIndex, cxGPTypeUsed.Index) = False then
    ACanvas.Font.Color := clSilver;
end;

procedure TfrmMain.cxGRelationshipCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if not adoRelationship.IsEmpty then
  begin
    txtRelationship.Text := adoRelationship.FieldByName('RelationshipName').AsString;
    chkRelationshipUsed.Checked := adoRelationship.FieldByName('Used').AsBoolean;
  end
  else
    ClearRelationshipControls;
end;

procedure TfrmMain.cxGRelationshipCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  iIndex: integer;
begin
  iIndex := AViewInfo.RecordViewInfo.GridRecord.Index;

  if Sender.DataController.GetValue(iIndex, cxGRelationshipUsed.Index) = False then
    ACanvas.Font.Color := clSilver;
end;

procedure TfrmMain.cxGUserViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if not adoUser.IsEmpty then
  begin
    txtUserID.Text := adoUser.FieldByName('UserID').AsString;
    txtUserName.Text := adoUser.FieldByName('UserName').AsString;
    chkWorker.Checked := adoUser.FieldByName('Worker').AsBoolean;
    chkDoctor.Checked := adoUser.FieldByName('Doctor').AsBoolean;
    chkAdmin.Checked := adoUser.FieldByName('Admin').AsBoolean;
    chkUserUsed.Checked := adoUser.FieldByName('Used').AsBoolean;
  end
  else
    ClearUserControls;
end;

procedure TfrmMain.cxGUserViewCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  iIndex: integer;
begin
  iIndex := AViewInfo.RecordViewInfo.GridRecord.Index;

  if Sender.DataController.GetValue(iIndex, cxGUserViewUsed.Index) = False then
    ACanvas.Font.Color := clSilver;
end;

procedure TfrmMain.SetControls;
begin
  txtHospitalName.Enabled := adoHospital.Active;
  txtHospitalNo.Enabled := adoHospital.Active;
  txtHospitalImage.Enabled := adoHospital.Active;
  txtApptitle.Enabled := adoHospital.Active;
  chkHospitalUsed.Enabled := adoHospital.Active;
  btnBrowseHospitalImage.Enabled := adoHospital.Active;
  btnHospitalAppend.Enabled := adoHospital.Active;
  btnHospitalUpdate.Enabled := not adoHospital.IsEmpty;

  txtUserID.Enabled := adoUser.Active;
  txtUserName.Enabled := adoUser.Active;
  txtPassword.Enabled := adoUser.Active;
  txtPassword2.Enabled := adoUser.Active;
  chkWorker.Enabled := adoUser.Active;
  chkDoctor.Enabled := adoUser.Active;
  chkAdmin.Enabled := adoUser.Active;
  chkUserUsed.Enabled := adoUser.Active;
  btnUserAppend.Enabled := adoUser.Active;
  btnUserUpdate.Enabled := not adoUser.IsEmpty;

  txtPTypeName.Enabled := adoPType.Active;
  chkPTypeUsed.Enabled := adoPType.Active;
  btnPTypeAppend.Enabled := adoPType.Active;
  btnPTypeUpdate.Enabled := not adoPType.IsEmpty;
  spinSEQ.Enabled := not adoPType.IsEmpty;
  chkLinkRecord.Enabled := not adoPType.IsEmpty;

  txtRelationship.Enabled := adoRelationship.Active;
  chkRelationshipUsed.Enabled := adoRelationship.Active;
  btnRelationshipAppend.Enabled := adoRelationship.Active;
  btnRelationshipUpdate.Enabled := not adoRelationship.IsEmpty;
end;

procedure TfrmMain.dsHospitalDataChange(Sender: TObject; Field: TField);
begin
  ClearHospitalControls;
  SetControls;

  adoUser.Close;

  if adoHospital.IsEmpty then Exit;

  SelectUser(adoHospital.FieldByName('HospitalID').AsInteger);
end;

procedure TfrmMain.dsPTypeDataChange(Sender: TObject; Field: TField);
begin
  ClearPTypeControls;
  SetControls;
end;

procedure TfrmMain.dsRelationshipDataChange(Sender: TObject; Field: TField);
begin
  ClearRelationshipControls;
  SetControls;
end;

procedure TfrmMain.dsUserDataChange(Sender: TObject; Field: TField);
begin
  ClearUserControls;
  SetControls;
end;

function TfrmMain.isDuplicatedHospitalName(sHospitalName: string): Boolean;
var
  adoT: TAdoQuery;
begin
  adoT := TAdoQuery.Create(self);
  adoT.Connection := adoConnection;

  try
    adoT.SQL.Text := 'SELECT * FROM HOSPITALS WHERE HOSPITALNAME=''' + sHospitalName + '''';
    adoT.Open;
  finally
    result := not adoT.IsEmpty;
  end;

  adoT.Close;
  adoT.Free;
end;

function TfrmMain.isDuplicatedPTypeName(sPTypeName: string): Boolean;
var
  adoT: TAdoQuery;
begin
  adoT := TAdoQuery.Create(self);
  adoT.Connection := adoConnection;

  try
    adoT.SQL.Text := 'SELECT * FROM PROGRAMTYPES' +
                     ' WHERE PROGRAMTYPENAME=''' + sPTypeName + '''';
    adoT.Open;
  finally
    result := not adoT.IsEmpty;
  end;

  adoT.Close;
  adoT.Free;
end;

function TfrmMain.isDuplicatedRelationshipName(
  sRelationshipName: string): Boolean;
var
  adoT: TAdoQuery;
begin
  adoT := TAdoQuery.Create(self);
  adoT.Connection := adoConnection;

  try
    adoT.SQL.Text := 'SELECT * FROM RELATIONSHIPS' +
                     ' WHERE RELATIONSHIPNAME=''' + sRelationshipName + '''';
    adoT.Open;
  finally
    result := not adoT.IsEmpty;
  end;

  adoT.Close;
  adoT.Free;
end;

function TfrmMain.isDuplicatedUserID(nHospitalID: integer; sUserID: string): Boolean;
var
  adoT: TAdoQuery;
begin
  adoT := TAdoQuery.Create(self);
  adoT.Connection := adoConnection;

  try
    adoT.SQL.Text := 'SELECT * FROM USERS' +
                     ' WHERE HOSPITALID=' + inttostr(nHospitalID) +
                     '   AND USERID=''' + sUserID + '''';
    adoT.Open;
  finally
    result := not adoT.IsEmpty;
  end;

  adoT.Close;
  adoT.Free;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  adoConnection.Connected := False;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ClearControls;
  SetControls;
end;

function TfrmMain.isValidHospitalInput: Boolean;
begin
  result := oGlobal.isNotNullStr(txtHospitalName.Text) and
            oGlobal.isNotNullStr(txtAppTitle.Text);
end;

function TfrmMain.isValidUserInput(bAppend: Boolean): Boolean;
begin
  if bAppend then
    result := oGlobal.isNotNullStr(txtUserID.Text) and oGlobal.isNotNullStr(txtUserName.Text)
      and oGlobal.isNotNullStr(txtPassword.Text) and oGlobal.isNotNullStr(txtPassword2.Text)
  else
    result :=  oGlobal.isNotNullStr(txtUserID.Text) and oGlobal.isNotNullStr(txtUserName.Text);
end;

function TfrmMain.isValidInput: Boolean;
begin
  oCon.DataSource := trim(txtServerName.Text);
  oCon.DBName := 'SocialWorkDB';
  oCon.UserID := trim(txtDBUserID.Text);
  oCon.Password := trim(txtDBPassword.Text);

  result := oGlobal.isNotNullStr(oCon.DataSource) and oGlobal.isNotNullStr(oCon.UserID) and oGlobal.isNotNullStr(oCon.Password);
end;

function TfrmMain.isValidPTypeInput: Boolean;
begin
  result := oGlobal.isNotNullStr(txtPTypeName.Text);
end;

function TfrmMain.isValidRelationshipInput: Boolean;
begin
  result := oGlobal.isNotNullStr(txtRelationship.Text);
end;

procedure TfrmMain.SelectHospital;
begin
  adoHospital.SQL.Text := 'SELECT * FROM HOSPITALS ORDER BY HOSPITALNAME';
  adoHospital.Open;
end;

procedure TfrmMain.SelectPType;
begin
  adoPType.SQL.Text := 'SELECT * FROM PROGRAMTYPES ORDER BY SEQ';
  adoPType.Open;
end;

procedure TfrmMain.SelectRelationship;
begin
  adoRelationship.SQL.Text := 'SELECT * FROM RELATIONSHIPS ORDER BY RELATIONSHIPNAME';
  adoRelationship.Open;
end;

procedure TfrmMain.SelectUser(nHospitalID: integer);
begin
  adoUser.SQL.Text := 'SELECT * FROM USERS WHERE HOSPITALID='
    + inttostr(nHospitalID) + ' ORDER BY USERNAME';
  adoUser.Open;
end;

procedure TfrmMain.ADOConnectionAfterConnect(Sender: TObject);
begin
  btnDisconnect.Enabled := True;
end;

procedure TfrmMain.ADOConnectionAfterDisconnect(Sender: TObject);
begin
  btnDisconnect.Enabled := False;
end;

procedure TfrmMain.adoRecordNameAfterOpen(DataSet: TDataSet);
begin
  ClearControls;
  SetControls;
end;

procedure TfrmMain.btnBrowseHospitalImageClick(Sender: TObject);
begin
  if OpenDialog.Execute(self.Handle) then
    txtHospitalImage.Text := OpenDialog.FileName;
end;

procedure TfrmMain.btnConnectClick(Sender: TObject);
var
  strCon: string;
begin
  if not isValidInput then
  begin
    oGlobal.Msg('입력을 정확히 하십시오!');
    Exit;
  end;

  screen.Cursor := crHourGlass;
  try
    ADOConnection.Connected := False;
    strCon := Format(cDbConStr, [oCon.DataSource, oCon.DBName, oCon.UserID,
      oCon.Password]);
    ADOConnection.ConnectionString := strCon;
    ADOConnection.Connected := True;
  except
    screen.Cursor := crDefault;
    oGlobal.Msg('서버에 연결할 수 없습니다!');
  end;

  try
    SelectHospital;
    SelectPType;
    SelectRelationship;
  except
    screen.Cursor := crDefault;
    oGlobal.Msg('기관이나 프로그램구분을 선택할 수 없습니다!');
  end;

  screen.Cursor := crDefault;
end;

procedure TfrmMain.btnDisconnectClick(Sender: TObject);
begin
  adoConnection.Connected := False;
end;

procedure TfrmMain.btnHospitalAppendClick(Sender: TObject);
var
  sHospitalName: string;
  sFileName: string;
begin
  if not isValidHospitalInput then
  begin
    oGlobal.Msg('기관정보를 입력하십시오!');
    Exit;
  end;

  sHospitalName := trim(txtHospitalName.Text);
  sFileName := trim(txtHospitalImage.Text);

  if isDuplicatedHospitalName(sHospitalName) then
  begin
    oGlobal.Msg('중복된 기관이름이 있습니다!');
    Exit;
  end;

  adoHospital.DisableControls;
  try
    adoConnection.BeginTrans;
    adoHospital.Append;
    adoHospital.FieldByName('HospitalName').AsString := sHospitalName;
    adoHospital.FieldByName('HospitalNo').AsString := trim(txtHospitalNo.Text);

    if oGlobal.isNotNullStr(sFileName) then
      TBlobField(adoHospital.FieldByName('HospitalImage')).LoadFromFile(sFileName);

    adoHospital.FieldByName('AppTitle').AsString := trim(txtAppTitle.Text);

    adoHospital.FieldByName('Used').AsBoolean := chkHospitalUsed.Checked;
    adoHospital.Post;
    adoConnection.CommitTrans;

    screen.Cursor := crDefault;
    oGlobal.Msg('추가하였습니다!');
  except
    adoConnection.RollbackTrans;
    screen.Cursor := crDefault;
    oGlobal.Msg('추가하지 못했습니다!');
  end;
  adoHospital.EnableControls;
end;

procedure TfrmMain.btnHospitalUpdateClick(Sender: TObject);
var
  sHospitalName: string;
  sFileName: string;
begin
  if not isValidHospitalInput then
  begin
    oGlobal.Msg('기관정보를 입력하십시오!');
    Exit;
  end;

  sHospitalName := trim(txtHospitalName.Text);
  sFileName := trim(txtHospitalImage.Text);

  if sHospitalName <> adoHospital.FieldByName('HospitalName').AsString then
  begin
    if isDuplicatedHospitalName(sHospitalName) then
    begin
      oGlobal.Msg('중복된 기관이름이 있습니다!');
      Exit;
    end;
  end;

  adoHospital.DisableControls;
  try
    adoConnection.BeginTrans;
    adoHospital.Edit;
    adoHospital.FieldByName('HospitalName').AsString := sHospitalName;
    adoHospital.FieldByName('HospitalNo').AsString := trim(txtHospitalNo.Text);

    if oGlobal.isNotNullStr(sFileName) then
      TBlobField(adoHospital.FieldByName('HospitalImage')).LoadFromFile(sFileName);

    adoHospital.FieldByName('AppTitle').AsString := trim(txtAppTitle.Text);

    adoHospital.FieldByName('Used').AsBoolean := chkHospitalUsed.Checked;
    adoHospital.Post;
    adoConnection.CommitTrans;

    screen.Cursor := crDefault;
    oGlobal.Msg('수정하였습니다!');
  except
    adoConnection.RollbackTrans;
    screen.Cursor := crDefault;
    oGlobal.Msg('수정하지 못했습니다!');
  end;
  adoHospital.EnableControls;
end;

procedure TfrmMain.btnPTypeAppendClick(Sender: TObject);
var
  sPTypeName: string;
begin
  if not isValidPTypeInput then
  begin
    oGlobal.Msg('프로그램구분을 입력하십시오!');
    Exit;
  end;

  sPTypeName := trim(txtPTypeName.Text);

  if isDuplicatedPTypeName(sPTypeName) then
  begin
    oGlobal.Msg('중복된 프로그램구분이 있습니다!');
    Exit;
  end;

  adoPType.DisableControls;
  try
    adoConnection.BeginTrans;
    adoPType.Append;
    adoPType.FieldByName('ProgramTypeName').AsString := sPTypeName;
    adoPType.FieldByName('Used').AsBoolean := True;
    adoPType.FieldByName('SEQ').AsInteger := spinSEQ.Value;
    adoPType.FieldByName('LinkRecord').AsBoolean := chkLinkRecord.Checked;
    adoPType.Post;
    adoConnection.CommitTrans;

    screen.Cursor := crDefault;
    oGlobal.Msg('추가하였습니다!');
  except
    adoConnection.RollbackTrans;
    screen.Cursor := crDefault;
    oGlobal.Msg('추가하지 못했습니다!');
  end;
  adoPType.EnableControls;
end;

procedure TfrmMain.btnPTypeUpdateClick(Sender: TObject);
var
  sPTypeName: string;
begin
  if not isValidPTypeInput then
  begin
    oGlobal.Msg('프로그램구분을 입력하십시오!');
    Exit;
  end;

  sPTypeName := trim(txtPTypeName.Text);

  if (sPTypeName <> adoPType.FieldByName('ProgramTypeName').AsString) and
    isDuplicatedPTypeName(sPTypeName) then
  begin
    oGlobal.Msg('중복된 프로그램구분이 있습니다!');
    Exit;
  end;

  adoPType.DisableControls;
  try
    adoConnection.BeginTrans;
    adoPType.Edit;
    adoPType.FieldByName('ProgramTypeName').AsString := sPTypeName;
    adoPType.FieldByName('Used').AsBoolean := chkPTypeUsed.Checked;
    adoPType.FieldByName('SEQ').AsInteger := spinSEQ.Value;
    adoPType.FieldByName('LinkRecord').AsBoolean := chkLinkRecord.Checked;
    adoPType.Post;
    adoConnection.CommitTrans;

    screen.Cursor := crDefault;
    oGlobal.Msg('수정하였습니다!');
  except
    adoConnection.RollbackTrans;
    screen.Cursor := crDefault;
    oGlobal.Msg('수정하지 못했습니다!');
  end;
  adoPType.EnableControls;
end;

procedure TfrmMain.btnRelationshipAppendClick(Sender: TObject);
var
  sRelationshipName: string;
begin
  if not isValidRelationshipInput then
  begin
    oGlobal.Msg('가구주와의 관계를 입력하십시오!');
    Exit;
  end;

  sRelationshipName := trim(txtRelationship.Text);

  if isDuplicatedPTypeName(sRelationshipName) then
  begin
    oGlobal.Msg('중복된 관계명이 있습니다!');
    Exit;
  end;

  adoRelationship.DisableControls;
  try
    screen.Cursor := crHourGlass;

    adoConnection.BeginTrans;
    adoRelationship.Append;
    adoRelationship.FieldByName('RelationshipName').AsString := sRelationshipName;
    adoRelationship.FieldByName('Used').AsBoolean := True;
    adoRelationship.Post;
    adoConnection.CommitTrans;

    screen.Cursor := crDefault;
    oGlobal.Msg('추가하였습니다!');
  except
    adoConnection.RollbackTrans;
    screen.Cursor := crDefault;
    oGlobal.Msg('추가하지 못했습니다!');
  end;
  adoRelationship.EnableControls;
end;

procedure TfrmMain.btnRelationshipUpdateClick(Sender: TObject);
var
  sRelationshipName: string;
begin
  if not isValidRelationshipInput then
  begin
    oGlobal.Msg('프로그램구분을 입력하십시오!');
    Exit;
  end;

  sRelationshipName := trim(txtRelationship.Text);

  if (sRelationshipName <> adoRelationship.FieldByName('RelationshipName').AsString) and
    isDuplicatedPTypeName(sRelationshipName) then
  begin
    oGlobal.Msg('중복된 프로그램구분이 있습니다!');
    Exit;
  end;

  adoRelationship.DisableControls;
  try
    adoConnection.BeginTrans;
    adoRelationship.Edit;
    adoRelationship.FieldByName('RelationshipName').AsString := sRelationshipName;
    adoRelationship.FieldByName('Used').AsBoolean := chkRelationshipUsed.Checked;
    adoRelationship.Post;
    adoConnection.CommitTrans;

    screen.Cursor := crDefault;
    oGlobal.Msg('수정하였습니다!');
  except
    adoConnection.RollbackTrans;
    screen.Cursor := crDefault;
    oGlobal.Msg('수정하지 못했습니다!');
  end;
  adoRelationship.EnableControls;
end;

procedure TfrmMain.btnUserAppendClick(Sender: TObject);
var
  nHospitalID: integer;
  sUserID, sPwd, sPwd2: string;
begin
  if not isValidUserInput(True) then
  begin
    oGlobal.Msg('사용자정보를 입력하십시오!');
    Exit;
  end;

  nHospitalID := adoHospital.FieldByName('HospitalID').AsInteger;
  sUserID := trim(txtUserID.Text);
  sPwd := trim(txtPassword.Text);
  sPwd2 := trim(txtPassword2.Text);

  if isDuplicatedUserID(nHospitalID, sUserID) then
  begin
    oGlobal.Msg('중복된 User ID 가 있습니다!');
    Exit;
  end;

  if sPwd <> sPwd2 then
  begin
    oGlobal.Msg('암호를 정확히 입력해 주십시오!');
    Exit;
  end;

  adoUser.DisableControls;
  try
    adoConnection.BeginTrans;
    adoUser.Append;
    adoUser.FieldByName('HospitalID').AsInteger := nHospitalID;
    adoUser.FieldByName('UserID').AsString := sUserID;
    adoUser.FieldByName('UserName').AsString := trim(txtUserName.Text);
    adoUser.FieldByName('Password').AsString := sPwd;
    adoUser.FieldByName('Worker').AsBoolean := chkWorker.Checked;
    adoUser.FieldByName('Doctor').AsBoolean := chkDoctor.Checked;
    adoUser.FieldByName('Admin').AsBoolean := chkAdmin.Checked;
    adoUser.FieldByName('Used').AsBoolean := chkUserUsed.Checked;
    adoUser.Post;
    adoConnection.CommitTrans;

    screen.Cursor := crDefault;
    oGlobal.Msg('추가하였습니다!');
  except
    adoConnection.RollbackTrans;
    screen.Cursor := crDefault;
    oGlobal.Msg('추가하지 못했습니다!');
  end;
  adoUser.EnableControls;
end;

procedure TfrmMain.btnUserUpdateClick(Sender: TObject);
var
  nHospitalID: integer;
  sUserID, sPwd, sPwd2: string;
begin
  if not isValidUserInput(False) then
  begin
    oGlobal.Msg('사용자정보를 입력하십시오!');
    Exit;
  end;

  nHospitalID := adoHospital.FieldByName('HospitalID').AsInteger;
  sUserID := trim(txtUserID.Text);
  sPwd := trim(txtPassword.Text);
  sPwd2 := trim(txtPassword2.Text);

  if sUserID <> adoUser.FieldByName('UserID').AsString then
  begin
    if isDuplicatedUserID(nHospitalID, sUserID) then
    begin
      oGlobal.Msg('중복된 User ID 가 있습니다!');
      Exit;
    end;
  end;

  if sPwd <> sPwd2 then
  begin
    oGlobal.Msg('암호를 정확히 입력해 주십시오!');
    Exit;
  end;

  adoUser.DisableControls;
  try
    adoConnection.BeginTrans;
    adoUser.Edit;
    adoUser.FieldByName('UserID').AsString := sUserID;
    adoUser.FieldByName('UserName').AsString := trim(txtUserName.Text);

    if oGlobal.isNotNullStr(sPwd) then
      adoUser.FieldByName('Password').AsString := uEncryption.Encoding(sPwd);

    adoUser.FieldByName('Worker').AsBoolean := chkWorker.Checked;
    adoUser.FieldByName('Doctor').AsBoolean := chkDoctor.Checked;
    adoUser.FieldByName('Admin').AsBoolean := chkAdmin.Checked;
    adoUser.FieldByName('Used').AsBoolean := chkUserUsed.Checked;
    adoUser.Post;
    adoConnection.CommitTrans;

    screen.Cursor := crDefault;
    oGlobal.Msg('수정하였습니다!');
  except
    adoConnection.RollbackTrans;
    screen.Cursor := crDefault;
    oGlobal.Msg('수정하지 못했습니다!');
  end;
  adoUser.EnableControls;
end;

end.
