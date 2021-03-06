program SocialWorkAdmin;

uses
  Forms,
  uAdminMain in 'uAdminMain.pas' {frmMain},
  uGlobal in '..\..\LIB\uGlobal.pas',
  uInputName in '..\..\LIB\uInputName.pas' {frmInputName},
  uMsg in '..\..\LIB\uMsg.pas' {frmMsg},
  uYesNo in '..\..\LIB\uYesNo.pas' {frmYesNo},
  uEncryption in '..\..\LIB\uEncryption.pas',
  uKeywordMgr in '..\uKeywordMgr.pas' {frmKeywordMgr},
  uFrameKeyword in '..\uFrameKeyword.pas' {frameKeyword: TFrame},
  uDB in '..\uDB.pas' {dbMain: TDataModule},
  uConfig in '..\uConfig.pas',
  uKeywordEdit in '..\uKeywordEdit.pas' {frmKeywordEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmInputName, frmInputName);
  Application.CreateForm(TfrmMsg, frmMsg);
  Application.CreateForm(TfrmYesNo, frmYesNo);
  Application.CreateForm(TfrmKeywordMgr, frmKeywordMgr);
  Application.CreateForm(TdbMain, dbMain);
  Application.CreateForm(TfrmKeywordEdit, frmKeywordEdit);
  Application.Run;
end.
