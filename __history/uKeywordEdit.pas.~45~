unit uKeywordEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, uGlobal, uConfig, uDB, ADODB, cxControls, cxContainer, cxEdit,
  dxSkinsCore, dxSkinCaramel, cxGroupBox, cxRadioGroup, cxTextEdit, cxMemo,
  DB;

type
  TfrmKeywordEdit = class(TForm)
    btnClose: TcxButton;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    txtKeyword: TcxTextEdit;
    txtTitle: TcxTextEdit;
    rgLevel: TcxRadioGroup;
    memoContent: TcxMemo;
    btnSave: TcxButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure ClearControls;
    procedure SetValue;
    function isValidInput: Boolean;
  public
    { Public declarations }
    EditMode : TEditMode;
    adoKeyword: TAdoQuery;
  end;

var
  frmKeywordEdit: TfrmKeywordEdit;

implementation

{$R *.dfm}

procedure TfrmKeywordEdit.btnSaveClick(Sender: TObject);
var
  nCurParent, nCurID: integer;
  nID: integer;
begin
  if not isValidInput then
    Exit;

  if oGlobal.YesNo(btnSave.Caption + '하시겠습니까?') <> mrYes then
    Exit;

  if adoKeyword.IsEmpty then
  begin
    nCurParent := -1;
    nCurID := -1;
  end
  else
  begin
    nCurParent := adoKeyword.FieldByName('Parent').AsInteger;
    nCurID := adoKeyword.FieldByName('ID').AsInteger;
  end;

  adoKeyword.DisableControls;
  try
    adoKeyword.Connection.BeginTrans;
    if EditMode = emUpdate then
      adoKeyword.Edit
    else
    begin
      adoKeyword.Append;
      adoKeyword.FieldByName('HospitalID').AsInteger := oConfig.User.HospitalID;
      case rgLevel.ItemIndex of
        0: adoKeyword.FieldByName('Parent').AsInteger := -1;
        1: adoKeyword.FieldByName('Parent').AsInteger := nCurParent;
      else
           adoKeyword.FieldByName('Parent').AsInteger := nCurID;
      end;
    end;

    adoKeyword.FieldByName('Keyword').AsString := trim(txtKeyword.Text);
    adoKeyword.FieldByName('Title').AsString := trim(txtTitle.Text);
    adoKeyword.FieldByName('Content').AsString := trim(MemoContent.Lines.Text);
    adoKeyword.Post;

    nID := adoKeyword.FieldByName('ID').AsInteger;

    if EditMode = emAppend then
    begin
      adoKeyword.Close;
      adoKeyword.Open;
      adoKeyword.Locate('ID', nID, [loCaseInsensitive]);
      ClearControls;
      SetValue;
      txtKeyword.SetFocus;
    end;

    adoKeyword.Connection.CommitTrans;

    if EditMode = emUpdate then
      Close;
  except
    adoKeyword.Connection.RollbackTrans;

    oGlobal.Msg(btnSave.Caption + '하지 못했습니다!');
  end;
  adoKeyword.EnableControls;
end;

procedure TfrmKeywordEdit.ClearControls;
begin
  txtKeyword.Clear;
  txtTitle.Clear;
  rgLevel.Clear;
  memoContent.Lines.Clear;
  rgLevel.Enabled := EditMode = emAppend;

  if EditMode = emAppend then
    btnSave.caption := '추가'
  else
    btnSave.Caption := '수정';
end;

procedure TfrmKeywordEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmKeywordEdit.FormShow(Sender: TObject);
begin
  ClearControls;
  SetValue;

  txtKeyword.SetFocus;
end;

function TfrmKeywordEdit.isValidInput: Boolean;
var
  sKeyword, sTitle: string;
begin
  result := False;

  sKeyword := trim(txtKeyword.Text);
  sTitle := trim(txtTitle.Text);

  if oGlobal.isNullStr(sKeyword) then
  begin
    oGlobal.Msg('Keyword를 입력해 주십시오!');
    txtKeyword.SetFocus;
    Exit;
  end;

  if oGlobal.isNullStr(sTitle) then
  begin
    oGlobal.Msg('제목을 입력해 주십시오!');
    txtTitle.SetFocus;
    Exit;
  end;

  if EditMode = emAppend then
  begin
    if dbMain.isExistKeyword(oConfig.User.HospitalID, sKeyword) then
    begin
      oGlobal.Msg('중복된 Keyword 가 있습니다!');
      txtKeyword.SetFocus;
      Exit;
    end;

    if rgLevel.ItemIndex < 0 then
    begin
      oGlobal.Msg('추가 방법을 선택하십시오!');
      Exit;
    end;
  end
  else
  begin
    if (adoKeyword.FieldByName('Keyword').AsString <> sKeyword) and
      dbMain.isExistKeyword(oConfig.User.HospitalID, sKeyword) then
    begin
      oGlobal.Msg('중복된 Keyword 가 있습니다!');
      txtKeyword.SetFocus;
      Exit;
    end;
  end;

  result := True;
end;

procedure TfrmKeywordEdit.SetValue;
begin
  if EditMode = emUpdate then
  begin
    txtKeyword.Text := adoKeyword.FieldByName('Keyword').AsString;
    txtTitle.Text := adoKeyword.FieldByName('Title').AsString;
    memoContent.Lines.Text := adoKeyword.FieldByName('Content').AsString;
  end
  else
  begin
    if adoKeyword.IsEmpty then
    begin
      rgLevel.ItemIndex := 0;
      rgLevel.Enabled := False;
    end
    else
      rgLevel.ItemIndex := 1;
  end;
end;

end.
