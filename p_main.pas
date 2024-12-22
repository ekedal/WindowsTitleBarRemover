unit p_main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Dialogs,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    btnRemoveTitleBar: TButton;
    ListBox1: TListBox;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    lblSavefile_: TLabel;
    Button4: TButton;
    Button5: TButton;
    Label2: TLabel;
    procedure btnRemoveTitleBarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SaveItemsToFile(ListBox: TListBox; const FileName: string);
    procedure LoadItemsFromFile(ListBox: TListBox; const FileName: string);

    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    procedure RemoveTitleBar(const WindowTitle: string);
    procedure RestoreTitleBar(const WindowTitle: string);

  end;

var
  Form1: TForm1;
  Savefile_ : string;

implementation

{$R *.dfm}


procedure TForm1.RemoveTitleBar(const WindowTitle: string);
var
  hWnd: THandle;
  Style: LongInt;
begin
  // Find the window by its title
  hWnd := FindWindow(nil, PChar(WindowTitle));
  if hWnd = 0 then
  begin
    ShowMessage('Window not found: ' + WindowTitle);
    Exit;
  end;

  // Get the current style
  Style := GetWindowLong(hWnd, GWL_STYLE);
  if Style = 0 then
  begin
    ShowMessage('Failed to retrieve window style.');
    Exit;
  end;

  // Remove the title bar (WS_CAPTION)
  Style := Style and not WS_CAPTION;
  if SetWindowLong(hWnd, GWL_STYLE, Style) = 0 then
  begin
    ShowMessage('Failed to update window style.');
    Exit;
  end;

  // Redraw the window to apply the changes
  SetWindowPos(hWnd, 0, 0, 0, 0, 0,
    SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER or SWP_FRAMECHANGED);

  //ShowMessage('Title bar removed for window: ' + WindowTitle);
end;

procedure TForm1.RestoreTitleBar(const WindowTitle: string);
var
  hWnd: THandle;
  Style: LongInt;
begin
  // Find the window by its title
  hWnd := FindWindow(nil, PChar(WindowTitle));
  if hWnd = 0 then
  begin
    ShowMessage('Window not found: ' + WindowTitle);
    Exit;
  end;

  // Get the current style
  Style := GetWindowLong(hWnd, GWL_STYLE);
  if Style = 0 then
  begin
    ShowMessage('Failed to retrieve window style.');
    Exit;
  end;

  // Remove the title bar (WS_CAPTION)
  Style := Style or WS_CAPTION;
  if SetWindowLong(hWnd, GWL_STYLE, Style) = 0 then
  begin
    ShowMessage('Failed to update window style.');
    Exit;
  end;

  // Redraw the window to apply the changes
  SetWindowPos(hWnd, 0, 0, 0, 0, 0,
    SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER or SWP_FRAMECHANGED);

//  ShowMessage('Title bar removed for window: ' + WindowTitle);
end;




procedure TForm1.BitBtn1Click(Sender: TObject);
Var
  i : integer;
begin
for i := 0 to ListBox1.Items.Count - 1 do
  begin
    RemoveTitleBar(listbox1.Items[i]);
  end;
end;

procedure TForm1.btnRemoveTitleBarClick(Sender: TObject);
var
  i : integer;
begin
  if ListBox1.ItemIndex <> -1 then // Check if an item is selected
     RemoveTitleBar(ListBox1.Items[ListBox1.ItemIndex]);
end;

procedure TForm1.SaveItemsToFile(ListBox: TListBox; const FileName: string);
var
  StringList: TStringList;

begin
  StringList := TStringList.Create;
  try
    StringList.Assign(ListBox.Items);
    StringList.SaveToFile(filename);  // Save to file, overwriting if it exists
  finally
    StringList.Free;
  end;
end;

procedure Tform1.LoadItemsFromFile(ListBox: TListBox; const FileName: string);
var
  Items: TStringList;
  i : integer;

begin
  Items := TStringList.Create;
  try
    Items.LoadFromFile(FileName);
    listBox.Clear;
    ListBox.Items.Assign(Items);

    for i := ListBox.Items.Count - 1 downto 0 do
    begin
      if Trim(ListBox.Items[i]) = '' then
        ListBox.Items.Delete(i);
    end;

  except
    on E: Exception do
      ShowMessage('Error loading file: ' + E.Message);
  end;
  Items.Free; // Free the TStringList
end;



procedure TForm1.Button1Click(Sender: TObject);
var
  UserInput: string;
begin
  UserInput := InputBox('Add Window', 'Enter the window title to add:', '');

  if Trim(UserInput) <> '' then  // Check if the input is not empty or whitespace
    ListBox1.Items.Add(UserInput);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SaveItemsToFile(Listbox1, savefile_);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if ListBox1.ItemIndex <> -1 then // Check if an item is selected
    ListBox1.Items.Delete(ListBox1.ItemIndex);
end;

procedure TForm1.Button4Click(Sender: TObject);
Var
  i : integer;
begin
for i := 0 to ListBox1.Items.Count - 1 do
  begin
    RestoreTitleBar(ListBox1.Items[ListBox1.ItemIndex]);
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  MessageDlg('Developed by Jan Roger Ekedal for own use, others may use it as freeware. e-mail: jan.roger@ekedal.no',mtinformation,[mbok],0);
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
  savefile_ :=  ExtractFilePath(ParamStr(0)) + 'wintitles.asc';
  if fileexists(savefile_) then LoadItemsFromFile(ListBox1, savefile_);
  lblSavefile_.caption := savefile_;
end;

end.
