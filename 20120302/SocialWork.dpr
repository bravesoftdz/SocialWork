program SocialWork;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uDB in 'uDB.pas' {dbMain: TDataModule},
  uLogin in 'uLogin.pas' {frmLogin},
  uSetup in 'uSetup.pas' {frmSetup},
  uConfig in 'uConfig.pas',
  uGlobal in '..\LIB\uGlobal.pas',
  uEncryption in '..\LIB\uEncryption.pas',
  uTest in 'uTest.pas' {frmTest},
  uUserMgr in 'uUserMgr.pas' {frmUserMgr},
  uWardMgr in 'uWardMgr.pas' {frmWardMgr},
  uPatientMgr in 'uPatientMgr.pas' {frmPatientMgr},
  uPatientNew in 'uPatientNew.pas' {frmPatientNew},
  uPatientEdit in 'uPatientEdit.pas' {frmPatientEdit},
  uInOutMgr in 'uInOutMgr.pas' {frmInOutMgr},
  uLocationMgr in 'uLocationMgr.pas' {frmLocationMgr},
  uPassword in 'uPassword.pas' {frmPassword},
  uRecord in 'uRecord.pas' {frmRecord},
  uIntake in 'uIntake.pas' {frmIntake},
  uRecordReport in 'uRecordReport.pas' {frmRecordReport},
  uRatingMgr in 'uRatingMgr.pas' {frmRatingMgr},
  uTherapyMgr in 'uTherapyMgr.pas' {frmTherapyMgr},
  uSetting in 'uSetting.pas' {frmSetting},
  uInputName in '..\LIB\uInputName.pas' {frmInputName},
  uMsg in '..\LIB\uMsg.pas' {frmMsg},
  uYesNo in '..\LIB\uYesNo.pas' {frmYesNo},
  uInputUserInfo in 'uInputUserInfo.pas' {frmInputUserInfo},
  uInTypeMgr in 'uInTypeMgr.pas' {frmInTypeMgr},
  uRelationshipMgr in 'uRelationshipMgr.pas' {frmRelationshipMgr},
  uProgramMgr in 'uProgramMgr.pas' {frmProgramMgr},
  uProgramInput in 'uProgramInput.pas' {frmProgramInput},
  uShortKeyMgr in 'uShortKeyMgr.pas' {frmShortKeyMgr},
  uShortKeyInput in 'uShortKeyInput.pas' {frmShortKeyInput},
  uFamilyInput in 'uFamilyInput.pas' {frmFamilyInput},
  uFamilyMgr in 'uFamilyMgr.pas' {frmFamilyMgr},
  uSurvey1 in 'uSurvey1.pas' {frmSurvey1},
  uSurvey2 in 'uSurvey2.pas' {frmSurvey2},
  uCounseling in 'uCounseling.pas' {frmCounseling},
  uTraining in 'uTraining.pas' {frmTraining},
  uTherapyEdit in 'uTherapyEdit.pas' {frmTherapyEdit},
  uSelectList in 'uSelectList.pas' {frmSelectList},
  uDoJob in 'uDoJob.pas' {frmDoJob},
  uTherapyPrint in 'uTherapyPrint.pas' {frmTherapyPrint},
  uQuery in 'uQuery.pas',
  uDoJobAll in 'uDoJobAll.pas' {frmDoJobAll},
  uOverNightMgr in 'uOverNightMgr.pas' {frmOverNightMgr},
  uOverNightMgrEdit in 'uOverNightMgrEdit.pas' {frmOverNightMgrEdit},
  uStatistics in 'uStatistics.pas' {frmStatistics},
  uPrintAll in 'uPrintAll.pas' {frmPrintAll},
  uVisit in 'uVisit.pas' {frmVisit};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdbMain, dbMain);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSetup, frmSetup);
  Application.CreateForm(TfrmUserMgr, frmUserMgr);
  Application.CreateForm(TfrmWardMgr, frmWardMgr);
  Application.CreateForm(TfrmPatientNew, frmPatientNew);
  Application.CreateForm(TfrmPatientEdit, frmPatientEdit);
  Application.CreateForm(TfrmInOutMgr, frmInOutMgr);
  Application.CreateForm(TfrmLocationMgr, frmLocationMgr);
  Application.CreateForm(TfrmPatientMgr, frmPatientMgr);
  Application.CreateForm(TfrmPassword, frmPassword);
  Application.CreateForm(TfrmIntake, frmIntake);
  Application.CreateForm(TfrmRecordReport, frmRecordReport);
  Application.CreateForm(TfrmSetting, frmSetting);
  Application.CreateForm(TfrmInTypeMgr, frmInTypeMgr);
  Application.CreateForm(TfrmRelationshipMgr, frmRelationshipMgr);
  Application.CreateForm(TfrmProgramMgr, frmProgramMgr);
  Application.CreateForm(TfrmShortKeyMgr, frmShortKeyMgr);
  Application.CreateForm(TfrmShortKeyInput, frmShortKeyInput);
  Application.CreateForm(TfrmSurvey1, frmSurvey1);
  Application.CreateForm(TfrmSurvey2, frmSurvey2);
  Application.CreateForm(TfrmCounseling, frmCounseling);
  Application.CreateForm(TfrmTraining, frmTraining);
  Application.CreateForm(TfrmSelectList, frmSelectList);
  Application.CreateForm(TfrmTherapyPrint, frmTherapyPrint);
  Application.CreateForm(TfrmDoJob, frmDoJob);
  Application.CreateForm(TfrmPrintAll, frmPrintAll);
  Application.CreateForm(TfrmVisit, frmVisit);
  Application.Run;
end.
