unit uVersionList;

interface

uses
  Classes, SysUtils, Dialogs;

type
  TListItem = class
    FileName: string;
    Size: integer;
    Modify: string;
  end;

  TVersionList = class
  private
    FList: TList;
    function GetListItem(Index: integer): TListItem;
    function GetCount: integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadFromStrings(Strings: TStrings; UpdaterFileName: string);
    function FileExists(const FileName: string): Boolean;
    function Modifies(const Name: string): string;
    function Sizes(const Name: string): integer;
    function FileNames(const Name: string): string;
    property count: integer read GetCount;
    property Items[Index: integer]: TListItem read GetListItem;
  end;

implementation

{ TVersionList }

constructor TVersionList.Create;
begin
  FList := TList.Create;
end;

destructor TVersionList.Destroy;
begin
  FList.Free;

  inherited;
end;

function TVersionList.FileExists(const FileName: string): Boolean;
var
  n: integer;
begin
  result := False;

  for n := 0 to Count - 1 do
  begin
    if UpperCase(Items[n].FileName) = UpperCase(FileName) then
    begin
      result := True;
      break;
    end;
  end;
end;

function TVersionList.FileNames(const Name: string): string;
var
  n: integer;
begin
  result := '';

  for n := 0 to Count - 1 do
  begin
    if UpperCase(Items[n].FileName) = UpperCase(Name) then
    begin
      result := Items[n].FileName;
      break;
    end;
  end;
end;

function TVersionList.GetCount: integer;
begin
  result := FList.Count;
end;

function TVersionList.GetListItem(Index: integer): TListItem;
begin
  result := pointer(FList.Items[Index]);
end;

procedure TVersionList.LoadFromStrings(Strings: TStrings; UpdaterFileName: string);
var
  Item: TListItem;
  oTemp: TStringList;
  Loop: integer;
  sFileName: string;
begin
  // type, modify, size, filename

  oTemp := TStringList.Create;
  FList.Clear;

  try
    for Loop := 0 to Strings.Count - 1 do
    begin

      oTemp.Delimiter := ';';
      oTemp.DelimitedText := Strings[Loop];

      sFileName := oTemp.Strings[3];
      if (oTemp.Values['type'] = 'file') and (sFileName <> UpdaterFileName) then
      begin
        Item := TListItem.Create;

        Item.Modify := oTemp.Values['modify'];
        Item.Size := strtoint(oTemp.Values['size']);
        Item.FileName := sFileName;

        FList.Add(Item);
      end;
    end;
  except
    raise;
  end;
end;

function TVersionList.Modifies(const Name: string): string;
var
  n: integer;
begin
  result := '';

  for n := 0 to Count - 1 do
  begin
    if UpperCase(Items[n].FileName) = UpperCase(Name) then
    begin
      result := Items[n].Modify;
      break;
    end;
  end;
end;

function TVersionList.Sizes(const Name: string): integer;
var
  n: integer;
begin
  result := 0;

  for n := 0 to Count - 1 do
  begin
    if UpperCase(Items[n].FileName) = UpperCase(Name) then
    begin
      result := Items[n].Size;
      break;
    end;
  end;
end;

end.
