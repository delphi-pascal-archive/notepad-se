unit SP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, XPCheckBox, XPGroupBox, StdCtrls, Spin,
  RtColorPicker, XPLabel, XPButton, Registry, LbSpeedButton, ShellApi,
  IniFiles, XPEdit, ActiveX, ComObj, ShlObj, jpeg, Buttons, ComCtrls,
  ImgList, rmBaseEdit, rmBtnEdit;

  type
   TTabSheet = class(ComCtrls.TTabSheet);

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
   TSetForm = class(TForm)
    OK: TXPButton;
    PageTab: TPageControl;
    tab1: TTabSheet;
    tab2: TTabSheet;
    tab3: TTabSheet;
    tx1: TXPLabel;
    TextName: TXPEdit;
    tab4: TTabSheet;
    tab5: TTabSheet;
    ch5: TXPCheckBox;
    ch3: TXPCheckBox;
    ch4: TXPCheckBox;
    Ch11: TXPCheckBox;
    ch15: TXPCheckBox;
    ch10: TXPCheckBox;
    tab6: TTabSheet;
    ch1: TXPCheckBox;
    ch12: TXPCheckBox;
    ShortcutNameText: TXPEdit;
    fr1: TXPGroupBox;
    ch14: TXPCheckBox;
    fr2: TXPGroupBox;
    PathToHTMLEditorEd: TrmBtnEdit;
    fr3: TXPGroupBox;
    ch7: TXPCheckBox;
    fr4: TXPGroupBox;
    ch2: TXPCheckBox;
    fr5: TXPGroupBox;
    tx4: TXPLabel;
    tx3: TXPLabel;
    tx2: TXPLabel;
    tx5: TXPLabel;
    tx6: TXPLabel;
    fr6: TXPGroupBox;
    ch13: TXPCheckBox;
    fr7: TXPGroupBox;
    tx7: TXPLabel;
    tx8: TXPLabel;
    tx9: TXPLabel;
    fr8: TXPGroupBox;
    tx10: TXPLabel;
    tx11: TXPLabel;
    tx12: TXPLabel;
    fr11: TXPGroupBox;
    fr9: TXPGroupBox;
    ch8: TXPCheckBox;
    ch9: TXPCheckBox;
    fr10: TXPGroupBox;
    ch19: TXPCheckBox;
    ch18: TXPCheckBox;
    fr12: TXPGroupBox;
    ch17: TXPCheckBox;
    TimeEdit: TSpinEdit;
    tx13: TXPLabel;
    tx14: TXPLabel;
    tx15: TXPLabel;
    tx16: TXPLabel;
    tx17: TXPLabel;
    tx18: TXPLabel;
    logo1: TImage;
    tx19: TXPLabel;
    Cancel: TXPButton;
    procedure OKClick(Sender: TObject);
    procedure ch7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TextNameChange(Sender: TObject);
    procedure tx4Click(Sender: TObject);
    procedure ch17Click(Sender: TObject);
    procedure tx8Click(Sender: TObject);
    procedure tx9Click(Sender: TObject);
    procedure tx7Click(Sender: TObject);
    procedure tx10Click(Sender: TObject);
    procedure tx11Click(Sender: TObject);
    procedure tx12Click(Sender: TObject);
    procedure tx2Click(Sender: TObject);
    procedure tx6Click(Sender: TObject);
    procedure tx5Click(Sender: TObject);
    procedure tx3Click(Sender: TObject);
    procedure PathToHTMLEditorEdBtn1Click(Sender: TObject);
    procedure PathToHTMLEditorEdDblClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    SM: HWND;

    Ini : TIniFile;

    FColor: TColor;

    LinkFile:IPersistFile;

    ShellObject:IUnknown;

    ShellLink:IShellLink;

    FileName,ShortcutPosition:string;

    WShortcutPosition:WideString;

    P:PItemIDList;

    C:array[0..1000] of char;

    procedure WMMoving(var msg: TWMMoving);
    message WM_MOVING;

    procedure ChangeMessageBoxPosition(var Msg: TMessage);
    message AlignCenter;

    procedure SetColor(Value: TColor);

    procedure WMEraseBkGnd(var Msg: TWMEraseBkGnd); 
    message WM_ERASEBKGND;

    constructor Create(aOwner: TComponent); override;
    property Color: TColor read FColor write SetColor;

  public

  end;

