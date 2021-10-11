unit CLP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPLabel, StdCtrls, XPButton, IniFiles, XPCheckBox;

  
  const
   AlignCenter = Wm_User + 1024;

  type
   TWmMoving = record
   Msg: Cardinal;
   fwSide: Cardinal;
   lpRect: PRect;
   Result: Integer;
  end;

type
  TLangForm = class(TForm)
    Cancel: TXPButton;
    OK: TXPButton;
    LangBox: TComboBox;
    txt1: TXPLabel;
    procedure CancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);

    private

    SM: HWND;

    Ini : TIniFile;

    procedure WMMoving(var msg: TWMMoving);
    message WM_MOVING;

    procedure ChangeMessageBoxPosition(var Msg: TMessage);
    message AlignCenter;

  public

  end;

var
  LangForm: TLangForm;
  msgCaption: PChar;

implementation

uses SP, NP;

{$R *.dfm}

procedure TLangForm.CancelClick(Sender: TObject);
begin
LangBox.ItemIndex := Ini.ReadInteger('Language', 'Lang', LangBox.ItemIndex);
LangForm.Close;
end;

procedure TLangForm.ChangeMessageBoxPosition(var Msg: TMessage);
var
MbHwnd: longword;
MbRect: TRect;
x, y, w, h: integer;
begin
MbHwnd := FindWindow(MAKEINTRESOURCE(WC_DIALOG), msgCaption);
if (MbHwnd <> 0) then
begin
GetWindowRect(MBHWnd, MBRect);
with MbRect do
begin
w := Right - Left;
h := Bottom - Top;
end;
x := LangForm.Left + ((LangForm.Width - w) div 2);
if x < 0 then
x := 0
else if x + w > Screen.Width then x := Screen.Width - w;
y := LangForm.Top + ((LangForm.Height - h) div 2);
if y < 0 then y := 0
else if y + h > Screen.Height then y := Screen.Height - h;
SetWindowPos(MBHWnd, 0, x, y, 0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;
end;

procedure TLangForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
LangForm.Close;
end;

procedure TLangForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;

procedure TLangForm.FormShow(Sender: TObject);
begin
if SetForm.ch10.Checked then
begin
SetWindowLong(LangForm.Handle, GWL_EXSTYLE,
GetWindowLOng(LangForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
if LangBox.ItemIndex  = -1 then
LangBox.ItemIndex := 1;
end;

procedure TLangForm.WMMoving(var msg: TWMMoving);
var
r: TRect;
begin
r := Screen.WorkareaRect;
if msg.lprect^.left < r.left then
OffsetRect(msg.lprect^, r.left - msg.lprect^.left, 0);
if msg.lprect^.top < r.top then
OffsetRect(msg.lprect^, 0, r.top - msg.lprect^.top);
if msg.lprect^.right > r.right then
OffsetRect(msg.lprect^, r.right - msg.lprect^.right, 0);
if msg.lprect^.bottom > r.bottom then
OffsetRect(msg.lprect^, 0, r.bottom - msg.lprect^.bottom);
end;

procedure TLangForm.FormDestroy(Sender: TObject);
begin
LangForm.OnActivate := nil;
LangBox.Free;
Cancel.Free;
txt1.Free;
Ok.Free;
end;

procedure TLangForm.FormCreate(Sender: TObject);
begin
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
LangBox.ItemIndex := Ini.ReadInteger('Language', 'Lang', LangBox.ItemIndex);
except
end;
end;

procedure TLangForm.OKClick(Sender: TObject);
begin
Ini.WriteInteger('Language', 'Lang', LangBox.ItemIndex);
if LangForm.LangBox.ItemIndex  = 0 then
begin
MainForm.EngButton.Click;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
MainForm.RusButton.Click;
end;
LangForm.Close;
end;

procedure TLangForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Cancel.SetFocus;
Cancel.OnClick(Self);
end;

procedure TLangForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

end.
