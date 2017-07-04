unit uDB;

interface

uses
  SysUtils, Classes, DB, ADODB, uEncryption, uGlobal, uConfig, cxStyles,
  StdCtrls, Messages, Graphics, Dialogs;

type
  TdbMain = class(TDataModule)
    adoSocialWorkDB: TADOConnection;
    adoUpdateDB: TADOConnection;
    adoTemp: TADOQuery;
    cxStyle: TcxStyleRepository;
    cxHeaderIndex: TcxStyle;
    cxSelection: TcxStyle;
    cxReadOnlyEdit: TcxStyle;
    cxVerticalHeader: TcxStyle;
    cxBackground: TcxStyle;
  private
    { Private declarations }
  public
    { Public declarations }
    function isValidUser(sHospitalName, sUserID, sPassword: string): Boolean;
    function CheckUpdater: Boolean;
    function GetCounselingSeq(nInOutID: integer; sMeetingDate: string): integer;
    function GetTrainingSeq(nInOutID: integer; sMeetingDate: string): integer;
    function GetVisitSeq(nInOutID: integer; sVisitDate: string): integer;
    function GetHospitalID(sHospitalName: string): integer;
    function GetHospitalList(oList: TStrings): Boolean;
    function GetUserID(nHospitalID: integer; sUserName: string): string;
    function GetUserName(nHospitalID: integer; sUserID: string): string;
    function GetPatientName(nHospitalID: integer; sPatientID: string): string;
    function GetDoctorID(nHospitalID: integer; sDoctorName: string): string;
    function GetDoctorName(nHospitalID: integer; sDoctorID: string): string;
    function GetProgramColor(nHospitalID: integer; sProgramName: string)
      : integer;
    function GetProgramTypeID(sProgramTypeName: string): integer;
    function GetProgramTypeName(sProgramTypeID: string): string;
    function GetBohumName(nBohumID: integer): string;
    function GetBohumID(sBohumName: string): integer;
    function GetWardID(nHospitalID: integer; sWardName: string): integer;
    function GetWardName(nHospitalID, nWardID: integer): string;
    function GetInTypeID(nHospitalID: integer; sInTypeName: string): integer;
    function GetInTypeName(nInTypeID: integer): string;
    function GetVersion: string;
    function GetInTypeList(nHospitalID: integer; oList: TStrings): Boolean;
    function GetChairmanIDs(nHospitalID: integer; sChairmanNames: string)
      : string;
    function GetChairmanNames(nHospitalID: integer; sChairmanIDs: string)
      : string;
    function GetLastWardSeq(nHospitalID: integer): integer;
    function GetLocationIDs(nHospitalID: integer; sLocationNames: string)
      : string;
    function GetLocationNames(nHospitalID: integer; sLocationIDs: string)
      : string;
    function GetProgramTypeList(oList: TStrings; bAll: Boolean): Boolean;
    function GetProgramID(nHospitalID: integer; sProgramName: string): integer;
    function GetProgramList(nHospitalID, nWardID: integer; oList: TStrings;
      bAll: Boolean): Boolean;
    function GetProgramPatientNames(nScheduleID: integer): string;
    function GetProgramPatientList(nScheduleID: integer; oList: TStrings)
      : Boolean;
    function GetWardList(nHospitalID: integer; oList: TStrings; bAll: Boolean)
      : Boolean;
    function GetRelationshipList(nHospitalID: integer; oList: TStrings)
      : Boolean;
    function GetBohumList(oList: TStrings; bAll: Boolean): Boolean;
    function GetDoctorList(nHospitalID: integer; oList: TStrings): Boolean;
    function GetLocationList(nHospitalID: integer; oList: TStrings): Boolean;
    function GetUserList(nHospitalID: integer; oList: TStrings; bAll: Boolean)
      : Boolean;
    function GetLastPatientID(nHospitalID: integer): string;
    function GetLastRelationshipSeq(nHospitalID: integer): integer;
    function GetLastCounselingSeq(nInOutID: integer): integer;
    function GetLastTrainingSeq(nInOutID: integer): integer;
    function GetLastVisitSeq(nInOutID: integer): integer;
    function GetRelationshipID(nHospitalID: integer; sRelationshipName: string)
      : integer;
    function GetRelationshipName(nRelationshipID: integer): string;
    function GetScheduleYear(nHospitalID: integer; oList: TStrings): Boolean;
    function UsedRecord(nInOutID: integer): TRecordType;
    function isDuplicatedPatientID(nHospitalID: integer; sPatientID: string)
      : Boolean;
    function isDuplicatedInOut(nHospitalID: integer;
      sPatientID, sInDate: string): Boolean;
    function isDuplicatedInWard(nHospitalID: integer; sPatientID: string;
      nWardID: integer): Boolean;
    function isDuplicatedWardName(nHospitalID: integer; sWardName: string)
      : Boolean;
    function isDuplicatedInTypeName(nHospitalID: integer; sInTypeName: string)
      : Boolean;
    function isDuplicatedLocationName(nHospitalID: integer;
      sLocationName: string): Boolean;
    function isDuplicatedRelationshipName(nHospitalID: integer;
      sRelationshipName: string): Boolean;
    function isDuplicatedShortkey(nHospitalID: integer; sKeyword: string)
      : Boolean;
    function isExistsIn(nHospitalID: integer; sPatientID: string): Boolean;
    function isExistInInOut(nHospitalID: integer; sPatientID: string): Boolean;
    function isExistCounselingMeetingDate(nInOutID: integer;
      sMeetingDate: string): Boolean;
    function isExistScheduleInProgramPatient(nScheduleID: integer): Boolean;
    function isExistTrainingMeetingDate(nInOutID: integer; sMeetingDate: string)
      : Boolean;
    function isExistVisitDate(nInOutID: integer; sVisitDate: string): Boolean;
    function isKeyword(nHospitalID: integer; sKeyword: string;
      var sContent: string): Boolean;
    function RemakeCounselingOrder(nInOutID: integer; sMeetingDate: string)
      : Boolean;
    function RemakeTrainingOrder(nInOutID: integer; sMeetingDate: string)
      : Boolean;
    function RemakeVisitOrder(nInOutID: integer; sVisitDate: string): Boolean;
    function SaveNewPatient(oP: TNewPatientInfo): integer;
    function EditPatient(oP: TPatientInfo): Boolean;
    function SetPassword(nHospitalID: integer; sUserID, sPwd: string): Boolean;
    procedure SetFamilies(nInOutID: integer;
      oRelationshipName, oFamilyName: TStrings); overload;
    procedure SetFamilies(nInOutID: integer; oRelationshipName, oFamilyName,
      oInMate, oHealth, oPay: TStrings); overload;
    procedure SetCurrentKeyword(oMemo: TMemo);
    function isExistOverNight(sInOutID: string; oStartTime,
      oFinishTime: TDateTime): Boolean;
  end;