var
  SetForm: TSetForm;
  msgCaption: PChar;

implementation

uses NP, CLP;

{$R *.dfm}

procedure TSetForm.OKClick(Sender: TObject);
var
R : TRegistry;
begin
MainForm.T1.Enabled := True;
R := TRegistry.Create;
R.RootKey := HKEY_LOCAL_MACHINE;
R.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', false);
if SetForm.ch2.Checked then
R.WriteString(Application.Title, ParamStr(0)) else
R.DeleteValue(Application.Title);
R.Free;
if ch12.Checked then
begin
R:= TRegistry.Create;
R.RootKey := HKEY_CLASSES_ROOT;
R.OpenKey('*\Shell\Notepad',true);
R.WriteString('','MyPro');
R.WriteString('',ShortcutNameText.Text);
R.CloseKey;
R.OpenKey('*\Shell\Notepad\command',true);
R.WriteString('','command');
R.WriteString('',paramstr(1) + application.ExeName);
R.CloseKey;
R.Free;
end else
if not ch12.Checked then
begin
R:= TRegistry.Create;
R.RootKey := HKEY_CLASSES_ROOT;
R.DeleteKey('*\Shell\Notepad');
R.CloseKey;
R.Free;
end;
if ch1.Checked then
DragAcceptFiles(MainForm.Handle, True) else
DragAcceptFiles(MainForm.Handle, False);
if ch3.Checked then
MainForm.CoolBar.Visible := True else
MainForm.CoolBar.Visible := False;
if ch4.Checked then
begin
MainForm.CoolBar.ShowHint := True;
end else
begin
MainForm.CoolBar.ShowHint := False;
end;
SetForm.Close;
end;

procedure TSetForm.ch7Click(Sender: TObject);
begin
if LangForm.LangBox.ItemIndex  = 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox('Theme changes will take effect when you restart Notepad SE!',
'Apply Theme',
mb_IconExclamation + mb_OK);
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox('Тема вступит в силу, когда Вы перезапустите Notepad SE!',
'Применение Темы',
mb_IconExclamation + mb_OK);
end;
end;

