unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, jpeg, DB, ADODB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, Menus, cxButtons, cxLabel, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, uVersionList;

type
  TfrmLogin = class(TForm)
    Image1: TImage;
    btnConfig: TSpeedButton;
    Timer1: TTimer;
    cboHospitals: TcxComboBox;
    txtUserID: TcxTextEdit;
    txtPassword: TcxTextEdit;
    btnLogin: TcxButton;
    btnClose: TcxButton;
    lblExp: TLabel;
    cxLabel6: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    IdFTP: TIdFTP;
    procedure btnConfigClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function isValidInput: Boolean;
    procedure txtPasswordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtUserIDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
    FVersionList: TVersionList;
    function LoadingConfiguration: Boolean;
    function SetUpdateDB: Boolean;
    function SetSocialWorkDB: Boolean;
    function GetUpdater: Boolean;
    procedure OutExp(sMsg: string);
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation
uses uConfig, uDB, uGlobal, uSetup, uQuery;
{$R *.dfm}

procedure TfrmLogin.btnConfigClick(Sender: TObject);
begin
  if frmSetup.ShowModal = mrOK then
  while true do
  begin
    if not LoadingConfiguration then
    begin
      if frmSetup.ShowModal <> mrOK then
      begin
        Application.Terminate;
        break;
      end;
    end
    else
      break;
  end;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  sHospitalName, sUserID, sPassword: string;
begin
  if not isValidInput then
  begin
    oGlobal.Msg('아이디와 암호를 입력해 주십시오!');
    Exit;
  end;

  sHospitalName := trim(cboHospitals.Text);
  sUserID := trim(txtUserID.Text);
  sPassword := trim(txtPassword.Text);

  if dbMain.isValidUser(sHospitalName, sUserID, sPassword) then
  begin
    oConfig.User.HospitalName := sHospitalName;
    oConfig.SaveServerConfiguration(oConfig.Version, oConfig.UpdateServer, oConfig.SWServer);
    ModalResult := mrOK;
  end
  else
    oGlobal.Msg('아이디 혹은 암호가 잘못 입력되었습니다!');
end;

procedure TfrmLogin.txtUserIDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    txtPassword.SetFocus;
end;

procedure TfrmLogin.txtPasswordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnLogin.SetFocus;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  lblExp.Caption := NullString;

  txtUserID.Clear;
  txtPassword.Clear;

  txtUserID.SetFocus;

  Timer1.Enabled := True;
end;

function TfrmLogin.GetUpdater: Boolean;
var
  oT: TadoQuery;
  sFileName: string;
begin
  oT := TAdoQuery.Create(self);
  oT.Connection := dbMain.adoUpdateDB;
  oT.SQL.Text := QueryUpdater;
  oT.Open;

  sFileName := oConfig.CurDir + cUpdaterName;
  TBlobField(oT.FieldByName('updater')).SaveToFile(sFileName);

  if FileExists(sFileName) then
    result := true
  else
    result := false;

  oT.Close;
  oT.Free;
end;

function TfrmLogin.isValidInput: Boolean;
begin
  result := oGlobal.isNotNullStr(txtUserID.Text) and oGlobal.isNotNullStr(txtPassword.Text);
end;

function TfrmLogin.LoadingConfiguration: Boolean;
var
  msg: string;
  si: TSTARTUPINFO;
  pi: TPROCESSINFORMATION;
  sFileName: string;
  CmdLine : array[0..512] of char;
  i: integer;
