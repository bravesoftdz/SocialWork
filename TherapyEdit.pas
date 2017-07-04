unit TherapyEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, uGlobal, ADODB, DB, cxControls, cxContainer, cxEdit, dxSkinsCore,
  dxSkinCaramel, dxSkinOffice2007Blue, cxTextEdit, cxGroupBox, cxMaskEdit,
  cxDropDownEdit, cxSpinEdit, cxTimeEdit, cxCalendar, cxButtonEdit;

type
  TfrmTherapyEdit = class(TForm)
    btnOK: TcxButton;
    btnClose: TcxButton;
    adoPP: TADOTable;
    dsPP: TDataSource;
    cxGroupBox8: TcxGroupBox;
    txtInfoDonor: TcxTextEdit;
    cxGroupBox4: TcxGroupBox;
    cboWard: TcxComboBox;
    cxGroupBox5: TcxGroupBox;
    cxDateInDate: TcxDateEdit;
    cxTimeEdit1: TcxTimeEdit;
    cxTimeEdit2: TcxTimeEdit;
    cxGroupBox1: TcxGroupBox;
    cxTextEdit1: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    cxTextEdit2: TcxTextEdit;
    cxButtonEdit1: TcxButtonEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTherapyEdit: TfrmTherapyEdit;

implementation
uses uConfig, uDB, uTherapyMgr;
{$R *.dfm}

procedure TfrmTherapyEdit.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  showmessage('button click');
end;

procedure TfrmTherapyEdit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Close;
end;

end.