procedure TSetForm.FormShow(Sender: TObject);
var
Reg: TRegistry;
begin
PageTab.ActivePageIndex := 0;
Reg := TRegistry.Create;
with Reg do begin
RootKey := HKEY_CLASSES_ROOT;
if not reg.KeyExists
('\*\Shell\Notepad\Command\')then
ch12.Checked := False else
ch12.Checked := True;
end;
Reg:=TRegistry.Create;
Reg.RootKey:=HKEY_LOCAL_MACHINE;
Reg.OpenKeyReadOnly('\SOFTWARE\Microsoft\Internet Explorer\View Source Editor\Editor Name');
PathToHTMLEditorEd.Text := Reg.ReadString('');
TextName.Height := 19;
if ch10.Checked then
begin
SetWindowLong(SetForm.Handle, GWL_EXSTYLE,
GetWindowLOng(SetForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
if Length(TextName.Text) = 0 then
begin
tx2.Enabled := False;
tx3.Enabled := False;
tx4.Enabled := False;
tx5.Enabled := False;
tx6.Enabled := False;
end else
begin
tx2.Enabled := True;
tx3.Enabled := True;
tx4.Enabled := True;
tx5.Enabled := True;
tx6.Enabled := True;
end;
end;

procedure TSetForm.FormCreate(Sender: TObject);
begin
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
ch1.Checked := Ini.ReadBool('Parameters', 'Use of "Drag and Drop"', ch1.Checked);
ch2.Checked := Ini.ReadBool('Parameters', 'Run with Windows OS Startup', ch2.Checked);
ch3.Checked := Ini.ReadBool('Parameters', 'Tool Bar', ch3.Checked);
ch4.Checked := Ini.ReadBool('Parameters', 'Show Hint on the Tool Bar', ch4.Checked);
ch5.Checked := Ini.ReadBool('Parameters', 'Show Hint in the Status Bar', ch5.Checked);
ch7.Checked := Ini.ReadBool('Parameters', 'Use of XP Menu', ch7.Checked);
ch8.Checked := Ini.ReadBool('Full Screen', 'Hide Tool Bar on Full Screen', ch8.Checked);
ch9.Checked := Ini.ReadBool('Full Screen', 'Hide Status Bar on Full Screen', ch9.Checked);
ch10.Checked := Ini.ReadBool('Parameters', 'Modal Windows on Task Bar', ch10.Checked);
ch11.Checked := Ini.ReadBool('Parameters', 'Always on Top', ch11.Checked);
ch13.Checked := Ini.ReadBool('Parameters', 'Hide message on creating shortcut', ch13.Checked);
TextName.Text := Ini.ReadString('Parameters', 'Name on creating shortcut', TextName.Text);
ch14.Checked := Ini.ReadBool('Parameters', 'Open last file', ch14.Checked);
ch15.Checked := Ini.ReadBool('Parameters', 'Min to Tray', ch15.Checked);
ch17.Checked := Ini.ReadBool('Parameters', 'Use of autosave', ch17.Checked);
TimeEdit.Value := Ini.ReadInteger('Parameters', 'Time limit autosave', TimeEdit.Value);
ch18.Checked := Ini.ReadBool('Full Screen', 'On file open', ch18.Checked);
ch19.Checked := Ini.ReadBool('Full Screen', 'On start program', ch19.Checked);
except
end;
end;

procedure TSetForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;

procedure TSetForm.WMMoving(var msg: TWMMoving);
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

procedure TSetForm.ChangeMessageBoxPosition(var Msg: TMessage);
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
x := SetForm.Left + ((SetForm.Width - w) div 2);
if x < 0 then
x := 0
else if x + w > Screen.Width then x := Screen.Width - w;
y := SetForm.Top + ((SetForm.Height - h) div 2);
if y < 0 then y := 0
else if y + h > Screen.Height then y := Screen.Height - h;
SetWindowPos(MBHWnd, 0, x, y, 0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;
end;

procedure TSetForm.FormDestroy(Sender: TObject);
begin
SetForm.OnActivate := nil;
PathToHTMLEditorEd.Free;
ShortcutNameText.Free;
TextName.Free;
TimeEdit.Free;
PageTab.Free;
Cancel.Free;
logo1.Free;
fr1.Free;
fr2.Free;
fr3.Free;
fr4.Free;
fr5.Free;
fr6.Free;
fr7.Free;
fr8.Free;
fr9.Free;
fr10.Free;
fr11.Free;
fr12.Free;
ch1.Free;
ch2.Free;
ch3.Free;
ch4.Free;
ch5.Free;
ch7.Free;
ch8.Free;
ch9.Free;
ch10.Free;
ch11.Free;
ch12.Free;
ch13.Free;
ch14.Free;
ch15.Free;
ch17.Free;
ch18.Free;
ch19.Free;
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
tx11.Free;
tx12.Free;
tx13.Free;
tx14.Free;
tx15.Free;
tx16.Free;
tx17.Free;
tx18.Free;
tx19.Free;
Ini.Free;
end;

procedure TSetForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
Cancel.OnClick(Self);
end;

procedure TSetForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Cancel.SetFocus;
end;

procedure TSetForm.TextNameChange(Sender: TObject);
begin
if Length(TextName.Text) = 0 then
begin
tx2.Enabled := False;
tx3.Enabled := False;
tx4.Enabled := False;
tx5.Enabled := False;
tx6.Enabled := False;
end else
begin
tx2.Enabled := True;
tx3.Enabled := True;
tx4.Enabled := True;
tx5.Enabled := True;
tx6.Enabled := True;
end;
end;

procedure TSetForm.tx4Click(Sender: TObject);
begin
ShellObject:=CreateComObject(CLSID_ShellLink);
LinkFile:=ShellObject as IPersistFile;
ShellLink:=ShellObject as IShellLink;
FileName:=ParamStr(0);
ShellLink.SetPath(pchar(FileName));
ShellLink.SetWorkingDirectory(pchar(ExtractFilePath(FileName)));
if SHGetSpecialFolderLocation(Handle,CSIDL_PROGRAMS,P)=NOERROR then begin
SHGetPathFromIDList(P,C);
ShortcutPosition:=StrPas(C);
PostMessage(Handle, WM_USER + 1024, 0, 0);
if not Ch13.Checked then
if LangForm.LangBox.ItemIndex = 0 then
if Application.MessageBox(PChar('Do you want a shortcut "' + TextName.Text + '" to your Programs Menu?'),
'Notepad SE',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if not Ch13.Checked then
if LangForm.LangBox.ItemIndex = 1 then
if Application.MessageBox(PChar('Вы хотите разместить ярлык "' + TextName.Text + '" в Меню Программы?'),
'Notepad SE',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if Ch13.Checked then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
WShortcutPosition:=ShortcutPosition;
LinkFile.Save(PWChar(WShortcutPosition),False);
end;
end;

procedure TSetForm.ch17Click(Sender: TObject);
begin
if TimeEdit.Value <=0 then
begin
MainForm.T3.Enabled := False;
TimeEdit.Enabled := True;
ch17.Checked := False;
if LangForm.LangBox.ItemIndex  = 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox('Incorrect meaning!', 'Notepad SE',
mb_IconAsterisk + mb_OK);
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(
'Недопустимое значение!', 'Notepad SE',
mb_IconAsterisk + mb_OK);
end;
Exit end else
if ch17.Checked then
begin
MainForm.T3.Enabled := True;
TimeEdit.Enabled := False;
end else
begin
MainForm.T3.Enabled := False;
TimeEdit.Enabled := True;
end;
end;

procedure TSetForm.tx8Click(Sender: TObject);
var
R: TRegistry;
begin
R := TRegistry.Create;
R.RootKey := HKEY_CLASSES_ROOT;
R.OpenKey('.ini',true);
R.WriteString('', 'inifile');
R.CloseKey;
R.OpenKey('inifile\DefaultIcon',true);
R.WriteString('', ParamStr(0) + ', 0');
R.CloseKey;
R.OpenKey('inifile\shell\open\command', true);
R.WriteString('', ParamStr(0) + ' "%1"');
R.CloseKey;
R.Free;
end;

procedure TSetForm.tx9Click(Sender: TObject);
var
R: TRegistry;
begin
R := TRegistry.Create;
R.RootKey := HKEY_CLASSES_ROOT;
R.OpenKey('.dat',true);
R.WriteString('', 'datfile');
R.CloseKey;
R.OpenKey('datfile\DefaultIcon',true);
R.WriteString('', ParamStr(0) + ', 0');
R.CloseKey;
R.OpenKey('datfile\shell\open\command', true);
R.WriteString('', ParamStr(0) + ' "%1"');
R.CloseKey;
R.Free;
end;

procedure TSetForm.tx7Click(Sender: TObject);
var
R: TRegistry;
begin
R := TRegistry.Create;
R.RootKey := HKEY_CLASSES_ROOT;
R.OpenKey('.txt',true);
R.WriteString('', 'txtfile');
R.CloseKey;
R.OpenKey('txtfile\DefaultIcon',true);
R.WriteString('', ParamStr(0) + ', 0');
R.CloseKey;
R.OpenKey('txtfile\shell\open\command', true);
R.WriteString('', ParamStr(0) + ' "%1"');
R.CloseKey;
R.Free;
end;

procedure TSetForm.tx10Click(Sender: TObject);
var
R: TRegistry;
begin
r := TRegistry.Create;
r.RootKey := HKEY_CLASSES_ROOT;
r.OpenKey('.txt',true);
r.WriteString('', '!txt');
r.CloseKey;
r.OpenKey('!txt\DefaultIcon',true);
r.WriteString('', 'NOTEPAD.exe' + ', 0');
r.CloseKey;
r.OpenKey('!txt\shell\open\command', true);
r.WriteString('', 'NOTEPAD.exe' + ' "%1"');
r.CloseKey;
r.Free;
end;

procedure TSetForm.tx11Click(Sender: TObject);
var
R: TRegistry;
begin
r := TRegistry.Create;
r.RootKey := HKEY_CLASSES_ROOT;
r.OpenKey('.ini',true);
r.WriteString('', '!ini');
r.CloseKey;
r.OpenKey('!ini\DefaultIcon',true);
r.WriteString('', 'NOTEPAD.exe' + ', 0');
r.CloseKey;
r.OpenKey('!ini\shell\open\command', true);
r.WriteString('', 'NOTEPAD.exe' + ' "%1"');
r.CloseKey;
r.Free;
end;

procedure TSetForm.tx12Click(Sender: TObject);
var
R: TRegistry;
begin
r := TRegistry.Create;
r.RootKey := HKEY_CLASSES_ROOT;
r.OpenKey('.dat',true);
r.WriteString('', '!dat');
r.CloseKey;
r.OpenKey('!dat\DefaultIcon',true);
r.WriteString('', 'NOTEPAD.exe' + ', 0');
r.CloseKey;
r.OpenKey('!dat\shell\open\command', true);
r.WriteString('', 'NOTEPAD.exe' + ' "%1"');
r.CloseKey;
r.Free;
end;

procedure TSetForm.tx2Click(Sender: TObject);
begin
ShellObject:=CreateComObject(CLSID_ShellLink);
LinkFile:=ShellObject as IPersistFile;
ShellLink:=ShellObject as IShellLink;
FileName:=ParamStr(0);
ShellLink.SetPath(pchar(FileName));
ShellLink.SetWorkingDirectory(pchar(ExtractFilePath(FileName)));
if SHGetSpecialFolderLocation(Handle,CSIDL_DESKTOP,P)=NOERROR then begin
SHGetPathFromIDList(P,C);
ShortcutPosition:=StrPas(C);
PostMessage(Handle, WM_USER + 1024, 0, 0);
if not Ch13.Checked then
if LangForm.LangBox.ItemIndex = 0 then
if Application.MessageBox(PChar('Do you want a shortcut "' + TextName.Text + '" to your Desktop?'),
'Notepad SE',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if not Ch13.Checked then
if LangForm.LangBox.ItemIndex = 1 then
if Application.MessageBox(PChar('Вы хотите разместить ярлык "' + TextName.Text + '" на Рабочем Столе?'),
'Notepad SE',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if Ch13.Checked then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
WShortcutPosition:=ShortcutPosition;
LinkFile.Save(PWChar(WShortcutPosition),False);
end;
end;

procedure TSetForm.tx6Click(Sender: TObject);
begin
ShellObject:=CreateComObject(CLSID_ShellLink);
LinkFile:=ShellObject as IPersistFile;
ShellLink:=ShellObject as IShellLink;
FileName:=ParamStr(0);
ShellLink.SetPath(pchar(FileName));
ShellLink.SetWorkingDirectory(pchar(ExtractFilePath(FileName)));
if SHGetSpecialFolderLocation(Handle,CSIDL_FAVORITES,P)=NOERROR then begin
SHGetPathFromIDList(P,C);
ShortcutPosition:=StrPas(C);
PostMessage(Handle, WM_USER + 1024, 0, 0);
if not Ch13.Checked then
if LangForm.LangBox.ItemIndex = 0 then
if Application.MessageBox(PChar('Do you want a shortcut "' + TextName.Text + '" to your Favorites?'),
'Notepad SE',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if not Ch13.Checked then
if LangForm.LangBox.ItemIndex = 1 then
if Application.MessageBox(PChar('Вы хотите разместить ярлык "' + TextName.Text + '" в Избранном?'),
'Notepad SE',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if Ch13.Checked then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
WShortcutPosition:=ShortcutPosition;
LinkFile.Save(PWChar(WShortcutPosition),False);
end;
end;

procedure TSetForm.tx5Click(Sender: TObject);
begin
ShellObject:=CreateComObject(CLSID_ShellLink);
LinkFile:=ShellObject as IPersistFile;
ShellLink:=ShellObject as IShellLink;
FileName:=ParamStr(0);
ShellLink.SetPath(pchar(FileName));
ShellLink.SetWorkingDirectory(pchar(ExtractFilePath(FileName)));
if SHGetSpecialFolderLocation(Handle,CSIDL_STARTUP,P)=NOERROR then begin
SHGetPathFromIDList(P,C);
ShortcutPosition:=StrPas(C);
PostMessage(Handle, WM_USER + 1024, 0, 0);
if not Ch13.Checked then
if LangForm.LangBox.ItemIndex = 0 then
if Application.MessageBox(PChar('Do you want a shortcut "' + TextName.Text + '" to your Startup folder?'),
'Notepad SE',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if not Ch13.Checked then
if LangForm.LangBox.ItemIndex = 1 then
if Application.MessageBox(PChar('Вы хотите разместить ярлык "' + TextName.Text + '" в папке Автозагрузки?'),
'Notepad SE',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if Ch13.Checked then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
WShortcutPosition:=ShortcutPosition;
LinkFile.Save(PWChar(WShortcutPosition),False);
end;
end;

procedure TSetForm.tx3Click(Sender: TObject);
begin
ShellObject:=CreateComObject(CLSID_ShellLink);
LinkFile:=ShellObject as IPersistFile;
ShellLink:=ShellObject as IShellLink;
FileName:=ParamStr(0);
ShellLink.SetPath(pchar(FileName));
ShellLink.SetWorkingDirectory(pchar(ExtractFilePath(FileName)));
if SHGetSpecialFolderLocation(Handle,CSIDL_STARTMENU,P)=NOERROR then begin
SHGetPathFromIDList(P,C);
ShortcutPosition:=StrPas(C);
PostMessage(Handle, WM_USER + 1024, 0, 0);
if not Ch13.Checked then
if LangForm.LangBox.ItemIndex = 0 then
if Application.MessageBox(PChar('Do you want a shortcut "' + TextName.Text + '" to your Start Menu?'),
'Notepad SE',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if not Ch13.Checked then
if LangForm.LangBox.ItemIndex = 1 then
if Application.MessageBox(PChar('Вы хотите разместить ярлык "' + TextName.Text + '" в Главном Меню?'),
'Notepad SE',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if Ch13.Checked then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
WShortcutPosition:=ShortcutPosition;
LinkFile.Save(PWChar(WShortcutPosition),False);
end;
end;

procedure TSetForm.PathToHTMLEditorEdBtn1Click(Sender: TObject);
var
s: String;
Reg: TRegistry;
begin
if LangForm.LangBox.ItemIndex = 0 then
begin
if OpenSaveFileDialog(SetForm.Handle,
'*.exe', 'Executable files (*.exe)|*.exe; |All files (*.*)|*.*', ParamStr(1),
'Notepad SE', s, True) then
begin
PathToHTMLEditorEd.Text := s;
Reg := TRegistry.Create;
with Reg do
begin
RootKey:=HKEY_LOCAL_MACHINE;
if OpenKey('\Software\Microsoft\Internet Explorer\View Source Editor\Editor Name', True) then
begin
WriteString('', PathToHTMLEditorEd.Text);
CloseKey;
Free;
end;
end;
end;
end;

if LangForm.LangBox.ItemIndex = 1 then
begin
if OpenSaveFileDialog(SetForm.Handle,
'*.exe', 'Программы (*.exe)|*.exe; |Все файлы (*.*)|*.*', ParamStr(1),
'Notepad SE', s, True) then
begin
PathToHTMLEditorEd.Text := s;
Reg := TRegistry.Create;
with Reg do
begin
RootKey:=HKEY_LOCAL_MACHINE;
if OpenKey('\Software\Microsoft\Internet Explorer\View Source Editor\Editor Name', True) then
begin
WriteString('', PathToHTMLEditorEd.Text);
CloseKey;
Free;
end;
end;
end;
end;
end;

constructor TSetForm.Create(aOwner: TComponent);
begin
inherited;
FColor := $00FFE7CE;
end;

procedure TSetForm.SetColor(Value: TColor);
begin
if FColor = Value then
begin
FColor := Value;
Invalidate;
end;
end;

procedure TSetForm.WMEraseBkGnd(var Msg: TWMEraseBkGnd);
begin
if FColor = clBtnFace then
inherited else
begin
Brush.Color := FColor;
Windows.FillRect(Msg.dc, ClientRect, Brush.Handle);
Msg.Result := 1;
end;
end;

procedure TSetForm.PathToHTMLEditorEdDblClick(Sender: TObject);
begin
if LangForm.LangBox.ItemIndex  = 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(PChar('System Registry Path Key: ' + #13 + #13 +
'HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\View Source Editor\Editor Name\'),
'Notepad SE',
mb_IconAsterisk + mb_OK);
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(PChar('Путь к ключу в системном реестре: ' + #13 + #13 +
'HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\View Source Editor\Editor Name\'),
'Notepad SE',
mb_IconAsterisk + mb_OK);
end;
end;

procedure TSetForm.CancelClick(Sender: TObject);
begin
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
ch1.Checked := Ini.ReadBool('Parameters', 'Use of "Drag and Drop"', ch1.Checked);
ch2.Checked := Ini.ReadBool('Parameters', 'Run with Windows OS Startup', ch2.Checked);
ch3.Checked := Ini.ReadBool('Parameters', 'Tool Bar', ch3.Checked);
ch4.Checked := Ini.ReadBool('Parameters', 'Show Hint on the Tool Bar', ch4.Checked);
ch5.Checked := Ini.ReadBool('Parameters', 'Show Hint in the Status Bar', ch5.Checked);
ch7.Checked := Ini.ReadBool('Parameters', 'Use of XP Menu', ch7.Checked);
ch8.Checked := Ini.ReadBool('Full Screen', 'Hide Tool Bar on Full Screen', ch8.Checked);
ch9.Checked := Ini.ReadBool('Full Screen', 'Hide Status Bar on Full Screen', ch9.Checked);
ch10.Checked := Ini.ReadBool('Parameters', 'Modal Windows on Task Bar', ch10.Checked);
ch11.Checked := Ini.ReadBool('Parameters', 'Always on Top', ch11.Checked);
ch13.Checked := Ini.ReadBool('Parameters', 'Hide message on creating shortcut', ch13.Checked);
TextName.Text := Ini.ReadString('Parameters', 'Name on creating shortcut', TextName.Text);
ch14.Checked := Ini.ReadBool('Parameters', 'Open last file', ch14.Checked);
ch15.Checked := Ini.ReadBool('Parameters', 'Min to Tray', ch15.Checked);
ch17.Checked := Ini.ReadBool('Parameters', 'Use of autosave', ch17.Checked);
TimeEdit.Value := Ini.ReadInteger('Parameters', 'Time limit autosave', TimeEdit.Value);
ch18.Checked := Ini.ReadBool('Full Screen', 'On file open', ch18.Checked);
ch19.Checked := Ini.ReadBool('Full Screen', 'On start program', ch19.Checked);
except
end;
end;

procedure TSetForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

end.

