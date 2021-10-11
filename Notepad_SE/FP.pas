unit FP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, XPButton, StdCtrls, Spin, XPLabel, XPGroupBox,
  RtColorPicker, ExtCtrls, XPCheckBox, IniFiles, ComCtrls, XPPanel,
  Buttons;

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
  TFontForm = class(TForm)
    Cancel: TXPButton;
    OK: TXPButton;
    fr1: TXPGroupBox;
    txt1: TXPLabel;
    txt2: TXPLabel;
    FontsBox: TComboBox;
    fr2: TXPGroupBox;
    ColorBox: TColorBox;
    txt3: TXPLabel;
    txt4: TXPLabel;
    ch3: TRadioButton;
    ch4: TRadioButton;
    ch5: TRadioButton;
    fr3: TPanel;
    OnPreviewButton: TSpeedButton;
    ch1: TXPCheckBox;
    ch2: TXPCheckBox;
    SizeBox: TSpinEdit;
    TextEdit: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure txt4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FontsBoxChange(Sender: TObject);
    procedure OnPreviewButtonClick(Sender: TObject);
    procedure ColorBoxChange(Sender: TObject);
    procedure ch3Click(Sender: TObject);
    procedure ch4Click(Sender: TObject);
    procedure ch5Click(Sender: TObject);
    procedure ch1Click(Sender: TObject);
    procedure ch2Click(Sender: TObject);
    procedure FontsBoxKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure ColorBoxKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure SizeBoxChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ColorBoxCloseUp(Sender: TObject);
    procedure FontsBoxCloseUp(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    SM: HWND;

    Ini: TIniFile;

    procedure WMMoving(var msg: TWMMoving);
    message WM_MOVING;

    procedure ChangeMessageBoxPosition(var Msg: TMessage);
    message AlignCenter;

  public
  
  end;

var
  FontForm: TFontForm;
  msgCaption: PChar;

implementation

uses SP, NP, CLP;

{$R *.dfm}

procedure TFontForm.FormCreate(Sender: TObject);
begin
FontsBox.Items := Screen.Fonts;
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
ColorBox.Selected := Ini.ReadInteger('Fonts settings', 'Color', ColorBox.Selected);
SizeBox.Value := Ini.ReadInteger('Fonts settings', 'Size', SizeBox.Value);
ch1.Checked := Ini.ReadBool('Fonts settings', 'Underline', ch1.Checked);
ch2.Checked := Ini.ReadBool('Fonts settings', 'Strikeout', ch2.Checked);
ch3.Checked := Ini.ReadBool('Fonts settings', 'Bold', ch3.Checked);
ch4.Checked := Ini.ReadBool('Fonts settings', 'Italic', ch4.Checked);
ch5.Checked := Ini.ReadBool('Fonts settings', 'Def', ch5.Checked);
OnPreviewButton.Down := Ini.ReadBool('On preview', 'Open', OnPreviewButton.Down);
except
end;
end;

procedure TFontForm.OKClick(Sender: TObject);
begin
if ch1.Checked then
begin
if not ch2.Checked then
MainForm.TextEdit.Font.Style := [fsUnderline];
end;
if ch2.Checked then
begin
if not ch1.Checked then
MainForm.TextEdit.Font.Style := [fsStrikeout];
end;
if ch1.Checked then
if ch2.Checked then
MainForm.TextEdit.Font.Style := [fsUnderline, fsStrikeout];
if not ch1.Checked then
if not ch2.Checked then
MainForm.TextEdit.Font.Style := [];
begin
if Ch3.Checked then
begin
if Ch1.Checked then
MainForm.TextEdit.Font.Style := [fsUnderline, fsBold];
if Ch2.Checked then
MainForm.TextEdit.Font.Style := [fsStrikeOut, fsBold];
if Ch1.Checked then
if Ch2.Checked then
MainForm.TextEdit.Font.Style := [fsUnderline, fsStrikeOut, fsBold];
if not Ch1.Checked then
if not Ch2.Checked then
MainForm.TextEdit.Font.Style := [fsBold];
end;
begin
if Ch4.Checked then
begin
if Ch1.Checked then
MainForm.TextEdit.Font.Style := [fsUnderline, fsItalic];
if Ch2.Checked then
MainForm.TextEdit.Font.Style := [fsStrikeOut, fsItalic];
if Ch1.Checked then
if Ch2.Checked then
MainForm.TextEdit.Font.Style := [fsUnderline, fsStrikeOut, fsItalic];
if not Ch1.Checked then
if not Ch2.Checked then
MainForm.TextEdit.Font.Style := [fsItalic];
end;
end;
end;
begin
if Ch5.Checked then
begin
if Ch1.Checked then
MainForm.TextEdit.Font.Style := [fsUnderline];
if Ch2.Checked then
MainForm.TextEdit.Font.Style := [fsStrikeOut];
if Ch1.Checked then
if Ch2.Checked then
MainForm.TextEdit.Font.Style := [fsUnderline, fsStrikeOut];
if not Ch1.Checked then
if not Ch2.Checked then
MainForm.TextEdit.Font.Style := [];
end;
end;
MainForm.TextEdit.Font.Name := FontForm.FontsBox.Text;
MainForm.FontsBox.Text := FontsBox.Text;
MainForm.TextEdit.Font.Size := FontForm.SizeBox.Value;
MainForm.SizeBox.Value := SizeBox.Value;
MainForm.TextEdit.Font.Color := ColorBox.Selected;
MainForm.ColorBox.Selected := ColorBox.Selected;
MainForm.TextEdit.Refresh;
FontForm.Close;
end;

procedure TFontForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;

procedure TFontForm.FormDestroy(Sender: TObject);
begin
FontForm.OnActivate := nil;
OnPreviewButton.Free;
TextEdit.Free;
ColorBox.Free;
FontsBox.Free;
SizeBox.Free;
Cancel.Free;
txt1.Free;
txt2.Free;
txt3.Free;
txt4.Free;
fr1.Free;
fr2.Free;
fr3.Free;
ch1.Free;
ch2.Free;
ch3.Free;
ch4.Free;
Ini.Free;
OK.Free;
end;

procedure TFontForm.FormShow(Sender: TObject);
begin
if MainForm.TextEdit.Font.Style = [fsUnderline, fsStrikeOut] then
begin
ch1.Checked := True;
ch2.Checked := True;
end;
if MainForm.TextEdit.Font.Style = [fsUnderline] then
FontForm.ch1.Checked := True;
if MainForm.TextEdit.Font.Style = [fsStrikeOut] then
FontForm.ch2.Checked := True;
if MainForm.TextEdit.Font.Style = [fsBold] then
FontForm.ch3.Checked := True;
if MainForm.TextEdit.Font.Style = [fsItalic] then
FontForm.ch4.Checked := True;
if MainForm.TextEdit.Font.Style = [] then
FontForm.ch5.Checked := True;
if OnPreviewButton.Down = True then
FontForm.ClientWidth := 241;
if OnPreviewButton.Down = False then
FontForm.ClientWidth := 530;
ColorBox.Selected := MainForm.TextEdit.Font.Color;
TextEdit.Color := MainForm.TextEdit.Color;
TextEdit.Font.Color := MainForm.TextEdit.Font.Color;
FontsBox.Text := MainForm.TextEdit.Font.Name;
TextEdit.Font.Name := MainForm.TextEdit.Font.Name;
SizeBox.Value := MainForm.TextEdit.Font.Size;
TextEdit.Font.Size := MainForm.TextEdit.Font.Size;
if MainForm.TextEdit.Text = '' then
TextEdit.Text := 'Notepad SE' else
TextEdit.Text := MainForm.TextEdit.Text;
end;

procedure TFontForm.txt4Click(Sender: TObject);
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if LangForm.LangBox.ItemIndex  = 0 then
begin
if Application.MessageBox('Restore all settings fonts by default?',
'Notepad SE',
mb_IconQuestion + mb_YesNo) = idYes then
begin
FontsBox.Text := 'Tahoma';
SizeBox.Value := 10;
ch1.Checked := False;
ch2.Checked := False;
ch3.Checked := False;
ch4.Checked := False;
ch5.Checked := True;
ColorBox.Selected := clBlack;
TextEdit.Font.Name := 'Tahoma';
TextEdit.Font.Size := 10;
TextEdit.Font.Color := clBlack;
TextEdit.Font.Style := [];
end;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
if Application.MessageBox('Восстановить все настройки шрифта по умолчанию?',
'Notepad SE',
mb_IconQuestion + mb_YesNo) = idYes then
begin
FontsBox.Text := 'Tahoma';
SizeBox.Value := 10;
ch1.Checked := False;
ch2.Checked := False;
ch3.Checked := False;
ch4.Checked := False;
ch5.Checked := True;
ColorBox.Selected := clBlack;
TextEdit.Font.Name := 'Tahoma';
TextEdit.Font.Size := 10;
TextEdit.Font.Color := clBlack;
TextEdit.Font.Style := [];
end;
end;
end;

procedure TFontForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
FontForm.Close;
end;

procedure TFontForm.WMMoving(var msg: TWMMoving);
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

procedure TFontForm.FontsBoxChange(Sender: TObject);
begin
TextEdit.Font.Name := FontsBox.Text;
end;

procedure TFontForm.OnPreviewButtonClick(Sender: TObject);
begin
if OnPreviewButton.Down = True then
FontForm.ClientWidth := 241;
if OnPreviewButton.Down = False then
FontForm.ClientWidth := 530;
end;

procedure TFontForm.ColorBoxChange(Sender: TObject);
begin
TextEdit.Font.Color := ColorBox.Selected;
end;

procedure TFontForm.ChangeMessageBoxPosition(var Msg: TMessage);
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
x := FontForm.Left + ((FontForm.Width - w) div 2);
if x < 0 then
x := 0
else if x + w > Screen.Width then x := Screen.Width - w;
y := FontForm.Top + ((FontForm.Height - h) div 2);
if y < 0 then y := 0
else if y + h > Screen.Height then y := Screen.Height - h;
SetWindowPos(MBHWnd, 0, x, y, 0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;
end;

procedure TFontForm.ch3Click(Sender: TObject);
begin
if Ch3.Checked then
begin
if Ch1.Checked then
TextEdit.Font.Style := [fsUnderline, fsBold];
if Ch2.Checked then
TextEdit.Font.Style := [fsStrikeOut, fsBold];
if Ch1.Checked then
if Ch2.Checked then
TextEdit.Font.Style := [fsUnderline, fsStrikeOut, fsBold];
if not Ch1.Checked then
if not Ch2.Checked then
TextEdit.Font.Style := [fsBold];
end;
TextEdit.SetFocus;
end;

procedure TFontForm.ch4Click(Sender: TObject);
begin
if Ch4.Checked then
begin
if Ch1.Checked then
TextEdit.Font.Style := [fsUnderline, fsItalic];
if Ch2.Checked then
TextEdit.Font.Style := [fsStrikeOut, fsItalic];
if Ch1.Checked then
if Ch2.Checked then
TextEdit.Font.Style := [fsUnderline, fsStrikeOut, fsItalic];
if not Ch1.Checked then
if not Ch2.Checked then
TextEdit.Font.Style := [fsItalic];
end;
TextEdit.SetFocus;
end;

procedure TFontForm.ch5Click(Sender: TObject);
begin
if Ch5.Checked then
begin
if Ch1.Checked then
TextEdit.Font.Style := [fsUnderline];
if Ch2.Checked then
TextEdit.Font.Style := [fsStrikeOut];
if Ch1.Checked then
if Ch2.Checked then
TextEdit.Font.Style := [fsUnderline, fsStrikeOut];
if not Ch1.Checked then
if not Ch2.Checked then
TextEdit.Font.Style := [];
end;
TextEdit.SetFocus;
end;

procedure TFontForm.ch1Click(Sender: TObject);
begin
if Ch1.Checked then
begin
if Ch1.Checked then
TextEdit.Font.Style := [fsUnderline];
if Ch2.Checked then
TextEdit.Font.Style := [fsStrikeOut];
if Ch1.Checked then
if Ch2.Checked then
TextEdit.Font.Style := [fsUnderline, fsStrikeOut];
end;
if not Ch2.Checked then
if  Ch1.Checked then
TextEdit.Font.Style := [fsUnderline];
if not Ch1.Checked then
if  Ch2.Checked then
TextEdit.Font.Style := [fsStrikeOut];
if not Ch1.Checked then
if not Ch2.Checked then
TextEdit.Font.Style := [];
ch3.OnClick(Self);
ch4.OnClick(Self);
ch5.OnClick(Self);
TextEdit.SetFocus;
end;

procedure TFontForm.ch2Click(Sender: TObject);
begin
if Ch2.Checked then
begin
if Ch2.Checked then
TextEdit.Font.Style := [fsStrikeOut];
if Ch1.Checked then
TextEdit.Font.Style := [fsUnderline];
if Ch1.Checked then
if Ch2.Checked then
TextEdit.Font.Style := [fsUnderline, fsStrikeOut];
end;
if not Ch1.Checked then
if Ch2.Checked then
TextEdit.Font.Style := [fsStrikeOut];
if not Ch2.Checked then
if Ch1.Checked then
TextEdit.Font.Style := [fsUnderline];
if not Ch1.Checked then
if not Ch2.Checked then
TextEdit.Font.Style := [];
ch3.OnClick(Self);
ch4.OnClick(Self);
ch5.OnClick(Self);
TextEdit.SetFocus;
end;

procedure TFontForm.FontsBoxKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
case Key of
vk_Next: FontsBox.DroppedDown := True;
vk_Prior: FontsBox.DroppedDown := False;
end;
if Key = vk_Escape then
FontForm.Close;
end;

procedure TFontForm.ColorBoxKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
case Key of
vk_Next: ColorBox.DroppedDown := True;
vk_Prior: ColorBox.DroppedDown := False;
end;
if Key = vk_Escape then
FontForm.Close;
end;

procedure TFontForm.SizeBoxChange(Sender: TObject);
begin
TextEdit.Font.Size := SizeBox.Value;
TextEdit.SetFocus;
end;

procedure TFontForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
TextEdit.SetFocus;
end;

procedure TFontForm.ColorBoxCloseUp(Sender: TObject);
begin
TextEdit.SetFocus;
end;

procedure TFontForm.FontsBoxCloseUp(Sender: TObject);
begin
TextEdit.SetFocus;
end;

procedure TFontForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

end.
