unit uRatingPrintAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, dxSkinsCore, dxSkinCaramel,
  cxTextEdit, cxMaskEdit, cxSpinEdit, ComCtrls, ADODB, QuickRpt, uGlobal, uDB;

type
  TfrmRatingPrintAll = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnClose: TcxButton;
    ProgressBar1: TProgressBar;
    btnPrint: TcxButton;
    spinStart: TcxSpinEdit;
    spinFinish: TcxSpinEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure spinStartPropertiesChange(Sender: TObject);
    procedure spinFinishPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    FClose: Boolean;
    procedure DisplayProgress;
  public
    { Public declarations }
    oInOut: TADOQuery;
    oReport: TQuickRep;
  end;

var
  frmRatingPrintAll: TfrmRatingPrintAll;

implementation

{$R *.dfm}

procedure TfrmRatingPrintAll.btnCloseClick(Sender: TObject);
begin
  if FClose then
    Close
  else if oGlobal.YesNo('����� �����Ͻðڽ��ϱ�?') = mrYes then
  begin
    FClose := True;
    Close;
  end;
end;

procedure TfrmRatingPrintAll.btnPrintClick(Sender: TObject);
var
  num: integer;
  nStart, nFinish: integer;
begin
  nStart := spinStart.Value;
  nFinish := spinFinish.Value;

  if nStart > nFinish then
  begin
    oGlobal.Msg('���۹�ȣ�� ����ȣ ���� �۰ų� ���ƾ� �մϴ�!');
    spinStart.SetFocus;
    Exit;
  end;

  FClose := False;

  for num := nStart to nFinish do
  begin
    if FClose then break;

    oInOut.RecNo := num; Application.ProcessMessages;
    Progressbar1.Position := num - nStart + 1; Application.ProcessMessages;
    DisplayProgress; Application.ProcessMessages;

    try
      if num = nStart then
      begin
        oReport.PrinterSetup;
        if oReport.Tag = 0 then
          oReport.Print
        else
        begin
          Progressbar1.Position := 0;
          FClose := True;
          break;
        end;
      end
      else
        oReport.Print;
    except
      oGlobal.Msg('��� �� ������ �߻��߽��ϴ�!');
      Progressbar1.Position := 0;
      FClose := True;
      break;
    end;

    if num = nFinish then
    begin
      FClose := True;
      Close;
    end;

    Application.ProcessMessages;
  end;
end;

procedure TfrmRatingPrintAll.DisplayProgress;
begin
  label1.Caption := inttostr(Progressbar1.Position) + ' / ' + inttostr(Progressbar1.Max);
end;

procedure TfrmRatingPrintAll.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  oInOut := nil;
  oReport := nil;
end;

procedure TfrmRatingPrintAll.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FClose then
    CanClose := True
  else
  begin
    if oGlobal.YesNo('����� �����Ͻðڽ��ϱ�?') = mrYes then
    begin
      FClose := True;
      CanClose := True;
    end
    else
      CanClose := False;
  end;
end;

procedure TfrmRatingPrintAll.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

procedure TfrmRatingPrintAll.FormShow(Sender: TObject);
begin
  FClose := True;

  spinStart.Properties.MinValue := 0;
  spinStart.Properties.MaxValue := 0;
  spinStart.Value := 0;

  spinFinish.Properties.MinValue := 1;
  spinFinish.Properties.MaxValue := oInOut.RecordCount;
  spinFinish.Value := oInOut.RecordCount;

  spinStart.Properties.MinValue := 1;
  spinStart.Properties.MaxValue := oInOut.RecordCount;
  spinStart.Value := 1;
end;

procedure TfrmRatingPrintAll.spinFinishPropertiesChange(Sender: TObject);
begin
  if spinFinish.Value < spinStart.Value then
  begin
    oGlobal.Msg('����ȣ�� ���۹�ȣ���� ũ�ų� ���ƾ� �մϴ�!');
    spinFinish.Value := spinStart.Value;
    spinFinish.SetFocus;
  end;

  Progressbar1.Min := 0;
  Progressbar1.Max := spinFinish.Value - spinStart.Value + 1;
  Progressbar1.Position := 0;
  DisplayProgress;
  Application.ProcessMessages;
end;

procedure TfrmRatingPrintAll.spinStartPropertiesChange(Sender: TObject);
begin
  if spinStart.Value > spinFinish.Value then
  begin
    oGlobal.Msg('���۹�ȣ�� ����ȣ ���� �۰ų� ���ƾ� �մϴ�!');
    spinStart.Value := spinFinish.Value;
    spinStart.SetFocus;
  end;

  Progressbar1.Min := 0;
  Progressbar1.Max := spinFinish.Value - spinStart.Value + 1;
  Progressbar1.Position := 0;
  DisplayProgress;
  Application.ProcessMessages;
end;

end.