var
  dbMain: TdbMain;

implementation

{$R *.dfm}
{ TdbMain }

function TdbMain.CheckUpdater: Boolean;
var
  oT: TADOQuery;
begin
  oT := TADOQuery.Create(self);
  try
    oT.Connection := adoUpdateDB;
    oT.SQL.Text := 'SELECT uNo FROM UPDATER';
    oT.Open;
  finally
    result := not oT.IsEmpty;
    oT.Close;
  end;
  oT.Free;
end;

function TdbMain.EditPatient(oP: TPatientInfo): Boolean;
var
  oT: TADOQuery;
begin
  oT := TADOQuery.Create(self);
  oT.Connection := adoSocialWorkDB;

  try
    oT.Connection.BeginTrans;
    oT.SQL.Clear;
    oT.SQL.Add('SELECT *');
    oT.SQL.Add('  FROM PATIENTS');
    oT.SQL.Add(' WHERE HOSPITALID=' + inttostr(oP.nHospitalID));
    oT.SQL.Add('   AND PATIENTID=''' + oP.sPatientID + '''');
    oT.Open;

    if oT.IsEmpty then
    begin
      result := false;
      exit;
    end;

    oT.Edit;
    oT.FieldByName('PatientName').AsString := oP.sPatientName;
    if oP.bMale then
      oT.FieldByName('Sex').AsString := cMale
    else
      oT.FieldByName('Sex').AsString := cFeMale;
    oT.FieldByName('Birthday').AsString := oP.sBirthday;

    oT.Post;

    oT.Connection.CommitTrans;

    result := true;
  except
    oT.Cancel;
    oT.Connection.RollbackTrans;

    result := false;
  end;

  oT.Close;
  oT.Free;
end;

function TdbMain.GetChairmanIDs(nHospitalID: integer; sChairmanNames: string)
  : string;
var
  nPos: integer;
  sName: string;
begin
  result := '';

  if oGlobal.isNullStr(sChairmanNames) then
    exit;

  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT UserID');
      Add('       ,UserName');
      Add('  FROM Users');
      Add(' WHERE HospitalID=' + inttostr(nHospitalID));
    end;

    adoTemp.Open;
  except
    exit;
  end;

  nPos := pos(cDelimeter, sChairmanNames);
  while nPos > 0 do
  begin
    sName := copy(sChairmanNames, 1, nPos - 1);
    sChairmanNames := copy(sChairmanNames, nPos + 1, Length(sChairmanNames)
        - nPos);

    if adoTemp.Locate('UserName', sName, [loCaseInsensitive]) then
      result := result + adoTemp.FieldByName('UserID').AsString + cDelimeter;

    nPos := pos(cDelimeter, sChairmanNames);
  end;

  adoTemp.Close;
end;

function TdbMain.GetChairmanNames(nHospitalID: integer; sChairmanIDs: string)
  : string;
var
  nPos: integer;
  sID: string;
begin
  result := '';

  if oGlobal.isNullStr(sChairmanIDs) then
    exit;

  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT UserID');
      Add('       ,UserName');
      Add('  FROM Users');
      Add(' WHERE HospitalID=' + inttostr(nHospitalID));
    end;

    adoTemp.Open;
  except
    exit;
  end;

  nPos := pos(cDelimeter, sChairmanIDs);
  while nPos > 0 do
  begin
    sID := copy(sChairmanIDs, 1, nPos - 1);
    sChairmanIDs := copy(sChairmanIDs, nPos + 1, Length(sChairmanIDs) - nPos);

    if adoTemp.Locate('UserID', sID, [loCaseInsensitive]) then
      result := result + adoTemp.FieldByName('UserName').AsString + cDelimeter;

    nPos := pos(cDelimeter, sChairmanIDs);
  end;

  adoTemp.Close;
end;

function TdbMain.GetCounselingSeq(nInOutID: integer; sMeetingDate: string)
  : integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM Counseling');
      Add(' WHERE InOutID=' + inttostr(nInOutID));
      Add('   AND MeetingDate=''' + sMeetingDate + '''');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := -1
    else
      result := adoTemp.FieldByName('Seq').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetDoctorID(nHospitalID: integer; sDoctorName: string): string;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM USERS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND USERNAME=''' + trim(sDoctorName) + '''');
      Add('   AND DOCTOR=1');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := NullString
    else
      result := adoTemp.FieldByName('UserID').AsString;

    adoTemp.Close;
  end;
end;

function TdbMain.GetDoctorList(nHospitalID: integer; oList: TStrings): Boolean;
begin
  try
    oList.Clear;

    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM USERS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND DOCTOR=1');
      Add('   AND USED=1');
      Add(' ORDER BY USERNAME');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := false
    else
    begin
      while not adoTemp.Eof do
      begin
        oList.Add(adoTemp.FieldByName('UserName').AsString);
        adoTemp.Next;
      end;

      result := true;
    end;

    adoTemp.Close;
  end;
end;

function TdbMain.GetDoctorName(nHospitalID: integer; sDoctorID: string): string;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM USERS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND USERID=''' + trim(sDoctorID) + '''');
      Add('   AND DOCTOR=1');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := NullString
    else
      result := adoTemp.FieldByName('UserName').AsString;

    adoTemp.Close;
  end;
end;

function TdbMain.GetHospitalID(sHospitalName: string): integer;
var
  oT: TADOQuery;
begin
  oT := TADOQuery.Create(self);
  try
    oT.Connection := adoSocialWorkDB;

    with oT.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM HOSPITALS');
      Add(' WHERE HOSPITALNAME=''' + sHospitalName + '''');
    end;

    oT.Open;
  finally
    if oT.IsEmpty then
      result := -1
    else
      result := oT.FieldByName('HospitalID').AsInteger;
    oT.Close;
  end;
  oT.Free;
end;

function TdbMain.GetHospitalList(oList: TStrings): Boolean;
begin
  try
    oList.Clear;

    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM Hospitals');
      Add(' WHERE Used=1');
      Add(' ORDER BY HospitalName');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := false
    else
    begin
      while not adoTemp.Eof do
      begin
        oList.Add(adoTemp.FieldByName('HospitalName').AsString);
        adoTemp.Next;
      end;

      result := true;
    end;

    adoTemp.Close;
  end;
end;

function TdbMain.GetInTypeID(nHospitalID: integer; sInTypeName: string)
  : integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM INTYPES');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND InTypeName =''' + sInTypeName + '''');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := -1
    else
      result := adoTemp.FieldByName('InTypeID').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetInTypeList(nHospitalID: integer; oList: TStrings): Boolean;
begin
  try
    oList.Clear;

    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM INTYPES');
      Add(' WHERE USED=1');
      Add('   AND HOSPITALID=' + inttostr(nHospitalID));
      Add(' ORDER BY INTYPENAME');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := false
    else
    begin
      while not adoTemp.Eof do
      begin
        oList.Add(adoTemp.FieldByName('InTypeName').AsString);
        adoTemp.Next;
      end;

      result := true;
    end;

    adoTemp.Close;
  end;
end;

function TdbMain.GetInTypeName(nInTypeID: integer): String;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM INTYPES');
      Add(' WHERE InTypeID =' + inttostr(nInTypeID));
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := NullString
    else
      result := adoTemp.FieldByName('InTypeName').AsString;

    adoTemp.Close;
  end;

end;

function TdbMain.GetLastCounselingSeq(nInOutID: integer): integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT MAX(SEQ) AS LastSeq');
      Add('  FROM Counseling');
      Add(' WHERE InOutID=' + inttostr(nInOutID));
    end;

    adoTemp.Open;
  finally
    if oGlobal.isNullStr(adoTemp.FieldByName('LastSeq').AsString) then
      result := 0
    else
      result := adoTemp.FieldByName('LastSeq').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetLastPatientID(nHospitalID: integer): string;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT TOP 1 *');
      Add('  FROM PATIENTS');
      Add(' WHERE HOSPITALID = ''' + inttostr(nHospitalID) + '''');
      Add(' ORDER BY PATIENTID DESC');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := ''
    else
      result := adoTemp.FieldByName('PatientID').AsString;

    adoTemp.Close;
  end;

end;

function TdbMain.GetLastRelationshipSeq(nHospitalID: integer): integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT MAX(SEQ) AS LastSeq');
      Add('  FROM RELATIONSHIPS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
    end;

    adoTemp.Open;
  finally
    if oGlobal.isNullStr(adoTemp.FieldByName('LastSeq').AsString) then
      result := 0
    else
      result := adoTemp.FieldByName('LastSeq').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetLastTrainingSeq(nInOutID: integer): integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT MAX(SEQ) AS LastSeq');
      Add('  FROM Training');
      Add(' WHERE InOutID=' + inttostr(nInOutID));
    end;

    adoTemp.Open;
  finally
    if oGlobal.isNullStr(adoTemp.FieldByName('LastSeq').AsString) then
      result := 0
    else
      result := adoTemp.FieldByName('LastSeq').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetLastVisitSeq(nInOutID: integer): integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT MAX(SEQ) AS LastSeq');
      Add('  FROM Visit');
      Add(' WHERE InOutID=' + inttostr(nInOutID));
    end;

    adoTemp.Open;
  finally
    if oGlobal.isNullStr(adoTemp.FieldByName('LastSeq').AsString) then
      result := 0
    else
      result := adoTemp.FieldByName('LastSeq').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetLastWardSeq(nHospitalID: integer): integer;
begin
  try
    adoTemp.SQL.Text :=
      'SELECT MAX(SEQ) AS LastSeq FROM Wards WHERE HospitalID=' + inttostr
      (nHospitalID);
    adoTemp.Open;
  finally
    if oGlobal.isNullStr(adoTemp.FieldByName('LastSeq').AsString) then
      result := -1
    else
      result := adoTemp.FieldByName('LastSeq').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetLocationIDs(nHospitalID: integer; sLocationNames: string)
  : string;
var
  nPos: integer;
  sName: string;
begin
  result := '';

  if oGlobal.isNullStr(sLocationNames) then
    exit;

  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT LocationID');
      Add('       ,LocationName');
      Add('  FROM Locations');
      Add(' WHERE HospitalID=' + inttostr(nHospitalID));
    end;

    adoTemp.Open;
  except
    exit;
  end;

  nPos := pos(cDelimeter, sLocationNames);
  while nPos > 0 do
  begin
    sName := copy(sLocationNames, 1, nPos - 1);
    sLocationNames := copy(sLocationNames, nPos + 1, Length(sLocationNames)
        - nPos);

    if adoTemp.Locate('LocationName', sName, [loCaseInsensitive]) then
      result := result + adoTemp.FieldByName('LocationID')
        .AsString + cDelimeter;

    nPos := pos(cDelimeter, sLocationNames);
  end;

  adoTemp.Close;
end;

function TdbMain.GetLocationList(nHospitalID: integer; oList: TStrings)
  : Boolean;
begin
  try
    oList.Clear;

    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT LocationName');
      Add('  FROM Locations');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND USED=1');
      Add(' ORDER BY LocationName');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := false
    else
    begin
      while not adoTemp.Eof do
      begin
        oList.Add(adoTemp.FieldByName('LocationName').AsString);
        adoTemp.Next;
      end;

      result := true;
    end;

    adoTemp.Close;
  end;
end;

function TdbMain.GetLocationNames(nHospitalID: integer; sLocationIDs: string)
  : string;
var
  nPos: integer;
  sID: string;
begin
  result := '';

  if oGlobal.isNullStr(sLocationIDs) then
    exit;

  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT LocationID');
      Add('       ,LocationName');
      Add('  FROM Locations');
      Add(' WHERE HospitalID=' + inttostr(nHospitalID));
    end;
    adoTemp.Open;
  except
    exit;
  end;

  nPos := pos(cDelimeter, sLocationIDs);
  while nPos > 0 do
  begin
    sID := copy(sLocationIDs, 1, nPos - 1);
    sLocationIDs := copy(sLocationIDs, nPos + 1, Length(sLocationIDs) - nPos);

    if adoTemp.Locate('LocationID', sID, [loCaseInsensitive]) then
      result := result + adoTemp.FieldByName('LocationName')
        .AsString + cDelimeter;

    nPos := pos(cDelimeter, sLocationIDs);
  end;

  adoTemp.Close;
end;

function TdbMain.GetUserID(nHospitalID: integer; sUserName: string): string;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM USERS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND USERNAME=''' + trim(sUserName) + '''');
      Add('   AND WORKER=1');
    end;
    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := NullString
    else
      result := adoTemp.FieldByName('UserID').AsString;

    adoTemp.Close;
  end;
end;

function TdbMain.GetUserList(nHospitalID: integer; oList: TStrings;
  bAll: Boolean): Boolean;
begin
  try
    oList.Clear;

    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM USERS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND WORKER=1');
      Add('   AND USED=1');
      Add(' ORDER BY USERNAME');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := false
    else
    begin
      if bAll then
        oList.Add(cAll);

      while not adoTemp.Eof do
      begin
        oList.Add(adoTemp.FieldByName('UserName').AsString);
        adoTemp.Next;
      end;

      result := true;
    end;

    adoTemp.Close;
  end;
end;

function TdbMain.GetUserName(nHospitalID: integer; sUserID: string): string;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM USERS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND USERID=''' + trim(sUserID) + '''');
      Add('   AND WORKER=1');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := NullString
    else
      result := adoTemp.FieldByName('UserName').AsString;

    adoTemp.Close;
  end;
end;

function TdbMain.GetPatientName(nHospitalID: integer; sPatientID: string)
  : string;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT PATIENTNAME');
      Add('  FROM PATIENTS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND PATIENTID=''' + trim(sPatientID) + '''');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := NullString
    else
      result := adoTemp.FieldByName('PatientName').AsString;

    adoTemp.Close;
  end;
end;

function TdbMain.GetProgramColor(nHospitalID: integer; sProgramName: string)
  : integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT Color');
      Add('  FROM Programs');
      Add(' WHERE HospitalID=' + inttostr(nHospitalID));
      Add('   AND ProgramName=''' + sProgramName + '''');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := clWhite
    else
      result := adoTemp.FieldByName('Color').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetProgramID(nHospitalID: integer; sProgramName: string)
  : integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT ProgramID');
      Add('  FROM Programs');
      Add(' WHERE HospitalID=' + inttostr(nHospitalID));
      Add('   AND ProgramName=''' + sProgramName + '''');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := -1
    else
      result := adoTemp.FieldByName('ProgramID').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetProgramList(nHospitalID, nWardID: integer; oList: TStrings;
  bAll: Boolean): Boolean;
begin
  try
    oList.Clear;

    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM Programs');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND (WardID=' + inttostr(nWardID) + ' OR UseAll=1)');
      Add('   AND USED=1');
      Add(' ORDER BY ProgramName');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := false
    else
    begin
      if bAll then
        oList.Add(cAll);

      while not adoTemp.Eof do
      begin
        oList.Add(adoTemp.FieldByName('ProgramName').AsString);
        adoTemp.Next;
      end;

      result := true;
    end;

    adoTemp.Close;
  end;
end;

function TdbMain.GetProgramPatientList(nScheduleID: integer; oList: TStrings)
  : Boolean;
begin
  oList.Clear;
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT (select PatientName');
      Add('          from Patients');
      Add('         where PatientID=InOut.PatientID');
      Add('           and Patients.HospitalID=' + inttostr
          (oConfig.User.HospitalID));
      Add('       ) as PatientName');
      Add('  FROM ProgramPatients, InOut');
      Add(' WHERE ProgramPatients.InOutID = InOut.InOutID');
      Add('   AND ProgramPatients.ScheduleID=' + inttostr(nScheduleID));
      Add(' ORDER BY PatientName');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := false
    else
    begin
      while not adoTemp.Eof do
      begin
        oList.Add(adoTemp.FieldByName('PatientName').AsString);
        adoTemp.Next;
      end;

      result := true;
    end;

    adoTemp.Close;
  end;
end;

function TdbMain.GetProgramPatientNames(nScheduleID: integer): string;
var
  sNames: string;
begin
  sNames := '';
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT (select PatientName');
      Add('          from Patients');
      Add('         where PatientID=InOut.PatientID');
      Add('           and Patients.HospitalID=' + inttostr
          (oConfig.User.HospitalID));
      Add('       ) as PatientName');
      Add('  FROM ProgramPatients, InOut');
      Add(' WHERE ProgramPatients.InOutID = InOut.InOutID');
      Add('   AND ProgramPatients.ScheduleID=' + inttostr(nScheduleID));
      Add(' ORDER BY PatientName');
    end;

    adoTemp.Open;
  finally
    adoTemp.First;
    while not adoTemp.Eof do
    begin
      sNames := sNames + adoTemp.FieldByName('PatientName').AsString + '; ';
      adoTemp.Next;
    end;

    if not adoTemp.IsEmpty then
      sNames := sNames + '  �̻� ' + inttostr(adoTemp.RecordCount) + '��';

    adoTemp.Close;

    result := sNames;
  end;
end;

function TdbMain.GetProgramTypeList(oList: TStrings; bAll: Boolean): Boolean;
begin
  try
    oList.Clear;

    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM ProgramTypes');
      Add(' WHERE USED=1');
      Add(' ORDER BY ProgramTypeName');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := false
    else
    begin
      if bAll then
        oList.Add(cAll);

      while not adoTemp.Eof do
      begin
        oList.Add(adoTemp.FieldByName('ProgramTypeName').AsString);
        adoTemp.Next;
      end;

      result := true;
    end;

    adoTemp.Close;
  end;
end;

function TdbMain.GetProgramTypeName(sProgramTypeID: string): string;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM ProgramTypes');
      Add(' WHERE ProgramTypeID=''' + sProgramTypeID + '''');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := NullString
    else
      result := adoTemp.FieldByName('ProgramTypeName').AsString;

    adoTemp.Close;
  end;
end;

function TdbMain.GetProgramTypeID(sProgramTypeName: string): integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM ProgramTypes');
      Add(' WHERE ProgramTypeName=''' + sProgramTypeName + '''');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := -1
    else
      result := adoTemp.FieldByName('ProgramTypeID').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetRelationshipID(nHospitalID: integer;
  sRelationshipName: string): integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM RELATIONSHIPS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND RelationshipName=''' + sRelationshipName + '''');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := -1
    else
      result := adoTemp.FieldByName('RelationshipID').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetBohumID(sBohumName: string): integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT BohumID');
      Add('  FROM Bohum');
      Add(' WHERE BohumName=''' + sBohumName + '''');
    end;
    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := -1
    else
      result := adoTemp.FieldByName('BohumID').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetBohumList(oList: TStrings; bAll: Boolean): Boolean;
begin
  try
    oList.Clear;

    with adoTemp.SQL do
    begin
      Clear;
      Add('Select *');
      Add('  from Bohum');
      Add(' Where Used=1');
      Add(' Order By Seq');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := false
    else
    begin
      if bAll then
        oList.Add(cAll);

      while not adoTemp.Eof do
      begin
        oList.Add(adoTemp.FieldByName('BohumName').AsString);
        adoTemp.Next;
      end;
      result := true;
    end;

    adoTemp.Close;
  end;
end;

function TdbMain.GetBohumName(nBohumID: integer): string;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT BohumName');
      Add('  FROM Bohum');
      Add(' WHERE BohumID=' + inttostr(nBohumID));
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := NullString
    else
      result := adoTemp.FieldByName('BohumName').AsString;

    adoTemp.Close;
  end;
end;

function TdbMain.GetRelationshipList(nHospitalID: integer; oList: TStrings)
  : Boolean;
begin
  try
    oList.Clear;

    with adoTemp.SQL do
    begin
      Clear;
      Add('Select *');
      Add('  from Relationships');
      Add(' Where HospitalID=' + inttostr(nHospitalID));
      Add(' Order By Seq');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := false
    else
    begin
      while not adoTemp.Eof do
      begin
        oList.Add(adoTemp.FieldByName('RelationshipName').AsString);
        adoTemp.Next;
      end;
      result := true;
    end;

    adoTemp.Close;
  end;
end;

function TdbMain.GetRelationshipName(nRelationshipID: integer): string;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT RelationshipName');
      Add('  FROM RelationshipID=' + inttostr(nRelationshipID));
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := NullString
    else
      result := adoTemp.FieldByName('RelationshipName').AsString;

    adoTemp.Close;
  end;
end;

function TdbMain.GetScheduleYear(nHospitalID: integer; oList: TStrings)
  : Boolean;
var
  sYear: string;
begin
  try
    oList.Clear;

    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT DISTINCT SUBSTRING(SDate,1,4) AS SelectYear');
      Add('  FROM Schedule');
      Add(' WHERE HospitalID=' + inttostr(nHospitalID));
      Add(' ORDER BY SelectYear DESC');
    end;

    adoTemp.Open;

    sYear := copy(oGlobal.DateToString(Now), 1, 4);

    if adoTemp.IsEmpty then
      oList.Add(sYear)
    else
    begin
      if sYear <> adoTemp.FieldByName('SelectYear').AsString then
        oList.Add(sYear);

      while not adoTemp.Eof do
      begin
        oList.Add(adoTemp.FieldByName('SelectYear').AsString);
        adoTemp.Next;
      end;
    end;
    result := true;
  except
    result := false;
  end;
  adoTemp.Close;
end;

function TdbMain.GetTrainingSeq(nInOutID: integer; sMeetingDate: string)
  : integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM Training');
      Add(' WHERE InOutID=' + inttostr(nInOutID));
      Add('   AND MeetingDate=''' + sMeetingDate + '''');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := -1
    else
      result := adoTemp.FieldByName('Seq').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetVersion: string;
var
  oT: TADOQuery;
begin
  oT := TADOQuery.Create(self);
  try
    oT.Connection := adoUpdateDB;

    with oT.SQL do
    begin
      Clear;
      Add('SELECT Version');
      Add('  FROM APPS');
      Add(' WHERE AppName=''' + cAppName + '''');
      Add(' ORDER BY Version DESC');
    end;
    oT.Open;
  finally
    if oT.IsEmpty then
      result := ''
    else
      result := oT.FieldByName('Version').AsString;

    oT.Close;
  end;
  oT.Free;
end;

function TdbMain.GetVisitSeq(nInOutID: integer; sVisitDate: string): integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM Visit');
      Add(' WHERE InOutID=' + inttostr(nInOutID));
      Add('   AND VisitDate=''' + sVisitDate + '''');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := -1
    else
      result := adoTemp.FieldByName('Seq').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetWardID(nHospitalID: integer; sWardName: string): integer;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM WARDS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND WARDNAME=''' + sWardName + '''');
    end;
    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := -1
    else
      result := adoTemp.FieldByName('WARDID').AsInteger;

    adoTemp.Close;
  end;
end;

function TdbMain.GetWardList(nHospitalID: integer; oList: TStrings;
  bAll: Boolean): Boolean;
begin
  try
    oList.Clear;

    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM WARDS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND USED=1');
      Add(' ORDER BY SEQ, WARDNAME');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := false
    else
    begin
      if bAll then
        oList.Add(cAll);

      while not adoTemp.Eof do
      begin
        oList.Add(adoTemp.FieldByName('WardName').AsString);
        adoTemp.Next;
      end;

      result := true;
    end;

    adoTemp.Close;
  end;
end;

function TdbMain.GetWardName(nHospitalID, nWardID: integer): string;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM WARDS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND WARDID=''' + inttostr(nWardID) + '''');
    end;

    adoTemp.Open;
  finally
    if adoTemp.IsEmpty then
      result := NullString
    else
      result := adoTemp.FieldByName('WARDNAME').AsString;

    adoTemp.Close;
  end;
end;

function TdbMain.isDuplicatedInOut(nHospitalID: integer;
  sPatientID, sInDate: string): Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM INOUT');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND PATIENTID=''' + sPatientID + '''');
      Add('   AND INDATE=''' + sInDate + '''');
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;
    adoTemp.Close;
  end;
end;

function TdbMain.isDuplicatedInTypeName(nHospitalID: integer;
  sInTypeName: string): Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM InTypes');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND InTypeName=''' + sInTypeName + '''');
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;
    adoTemp.Close;
  end;
end;

function TdbMain.isDuplicatedInWard(nHospitalID: integer; sPatientID: string;
  nWardID: integer): Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM INOUT');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND PATIENTID=''' + sPatientID + '''');
      Add('   AND State=' + inttostr(cIn));
      Add('   AND WardID=' + inttostr(nWardID));
    end;
    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;
    adoTemp.Close;
  end;

end;

function TdbMain.isDuplicatedLocationName(nHospitalID: integer;
  sLocationName: string): Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM LOCATIONS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND LocationName=''' + sLocationName + '''');
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;
    adoTemp.Close;
  end;
end;

function TdbMain.isDuplicatedPatientID(nHospitalID: integer; sPatientID: string)
  : Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM PATIENTS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND PATIENTID=''' + sPatientID + '''');
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;
    adoTemp.Close;
  end;
end;

function TdbMain.isDuplicatedRelationshipName(nHospitalID: integer;
  sRelationshipName: string): Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM Relationships');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND RelationshipName=''' + sRelationshipName + '''');
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;
    adoTemp.Close;
  end;
end;

function TdbMain.isDuplicatedShortkey(nHospitalID: integer; sKeyword: string)
  : Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT * ');
      Add('  FROM SHORTKEYS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND Keyword=''' + sKeyword + '''');
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;
    adoTemp.Close;
  end;
end;

function TdbMain.isDuplicatedWardName(nHospitalID: integer; sWardName: string)
  : Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM WARDS');
      Add(' WHERE HospitalID=' + inttostr(nHospitalID));
      Add('   AND WARDNAME = ''' + trim(sWardName) + '''');
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;

    adoTemp.Close;
  end;
end;

function TdbMain.isExistCounselingMeetingDate(nInOutID: integer;
  sMeetingDate: string): Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM Counseling');
      Add(' WHERE InOutID=' + inttostr(nInOutID));
      Add('   AND MeetingDate=''' + sMeetingDate + '''');
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;
    adoTemp.Close;
  end;
end;

function TdbMain.isExistInInOut(nHospitalID: integer; sPatientID: string)
  : Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT InOutID');
      Add('  FROM InOut');
      Add(' WHERE HospitalID=' + inttostr(nHospitalID));
      Add('   AND PatientID=''' + sPatientID + '''');
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;

    adoTemp.Close;
  end;
end;

function TdbMain.isExistScheduleInProgramPatient(nScheduleID: integer): Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT ScheduleID');
      Add('  FROM ProgramPatients');
      Add(' WHERE ScheduleID=' + inttostr(nScheduleID));
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;
    adoTemp.Close;
  end;
end;

function TdbMain.isExistsIn(nHospitalID: integer; sPatientID: string): Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM INOUT');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND PATIENTID=''' + sPatientID + '''');
      Add('   AND STATE=' + inttostr(cIn));
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;
    adoTemp.Close;
  end;
end;

function TdbMain.isExistOverNight(sInOutID: string;
  oStartTime, oFinishTime: TDateTime): Boolean;
var
  sS, sF: string;
begin
  sS := oGlobal.DateTimeToString(oStartTime);
  sF := oGlobal.DateTimeToString(oFinishTime);
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT StartTime');
      Add('  FROM OverNight');
      Add(' WHERE InOutID = ' + sInOutID);
      Add('   AND (   ''' + sS + ''' BETWEEN StartTime AND FinishTime');
      Add('        OR ''' + sF + ''' BETWEEN StartTime AND FinishTime');
      Add('        )');
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;
    adoTemp.Close;
  end;
end;

function TdbMain.isExistTrainingMeetingDate(nInOutID: integer;
  sMeetingDate: string): Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM Training');
      Add(' WHERE InOutID=' + inttostr(nInOutID));
      Add('   AND MeetingDate=''' + sMeetingDate + '''');
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;
    adoTemp.Close;
  end;
end;

function TdbMain.isExistVisitDate(nInOutID: integer; sVisitDate: string)
  : Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM Visit');
      Add(' WHERE InOutID=' + inttostr(nInOutID));
      Add('   AND VisitDate=''' + sVisitDate + '''');
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;
    adoTemp.Close;
  end;
end;

function TdbMain.isKeyword(nHospitalID: integer; sKeyword: string;
  var sContent: string): Boolean;
begin
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM SHORTKEYS');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND KEYWORD=''' + sKeyword + '''');
    end;

    adoTemp.Open;
  finally
    result := not adoTemp.IsEmpty;

    if adoTemp.IsEmpty then
      sContent := ''
    else
      sContent := adoTemp.FieldByName('Content').AsString;

    adoTemp.Close;
  end;
end;

function TdbMain.isValidUser(sHospitalName, sUserID, sPassword: string)
  : Boolean;
var
  nHospitalID: integer;
begin
  nHospitalID := -1;
  try
    nHospitalID := GetHospitalID(sHospitalName);

    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM USERS');
      Add(' WHERE HOSPITALID = ' + inttostr(nHospitalID));
      Add('   AND USERID = ''' + sUserID + '''');
      Add('   AND PASSWORD = ''' + Encoding(sPassword) + '''');
      Add('   AND USED = 1');
    end;

    adoTemp.Open;
  finally
    if not adoTemp.IsEmpty then
    begin
      oConfig.User.HospitalID := nHospitalID;
      oConfig.User.UserID := sUserID;
      oConfig.User.Password := sPassword;
      oConfig.User.UserName := adoTemp.FieldByName('UserName').AsString;
      oConfig.User.Worker := adoTemp.FieldByName('Worker').AsBoolean;
      oConfig.User.Doctor := adoTemp.FieldByName('Doctor').AsBoolean;
      oConfig.User.Admin := adoTemp.FieldByName('Admin').AsBoolean;
      oConfig.User.Used := adoTemp.FieldByName('Used').AsBoolean;
    end;

    result := not adoTemp.IsEmpty;

    adoTemp.Close;
  end;
end;

function TdbMain.RemakeCounselingOrder(nInOutID: integer; sMeetingDate: string)
  : Boolean;
var
  n: integer;
begin
  try
    adoTemp.Connection.BeginTrans;

    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM Counseling');
      Add(' WHERE InOutID=' + inttostr(nInOutID));
      Add(' ORDER BY MeetingDate');
    end;

    adoTemp.Open;

    adoTemp.First;
    for n := 1 to adoTemp.RecordCount do
    begin
      adoTemp.Edit;
      adoTemp.FieldByName('Seq').AsInteger := n;
      adoTemp.Post;

      adoTemp.Next;
    end;

    adoTemp.Connection.CommitTrans;

    result := true;
  except
    adoTemp.Connection.RollbackTrans;
    result := false;
  end;
end;

function TdbMain.RemakeTrainingOrder(nInOutID: integer; sMeetingDate: string)
  : Boolean;
var
  n: integer;
begin
  try
    adoTemp.Connection.BeginTrans;

    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM Training');
      Add(' WHERE InOutID=' + inttostr(nInOutID));
      Add(' ORDER BY MeetingDate');
    end;
    adoTemp.Open;

    adoTemp.First;
    for n := 1 to adoTemp.RecordCount do
    begin
      adoTemp.Edit;
      adoTemp.FieldByName('Seq').AsInteger := n;
      adoTemp.Post;

      adoTemp.Next;
    end;

    adoTemp.Connection.CommitTrans;

    result := true;
  except
    adoTemp.Connection.RollbackTrans;
    result := false;
  end;
end;

function TdbMain.RemakeVisitOrder(nInOutID: integer; sVisitDate: string)
  : Boolean;
var
  n: integer;
begin
  try
    adoTemp.Connection.BeginTrans;

    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT *');
      Add('  FROM Visit');
      Add(' WHERE InOutID=' + inttostr(nInOutID));
      Add(' ORDER BY VisitDate');
    end;
    adoTemp.Open;

    adoTemp.First;
    for n := 1 to adoTemp.RecordCount do
    begin
      adoTemp.Edit;
      adoTemp.FieldByName('Seq').AsInteger := n;
      adoTemp.Post;

      adoTemp.Next;
    end;

    adoTemp.Connection.CommitTrans;

    result := true;
  except
    adoTemp.Connection.RollbackTrans;
    result := false;
  end;
end;

function TdbMain.SaveNewPatient(oP: TNewPatientInfo): integer;
var
  oT: TADOQuery;
begin
  oT := TADOQuery.Create(self);
  oT.Connection := adoSocialWorkDB;

  try
    oT.Connection.BeginTrans;

    with oT.SQL do
    begin
      Clear;
      Add('SELECT TOP 1 *');
      Add('  FROM PATIENTS');
      Add(' WHERE PATIENTID=''-1''');
    end;

    oT.Open;

    oT.Append;
    oT.FieldByName('HospitalID').AsInteger := oP.oPatient.nHospitalID;
    oT.FieldByName('PatientID').AsString := oP.oPatient.sPatientID;
    oT.FieldByName('PatientName').AsString := oP.oPatient.sPatientName;
    if oP.oPatient.bMale then
      oT.FieldByName('Sex').AsString := cMale
    else
      oT.FieldByName('Sex').AsString := cFeMale;
    oT.FieldByName('Birthday').AsString := oP.oPatient.sBirthday;

    // oT.FieldByName('Used').AsBoolean := true;
    oT.Post;
    oT.Close;

    oT.SQL.Text := 'SELECT * FROM INOUT WHERE PATIENTID=''-1''';
    oT.Open;

    oT.Append;
    oT.FieldByName('InTypeID').AsInteger := oP.oInOut.nInTypeID;
    oT.FieldByName('BohumID').AsInteger := oP.oInOut.nBohumID;
    oT.FieldByName('HospitalID').AsInteger := oP.oInOut.nHospitalID;
    oT.FieldByName('PatientID').AsString := oP.oInOut.sPatientID;
    oT.FieldByName('InDate').AsString := oP.oInOut.sInDate;
    oT.FieldByName('InTime').AsString := oP.oInOut.sInTime;
    oT.FieldByName('State').AsInteger := cIn;
    oT.FieldByName('Room').AsString := oP.oInOut.sRoom;
    oT.FieldByName('DiagName').AsString := oP.oInOut.sDiagName;
    oT.FieldByName('DoctorID').AsString := dbMain.GetDoctorID
      (oP.oInOut.nHospitalID, oP.oInOut.sDoctorName);
    oT.FieldByName('UserID').AsString := dbMain.GetUserID
      (oP.oInOut.nHospitalID, oP.oInOut.sUserName);
    oT.FieldByName('WardID').AsInteger := dbMain.GetWardID
      (oP.oInOut.nHospitalID, oP.oInOut.sWardName);
    // oT.FieldByName('Used').AsBoolean := true;
    oT.Post;

    oT.Connection.CommitTrans;

    result := oT.FieldByName('InOutID').AsInteger;
  except
    oT.Cancel;
    oT.Connection.RollbackTrans;

    result := -1;
  end;

  oT.Close;
  oT.Free;
