unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RHEncryption;

type
  TfrmMain = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtServerName: TEdit;
    txtUserID: TEdit;
    txtPassword: TEdit;
    btnConnect: TButton;
    btnDisconnect: TButton;
    Encryption: TRHEncryption;
    procedure btnConnectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btnConnectClick(Sender: TObject);
begin
  showmessage(Encryption.Encoding('abc'));
end;

end.
