unit LP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, XPButton, StdCtrls, ComCtrls, ExtCtrls, XPCheckBox,
  IniFiles;

  type
   TWmMoving = record
   Msg: Cardinal;
   fwSide: Cardinal;
   lpRect: PRect;
   Result: Integer;
  end;

  type
   TLicForm = class(TForm)
    fr1: TPanel;
    ReadMe: TRichEdit;
    PrintText: TXPButton;
    Cancel: TXPButton;
    PrintDlg: TPrintDialog;
    ch1: TXPCheckBox;
    procedure PrintTextClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    SM: HWND;

    Ini: TIniFile;

    procedure WMMoving(var msg: TWMMoving);
    message WM_MOVING;

  public

  end;

var
  LicForm: TLicForm;

implementation

uses SP;

{$R *.dfm}

procedure TLicForm.PrintTextClick(Sender: TObject);
var
FFileName: String;
begin
if PrintDlg.Execute then
ReadMe.Print(FFileName);
end;

procedure TLicForm.CancelClick(Sender: TObject);
begin
LicForm.Close;
end;

procedure TLicForm.FormShow(Sender: TObject);
begin
if SetForm.ch10.Checked then
begin
SetWindowLong(LicForm.Handle, GWL_EXSTYLE,
GetWindowLOng(LicForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
end;

procedure TLicForm.FormDestroy(Sender: TObject);
begin
LicForm.OnActivate := nil;
PrintText.Free;
PrintDlg.Free;
Cancel.Free;
ReadMe.Free;
ch1.Free;
fr1.Free;
end;

procedure TLicForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;

procedure TLicForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
LicForm.Close;
end;

procedure TLicForm.WMMoving(var msg: TWMMoving);
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

procedure TLicForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ReadMe.SetFocus;
end;

procedure TLicForm.FormCreate(Sender: TObject);
begin
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
ch1.Checked := Ini.ReadBool('License on start', 'Show', ch1.Checked);
except
end;
end;

procedure TLicForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

end.
