unit uAdminSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, StdCtrls, uDB, uGlobal, ComCtrls;

type
  TfrmAdminSetup = class(TForm)
    Button1: TButton;
    ProgressBarWardHistory: TProgressBar;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminSetup: TfrmAdminSetup;

implementation

{$R *.dfm}

procedure TfrmAdminSetup.Button1Click(Sender: TObject);
var
  oInOut, oWardHistory: TADOQuery;
begin
  oInOut := TADOQuery.Create(self);
  oWardHistory := TADOQuery.Create(self);

  oInOut.Connection := dbMain.adoSocialWorkDB;
  oWardHistory.Connection := dbMain.adoSocialWorkDB;

  try
    oInOut.SQL.Text := 'SELECT * FROM INOUT';
    oInOut.Open;

    dbMain.adoSocialWorkDB.BeginTrans;

    ProgressBarWardHistory.Max :=oInOut.RecordCount;
    ProgressBarWardHistory.Position := 0;

    oInOut.First;
    while not oInOut.Eof do
    begin
      oWardHistory.SQL.Text :=
        'SELECT * FROM WardHistory WHERE InOutID=' + oInOut.FieldByName
        ('InOutID').AsString;
      oWardHistory.Open;
      if oWardHistory.IsEmpty then
      begin
        oWardHistory.Append;
        oWardHistory.FieldByName('InOutID').AsInteger := oInOut.FieldByName
          ('InOutID').AsInteger;
        oWardHistory.FieldByName('WardDate').AsString := oInOut.FieldByName
          ('InDate').AsString;
        oWardHistory.FieldByName('WardID').AsInteger := oInOut.FieldByName
          ('WardID').AsInteger;
        oWardHistory.Post;
      end;

      ProgressBarWardHistory.Position := ProgressBarWardHistory.Position + 1;
      Application.ProcessMessages;

      oInOut.Next;
    end;

    dbMain.adoSocialWorkDB.CommitTrans;
    oGlobal.Msg('완료!');
  except
    dbMain.adoSocialWorkDB.RollbackTrans;
    oGlobal.Msg('에러1');
  end;
end;

procedure TfrmAdminSetup.Button2Click(Sender: TObject);
var
  oT: TADOQuery;
begin
  if oGlobal.YesNo('진행하시겠습니까?') <> mrYes then
    Exit;

  oT := TADOQuery.Create(self);
  oT.Connection := dbMain.adoSocialWorkDB;
  try
    oT.Connection.BeginTrans;
    oT.SQL.Text := 'update ProgramPatients' +
                   '   set WardID=(select WardID from schedule where ScheduleID = ProgramPatients.ScheduleID)' +
                   '       ,WardDate=(select WardDate from WardHistory where InOutID=ProgramPatients.InOutID)';
    oT.ExecSQL;
    oT.Connection.CommitTrans;
    oGlobal.Msg('ok');
  except
    oT.Connection.RollbackTrans;
    oGlobal.Msg('error!');
  end;
end;

procedure TfrmAdminSetup.Button3Click(Sender: TObject);
var
  oT: TADOQuery;
begin
  oT := TADOQuery.Create(self);
  oT.Connection := dbMain.adoSocialWorkDB;
  try
    oT.Connection.BeginTrans;
    oT.SQL.Text := 'update inout set outdate='''' where outdate is null';
    oT.ExecSQL;

    oT.SQL.Text := 'update inout set outtime=''00:00:00'' where outtime is null';
    oT.ExecSQL;

    oT.SQL.Text := 'update inout set outtime=''00:00:00'' where outtime=''''';
    oT.ExecSQL;

    oT.SQL.Text := 'update inout set intime=''00:00:00'' where intime is null';
    oT.ExecSQL;

    oT.Connection.CommitTrans;
    oGlobal.Msg('ok');
  except
    oT.Connection.RollbackTrans;
    oGlobal.Msg('error!');
  end;
end;

procedure TfrmAdminSetup.Button4Click(Sender: TObject);
var
  oS, oT: TAdoQuery;
  nR: integer;
  sHospitalID, sKeyword, sContent: string;
begin
  oS := TAdoQuery.Create(self);
  oT := TAdoQuery.Create(self);

  oS.Connection := dbMain.adoSocialWorkDB;
  oT.Connection := dbMain.adoSocialWorkDB;

  oS.SQL.Text := 'SELECT * FROM ShortKeys';
  oS.Open;

  try
    dbMain.adoSocialWorkDB.BeginTrans;

    nR := 0;
    while not oS.Eof do
    begin
      sHospitalID := oS.FieldByName('HospitalID').AsString;
      sKeyword := oS.FieldByName('Keyword').AsString;
      sContent := oS.FieldByName('Content').AsString;

      oT.SQL.Text := 'SELECT * FROM Keyword WHERE HospitalID=' + sHospitalID + ' AND Keyword=''' + sKeyword + '''';
      oT.Open;

      if oT.IsEmpty then
      begin
        oT.Append;
        oT.FieldByName('Parent').AsInteger := -1;
        oT.FieldByName('HospitalID').AsString := sHospitalID;
        oT.FieldByName('Keyword').AsString := sKeyword;
        oT.FieldByName('Title').AsString := sKeyword;
        oT.FieldByName('Content').AsString := sContent;
        oT.Post;
      end;

      oS.Next;
      nR := nR + 1;
    end;

    dbMain.adoSocialWorkDB.CommitTrans;
    oGlobal.Msg('OK');
  except
    dbMain.adoSocialWorkDB.ConnectionObject.RollbackTrans;
    oGlobal.Msg('에러!');
  end;




end;

end.