begin
  OutExp('Update DB에 접속하고 있습니다...');
  if not SetUpdateDB then
  begin
    oGlobal.Msg('UpdateDB에 접근하지 못했습니다!');
    result := False;
    Exit;
  end;

  OutExp('사회사업실 DB에 접속하고 있습니다...');
  if not SetSocialWorkDB then
  begin
    oGlobal.Msg('SocialWorkDB 에 접근하지 못했습니다!');
    result := False;
    Exit;
  end;

  txtUserID.Text := oConfig.User.UserID;

  OutExp('기관정보를 가져오고 있습니다...');
  if not dbMain.GetHospitalList(cboHospitals.Properties.Items) then
  begin
    oGlobal.Msg('기관리스트를 가져오지 못했습니다!');
    result := False;
    Exit;
  end;

  i := cboHospitals.Properties.Items.IndexOf(oConfig.User.HospitalName);
  if i < 0 then
    cboHospitals.ItemIndex := 0
  else
    cboHospitals.ItemIndex := i;

  try
    OutExp('버전을 확인하고 있습니다!');
    if dbMain.GetVersion <> cVersion then
    begin
      if oGlobal.YesNo('다른 버전이 있습니다! 다운 받으시겠습니까?') = mrYes then
      begin
        FillChar(si,Sizeof(si),#0);
        si.cb := Sizeof(si);
        sFileName := oConfig.CurDir + cUpdaterName;
        StrPCopy(CmdLine, sFileName + ' ' + oConfig.UpdateServer.DataSource + ' ' + cAppName);

        if FileExists(sFileName) then
        begin
          CreateProcess( nil, CmdLine, nil, nil, false,  NORMAL_PRIORITY_CLASS, nil, nil, si, pi);
          Application.Terminate;
        end
        else
        begin
          msg := 'Updater 정보가 없습니다, 관리자에게 문의하세요!';
          if not dbMain.CheckUpdater then
          begin
            oGlobal.Msg(msg);
            result := false;
            Exit;
          end;

          OutExp('Updater를 다운받고 있습니다!');
          msg := 'Updater를 가져오기 못했습니다!';
          if not GetUpdater then
          begin
            oGlobal.Msg(msg);
            result := false;
            Exit;
          end;

          msg := '다른 버전을 다운받지 못했습니다!';

         if FileExists(sFileName) then
          begin
            CreateProcess( nil, CmdLine, nil, nil, false,  NORMAL_PRIORITY_CLASS, nil, nil, si, pi);
            Application.Terminate;
          end
          else
            oGlobal.Msg(msg);
        end;
      end;
    end;

    OutExp('');

    result := true;
  except
    oGlobal.Msg(msg);
    result := false;
  end;
end;

procedure TfrmLogin.OutExp(sMsg: string);
begin
  lblExp.Caption := sMsg;
  Application.ProcessMessages;
end;

function TfrmLogin.SetSocialWorkDB: Boolean;
var
  str: string;
begin
  str := Format(cDbConStr, [oConfig.SWServer.DataSource, oConfig.SWServer.DBName,
    oConfig.SwServer.UserID, oConfig.SWServer.Password]);

  try
    dbMain.adoSocialWorkDB.Connected := False;
    dbMain.adoSocialWorkDB.ConnectionString := str;
    dbMain.adoSocialWorkDB.Connected := True;

    result := True;
  except
    result := False;
  end;
end;

function TfrmLogin.SetUpdateDB: Boolean;
var
  str: string;
begin
  str := Format(cDbConStr, [oConfig.UpdateServer.DataSource, oConfig.UpdateServer.DBName,
    oConfig.UpdateServer.UserID, oConfig.UpdateServer.Password]);

  try
    dbMain.adoUpdateDB.Connected := False;
    dbMain.adoUpdateDB.ConnectionString := str;
    dbMain.adoUpdateDB.Connected := True;

    result := True;
  except
    result := False;
  end;
end;

procedure TfrmLogin.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;

  OutExp('설정을 로딩하고 있습니다...');

  while true do
  begin
    if LoadingConfiguration then
      break
    else
    begin
      if frmSetup.ShowModal <> mrOK then
      begin
        Application.Terminate;
        break;
      end;
    end;
  end;

  if trim(txtUserID.Text) <> NullString then
    txtPassword.SetFocus;
end;

end.
