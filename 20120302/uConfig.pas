unit uConfig;

interface
uses uGlobal, IniFiles, Windows, sysUtils, StrUtils, RHEncryption, SWType,
     Registry;

type
  TConfiguration = class
    CurDir: string;
    Version: string;
    UpdateServer: TDBServerConfig;
    SWServer: TDBServerConfig;
    User: TUserInfo;
  private
    procedure LoadServerConfiguration;
  public
    constructor create;
    function SaveServerConfiguration(sVersion: string; oUpdateServer,
      oSWServer: TDBServerConfig): Boolean;
  end;

var
  oConfig: TConfiguration;

implementation
uses uEncryption;

{ TConfiguration }
constructor TConfiguration.create;
begin
  inherited;

  User.Clear;

  CurDir := GetCurrentDir;
  if RightStr(CurDir, 1) <> '\'  then
    CurDir := CurDir + '\';

  LoadServerConfiguration;
end;

procedure TConfiguration.LoadServerConfiguration;
var
  r: TRegistry;
begin
  r := TRegistry.Create;
  r.RootKey := HKEY_CURRENT_USER;

  if r.OpenKey('\Software\EastSeaSoftware\Social Work\', False) then
  begin
    Version := r.ReadString('Version');

    UpdateServer.DataSource := r.ReadString('UpdateServer_DataSource');
    UpdateServer.DBName := r.ReadString('UpdateServer_DBName');
    UpdateServer.UserID := r.ReadString('UpdateServer_UserID');
    UpdateServer.Password := Decoding(r.ReadString('UpdateServer_Password'));

    SWServer.DataSource := r.ReadString('SWServer_DataSource');
    SWServer.DBName := r.ReadString('SWServer_DBName');
    SWServer.UserID := r.ReadString('SWServer_UserID');
    SWServer.Password := Decoding(r.ReadString('SWServer_Password'));

    user.HospitalName := r.ReadString('HospitalName');
    user.UserID := r.ReadString('UserID');
  end
  else
  begin
    Version := cVersion;

    UpdateServer.DataSource := 'erp.ambu.or.kr';
    UpdateServer.DBName := 'updateDB';
    UpdateServer.UserID := 'updater';
    UpdateServer.Password := 'updater';

    SWServer.DataSource := 'erp.ambu.or.kr';
    SWServer.DBName := 'SocialWorkDB';
    SWServer.UserID := 'socialworker';
    SWServer.Password :='socialworker';

    user.HospitalName := '';
    user.UserID := '';
  end;

  r.CloseKey;
  r.Free;
end;

function TConfiguration.SaveServerConfiguration(sVersion: string;
  oUpdateServer, oSWServer: TDBServerConfig): Boolean;
var
  r: TRegistry;
begin
  try
    r := TRegistry.Create;
    r.RootKey := HKEY_CURRENT_USER;
    r.OpenKey('\Software\EastSeaSoftware\Social Work\', True);

    r.WriteString('SocialWork_Version', sVersion);

    r.WriteString('UpdateServer_DataSource', oUpdateServer.DataSource);
    r.WriteString('UpdateServer_DBName', oUpdateServer.DBName);
    r.WriteString('UpdateServer_UserID', oUpdateServer.UserID);
    r.WriteString('UpdateServer_Password', Encoding(oUpdateServer.Password));

    r.WriteString('SWServer_DataSource', oSWServer.DataSource);
    r.WriteString('SWServer_DBName', oSWServer.DBName);
    r.WriteString('SWServer_UserID', oSWServer.UserID);
    r.WriteString('SWServer_Password', Encoding(oSWServer.Password));

    r.WriteString('HospitalName', User.HospitalName);
    r.WriteString('UserID', User.UserID);

    UpdateServer.Copy(oUpdateServer);
    SWServer.Copy(oSWServer);

    result := True;
  except
    result := False;
  end;
end;

initialization
  oConfig := TConfiguration.Create;

finalization
  oConfig.Free;

end.
