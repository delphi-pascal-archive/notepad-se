unit AP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, XPLabel, ExtCtrls, XPButton, XPGroupBox, StdCtrls,
  ComCtrls, ShellApi, jpeg, Animate, GIFCtrl;

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
  TAboutForm = class(TForm)
    tx1: TXPLabel;
    tx3: TXPLabel;
    tx4: TXPLabel;
    tx5: TXPLabel;
    tx6: TXPLabel;
    tx7: TXPLabel;
    tx8: TXPLabel;
    Cancel: TXPButton;
    License: TRichEdit;
    Logo: TImage;
    tx2: TXPLabel;
    spr1: TBevel;
    spr3: TBevel;
    spr2: TBevel;
    tx10: TXPLabel;
    spr4: TBevel;
    tx9: TXPLabel;
    RxGIFAnimator1: TRxGIFAnimator;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure tx7MouseLeave(Sender: TObject);
    procedure tx7MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure tx7MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure tx7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LogoClick(Sender: TObject);
    procedure tx2Click(Sender: TObject);
    procedure tx2MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure tx2MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure tx2MouseLeave(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tx9Click(Sender: TObject);
    procedure tx9MouseLeave(Sender: TObject);
    procedure tx9MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure tx9MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure FormActivate(Sender: TObject);

  private

    SM: HWND;

    procedure CMMouseLeave(var msg: TMessage);
    message CM_MOUSELEAVE;

    procedure WMMoving(var msg: TWMMoving);
    message WM_MOVING;

    procedure ChangeMessageBoxPosition(var Msg: TMessage);
    message AlignCenter;

  public

  end;

var
  AboutForm: TAboutForm;

  msgCaption: PChar;

implementation

uses SP, CLP;

{$R *.dfm}

procedure TAboutForm.CMMouseLeave(var msg: TMessage);
begin
tx7.ForegroundColor := $00FF8000;
tx2.ForegroundColor := $00FF8000;
end;

procedure TAboutForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
AboutForm.Close;
end;

procedure TAboutForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;

procedure TAboutForm.tx7MouseLeave(Sender: TObject);
begin
tx7.ForegroundColor := $00FF8000;
end;

procedure TAboutForm.tx7MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx7.ForegroundColor := $00FF8000;
end;

procedure TAboutForm.tx7MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx7.ForegroundColor := clRed;
end;

procedure TAboutForm.tx7Click(Sender: TObject);
begin
ShellExecute(Handle,'open',
'mailto:GoodWinNix@mail.ru?Subject=Notepad SE Project'+
'',
'','',SW_SHOW);
end;

procedure TAboutForm.FormShow(Sender: TObject);
begin
if SetForm.ch10.Checked then
begin
SetWindowLong(AboutForm.Handle, GWL_EXSTYLE,
GetWindowLOng(AboutForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
end;

procedure TAboutForm.WMMoving(var msg: TWMMoving);
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

procedure TAboutForm.FormDestroy(Sender: TObject);
begin
AboutForm.OnActivate := nil;
License.Free;
Cancel.Free;
Logo.Free;
spr1.Free;
spr2.Free;
spr3.Free;
spr4.Free;
tx1.Free;
tx2.Free;
tx3.Free;
tx4.Free;
tx5.Free;
tx6.Free;
tx7.Free;
tx8.Free;
tx9.Free;
tx10.Free;
end;

procedure TAboutForm.LogoClick(Sender: TObject);
begin
if LangForm.LangBox.ItemIndex  = 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox('You have the right to distribute and use Notepad SE in any' +
#13 + 'purposes under condition of integrity of the original' + #13 + 'distribution kit.',
'Notepad SE',
mb_IconAsterisk + mb_OK);
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox('Вы имеете право распространять и использовать Notepad SE' +
#13 + 'в любых целях при условии целостности оригинального' + #13 + 'дистрибутива.',
'Notepad SE',
mb_IconAsterisk + mb_OK);
end;
end;

procedure TAboutForm.ChangeMessageBoxPosition(var Msg: TMessage);
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
x := AboutForm.Left + ((AboutForm.Width - w) div 2);
if x < 0 then
x := 0
else if x + w > Screen.Width then x := Screen.Width - w;
y := AboutForm.Top + ((AboutForm.Height - h) div 2);
if y < 0 then y := 0
else if y + h > Screen.Height then y := Screen.Height - h;
SetWindowPos(MBHWnd, 0, x, y, 0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;
end;

procedure TAboutForm.tx2Click(Sender: TObject);
begin
ShellExecute(Handle, nil, 'http://www.viacoding.mylivepage.ru/', nil,nil, Sw_ShowNormal);
end;

procedure TAboutForm.tx2MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx2.ForegroundColor := clRed;
end;

procedure TAboutForm.tx2MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx2.ForegroundColor := $00FF8000;
end;

procedure TAboutForm.tx2MouseLeave(Sender: TObject);
begin
tx2.ForegroundColor := $00FF8000;
end;

procedure TAboutForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Cancel.SetFocus;
end;

procedure TAboutForm.tx9Click(Sender: TObject);
begin
ShellExecute(Handle,'open',
'mailto:viacoding@mail.ru?Subject=Notepad SE Project'+
'',
'','',SW_SHOW);
end;

procedure TAboutForm.tx9MouseLeave(Sender: TObject);
begin
tx9.ForegroundColor := $00FF8000;
end;

procedure TAboutForm.tx9MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx9.ForegroundColor := $00FF8000;
end;

procedure TAboutForm.tx9MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx9.ForegroundColor := clRed;
end;

procedure TAboutForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

end.
