unit PRP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPButton, XPEdit, XPLabel, ExtCtrls, ShellApi, StdCtrls, Registry,
  XPCheckBox;

  const
   AlignCenter = Wm_User + 1024;

  type
   TRegForm = class(TForm)
    Logo: TImage;
    tx1: TXPLabel;
    tx2: TXPLabel;
    InputName: TXPEdit;
    InputCode: TXPEdit;
    Cancel: TXPButton;
    OK: TXPButton;
    tx3: TXPLabel;
    tx4: TXPLabel;
    Logo2: TImage;
    tx5: TXPLabel;
    ch1: TXPCheckBox;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tx3Click(Sender: TObject);
    procedure InputCodeKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tx5Click(Sender: TObject);
    procedure tx5MouseLeave(Sender: TObject);
    procedure tx5MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure tx5MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure tx3MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure tx4MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure tx4MouseLeave(Sender: TObject);
    procedure tx4MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure tx3MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure tx3MouseLeave(Sender: TObject);
    procedure ch1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    SM: HWND;

    procedure CMMouseLeave(var msg: TMessage);
    message CM_MOUSELEAVE;

    procedure ChangeMessageBoxPosition(var Msg: TMessage);
    message AlignCenter;

  public

  end;

var
  RegForm: TRegForm;

  msgCaption: PChar;

implementation

uses NP, AP, SP, CLP;

{$R *.dfm}

procedure TRegForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;

procedure TRegForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
begin
RegForm.Close;
end;
end;

procedure TRegForm.FormCreate(Sender: TObject);
var
UserName: array[0..255] of char;
Size: dword;
begin
Size := 55;
if getUserName(UserName, Size) then
InputName.Text := UserName else
InputName.Text := 'User';
end;

procedure TRegForm.CancelClick(Sender: TObject);
begin
InputCode.Text := '';
RegForm.Close;
end;

procedure TRegForm.OKClick(Sender: TObject);
var
Reg:TRegistry;
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if InputCode.Text = 'человек проженный опытом' then
begin
if LangForm.LangBox.ItemIndex  = 0 then
begin
Application.MessageBox('Registration successful.' +
#13 + #13 + 'Thanks!',
'Notepad SE',
mb_IconAsterisk + mb_OK);
Reg:=TRegistry.Create;
Reg.RootKey:=HKEY_CURRENT_USER;
Reg.OpenKey('\SOFTWARE\Notepad SE\RegKey',true);
Reg.WriteString('',RegForm.InputCode.Text);
Reg.Free;
RegForm.Close;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
Application.MessageBox('Успешная регистрация.' +
#13 + #13 + 'Спасибо за поддержку!',
'Notepad SE',
mb_IconAsterisk + mb_OK);
Reg:=TRegistry.Create;
Reg.RootKey:=HKEY_CURRENT_USER;
Reg.OpenKey('\SOFTWARE\Notepad SE\RegKey',true);
Reg.WriteString('',RegForm.InputCode.Text);
Reg.Free;
RegForm.Close;
end;
end else
begin
RegForm.Close;
if LangForm.LangBox.ItemIndex  = 0 then
begin
Application.MessageBox('Incorrect registration!',
'Notepad SE',
mb_IconAsterisk + mb_OK);
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
Application.MessageBox('Неверная регистрация!',
'Notepad SE',
mb_IconAsterisk + mb_OK);
end;
end;
MainForm.T2.Enabled := True;
end;

procedure TRegForm.ChangeMessageBoxPosition(var Msg: TMessage);
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
x := RegForm.Left + ((RegForm.Width - w) div 2);
if x < 0 then
x := 0
else if x + w > Screen.Width then x := Screen.Width - w;
y := RegForm.Top + ((RegForm.Height - h) div 2);
if y < 0 then y := 0
else if y + h > Screen.Height then y := Screen.Height - h;
SetWindowPos(MBHWnd, 0, x, y, 0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;
end;

procedure TRegForm.FormShow(Sender: TObject);
var
r:TRegistry;
begin
r:=TRegistry.Create;
r.RootKey:=HKEY_CURRENT_USER;
if r.OpenKeyReadOnly('\SOFTWARE\Notepad SE\RegKey') then begin
if r.ValueExists(RegForm.InputCode.Text) then
RegForm.InputCode.Text:=r.ReadString(RegForm.InputCode.Text);
end;
if SetForm.ch10.Checked then
begin
SetWindowLong(RegForm.Handle, GWL_EXSTYLE,
GetWindowLOng(RegForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
end;

procedure TRegForm.FormDestroy(Sender: TObject);
begin
RegForm.OnActivate := nil;
InputName.Free;
InputCode.Free;
Cancel.Free;
Logo2.Free;
Logo.Free;
ch1.Free;
tx1.Free;
tx2.Free;
tx3.Free;
tx4.Free;
OK.Free;
end;

procedure TRegForm.tx3Click(Sender: TObject);
begin
ShellExecute(Handle, nil, 'http://www.gnu.org/', nil,nil, Sw_ShowNormal);
end;

procedure TRegForm.InputCodeKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
begin
RegForm.Close;
end;
if Key = vk_Return then
begin
OK.OnClick(Self);
end;
end;

procedure TRegForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
InputCode.SetFocus;
end;

procedure TRegForm.tx5Click(Sender: TObject);
begin
ShellExecute(Handle, 'open',
'mailto:GoodWinNix@mail.ru?Subject=Notepad SE Project' +
'&Body=Hello, please send me the source code program. Thanks!',
'', '', SW_SHOW);
end;

procedure TRegForm.CMMouseLeave(var msg: TMessage);
begin
tx3.ForegroundColor := $00FF8000;
tx4.ForegroundColor := $00FF8000;
tx5.ForegroundColor := $00FF8000;
tx3.Font.Style := [];
tx4.Font.Style := [];
tx5.Font.Style := [];
end;

procedure TRegForm.tx5MouseLeave(Sender: TObject);
begin
tx5.ForegroundColor := $00FF8000;
tx5.Font.Style := [];
end;

procedure TRegForm.tx5MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx3.Font.Style := [];
tx4.Font.Style := [];
tx5.ForegroundColor := $00FF8000;
end;

procedure TRegForm.tx5MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx5.ForegroundColor := clRed;
tx5.Font.Style := [fsUnderline];
end;

procedure TRegForm.tx3MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx3.ForegroundColor := clRed;
tx3.Font.Style := [fsUnderline];
end;

procedure TRegForm.tx4MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx4.ForegroundColor := clRed;
tx4.Font.Style := [fsUnderline];
end;

procedure TRegForm.tx4MouseLeave(Sender: TObject);
begin
tx4.ForegroundColor := $00FF8000;
tx4.Font.Style := [];
end;

procedure TRegForm.tx4MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx4.ForegroundColor := $00FF8000;
tx4.Font.Style := [];
end;

procedure TRegForm.tx3MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx3.ForegroundColor := $00FF8000;
tx3.Font.Style := [];
end;

procedure TRegForm.tx3MouseLeave(Sender: TObject);
begin
tx3.ForegroundColor := $00FF8000;
tx3.Font.Style := [];
end;

procedure TRegForm.ch1Click(Sender: TObject);
begin
if ch1.Checked then
begin
InputCode.PasswordChar := #0;
end else
begin
InputCode.PasswordChar := '*';
end;
end;

procedure TRegForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

end.