end;

procedure TdbMain.SetFamilies(nInOutID: integer;
  oRelationshipName, oFamilyName: TStrings);
begin
  oRelationshipName.Clear;
  oFamilyName.Clear;
  try
    with adoTemp.SQL do
    begin
      Clear;
      // Add('SELECT FAMILIES.*');
      // Add('       ,SEQ');
      // Add('       ,RELATIONSHIPNAME');
      // Add('       ,(SELECT RELATIONSHIPNAME FROM RELATIONSHIPS WHERE RELATIONSHIPS.RELATIONSHIPID=FAMILIES.RELATIONSHIPID) AS RELATIONSHIPNAME');
      // Add('  FROM FAMILIES LEFT JOIN RELATIONSHIPS ON RELATIONSHIPS.RELATIONSHIPID=FAMILIES.RELATIONSHIPID');
      // Add(' WHERE FAMILIES.RELATIONSHIPID=RELATIONSHIPS.RELATIONSHIPID');
      // Add('   AND  InOutID=' + inttostr(nInOutID));
      // Add(' ORDER BY SEQ, FAMILYNAME');
      Add('SELECT FAMILIES.*');
      Add('       ,SEQ');
      Add('       ,RELATIONSHIPNAME');
      Add(
        '  FROM FAMILIES LEFT JOIN RELATIONSHIPS ON RELATIONSHIPS.RELATIONSHIPID=FAMILIES.RELATIONSHIPID');
      Add(' WHERE InOutID=' + inttostr(nInOutID));
      Add(' ORDER BY SEQ, FAMILYNAME');
    end;

    adoTemp.Open;
  finally
    adoTemp.First;
    while not adoTemp.Eof do
    begin
      oRelationshipName.Add(adoTemp.FieldByName('RelationshipName').AsString);
      oFamilyName.Add(adoTemp.FieldByName('FamilyName').AsString);
      adoTemp.Next;
    end;
    oRelationshipName.Add(' ');
    oFamilyName.Add(' ');
    adoTemp.Close;
  end;
