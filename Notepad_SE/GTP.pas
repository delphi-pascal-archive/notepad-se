unit GTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Spin, XPButton, XPLabel, DdhNumEd;
  
  type
   TWmMoving = record
   Msg: Cardinal;
   fwSide: Cardinal;
   lpRect: PRect;
   Result: Integer;
  end;

type
  TGoToForm = class(TForm)
    txt1: TXPLabel;
    Cancel: TXPButton;
    OK: TXPButton;
    NumberEdit: TDdhNumEdit;
    procedure OKClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NumberEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    
  private

    SM: HWND;

    procedure WMMoving(var msg: TWMMoving);
    message WM_MOVING;

  public
  
  end;

var
  GoToForm: TGoToForm;

implementation

uses NP, SP;

{$R *.dfm}

procedure TGoToForm.OKClick(Sender: TObject);
begin
GoToForm.Close;
with MainForm.TextEdit do
begin
selstart := perform(EM_LINEINDEX, NumberEdit.Value, 0);
perform(EM_SCROLLCARET, 0, 0);
end;
end;

procedure TGoToForm.CancelClick(Sender: TObject);
begin
GoToForm.Close;
end;

procedure TGoToForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
GoToForm.Close;
end;

procedure TGoToForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;

procedure TGoToForm.FormShow(Sender: TObject);
begin
if SetForm.ch10.Checked then
begin
SetWindowLong(GoToForm.Handle, GWL_EXSTYLE,
GetWindowLOng(GoToForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
end;

procedure TGoToForm.WMMoving(var msg: TWMMoving);
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
inherited;
end;

procedure TGoToForm.FormDestroy(Sender: TObject);
begin
GoToForm.OnActivate := nil;
NumberEdit.Free;
Cancel.Free;
txt1.Free;
OK.Free;
end;

procedure TGoToForm.NumberEditKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
begin
GoToForm.Close;
end;
if Key = vk_Return then
begin
GoToForm.Close;
with MainForm.TextEdit do
begin
selstart := perform(EM_LINEINDEX, NumberEdit.Value, 0);
Perform(EM_SCROLLCARET, 0, 0);
end;
end;
end;

procedure TGoToForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
NumberEdit.SetFocus;
end;

procedure TGoToForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

end.
