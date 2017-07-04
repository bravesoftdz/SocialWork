unit uRecordReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, ComCtrls, QRPrntr;

type
  TfrmRecordReport = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    procedure QuickRep1Preview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecordReport: TfrmRecordReport;

implementation
uses uRecord;
{$R *.dfm}

procedure TfrmRecordReport.QuickRep1Preview(Sender: TObject);
begin
  frmRecord.QRPreviewIntake.QRPrinter := TQRPrinter(Sender);
  frmRecord.QRPreviewIntake.Zoom := 100;
end;

end.
