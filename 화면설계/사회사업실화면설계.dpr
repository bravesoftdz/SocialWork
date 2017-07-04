program 사회사업실화면설계;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uLogin in 'uLogin.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