end;

procedure TdbMain.SetCurrentKeyword(oMemo: TMemo);
var
  Line: integer;
  str, keyword, content: string;
begin
  Line := oMemo.Perform(EM_LINEFROMCHAR, oMemo.SelStart, 0);
  str := trim(oMemo.Lines[Line]);
  if (Length(str) > 0) and (str[1] = '/') and (Length(str) > 1) then
  begin
    keyword := copy(str, 2, Length(str) - 1);

    if isKeyword(oConfig.User.HospitalID, keyword, content) then
      oMemo.Lines[Line] := content;
  end;
end;

procedure TdbMain.SetFamilies(nInOutID: integer;
  oRelationshipName, oFamilyName, oInMate, oHealth, oPay: TStrings);
begin
  oRelationshipName.Clear;
  oFamilyName.Clear;
  try
    with adoTemp.SQL do
    begin
      Clear;
      Add('SELECT FAMILIES.*');
      Add('       ,SEQ');
      Add('       ,RELATIONSHIPNAME');
      Add(
        '       ,(SELECT RELATIONSHIPNAME FROM RELATIONSHIPS WHERE RELATIONSHIPS.RELATIONSHIPID=FAMILIES.RELATIONSHIPID) AS RELATIONSHIPNAME');
      Add('  FROM FAMILIES, RELATIONSHIPS');
      Add(' WHERE FAMILIES.RELATIONSHIPID=RELATIONSHIPS.RELATIONSHIPID');
      Add('   AND  InOutID=' + inttostr(nInOutID));
      Add(' ORDER BY SEQ, FAMILYNAME');
    end;

    adoTemp.Open;
  finally
    adoTemp.First;
    while not adoTemp.Eof do
    begin
      oRelationshipName.Add(adoTemp.FieldByName('RelationshipName').AsString);
      oFamilyName.Add(adoTemp.FieldByName('FamilyName').AsString);
      if adoTemp.FieldByName('InMate').AsBoolean then
        oInMate.Add('O')
      else
        oInMate.Add('X');
      oHealth.Add(adoTemp.FieldByName('Health').AsString);
      if adoTemp.FieldByName('Pay').AsBoolean then
        oPay.Add('O')
      else
        oPay.Add('X');
      adoTemp.Next;
    end;
    adoTemp.Close;
  end;

