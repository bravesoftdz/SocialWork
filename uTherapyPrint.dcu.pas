unit uTherapyPrint.dcu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, uGlobal;

type
  TfrmTherapyPrint = class(TForm)
    btnOK: TcxButton;
    btnClose: TcxButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    FScheduleID: integer;
  end;

var
  frmTherapyPrint: TfrmTherapyPrint;

implementation
uses uDB, uConfig;
{$R *.dfm}

procedure TfrmTherapyPrint.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

end.