end;

function TdbMain.SetPassword(nHospitalID: integer; sUserID, sPwd: string)
  : Boolean;
begin
  try
    adoTemp.Connection.BeginTrans;

    with adoTemp.SQL do
    begin
      Clear;
      Add('UPDATE USERS');
      Add('   SET PASSWORD=''' + Encoding(sPwd) + '''');
      Add(' WHERE HOSPITALID=' + inttostr(nHospitalID));
      Add('   AND USERID=''' + sUserID + '''');
    end;

    adoTemp.ExecSQL;
    adoTemp.Connection.CommitTrans;
    result := true;
  except
    adoTemp.Connection.RollbackTrans;
    result := false;
  end;
end;

function TdbMain.UsedRecord(nInOutID: integer): TRecordType;
begin
  try
    result := rtNone;

    adoTemp.SQL.Text := 'SELECT TOP 1 * FROM Intake WHERE INOUTID=' + inttostr
      (nInOutID);
    adoTemp.Open;
    if not adoTemp.IsEmpty then
      result := rtIntake;

    if result = rtNone then
    begin
      adoTemp.SQL.Text :=
        'SELECT TOP 1 * FROM Survey1 WHERE INOUTID=' + inttostr(nInOutID);
      adoTemp.Open;
      if not adoTemp.IsEmpty then
        result := rtSurvey1;
    end;

    if result = rtNone then
    begin
      adoTemp.SQL.Text :=
        'SELECT TOP 1 * FROM Survey2 WHERE INOUTID=' + inttostr(nInOutID);
      adoTemp.Open;
      if not adoTemp.IsEmpty then
        result := rtSurvey2;
    end;

    if result = rtNone then
    begin
      adoTemp.SQL.Text :=
        'SELECT TOP 1 * FROM Counseling WHERE INOUTID=' + inttostr(nInOutID);
      adoTemp.Open;
      if not adoTemp.IsEmpty then
        result := rtCounseling;
    end;

    if result = rtNone then
    begin
      adoTemp.SQL.Text :=
        'SELECT TOP 1 * FROM training WHERE INOUTID=' + inttostr(nInOutID);
      adoTemp.Open;
      if not adoTemp.IsEmpty then
        result := rttraining;
    end;

    if result = rtNone then
    begin
      adoTemp.SQL.Text :=
        'SELECT TOP 1 * FROM ProgramPatients WHERE INOUTID=' + inttostr
        (nInOutID);
      adoTemp.Open;
      if not adoTemp.IsEmpty then
        result := rtProgram;
    end;

    if result = rtNone then
    begin
      adoTemp.SQL.Text :=
        'SELECT TOP 1 * FROM Families WHERE INOUTID=' + inttostr(nInOutID);
      adoTemp.Open;
      if not adoTemp.IsEmpty then
        result := rtFamily;
    end;
  except
    result := rtError;
  end;
end;

end.
