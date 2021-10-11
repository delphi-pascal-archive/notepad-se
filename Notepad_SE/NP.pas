unit NP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, XPMenu, XpMan, StdCtrls, StdActns, ActnList, AppEvnts,
  ShellApi, IniFiles, Printers, ImgList, ToolWin, Registry, CommDlg, Spin,
  StrUtils, ShlObj, ClipBrd, RichEdit, ExtActns, ComObj, ActiveX, ComCtrls,
  ExtCtrls, XPButton, rmBaseEdit, rmBtnEdit, rmComboBox, LbSpeedButton;

  function OpenSaveFileDialog(ParentHandle: THandle; const DefExt, Filter, InitialDir,
  Title: string; var FileName: string; IsOpenDialog: Boolean): Boolean;

  const
   Tray        = Wm_User + 1;
   Cherta      = Wm_User + 2;
   About       = Wm_User + 3;
   AlignCenter = Wm_User + 1024;

 type
   TMainForm = class(TForm)
    MainMenu: TMainMenu;
    FileItem: TMenuItem;
    CreateItem: TMenuItem;
    OpenItem: TMenuItem;
    SaveItem: TMenuItem;
    SaveAsItem: TMenuItem;
    sp19: TMenuItem;
    PageSetupItem: TMenuItem;
    PrintItem: TMenuItem;
    ExitItem: TMenuItem;
    sp20: TMenuItem;
    EditItem: TMenuItem;
    CopyItem: TMenuItem;
    CutItem: TMenuItem;
    DelItem: TMenuItem;
    PasteItem: TMenuItem;
    SelectAllItem: TMenuItem;
    UndoItem: TMenuItem;
    TimeDateItem: TMenuItem;
    GotoLineItem: TMenuItem;
    FindItem: TMenuItem;
    ReplaceItem: TMenuItem;
    sp25: TMenuItem;
    FormatItem: TMenuItem;
    ViewItem: TMenuItem;
    StatusBarItem: TMenuItem;
    HelpItem: TMenuItem;
    AboutItem: TMenuItem;
    FontItem: TMenuItem;
    WordWrapItem: TMenuItem;
    ActionList: TActionList;
    EditCut: TEditCut;
    EditCopy: TEditCopy;
    EditPaste: TEditPaste;
    EditSelectAll: TEditSelectAll;
    EditUndo: TEditUndo;
    EditDelete: TEditDelete;
    sp26: TMenuItem;
    sp28: TMenuItem;
    ApplicationEvents: TApplicationEvents;
    StatusBar: TStatusBar;
    SysInfoItem: TMenuItem;
    sp51: TMenuItem;
    sp53: TMenuItem;
    PageSetupDlg: TPageSetupDialog;
    PrintDlg: TPrintDialog;
    OpenDlg: TOpenDialog;
    FullScreenItem: TMenuItem;
    CoolBar: TCoolBar;
    ToolBarImages: TImageList;
    SetupItem: TMenuItem;
    sp33: TMenuItem;
    StatisticsItem: TMenuItem;
    NewLinetem: TMenuItem;
    ToolsItem: TMenuItem;
    sp38: TMenuItem;
    sp35: TMenuItem;
    BigTextItem: TMenuItem;
    SmallTextItem: TMenuItem;
    sp36: TMenuItem;
    ScrollDownItem: TMenuItem;
    ScrollUpItem: TMenuItem;
    sp37: TMenuItem;
    DontSaveItem: TMenuItem;
    sp34: TMenuItem;
    ContextMenuItem: TMenuItem;
    sp27: TMenuItem;
    ClearAllItem: TMenuItem;
    SymTableItem: TMenuItem;
    KeyBrdItem: TMenuItem;
    sp48: TMenuItem;
    NewWinItem: TMenuItem;
    sp21: TMenuItem;
    sp18: TMenuItem;
    sp22: TMenuItem;
    sp13: TMenuItem;
    ToolBar: TToolBar;
    NewButton: TToolButton;
    OpenButton: TToolButton;
    SaveButton: TToolButton;
    PrintButton: TToolButton;
    UndoButton: TToolButton;
    CutButton: TToolButton;
    CopyButton: TToolButton;
    PasteButton: TToolButton;
    DelButton: TToolButton;
    FindButton: TToolButton;
    ReplaceButton: TToolButton;
    OptionsButton: TToolButton;
    SendButton: TToolButton;
    AboutButton: TToolButton;
    T1: TTimer;
    FillTextFieldItem: TMenuItem;
    TrayMenu: TPopupMenu;
    RestoreItem: TMenuItem;
    ColorDlg: TColorDialog;
    RussianLayoutItem: TMenuItem;
    EnglishLayoutItem: TMenuItem;
    sp49: TMenuItem;
    KeyPressItem: TMenuItem;
    sp50: TMenuItem;
    NumLockItem: TMenuItem;
    CapsLockItem: TMenuItem;
    ScrollLockItem: TMenuItem;
    InstallPrinterItem: TMenuItem;
    CopyAndPasteItem: TMenuItem;
    DontLastUndoItem: TMenuItem;
    DeleteFirstLineItem: TMenuItem;
    CutAllItem: TMenuItem;
    sp32: TMenuItem;
    ClearBufferItem: TMenuItem;
    ReadOnlyItem: TMenuItem;
    LicItem: TMenuItem;
    ContextMenu: TPopupMenu;
    Copy2Item: TMenuItem;
    Cut2Item: TMenuItem;
    Del2Item: TMenuItem;
    Paste2Item: TMenuItem;
    SelectAll2Item: TMenuItem;
    Undo2Item: TMenuItem;
    sp56: TMenuItem;
    sp57: TMenuItem;
    QuitItem: TMenuItem;
    BufferItem: TMenuItem;
    sp16: TMenuItem;
    SortLinesItem: TMenuItem;
    NewLineUnderPrecedingItem: TMenuItem;
    OpenPasteItem: TMenuItem;
    sp15: TMenuItem;
    sp1: TToolButton;
    sp4: TToolButton;
    sp3: TToolButton;
    sp6: TToolButton;
    sp5: TToolButton;
    sp2: TToolButton;
    DropMenu: TPopupMenu;
    Open2Item: TMenuItem;
    OpenPaste2Item: TMenuItem;
    FileRun1: TFileRun;
    RunItem: TMenuItem;
    sp47: TMenuItem;
    TimeDate2Item: TMenuItem;
    sp41: TMenuItem;
    Save2Item: TMenuItem;
    SaveAs2Item: TMenuItem;
    sp55: TMenuItem;
    sp58: TMenuItem;
    ScrollDown2Item: TMenuItem;
    ScrollUp2Item: TMenuItem;
    FindNextItem: TMenuItem;
    ZoomInItem: TMenuItem;
    ZoomOutItem: TMenuItem;
    sp31: TMenuItem;
    TreeViewList: TImageList;
    sp40: TMenuItem;
    PropertiesItem: TMenuItem;
    EditInMSWordItem: TMenuItem;
    EditInMSWord2Item: TMenuItem;
    RegProItem: TMenuItem;
    sp54: TMenuItem;
    T2: TTimer;
    GNUinetProjectItem: TMenuItem;
    SizeMaxButton: TToolButton;
    SizeMinButton: TToolButton;
    sp7: TToolButton;
    sp8: TToolButton;
    sp59: TMenuItem;
    sp60: TMenuItem;
    Print2Item: TMenuItem;
    CopyExeItem: TMenuItem;
    DeleteFileItem: TMenuItem;
    CopyFileItem: TMenuItem;
    LangItem: TMenuItem;
    sp46: TMenuItem;
    sp23: TMenuItem;
    sp24: TMenuItem;
    ReloadFileItem: TMenuItem;
    sp14: TMenuItem;
    WinHeadItem: TMenuItem;
    ResetOnLastSaveItem: TMenuItem;
    NumberActiveLineItem: TMenuItem;
    T3: TTimer;
    KillMe2Item: TMenuItem;
    KillMe1Item: TMenuItem;
    ClearPasteItem: TMenuItem;
    WordPadItem: TMenuItem;
    ClearPaste2Item: TMenuItem;
    ToolBar2: TToolBar;
    SizeBox: TSpinEdit;
    sp9: TToolButton;
    sp10: TToolButton;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    StrikeOutButton: TToolButton;
    DefaultButton: TToolButton;
    sp12: TToolButton;
    ColorBox: TColorBox;
    sp11: TToolButton;
    UserBarItem: TMenuItem;
    MainToolBarItem: TMenuItem;
    FormatToolBarItem: TMenuItem;
    sp39: TMenuItem;
    TimeItem: TMenuItem;
    DateItem: TMenuItem;
    AddTDItem: TMenuItem;
    sp44: TMenuItem;
    AddTD2Item: TMenuItem;
    Date2Item: TMenuItem;
    Time2Item: TMenuItem;
    InsertProItem: TMenuItem;
    sp43: TMenuItem;
    RepBufferItem: TMenuItem;
    InsertTabItem: TMenuItem;
    DelTabItem: TMenuItem;
    NumLockKeybdItem: TMenuItem;
    sp45: TMenuItem;
    HomeLineItem: TMenuItem;
    EndLineItem: TMenuItem;
    SourseCodeItem: TMenuItem;
    FormatBarImages: TImageList;
    InsertSpaceItem: TMenuItem;
    ImportFileItem: TMenuItem;
    ExportFileItem: TMenuItem;
    sp17: TMenuItem;
    AboutErrorItem: TMenuItem;
    sp52: TMenuItem;
    InsertClearBufItem: TMenuItem;
    sp42: TMenuItem;
    RecycleBinItem: TMenuItem;
    ChangeAttrItem: TMenuItem;
    sp29: TMenuItem;
    CopyPathNameToBufferItem: TMenuItem;
    CopyNameToBufferItem: TMenuItem;
    CopyDirPathToBufferItem: TMenuItem;
    sp30: TMenuItem;
    TextEdit: TMemo;
    RusButton: TButton;
    EngButton: TButton;
    ShowWindowsMenuItem: TMenuItem;
    FontsBox: TrmNewComboBox;
    NumberWordsItem: TMenuItem;
    NumBoardPanel: TPanel;
    NumBt: TLbSpeedButton;
    DevideBt: TLbSpeedButton;
    MultiplyBt: TLbSpeedButton;
    SevenBt: TLbSpeedButton;
    EightBt: TLbSpeedButton;
    NineBt: TLbSpeedButton;
    FourBt: TLbSpeedButton;
    FiveBt: TLbSpeedButton;
    SixBt: TLbSpeedButton;
    OneBt: TLbSpeedButton;
    TwoBt: TLbSpeedButton;
    ThreeBt: TLbSpeedButton;
    ZeroBt: TLbSpeedButton;
    DecimalBt: TLbSpeedButton;
    AddBt: TLbSpeedButton;
    ReturnBt: TLbSpeedButton;
    SubtracyBt: TLbSpeedButton;
    ResetScaleItem: TMenuItem;
    EndSymbolItem: TMenuItem;
    InsertDirItem: TMenuItem;
    InsertFullPathNameItem: TMenuItem;
    InsertFileNameItem: TMenuItem;
    InsertFullPathItem: TMenuItem;
    T4: TTimer;
    TipOnDayItem: TMenuItem;
    sp64: TMenuItem;
    DeleteLastLineItem: TMenuItem;
    DeleteActiveLineItem: TMenuItem;
    HomePageItem: TMenuItem;
    ReplaceDlg: TReplaceDialog;
    FindDlg: TFindDialog;
    PrinterSetupDlg: TPrinterSetupDialog;
    SendItem: TMenuItem;
    Mail2Item: TMenuItem;
    Mail1Item: TMenuItem;
    CodeItem: TMenuItem;
    KOI8ANSIItem: TMenuItem;
    ANSIKOI8Item: TMenuItem;
    N2: TMenuItem;
    DOSWINItem: TMenuItem;
    WINDOSItem: TMenuItem;
    N3: TMenuItem;
    KOIWinItem: TMenuItem;
    WINKOIItem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure TextEditChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure OpenItemClick(Sender: TObject);
    procedure SaveItemClick(Sender: TObject);
    procedure SaveAsItemClick(Sender: TObject);
    procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
    procedure ExitItemClick(Sender: TObject);
    procedure SysInfoItemClick(Sender: TObject);
    procedure CreateItemClick(Sender: TObject);
    procedure StatusBarItemClick(Sender: TObject);
    procedure WordWrapItemClick(Sender: TObject);
    procedure FontItemClick(Sender: TObject);
    procedure PageSetupItemClick(Sender: TObject);
    procedure PrintItemClick(Sender: TObject);
    procedure TimeDateItemClick(Sender: TObject);
    procedure FindItemClick(Sender: TObject);
    procedure ReplaceItemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GotoLineItemClick(Sender: TObject);
    procedure FullScreenItemClick(Sender: TObject);
    procedure AboutItemClick(Sender: TObject);
    procedure SetupItemClick(Sender: TObject);
    procedure StatisticsItemClick(Sender: TObject);
    procedure NewLinetemClick(Sender: TObject);
    procedure TextEditKeyPress(Sender: TObject; var Key: Char);
    procedure SmallTextItemClick(Sender: TObject);
    procedure BigTextItemClick(Sender: TObject);
    procedure ScrollDownItemClick(Sender: TObject);
    procedure ScrollUpItemClick(Sender: TObject);
    procedure DontSaveItemClick(Sender: TObject);
    procedure ClearAllItemClick(Sender: TObject);
    procedure SymTableItemClick(Sender: TObject);
    procedure KeyBrdItemClick(Sender: TObject);
    procedure NewWinItemClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OpenDlgShow(Sender: TObject);
    procedure T1Timer(Sender: TObject);
    procedure TextEditKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure RestoreItemClick(Sender: TObject);
    procedure FillTextFieldItemClick(Sender: TObject);
    procedure NumLockItemClick(Sender: TObject);
    procedure CapsLockItemClick(Sender: TObject);
    procedure ScrollLockItemClick(Sender: TObject);
    procedure InstallPrinterItemClick(Sender: TObject);
    procedure RussianLayoutItemClick(Sender: TObject);
    procedure EnglishLayoutItemClick(Sender: TObject);
    procedure CopyAndPasteItemClick(Sender: TObject);
    procedure DontLastUndoItemClick(Sender: TObject);
    procedure DeleteFirstLineItemClick(Sender: TObject);
    procedure CutAllItemClick(Sender: TObject);
    procedure ClearBufferItemClick(Sender: TObject);
    procedure ReadOnlyItemClick(Sender: TObject);
    procedure LicItemClick(Sender: TObject);
    procedure TextEditMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure QuitItemClick(Sender: TObject);
    procedure BufferItemClick(Sender: TObject);
    procedure SortLinesItemClick(Sender: TObject);
    procedure OpenPasteItemClick(Sender: TObject);
    procedure RunItemClick(Sender: TObject);
    procedure TimeDate2ItemClick(Sender: TObject);
    procedure OpenDlgCanClose(Sender: TObject; var CanClose: Boolean);
    procedure ZoomInItemClick(Sender: TObject);
    procedure ZoomOutItemClick(Sender: TObject);
    procedure UndoItemClick(Sender: TObject);
    procedure TreeViewCustomDrawItem(Sender: TCustomTreeView;
    Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure NewLineUnderPrecedingItemClick(Sender: TObject);
    procedure ContextMenuItemClick(Sender: TObject);
    procedure CutItemClick(Sender: TObject);
    procedure PasteItemClick(Sender: TObject);
    procedure CopyItemClick(Sender: TObject);
    procedure DelItemClick(Sender: TObject);
    procedure TreeViewClick(Sender: TObject);
    procedure PropertiesItemClick(Sender: TObject);
    procedure fr2MouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure RegProItemClick(Sender: TObject);
    procedure T2Timer(Sender: TObject);
    procedure GNUinetProjectItemClick(Sender: TObject);
    procedure CopyNameToBufferItemClick(Sender: TObject);
    procedure CopyPathNameToBufferItemClick(Sender: TObject);
    procedure CopyExeItemClick(Sender: TObject);
    procedure CopyFileItemClick(Sender: TObject);
    procedure DeleteFileItemClick(Sender: TObject);
    procedure LangItemClick(Sender: TObject);
    procedure RusButtonClick(Sender: TObject);
    procedure EngButtonClick(Sender: TObject);
    procedure FindDlgFind(Sender: TObject);
    procedure ReloadFileItemClick(Sender: TObject);
    procedure WinHeadItemClick(Sender: TObject);
    procedure ResetOnLastSaveItemClick(Sender: TObject);
    procedure NumberActiveLineItemClick(Sender: TObject);
    procedure T3Timer(Sender: TObject);
    procedure KillMe2ItemClick(Sender: TObject);
    procedure ClearPasteItemClick(Sender: TObject);
    procedure WordPadItemClick(Sender: TObject);
    procedure FontsBoxChange(Sender: TObject);
    procedure SizeBoxChange(Sender: TObject);
    procedure ColorBoxChange(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure StrikeOutButtonClick(Sender: TObject);
    procedure DefaultButtonClick(Sender: TObject);
    procedure MainToolBarItemClick(Sender: TObject);
    procedure FormatToolBarItemClick(Sender: TObject);
    procedure ColorBoxCloseUp(Sender: TObject);
    procedure FontsBoxCloseUp(Sender: TObject);
    procedure TimeItemClick(Sender: TObject);
    procedure DateItemClick(Sender: TObject);
    procedure Date2ItemClick(Sender: TObject);
    procedure Time2ItemClick(Sender: TObject);
    procedure RepBufferItemClick(Sender: TObject);
    procedure InsertTabItemClick(Sender: TObject);
    procedure DelTabItemClick(Sender: TObject);
    procedure NumLockKeybdItemClick(Sender: TObject);
    procedure EndLineItemClick(Sender: TObject);
    procedure HomeLineItemClick(Sender: TObject);
    procedure SourseCodeItemClick(Sender: TObject);
    procedure InsertSpaceItemClick(Sender: TObject);
    procedure ExportFileItemClick(Sender: TObject);
    procedure AboutErrorItemClick(Sender: TObject);
    procedure InsertClearBufItemClick(Sender: TObject);
    procedure RecycleBinItemClick(Sender: TObject);
    procedure ChangeAttrItemClick(Sender: TObject);
    procedure CopyDirPathToBufferItemClick(Sender: TObject);
    procedure ImportFileItemClick(Sender: TObject);
    procedure ShowWindowsMenuItemClick(Sender: TObject);
    procedure NumberWordsItemClick(Sender: TObject);
    procedure NumBtClick(Sender: TObject);
    procedure DevideBtClick(Sender: TObject);
    procedure MultiplyBtClick(Sender: TObject);
    procedure SubtracyBtClick(Sender: TObject);
    procedure SevenBtClick(Sender: TObject);
    procedure EightBtClick(Sender: TObject);
    procedure NineBtClick(Sender: TObject);
    procedure SixBtClick(Sender: TObject);
    procedure FiveBtClick(Sender: TObject);
    procedure FourBtClick(Sender: TObject);
    procedure OneBtClick(Sender: TObject);
    procedure TwoBtClick(Sender: TObject);
    procedure ThreeBtClick(Sender: TObject);
    procedure ZeroBtClick(Sender: TObject);
    procedure DecimalBtClick(Sender: TObject);
    procedure AddBtClick(Sender: TObject);
    procedure ReturnBtClick(Sender: TObject);
    procedure NumBoardPanelMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure NumBoardPanelDblClick(Sender: TObject);
    procedure ResetScaleItemClick(Sender: TObject);
    procedure InsertFullPathNameItemClick(Sender: TObject);
    procedure InsertFileNameItemClick(Sender: TObject);
    procedure InsertFullPathItemClick(Sender: TObject);
    procedure T4Timer(Sender: TObject);
    procedure TipOnDayItemClick(Sender: TObject);
    procedure EditInMSWordItemClick(Sender: TObject);
    procedure DeleteLastLineItemClick(Sender: TObject);
    procedure DeleteActiveLineItemClick(Sender: TObject);
    procedure HomePageItemClick(Sender: TObject);
    procedure ReplaceDlgFind(Sender: TObject);
    procedure ReplaceDlgReplace(Sender: TObject);
    procedure Mail1ItemClick(Sender: TObject);
    procedure Mail2ItemClick(Sender: TObject);
    procedure WINKOIItemClick(Sender: TObject);
    procedure KOIWinItemClick(Sender: TObject);
    procedure WINDOSItemClick(Sender: TObject);
    procedure DOSWINItemClick(Sender: TObject);
    procedure ANSIKOI8ItemClick(Sender: TObject);
    procedure KOI8ANSIItemClick(Sender: TObject);

  private

    SM: HWND;

    Ini : TIniFile;

    FSelPos: integer;

    Icon: TNotifyIconData;

    FFileName: string;

    TextString: String;

    procedure HideProHeading;
    
    procedure ShowProHeading;

    procedure SetFileName(const FileName: String);
    
    procedure PerformFileOpen(const AFileName: string);

    procedure MinimizeApplication(Sender: TObject);

    procedure SystemTrayMenu(var Oleg: TMessage);
    message Tray;

    procedure ShowHint(Sender: TObject);

    procedure WMGetMinMaxInfo(var msg: TWMGetMinMaxInfo);
    message WM_GETMINMAXINFO;

    procedure WMDropFiles(var Msg: TMessage);
    message wm_DropFiles;

    procedure MySystemMenu(var MySysMenu: TWmSysCommand);
    message Wm_SysCommand;

    procedure WMMouseActivate(var Msg: TMessage);
    message WM_MOUSEACTIVATE;

    procedure ChangeMessageBoxPosition(var Msg: TMessage);
    message AlignCenter;

  public

  end;

var
  MainForm: TMainForm;

  msgCaption: PChar;

implementation

uses GTP, AP, SP, FP, LP, BP, PRP, CLP, ATP, TTP;

type
str32=array[0..32]of char;
var
DT: TSystemTime;
s:str32;

 type
   POpenFilenameA = ^TOpenFilenameA;
   POpenFilename = POpenFilenameA;
   tagOFNA = packed record
   lStructSize: DWORD;
   hWndOwner: HWND;
   hInstance: HINST;
   lpstrFilter: PAnsiChar;
   lpstrCustomFilter: PAnsiChar;
   nMaxCustFilter: DWORD;
   nFilterIndex: DWORD;
   lpstrFile: PAnsiChar;
   nMaxFile: DWORD;
   lpstrFileTitle: PAnsiChar;
   nMaxFileTitle: DWORD;
   lpstrInitialDir: PAnsiChar;
   lpstrTitle: PAnsiChar;
   Flags: DWORD;
   nFileOffset: Word;
   nFileExtension: Word;
   lpstrDefExt: PAnsiChar;
   lCustData: LPARAM;
   lpfnHook: function(Wnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): UINT stdcall;
   lpTemplateName: PAnsiChar;
   end;
   TOpenFilenameA = tagOFNA;
   TOpenFilename = TOpenFilenameA;

   function GetOpenFileName(var OpenFile: TOpenFilename): Bool; stdcall; external 'comdlg32.dll'
   name 'GetOpenFileNameA';
   function GetSaveFileName(var OpenFile: TOpenFilename): Bool; stdcall; external 'comdlg32.dll'
   name 'GetSaveFileNameA';

  const
   OFN_DONTADDTORECENT = $02000000;
   OFN_FILEMUSTEXIST = $00001000;
   OFN_HIDEREADONLY = $00000004;
   OFN_PATHMUSTEXIST = $00000800;

 function CharReplace(const Source: string; oldChar, newChar: Char): string;
 var
 i: Integer;
 begin
 Result := Source;
 for i := 1 to Length(Result) do
 if Result[i] = oldChar then
 Result[i] := newChar;
 end;

{$R *.dfm}

  const

  Koi: array[0..66] of Char = ('T', '�', '�', '�', '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�', '�', '�');

  Win: array[0..66] of Char = ('�', '�', 'T', '�', '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
    '�', '�', '�', '�', '�', '�', '�');

const
ObjWord = 'Word.Application';

resourcestring
sUntitled = 'Untitled';

const
Rect: TRect = (Left: 100; Top: 100; Right: 100; Bottom: 100);
FullScreen: Boolean = False;

procedure clickkey(MyKey: WORD);
begin
keybd_event(MyKey, 0, 0, 0 );
keybd_event(MyKey, 0, keyeventf_keyup,0 );
end;

function GetFileSizeByName(FileName: String): Integer;
var
FindData: TWin32FindData;
hFind: THandle;
begin
Result := -1;
hFind := FindFirstFile(PChar(FileName), FindData);
if hFind <> INVALID_HANDLE_VALUE then
begin
Windows.FindClose(hFind);
if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
Result := FindData.nFileSizeLow;
end;
end;

procedure SaveFont(FName: string; Section: string; smFont: TFont);
var
FStream: TIniFile;
begin 
FStream := TIniFile.Create(FName);
try
FStream.WriteString(Section, 'Name', smFont.Name);
FStream.WriteInteger(Section, 'CharSet', smFont.CharSet);
FStream.WriteInteger(Section, 'Color', smFont.Color);
FStream.WriteInteger(Section, 'Size', smFont.Size);
FStream.WriteInteger(Section, 'Style', Byte(smFont.Style));
finally
FStream.Free;
end;
end; 

procedure LoadFont(FName: string; Section: string; smFont: TFont); 
var 
FStream: TIniFile;
begin 
FStream := TIniFile.Create(Fname);
try
smFont.Name    := FStream.ReadString(Section, 'Name', smFont.Name);
smFont.CharSet := TFontCharSet(FStream.ReadInteger(Section, 'CharSet', smFont.CharSet));
smFont.Color   := TColor(FStream.ReadInteger(Section, 'Color', smFont.Color));
smFont.Size    := FStream.ReadInteger(Section, 'Size', smFont.Size);
smFont.Style   := TFontStyles(Byte(FStream.ReadInteger(Section, 'Style', Byte(smFont.Style))));
finally
FStream.Free;
end;
end;

procedure TMainForm.HideProHeading;
var
Save: Longint;
begin
if BorderStyle=bsNone then
Exit;
Save:=GetWindowLong(Handle, GWL_STYLE);
if (Save and WS_CAPTION)=WS_CAPTION then
begin
case BorderStyle of
bsSingle, bsSizeable:
SetWindowLong(Handle, GWL_STYLE, Save and (not WS_CAPTION) or WS_BORDER);
bsDialog:
SetWindowLong(Handle, GWL_STYLE, Save and
(not WS_CAPTION) or DS_MODALFRAME or WS_DLGFRAME);
end;
Height:=Height-GetSystemMetrics(SM_CYCAPTION);
Refresh;
end;
end;

procedure TMainForm.ShowProHeading;
var
Save: Longint;
begin
if BorderStyle=bsNone then
Exit;
Save:=GetWindowLong(Handle, GWL_STYLE);
if (Save and WS_CAPTION)<>WS_CAPTION then
begin
case BorderStyle of
bsSingle, bsSizeable:
SetWindowLong(Handle, GWL_STYLE, Save or WS_CAPTION or WS_BORDER);
bsDialog:
SetWindowLong(Handle, GWL_STYLE, Save or WS_CAPTION or
DS_MODALFRAME or WS_DLGFRAME);
end;
Height:=Height+getSystemMetrics(SM_CYCAPTION);
Refresh;
end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
List: TStringList;
R: TRegistry;
i: word;
DialogUnitsX: LongInt;
PixelsX: LongInt;
TabArray: array[0..4] of integer;
WrapBt: Integer;
begin
try
FontsBox.Items := Screen.Fonts;
TextEdit.WantTabs := true;
DialogUnitsX := LoWord(GetDialogBaseUnits);
PixelsX := 25;
for i := 1 to 4 do
begin
TabArray[i - 1] := ((PixelsX * i) * 4) div DialogUnitsX;
end;
SendMessage(TextEdit.Handle, EM_SETTABSTOPS, 5, LongInt(@TabArray));
TextEdit.Refresh;
R := TRegistry.Create;
R.RootKey := HKEY_CLASSES_ROOT;
R.OpenKey('.nse',true);
R.WriteString('', 'nsefile');
R.CloseKey;
R.OpenKey('nsefile\DefaultIcon',true);
R.WriteString('', ParamStr(0) + ', 0');
R.CloseKey;
R.OpenKey('nsefile\shell\open\command', true);
R.WriteString('', ParamStr(0) + ' "%1"');
R.CloseKey;
R.Free;
with Icon do
begin
Wnd := Handle;
SzTip := 'Notepad SE v 1.0';
HIcon := Application.Icon.Handle;
UCallBackMessage := Tray;
UFlags := Nif_Tip + Nif_Message or Nif_Icon;
end;
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
Top := Ini.ReadInteger('Position', 'Top', 100);
Left := Ini.ReadInteger('Position', 'Left', 100);
ClientHeight := Ini.ReadInteger('Position', 'ClientHeight', 600);
ClientWidth := Ini.ReadInteger('Position', 'ClientWidth', 800);
ContextMenuItem.Checked := Ini.ReadBool('Parameters', 'Context Menu', ContextMenuItem.Checked);
NewLineUnderPrecedingItem.Checked := Ini.ReadBool('Parameters', 'New line under preceding', NewLineUnderPrecedingItem.Checked);
StatusBarItem.Checked := Ini.ReadBool('Parameters', 'Status Bar', StatusBarItem.Checked);
ColorDlg.Color := Ini.ReadInteger('Parameters', 'Field Color', ColorDlg.Color);
FFileName := Ini.ReadString('Parameters', 'Path', FFileName);
MainToolBarItem.Checked := Ini.ReadBool('Parameters', 'Main Tool Bar', MainToolBarItem.Checked);
FormatToolBarItem.Checked := Ini.ReadBool('Parameters', 'Format Tool Bar', FormatToolBarItem.Checked);
with TRegistry.Create do
try
RootKey := HKEY_CLASSES_ROOT;
EditInMSWordItem.Enabled := KeyExists(ObjWord);
finally
Free;
end;
except
end;
Application.OnHint := ShowHint;
Application.OnMinimize := MinimizeApplication;

WrapBt := GetWindowLong(NumBt.NumGlyphs, GWL_STYLE);
SetWindowLong(NumBt.NumGlyphs, GWL_STYLE, WrapBt or BS_MULTILINE);
NumBt.Caption := 'Num' + #13#10 + 'Lock';
WrapBt := GetWindowLong(SevenBt.NumGlyphs, GWL_STYLE);
SetWindowLong(SevenBt.NumGlyphs, GWL_STYLE, WrapBt or BS_MULTILINE);
SevenBt.Caption := '7' + #13#10 + 'Home';
WrapBt := GetWindowLong(EightBt.NumGlyphs, GWL_STYLE);
SetWindowLong(EightBt.NumGlyphs, GWL_STYLE, WrapBt or BS_MULTILINE);
EightBt.Caption := '8' + #13#10 + 'Up';
WrapBt := GetWindowLong(NineBt.NumGlyphs, GWL_STYLE);
SetWindowLong(NineBt.NumGlyphs, GWL_STYLE, WrapBt or BS_MULTILINE);
NineBt.Caption := '9' + #13#10 + 'Page Up';
WrapBt := GetWindowLong(FourBt.NumGlyphs, GWL_STYLE);
SetWindowLong(FourBt.NumGlyphs, GWL_STYLE, WrapBt or BS_MULTILINE);
FourBt.Caption := '4' + #13#10 + 'Back';
WrapBt := GetWindowLong(SixBt.NumGlyphs, GWL_STYLE);
SetWindowLong(SixBt.NumGlyphs, GWL_STYLE, WrapBt or BS_MULTILINE);
SixBt.Caption := '6' + #13#10 + 'Forward';
WrapBt := GetWindowLong(OneBt.NumGlyphs, GWL_STYLE);
SetWindowLong(OneBt.NumGlyphs, GWL_STYLE, WrapBt or BS_MULTILINE);
OneBt.Caption := '1' + #13#10 + 'End';
WrapBt := GetWindowLong(TwoBt.NumGlyphs, GWL_STYLE);
SetWindowLong(TwoBt.NumGlyphs, GWL_STYLE, WrapBt or BS_MULTILINE);
TwoBt.Caption := '2' + #13#10 + 'Down';
WrapBt := GetWindowLong(ThreeBt.NumGlyphs, GWL_STYLE);
SetWindowLong(ThreeBt.NumGlyphs, GWL_STYLE, WrapBt or BS_MULTILINE);
ThreeBt.Caption := '3' + #13#10 + 'Page Dn';
WrapBt := GetWindowLong(ZeroBt.NumGlyphs, GWL_STYLE);
SetWindowLong(ZeroBt.NumGlyphs, GWL_STYLE, WrapBt or BS_MULTILINE);
ZeroBt.Caption := '0' + #13#10 + 'Ins';
WrapBt := GetWindowLong(DecimalBt.NumGlyphs, GWL_STYLE);
SetWindowLong(DecimalBt.NumGlyphs, GWL_STYLE, WrapBt or BS_MULTILINE);
DecimalBt.Caption := '.' + #13#10 + 'Del';
end;

procedure TMainForm.TextEditChange(Sender: TObject);
begin
try
if DontSaveItem.Checked then
TextEdit.Tag := 0 else
TextEdit.Tag := 1;
except
end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
Res: Integer;
begin
try
if LangForm.LangBox.ItemIndex  = 0 then
begin
if TextEdit.Tag = 0 then begin
CanClose := True;
end else begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Res := Application.MessageBox(PChar('Save changes to "' + ExtractFileName(FFileName) + '"?'),
'Notepad SE',
mb_YesNoCancel + mb_IconQuestion);
if Res = idYes then
begin
MainForm.BringToFront;
MainForm.SaveItemClick(Sender);
if TextEdit.Tag = 1 then CanClose := False;
end;
if Res = idNo then CanClose := True;
if Res = idCancel then CanClose := False;
end;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
if TextEdit.Tag = 0 then begin
CanClose := True;
end else begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Res := Application.MessageBox(PChar('��������� ��������� � "' + ExtractFileName(FFileName) + '"?'),
'Notepad SE',
mb_YesNoCancel + mb_IconQuestion);
if Res = idYes then
begin
MainForm.BringToFront;
MainForm.SaveItemClick(Sender);
if TextEdit.Tag = 1 then CanClose := False;
end;
if Res = idNo then CanClose := True;
if Res = idCancel then CanClose := False;
end;
end;
except
end; 
end;

procedure TMainForm.OpenItemClick(Sender: TObject);
var
res: Integer;
begin
try
if TextEdit.Tag = 0 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.txt',
'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|All files (*.*)|*.*', ParamStr(1),
'Notepad SE', TextString, True) then
begin
OpenDlg.FileName := TextString;
if SetForm.ch18.Checked then
begin
if FullScreenItem.Checked = False then
FullScreenItem.Click;
end;
PerformFileOpen(TextString);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
FileRun1.FileName := TextString;
end;
end else
begin
if LangForm.LangBox.ItemIndex  = 0 then
begin
Res := Application.MessageBox(PChar('Save changes to "' + ExtractFileName(FFileName) + '"?'),
'Notepad SE',
mb_YesNoCancel + mb_IconQuestion);
if Res = idYes then
begin
MainForm.BringToFront;
MainForm.SaveItemClick(Sender);
if TextEdit.Tag = 0 then
if OpenSaveFileDialog(MainForm.Handle, '*.txt', 'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|All files (*.*)|*.*', ParamStr(1),
'Notepad SE', TextString, True) then
begin
OpenDlg.FileName := TextString;
if SetForm.ch18.Checked then
begin
if FullScreenItem.Checked = False then
FullScreenItem.Click;
end;
PerformFileOpen(TextString);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
FileRun1.FileName := TextString;
end;
Exit;
end;
if TextEdit.Tag = 0 then
begin
TextEdit.Clear;
PerformFileOpen(TextString);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
end;
if Res = idNo then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.txt', 'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|All files (*.*)|*.*', ParamStr(1),
'Notepad SE', TextString, True) then
begin
OpenDlg.FileName := TextString;
if SetForm.ch18.Checked then
begin
if FullScreenItem.Checked = False then
FullScreenItem.Click;
end;
PerformFileOpen(TextString);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
FileRun1.FileName := TextString;
end;
end else
begin
exit;
end;
if Res = idCancel then Exit;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
Res := Application.MessageBox(PChar('��������� ��������� � "' + ExtractFileName(FFileName) + '"?'),
'Notepad SE',
mb_YesNoCancel + mb_IconQuestion);
if Res = idYes then
begin
MainForm.BringToFront;
MainForm.SaveItemClick(Sender);
if TextEdit.Tag = 0 then
if OpenSaveFileDialog(MainForm.Handle, '*.txt', 'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|All files (*.*)|*.*', ParamStr(1),
'Notepad SE', TextString, True) then
begin
OpenDlg.FileName := TextString;
if SetForm.ch18.Checked then
begin
if FullScreenItem.Checked = False then
FullScreenItem.Click;
end;
PerformFileOpen(TextString);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
FileRun1.FileName := TextString;
end;
Exit;
end;
if TextEdit.Tag = 0 then
begin
TextEdit.Clear;
PerformFileOpen(TextString);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
end;
if Res = idNo then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.txt', 'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|All files (*.*)|*.*', ParamStr(1),
'Notepad SE', TextString, True) then
begin
OpenDlg.FileName := TextString;
if SetForm.ch18.Checked then
begin
if FullScreenItem.Checked = False then
FullScreenItem.Click;
end;
PerformFileOpen(TextString);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
FileRun1.FileName := TextString;
end;
end else
begin
Exit;
end;
if Res = idCancel then Exit;
end;
end;
except
end;
TextEdit.SetFocus;
end;

function Seps(As_Arg: Char): Boolean;
begin
Seps := As_Arg in
[#0..#$1F, ' ', '.', ',', '?', ':', ';', '(', ')', '/', '\'];
end;

function WordCount(CText: string): Longint;
var
Ix: Word;
Work_Count: Longint;
begin
Work_Count := 0;
Ix         := 1;
while Ix <= Length(CText) do
begin
while (Ix <= Length(CText)) and (Seps(CText[Ix])) do
Inc(Ix);
if Ix <= Length(CText) then
begin
Inc(Work_Count);
while (Ix <= Length(CText)) and (not Seps(CText[Ix])) do
Inc(Ix);
end;
end;
WordCount := Work_Count;
end;

procedure TMainForm.SaveItemClick(Sender: TObject);
begin
try
if FFileName = sUntitled then
SaveAsItemClick(Sender) else
begin
TextEdit.Lines.SaveToFile(FFileName);
TextEdit.Tag := 0;
end;
except
end;
TextEdit.SetFocus;
end;

procedure TMainForm.SaveAsItemClick(Sender: TObject);
begin
try
if LangForm.LangBox.ItemIndex = 0 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*', 'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|',
ParamStr(1), 'Save', FFileName, False) then begin
if FileExists(FFileName) then
begin
if Application.MessageBox(PChar('File "' + FFileName +
'" already exists.' +
#13 + 'Replace?'),
'Confirmation',MB_ICONQUESTION + mb_YesNo)
<> idYes then
begin
Exit;
end else
begin
TextEdit.Lines.SaveToFile(FFileName);
SetFileName(FFileName);
TextEdit.Tag := 0;
FileRun1.FileName := FFileName;
end;
end;
if not FileExists(s) then
begin
TextEdit.Lines.SaveToFile(FFileName);
SetFileName(FFileName);
TextEdit.Tag := 0;
FileRun1.FileName := FFileName;
end;
end;
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.txt', 'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|',
ParamStr(1), '���������', FFileName, False) then begin
if FileExists(FFileName) then
begin
if Application.MessageBox(PChar('���� "' + FFileName +
'" ��� ����������.' +
#13 + '��������?'),
'�������������',MB_ICONQUESTION + mb_YesNo)
<> idYes then
begin
Exit;
end else
begin
TextEdit.Lines.SaveToFile(FFileName);
SetFileName(FFileName);
TextEdit.Tag := 0;
FileRun1.FileName := FFileName;
end;
end;
if not FileExists(s) then
begin
TextEdit.Lines.SaveToFile(FFileName);
SetFileName(FFileName);
TextEdit.Tag := 0;
FileRun1.FileName := FFileName;
end;
end;
end;
except
end;
TextEdit.SetFocus;
end;

procedure TMainForm.ApplicationEventsIdle(Sender: TObject;
var Done: Boolean);
var
X, Y: LongInt;
Layout: array [0.. KL_NAMELENGTH] of char;
begin
try
if MainForm.Active = True then
begin
if LangForm.LangBox.ItemIndex  = -1 then
LangForm.LangBox.ItemIndex := 1;
if LangForm.LangBox.ItemIndex  = 0 then
begin
if ClipBoard.AsText = '' then
BufferItem.Caption := 'Clipboard is empty' else
BufferItem.Caption := 'Clipboard';
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
if ClipBoard.AsText = '' then
BufferItem.Caption := '����� ������ �� �������� �����' else
BufferItem.Caption := '����� ������ �������� �����';
end;
if TextEdit.Tag = 0 then
ResetOnLastSaveItem.Enabled := False else
ResetOnLastSaveItem.Enabled := True;
Y := TextEdit.Perform(EM_LINEFROMCHAR, TextEdit.SelStart, 0);
X := TextEdit.Perform(EM_LINEINDEX, Y, 0);
inc(Y);
X := TextEdit.SelStart - X + 1;
StatusBar.Panels[0].Text := '' + IntToStr(X) + ':' + IntToStr(Y);
GetKeyboardLayoutName(Layout);
if Layout = '00000409' then
begin
StatusBar.Panels[1].Text := 'ENG';
EnglishLayoutItem.Checked := True;
RussianLayoutItem.Checked := False;
end else
begin
StatusBar.Panels[1].Text := 'RUS';
EnglishLayoutItem.Checked := False;
RussianLayoutItem.Checked := True;
end;
if GetKeyState(VK_Numlock) and 1 = 0 then
StatusBar.Panels[2].Text := '' else
StatusBar.Panels[2].Text := 'NUM';
if GetKeyState(VK_Capital) and 1 = 0 then
StatusBar.Panels[3].Text := '' else
StatusBar.Panels[3].Text := 'CAP';
if GetKeyState(VK_Scroll) and 1 = 0 then
StatusBar.Panels[4].Text := '' else
StatusBar.Panels[4].Text := 'SCRL';
Y := TextEdit.Perform(EM_LINEFROMCHAR,
TextEdit.SelStart, 0);
X := TextEdit.SelStart - y + 1;
StatusBar.Panels[5].Text := 'nb char: ' + inttostr(x);
if ClipBoard.AsText = '' then
StatusBar.Panels[6].Text := 'Empty' else
StatusBar.Panels[6].Text := 'Insert';
StatusBar.Panels[7].Text := 'tw: ' + IntToStr(WordCount(TextEdit.Text));
if LangForm.LangBox.ItemIndex  = 0 then
begin
if FFileName = '' then
begin
StatusBar.Panels[8].Text := FFileName +
' / ' + IntToStr(GetFileSizeByName(FFileName)) + ' bites';
end else
begin
StatusBar.Panels[8].Text := FFileName +
' / ' + IntToStr(GetFileSizeByName(FFileName)) + ' bites';
end;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
if OpenDlg.FileName = '' then
begin
StatusBar.Panels[8].Text := FFileName +
' / ' + IntToStr(GetFileSizeByName(FFileName)) + ' ����';
end else
begin
StatusBar.Panels[8].Text := FFileName +
' / ' + IntToStr(GetFileSizeByName(FFileName)) + ' ����';
end;
end;

if Length(TextEdit.Text) = 0 then
begin
CutAllItem.Enabled := False;
ClearAllItem.Enabled := False;
CopyAndPasteItem.Enabled := False;
DeleteFirstLineItem.Enabled := False;
DeleteActiveLineItem.Enabled := False;
DeleteLastLineItem.Enabled := False;
FindItem.Enabled := False;
FindNextItem.Enabled := False;
ReplaceItem.Enabled := False;
GotoLineItem.Enabled := False;
PrintItem.Enabled := False;
Print2Item.Enabled := False;
PrintButton.Enabled := False;
FindButton.Enabled := False;
ReplaceButton.Enabled := False;
end else
begin
CutAllItem.Enabled := True;
ClearAllItem.Enabled := True;
CopyAndPasteItem.Enabled := True;
DeleteFirstLineItem.Enabled := True;
DeleteActiveLineItem.Enabled := True;
DeleteLastLineItem.Enabled := True;
FindItem.Enabled := True;
FindNextItem.Enabled := True;
ReplaceItem.Enabled := True;
GotoLineItem.Enabled := True;
PrintItem.Enabled := True;
Print2Item.Enabled := True;
PrintButton.Enabled := True;
FindButton.Enabled := True;
ReplaceButton.Enabled := True;
end;

if ClipBoard.AsText = '' then
begin
ClearBufferItem.Enabled := False;
RepBufferItem.Enabled := False;
InsertClearBufItem.Enabled := False;
end else
begin
ClearBufferItem.Enabled := True;
RepBufferItem.Enabled := True;
InsertClearBufItem.Enabled := True;
end;

if FFileName = sUntitled then
begin
PropertiesItem.Enabled := False;
CopyFileItem.Enabled := False;
DeleteFileItem.Enabled := False;
ChangeAttrItem.Enabled := False;
RunItem.Enabled := False;
CopyPathNameToBufferItem.Enabled := False;
CopyNameToBufferItem.Enabled := False;
CopyDirPathToBufferItem.Enabled := False;
ShowWindowsMenuItem.Enabled := False;
end else
begin
PropertiesItem.Enabled := True;
CopyFileItem.Enabled := True;
DeleteFileItem.Enabled := True;
ChangeAttrItem.Enabled := True;
RunItem.Enabled := True;
CopyPathNameToBufferItem.Enabled := True;
CopyNameToBufferItem.Enabled := True;
CopyDirPathToBufferItem.Enabled := True;
ShowWindowsMenuItem.Enabled := True;
end;

end;
except
end;
end;

procedure TMainForm.ExitItemClick(Sender: TObject);
begin
Close;
end;

procedure TMainForm.SysInfoItemClick(Sender: TObject);
begin
ShellExecute(Handle, nil, 'msInfo32', nil,nil, Sw_ShowNormal);
TextEdit.SetFocus;
end;

procedure TMainForm.CreateItemClick(Sender: TObject);
var
res: Integer;
begin
if TextEdit.Tag = 0 then
begin
TextEdit.Clear;
SetFileName(sUntitled);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
end
else begin
if LangForm.LangBox.ItemIndex  = 0 then
begin
Res := Application.MessageBox(PChar('Save changes to "' + ExtractFileName(FFileName) + '"?'),
'Notepad SE',
mb_YesNoCancel + mb_IconQuestion);
if Res = idYes then
begin
MainForm.BringToFront;
MainForm.SaveItemClick(Sender);
if TextEdit.Tag = 1 then
Exit;
end;
if TextEdit.Tag = 0 then
begin
TextEdit.Clear;
SetFileName(sUntitled);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
end;
if Res = idNo then
begin
TextEdit.Clear;
SetFileName(sUntitled);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
end;
if Res = idCancel then Exit;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
Res := Application.MessageBox(PChar('��������� ��������� � "' + ExtractFileName(FFileName) + '"?'),
'Notepad SE',
mb_YesNoCancel + mb_IconQuestion);
if Res = idYes then
begin
MainForm.BringToFront;
MainForm.SaveItemClick(Sender);
if TextEdit.Tag = 1 then
Exit;
end;
if TextEdit.Tag = 0 then
begin
TextEdit.Clear;
SetFileName(sUntitled);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
end;
if Res = idNo then
begin
TextEdit.Clear;
SetFileName(sUntitled);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
end;
if Res = idCancel then Exit;
end;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.StatusBarItemClick(Sender: TObject);
begin
if StatusBarItem.Checked then
StatusBar.Visible := True else
StatusBar.Visible := False;
TextEdit.SetFocus;
end;

procedure TMainForm.WordWrapItemClick(Sender: TObject);
begin
with TextEdit do
begin
WordWrap := not WordWrap; 
if WordWrap then
ScrollBars := ssVertical
else
ScrollBars := ssBoth;
WordWrapItem.Checked := WordWrap;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.FontItemClick(Sender: TObject);
begin
FontForm.Position := poMainFormCenter;
FontForm.ShowModal;
TextEdit.SetFocus;
end;

procedure TMainForm.PageSetupItemClick(Sender: TObject);
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
PageSetupDlg.Execute;
TextEdit.SetFocus;
end;

procedure TMainForm.PrintItemClick(Sender: TObject);
var
sMemo : String;
filename : TextFile;
x : Integer;
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
sMemo := TextEdit.Text;
If Length(Trim(sMemo)) = 0 Then
exit;
If Length(Trim(sMemo)) <> 0 Then
if PrinterSetupDlg.Execute then begin
AssignPrn(filename);
Rewrite(filename);
for x := 0 to TextEdit.Lines.Count - 1 do
Writeln(filename, TextEdit.Lines[x]);
CloseFile(filename);
end;
end;

procedure TMainForm.TimeDateItemClick(Sender: TObject);
begin
TextEdit.Lines.Add(DateTimeToStr(Now));
TextEdit.SetFocus;
end;

procedure TMainForm.FindItemClick(Sender: TObject);
begin
FindDlg.Position := Point(MainForm.Left + TextEdit.Left +
TextEdit.Width div 4, TextEdit.Top + MainForm.Top);
FSelPos := 0;
FindDlg.Execute;
end;

procedure TMainForm.ReplaceItemClick(Sender: TObject);
begin
ReplaceDlg.Position := Point(MainForm.Left + TextEdit.Left +
TextEdit.Width div 4, TextEdit.Top + MainForm.Top);
ReplaceDlg.Execute;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
R : TRegistry;
Str: String;
begin
try
LoadFont('Parameters.ini', 'label', TextEdit.Font);
if LangForm.LangBox.ItemIndex  = -1 then
LangForm.LangBox.ItemIndex := 1;
if LangForm.LangBox.ItemIndex  = 1 then
begin
RusButton.Click;
end;
SetFileName(sUntitled);
OpenDlg.FileName := ParamStr(1);
FileRun1.FileName := OpenDlg.FileName;
MainForm.Color := ColorDlg.Color;
TextEdit.Color := ColorDlg.Color;
NumBoardPanel.Color := ColorDlg.Color;
BufferForm.BufferText.Color := ColorDlg.Color;
if StatusBarItem.Checked then
StatusBar.Visible := True else
StatusBar.Visible := False;
if SetForm.ch1.Checked then
DragAcceptFiles(MainForm.Handle, True) else
DragAcceptFiles(MainForm.Handle, False);
if SetForm.ch3.Checked then
CoolBar.Visible := True else
CoolBar.Visible := False;
if SetForm.ch4.Checked then
begin
MainForm.CoolBar.ShowHint := True;
end else
begin
MainForm.CoolBar.ShowHint := False;
end;
if MainToolBarItem.Checked then
ToolBar.Visible := True else
ToolBar.Visible := False;
if FormatToolBarItem.Checked then
ToolBar2.Visible := True else
ToolBar2.Visible := False;
if ParamCount > 0 then
begin
if SetForm.ch18.Checked then
begin
if FullScreenItem.Checked = False then
FullScreenItem.Click;
end;
MainForm.SetFileName(ParamStr(1));
TextEdit.Lines.LoadFromFile(paramstr(1)+ str);
TextEdit.Tag := 0;
end
else
if SetForm.ch14.Checked then
begin
TextEdit.Lines.Clear;
FFileName := Ini.ReadString('Parameters', 'Path', FFileName);
TextEdit.Lines.LoadFromFile(FFileName);
SetFileName(FFileName);
OpenDlg.FileName := FFileName;
FileRun1.FileName := FFileName;
end;
except
TextEdit.Lines.Clear;
SetFileName(sUntitled);
end;
if SetForm.ch19.Checked then
begin
if FullScreenItem.Checked = False then
FullScreenItem.Click;
end;
if SetForm.ch7.Checked then
begin
RyMenu.Add(MainMenu, nil);
RyMenu.Add(TrayMenu, nil);
RyMenu.Add(DropMenu, nil);
RyMenu.Add(ContextMenu, nil);
end;
if SetForm.ch17.Checked then
begin
MainForm.T3.Enabled := True;
SetForm.TimeEdit.Enabled := False;
end else
begin
MainForm.T3.Enabled := False;
SetForm.TimeEdit.Enabled := True;
end;
R := TRegistry.Create;
R.RootKey := HKEY_LOCAL_MACHINE;
R.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', false);
if SetForm.ch2.Checked then
R.WriteString(Application.Title, ParamStr(0)) else
R.DeleteValue(Application.Title);
R.Free;
TextEdit.Font.Size := FontForm.SizeBox.Value;
TextEdit.Font.Name := FontForm.FontsBox.Text;
TextEdit.Font.Color := FontForm.ColorBox.Selected;
if TextEdit.Font.Style = [fsUnderline] then
FontForm.ch1.Checked;
if TextEdit.Font.Style = [fsStrikeOut] then
FontForm.ch2.Checked;
if TextEdit.Font.Style = [fsBold] then
FontForm.ch3.Checked;
if TextEdit.Font.Style = [fsItalic] then
FontForm.ch4.Checked;
if TextEdit.Font.Style = [] then
FontForm.ch5.Checked;
if LangForm.LangBox.ItemIndex  = 0 then
begin
EngButton.Click;
end;
r:=TRegistry.Create;
r.RootKey:=HKEY_CURRENT_USER;
if r.OpenKeyReadOnly('\SOFTWARE\Notepad SE\RegKey') then begin
if r.ValueExists(RegForm.InputCode.Text) then
RegForm.InputCode.Text:=r.ReadString(RegForm.InputCode.Text);
end;
FontsBox.Text := TextEdit.Font.Name;
SizeBox.Value := TextEdit.Font.Size;
ColorBox.Selected := TextEdit.Font.Color;
with TextEdit do
begin
WordWrap := not WordWrap; 
if WordWrap then
ScrollBars := ssVertical
else
ScrollBars := ssBoth;
WordWrapItem.Checked := WordWrap;
end;

T4.Enabled := True;
T2.Enabled := True;
T1.Enabled := True;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
Reg: TRegistry;
begin
MainForm.WindowState := wsNormal;
Reg:=TRegistry.Create;
Reg.RootKey:=HKEY_CURRENT_USER;
Reg.OpenKey('\SOFTWARE\Notepad SE\RegKey',true);
Reg.WriteString('', RegForm.InputCode.Text);
Reg.Free;
try
Action := caFree;
if FullScreenItem.Checked = True then
begin
ClientHeight := 600;
ClientWidth := 800;
FullScreenItem.Click;
end;
Ini.WriteInteger('Language', 'Lang', LangForm.LangBox.ItemIndex);
Ini.WriteInteger('Position', 'Top', Top);
Ini.WriteInteger('Position', 'Left', Left);
Ini.WriteInteger('Position', 'ClientHeight', ClientHeight);
Ini.WriteInteger('Position', 'ClientWidth', ClientWidth);
Ini.WriteBool('Parameters', 'Context Menu', ContextMenuItem.Checked);
Ini.WriteBool('Parameters', 'New line under preceding', NewLineUnderPrecedingItem.Checked);
Ini.WriteBool('Parameters', 'Status Bar', StatusBarItem.Checked);
Ini.WriteBool('Parameters', 'Main Tool Bar', MainToolBarItem.Checked);
Ini.WriteBool('Parameters', 'Format Tool Bar', FormatToolBarItem.Checked);
Ini.WriteInteger('Parameters', 'Field Color', ColorDlg.Color);
Ini.WriteInteger('Fonts settings', 'Color', FontForm.ColorBox.Selected);
Ini.WriteInteger('Fonts settings', 'Size', FontForm.SizeBox.Value);
Ini.WriteBool('Fonts settings', 'Underline', FontForm.ch1.Checked);
Ini.WriteBool('Fonts settings', 'Strikeout', FontForm.ch2.Checked);
Ini.WriteBool('Fonts settings', 'Bold', FontForm.ch3.Checked);
Ini.WriteBool('Fonts settings', 'Italic', FontForm.ch4.Checked);
Ini.WriteBool('Fonts settings', 'Def', FontForm.ch5.Checked);
Ini.WriteBool('On preview', 'Open', FontForm.OnPreviewButton.Down);
Ini.WriteBool('Parameters', 'Use of "Drag and Drop"', SetForm.ch1.Checked);
Ini.WriteBool('Parameters', 'Run with Windows OS Startup', SetForm.ch2.Checked);
Ini.WriteBool('Parameters', 'Tool Bar', SetForm.ch3.Checked);
Ini.WriteBool('Parameters', 'Show Hint on the Tool Bar', SetForm.ch4.Checked);
Ini.WriteBool('Parameters', 'Show Hint in the Status Bar', SetForm.ch5.Checked);
Ini.WriteBool('Parameters', 'Use of XP Menu', SetForm.ch7.Checked);
Ini.WriteBool('Parameters', 'Modal Windows on Task Bar', SetForm.ch10.Checked);
Ini.WriteBool('Parameters', 'Always on Top', SetForm.ch11.Checked);
Ini.WriteBool('Parameters', 'Hide message on creating shortcut', SetForm.ch13.Checked);
Ini.WriteBool('Parameters', 'Open last file', SetForm.ch14.Checked);
Ini.WriteBool('Parameters', 'Min to Tray', SetForm.ch15.Checked);
Ini.WriteBool('Parameters', 'Use of autosave', SetForm.ch17.Checked);
Ini.WriteInteger('Parameters', 'Time limit autosave', SetForm.TimeEdit.Value);
Ini.WriteInteger('Tip window', 'Tip position', TipForm.NextBt.Tag);
Ini.WriteInteger('Tip window', 'Tip text size', TipForm.FontsBox.ItemIndex);
Ini.WriteBool('Full Screen', 'On file open', SetForm.ch18.Checked);
Ini.WriteBool('Full Screen', 'On start program', SetForm.ch19.Checked);
Ini.WriteString('Parameters', 'Name on creating shortcut', SetForm.TextName.Text);
Ini.WriteBool('Full Screen', 'Hide Tool Bar on Full Screen', SetForm.ch8.Checked);
Ini.WriteBool('Full Screen', 'Hide Status Bar on Full Screen', SetForm.ch9.Checked);
if SetForm.ch14.Checked then
begin
Ini.WriteString('Parameters', 'Path', FFileName);
end;
Ini.WriteBool('License on start', 'Show', LicForm.ch1.Checked);
except
end;
end;

procedure TMainForm.GotoLineItemClick(Sender: TObject);
begin
GoToForm.Position := poMainFormCenter;
GoToForm.ShowModal;
end;

procedure TMainForm.ShowHint(Sender: TObject);
begin
if SetForm.ch5.Checked then
begin
if Length(Application.Hint) > 0 then
begin
StatusBar.SimplePanel := True;
StatusBar.SimpleText := Application.Hint;
end else
StatusBar.SimplePanel := False;
end;
end;

procedure TMainForm.WMGetMinMaxInfo(var msg: TWMGetMinMaxInfo);
begin
inherited;
with msg.MinMaxInfo^.ptMaxTrackSize do begin
X := GetDeviceCaps( Canvas.handle, HORZRES ) +
(Width - ClientWidth);
Y := GetDeviceCaps( Canvas.handle, VERTRES ) +
(Height - ClientHeight );
end;
end;

procedure TMainForm.FullScreenItemClick(Sender: TObject);
begin 
MainForm.ScreenSnap := False;
FullScreen := not FullScreen;
if FullScreen then begin
FullScreenItem.Checked := True;
if SetForm.ch9.Checked then
StatusBar.Visible := False;
if SetForm.ch8.Checked then
CoolBar.Visible := False;
WinHeadItem.Enabled := False;
Rect := BoundsRect;
SetBounds( Left - ClientOrigin.X,
Top - ClientOrigin.Y, GetDeviceCaps( Canvas.handle,
HORZRES )
+ (Width - ClientWidth), GetDeviceCaps( Canvas.handle,
VERTRES )
+ (Height - ClientHeight ));
end else
begin
if StatusBarItem.Checked = True then
StatusBar.Visible := True else
StatusBar.Visible := False;
if SetForm.ch3.Checked = True then
CoolBar.Visible := True else
CoolBar.Visible := False;
FullScreenItem.Checked := False;
BoundsRect := Rect;
WinHeadItem.Enabled := True;
MainForm.ScreenSnap := True;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.AboutItemClick(Sender: TObject);
begin
try
AboutForm.Position := poMainFormCenter;
AboutForm.ShowModal;
TextEdit.SetFocus;
except
end;
end;

procedure TMainForm.SetupItemClick(Sender: TObject);
begin
try
SetForm.Position := poMainFormCenter;
SetForm.ShowModal;
TextEdit.SetFocus;
except
end;
end;

procedure TMainForm.StatisticsItemClick(Sender: TObject);
const
SIZE=500;
var
a:array[1..SIZE]of string[255];
n: integer;
i:integer;
st:string;
begin
try
n:=TextEdit.Lines.Count;
if n = 0 then
begin
if LangForm.LangBox.ItemIndex  = 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(PChar('Document is empty.'),
'Notepad SE',
mb_IconAsterisk + mb_OK);
Exit;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(PChar('�������� ����.'),
'Notepad SE',
mb_IconAsterisk + mb_OK);
Exit;
end;
end;
if n > SIZE then
begin
if LangForm.LangBox.ItemIndex  = 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox('Count inputing strings more possible meaning.',
'Notepad SE',
mb_IconHand + mb_OK);
n:=SIZE;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox('���������� ��������� ����� ��������� ��������� ��������.',
'Notepad SE',
mb_IconHand + mb_OK);
n:=SIZE;
end;
end;
for i:=1 to n do
a[i]:=TextEdit.Lines[i-1];
if n > 0 then
begin
if LangForm.LangBox.ItemIndex  = 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
st:='Statistics:' + #13;
for i:=1  to n do
st:=st+IntToStr(i)+'.  '+ a[i]+#13;
Application.MessageBox(PChar('' + st + ''),
'Notepad SE',
mb_OK);
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
st:='����������:' + #13;
for i:=1  to n do
st:=st+IntToStr(i)+'.  '+ a[i]+#13;
Application.MessageBox(PChar('' + st + ''),
'Notepad SE',
mb_OK);
end;
end;
TextEdit.SetFocus;
except
end;
end;

procedure TMainForm.NewLinetemClick(Sender: TObject);
begin
try
ClickKey(VK_RETURN);
TextEdit.SetFocus;
except
end;
end;

function UpCaseRus(ch: Char): Char;
asm
CMP   AL,'a'
JB    @@exit
CMP   AL,'z'
JA    @@Rus
SUB   AL,'a' - 'A'
RET
@@Rus:
CMP   AL,'�'
JA    @@Exit
CMP   AL,'�'
JB    @@yo
SUB   AL,'�' - '�'
RET
@@yo:
CMP   AL,'?'
JNE   @@exit
MOV   AL,'?'
@@exit:
end;

function LoCaseRus( ch : Char ) : Char;
asm
CMP          AL,'A'
JB              @@exit
CMP          AL,'Z'
JA              @@Rus
ADD          AL,'a' - 'A'
RET
@@Rus:
CMP          AL,'�'
JA              @@Exit
CMP          AL,'�'
JB              @@yo
ADD          AL,'�' - '�'
RET
@@yo:
CMP          AL,'?'
JNE            @@exit
MOV          AL,'?'
@@exit:
end;

procedure TMainForm.TextEditKeyPress(Sender: TObject; var Key: Char);
var
line, col, indent: integer;
S: string;
begin
if BigTextItem.Checked then
begin
with Sender as TMEMO do
Key := UpCaseRus(Key);
end;
if SmallTextItem.Checked then
begin
with Sender as TMEMO do
Key := LoCaseRus(Key);
end;
if NewLineUnderPrecedingItem.Checked then
begin
if key = #13 then
begin
key := #0;
with Sender as TMEMO do
begin
line := PerForm(EM_EXLINEFROMCHAR, 0, SelStart);
Col := SelStart - Perform(EM_LINEINDEX, line, 0);
S:= Copy(lines[line], 1, col );
indent := 0;
while (indent < length(S)) and (S[indent + 1] in [' ', #9]) do
Inc(indent);
SelText := #13#10 + Copy(S, 1, indent);
end;
end;
end;
end;

procedure TMainForm.SmallTextItemClick(Sender: TObject);
begin
BigTextItem.Checked := False;
TextEdit.SetFocus;
end;

procedure TMainForm.BigTextItemClick(Sender: TObject);
begin
SmallTextItem.Checked := False;
TextEdit.SetFocus;
end;

procedure TMainForm.WMDropFiles(var Msg: TMessage);
var
Filename: array[0 .. 256] of Char;
Count, i: integer;
Res: Integer;
begin
try
Count := DragQueryFile(Msg.WParam, $FFFFFFFF, Filename, SizeOf(Filename));
for i:=0 to Count - 1 do
begin
DragQueryFile(Msg.WParam,i,Filename,SizeOf(Filename));
OpenDlg.FileName := FileName;
if TextEdit.Tag = 0 then
begin
if SetForm.ch18.Checked then
begin
if FullScreenItem.Checked = False then
FullScreenItem.Click;
end;
TextEdit.Clear;
MainForm.TextEdit.Lines.LoadFromFile(Filename);
MainForm.TextEdit.Tag := 0;
MainForm.SetFileName(FileName);
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
FileRun1.FileName := OpenDlg.FileName;
end
else begin
PostMessage(MainForm.Handle, WM_USER + 1024, 0, 0);
if LangForm.LangBox.ItemIndex  = 0 then
begin
Res := Application.MessageBox(PChar('Save changes to "' + ExtractFileName(FFileName) + '"?'),
'Notepad SE',
mb_YesNoCancel + mb_IconQuestion);
if Res = idYes then
begin
MainForm.BringToFront;
MainForm.SaveItemClick(Self);
if TextEdit.Tag = 1 then
Exit;
end;
if TextEdit.Tag = 0 then
begin
if SetForm.ch18.Checked then
begin
if FullScreenItem.Checked = False then
FullScreenItem.Click;
end;
TextEdit.Clear;
MainForm.TextEdit.Lines.LoadFromFile(Filename);
MainForm.TextEdit.Tag := 0;
MainForm.SetFileName(FileName);
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
FileRun1.FileName := OpenDlg.FileName;
end;
if SetForm.ch18.Checked then
begin
if FullScreenItem.Checked = False then
FullScreenItem.Click;
end;
if Res = idNo then
begin
TextEdit.Clear;
MainForm.TextEdit.Lines.LoadFromFile(Filename);
MainForm.TextEdit.Tag := 0;
MainForm.SetFileName(FileName);
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
FileRun1.FileName := OpenDlg.FileName;
end;
if Res = idCancel then Exit;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
Res := Application.MessageBox(PChar('��������� ��������� � "' + ExtractFileName(FFileName) + '"?'),
'Notepad SE',
mb_YesNoCancel + mb_IconQuestion);
if Res = idYes then
begin
MainForm.BringToFront;
MainForm.SaveItemClick(Self);
if TextEdit.Tag = 1 then
Exit;
end;
if TextEdit.Tag = 0 then
begin
if SetForm.ch18.Checked then
begin
if FullScreenItem.Checked = False then
FullScreenItem.Click;
end;
TextEdit.Clear;
MainForm.TextEdit.Lines.LoadFromFile(Filename);
MainForm.TextEdit.Tag := 0;
MainForm.SetFileName(FileName);
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
FileRun1.FileName := OpenDlg.FileName;
end;
if SetForm.ch18.Checked then
begin
if FullScreenItem.Checked = False then
FullScreenItem.Click;
end;
if Res = idNo then
begin
TextEdit.Clear;
MainForm.TextEdit.Lines.LoadFromFile(Filename);
MainForm.TextEdit.Tag := 0;
MainForm.SetFileName(FileName);
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
FileRun1.FileName := OpenDlg.FileName;
end;
if Res = idCancel then Exit;
end;
end;
end;
DragFinish(Msg.WParam);
except
end;
end;

procedure TMainForm.ScrollDownItemClick(Sender: TObject);
begin
try
SendMessage(TextEdit.Handle, WM_VSCROLL, SB_PAGEDOWN, 0);
TextEdit.SetFocus;
except
end;
end;

procedure TMainForm.ScrollUpItemClick(Sender: TObject);
begin
try
SendMessage(TextEdit.Handle, WM_VSCROLL, SB_PAGEUP, 0);
TextEdit.SetFocus;
except
end;
end;

procedure TMainForm.DontSaveItemClick(Sender: TObject);
begin
if DontSaveItem.Checked then
TextEdit.Tag := 0 else
TextEdit.Tag := 1;
TextEdit.SetFocus;
end;

procedure TMainForm.ClearAllItemClick(Sender: TObject);
begin
TextEdit.Clear;
TextEdit.Tag := 1;
if Length(TextEdit.Text) = 0 then
ClearAllItem.Enabled := False else
ClearAllItem.Enabled := True;
if Length(TextEdit.Text) = 0 then
CopyAndPasteItem.Enabled := False else
CopyAndPasteItem.Enabled := True;
TextEdit.SetFocus;
end;

procedure TMainForm.SymTableItemClick(Sender: TObject);
begin
WinExec('charmap', Sw_Restore);
TextEdit.SetFocus;
end;

procedure TMainForm.KeyBrdItemClick(Sender: TObject);
begin
WinExec('osk', Sw_Restore);
TextEdit.SetFocus; 
end;

procedure TMainForm.NewWinItemClick(Sender: TObject);
var
PC: array[0..255] of char;
S: String;
begin
{$ifdef Windows}
WinExec(StrPCopy(PC, ParamStr(0)+' '+S), Sw_Show);
{$else}
WinExec(StrPCopy(PC, ParamStr(0)+' "'+S+'"'), Sw_Show);
{$endif}
TextEdit.SetFocus;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
var
List: TStringList;
i: word;
begin
try
SaveFont('Parameters.ini', 'label', TextEdit.Font);
Shell_NotifyIcon(Nim_Delete, @Icon);
SM := GetSystemMenu(Handle, True);
MainForm.OnActivate := nil;
ApplicationEvents.Free;
PrinterSetupDlg.Free;
FormatBarImages.Free;
ToolBarImages.Free;
PageSetupDlg.Free;
TreeViewList.Free;
ContextMenu.Free;
ActionList.Free;
ReplaceDlg.Free;
StatusBar.Free;
TextEdit.Free;
MainMenu.Free;
TrayMenu.Free;
PrintDlg.Free;
ColorDlg.Free;
ToolBar2.Free;
ToolBar.Free;
OpenDlg.Free;
OpenDlg.Free;
CoolBar.Free;
Ini.Free;
T1.Free;
T2.Free;
T3.Free;
NumBoardPanel.Free;
AddBt.Free;
MultiplyBt.Free;
SubtracyBt.Free;
ReturnBt.Free;
DecimalBt.Free;
DevideBt.Free;
EightBt.Free;
SevenBt.Free;
ThreeBt.Free;
ZeroBt.Free;
NineBt.Free;
FiveBt.Free;
FourBt.Free;
NumBt.Free;
OneBt.Free;
SixBt.Free;
TwoBt.Free;
except
end;
end;

procedure TMainForm.OpenDlgShow(Sender: TObject);
const
LB_FILETYPES_ID = 1089;
LB_FILENAME_ID = 1090;
LB_DRIVES_ID = 1091;
Str1 = 'OK';
Str2 = '������';
Str3 = '���:';
Str4 = '���:';
Str5 = 'SE';
Str6 = 'OK';
Str7 = 'Cancel';
Str8 = 'Type:';
Str9 = 'Name:';
var
hOpenDialog: HWND;
begin
hOpenDialog := GetParent(OpenDlg.Handle);
if LangForm.LangBox.ItemIndex = 1 then
SendMessage(hOpenDialog, CDM_SETCONTROLTEXT, idOk, Longint(PChar(Str1))) else
SendMessage(hOpenDialog, CDM_SETCONTROLTEXT, idOk, Longint(PChar(Str6)));
if LangForm.LangBox.ItemIndex = 1 then
SendMessage(hOpenDialog, CDM_SETCONTROLTEXT, idCancel, Longint(PChar(Str2))) else
SendMessage(hOpenDialog, CDM_SETCONTROLTEXT, idCancel, Longint(PChar(Str7)));
if LangForm.LangBox.ItemIndex = 1 then
SendMessage(hOpenDialog, CDM_SETCONTROLTEXT, LB_FILETYPES_ID, Longint(PChar(Str3))) else
SendMessage(hOpenDialog, CDM_SETCONTROLTEXT, LB_FILETYPES_ID, Longint(PChar(Str8)));
if LangForm.LangBox.ItemIndex = 1 then
SendMessage(hOpenDialog, CDM_SETCONTROLTEXT, LB_FILENAME_ID, Longint(PChar(Str4))) else
SendMessage(hOpenDialog, CDM_SETCONTROLTEXT, LB_FILENAME_ID, Longint(PChar(Str9)));
SendMessage(hOpenDialog, CDM_SETCONTROLTEXT, LB_DRIVES_ID, Longint(PChar(Str5)));
end;

procedure TMainForm.T1Timer(Sender: TObject);
begin
T1.Enabled := False;
if SetForm.ch11.Checked then
SetWindowPos(MainForm.Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE) else
SetWindowPos(MainForm.Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE);
end;

procedure TMainForm.TextEditKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if not FullScreenItem.Checked then
begin
if Key = vk_Escape then
Close;
end;
if FullScreenItem.Checked then
begin
if Key = vk_Escape then
FullScreenItem.Click;
end;
if (Key = VK_INSERT) and (Shift = []) then
TextEdit.PasteFromClipboard;
if EndSymbolItem.Checked then
begin
if Key = vk_Return then
TextEdit.SelText := '.';
end;
end;

procedure TMainForm.MinimizeApplication(Sender: TObject);
begin
if SetForm.ch15.Checked then
begin
ShowWindow(Application.Handle, Sw_Hide);
Shell_NotifyIcon(Nim_Add, @Icon);
end;
end;

procedure TMainForm.SystemTrayMenu(var Oleg: TMessage);
var
Ico: TPoint;
begin
case Oleg.LParam of
Wm_LButtonDblClk:
begin
ShowWindow(Application.Handle, Sw_Show);
Application.Restore;
Shell_NotifyIcon(Nim_Delete, @Icon);
end;
Wm_RButtonDown:
begin
SetForegroundWindow(Handle);
GetCursorPos(Ico);
TrayMenu.Popup(Ico.X, Ico.Y); 
end;
end;
end;

procedure TMainForm.RestoreItemClick(Sender: TObject);
begin
ShowWindow(Application.Handle, Sw_Show);
Application.Restore;
Shell_NotifyIcon(Nim_Delete, @Icon);
end;

procedure TMainForm.FillTextFieldItemClick(Sender: TObject);
begin
ColorDlg.Color := TextEdit.Color;
if ColorDlg.Execute then
begin
MainForm.Color := ColorDlg.Color;
TextEdit.Color := ColorDlg.Color;
NumBoardPanel.Color := ColorDlg.Color;
BufferForm.BufferText.Color := ColorDlg.Color;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.NumLockItemClick(Sender: TObject);
begin
ClickKey(VK_NUMLOCK);
TextEdit.SetFocus;
end;

procedure TMainForm.CapsLockItemClick(Sender: TObject);
begin
ClickKey(VK_CAPITAL);
TextEdit.SetFocus;
end;

procedure TMainForm.ScrollLockItemClick(Sender: TObject);
begin
ClickKey(VK_SCROLL);
TextEdit.SetFocus;
end;

procedure TMainForm.InstallPrinterItemClick(Sender: TObject);
begin
ShellExecute(handle, nil, 'rundll32.exe',
'shell32.dll,SHHelpShortcuts_RunDLL AddPrinter',
'', SW_SHOWNORMAL);
TextEdit.SetFocus;
end;

procedure TMainForm.RussianLayoutItemClick(Sender: TObject);
begin
LoadKeyBoardLayout('00000419', KLF_Activate);
TextEdit.SetFocus;
end;

procedure TMainForm.EnglishLayoutItemClick(Sender: TObject);
begin
LoadKeyBoardLayout('00000409', KLF_Activate);
TextEdit.SetFocus;
end;

procedure TMainForm.CopyAndPasteItemClick(Sender: TObject);
begin
try
TextEdit.lines.Add(TextEdit.Lines.GetText);
TextEdit.SetFocus;
except
end;
end;

procedure TMainForm.DontLastUndoItemClick(Sender: TObject);
begin
TextEdit.ClearUndo;
TextEdit.SetFocus;
end;

procedure TMainForm.DeleteFirstLineItemClick(Sender: TObject);
begin
TextEdit.lines.Delete(TextEdit.SelLength);
TextEdit.SetFocus;
end;

procedure TMainForm.CutAllItemClick(Sender: TObject);
begin
TextEdit.SelectAll;
TextEdit.CutToClipboard;
end;

procedure TMainForm.ClearBufferItemClick(Sender: TObject);
begin
ClipBoard.Clear;
end;

procedure TMainForm.ReadOnlyItemClick(Sender: TObject);
begin
if ReadOnlyItem.Checked then
TextEdit.ReadOnly := True else
TextEdit.ReadOnly := False;
TextEdit.SetFocus;
end;

procedure TMainForm.MySystemMenu(var MySysMenu: TWmSysCommand);
begin
if MySysMenu.CmdType = About then
begin
AboutForm.Position := poMainFormCenter;
AboutForm.ShowModal;
end;
inherited;
end;

procedure TMainForm.LicItemClick(Sender: TObject);
begin
try
LicForm.Position := poMainFormCenter;
LicForm.ShowModal;
TextEdit.SetFocus;
except
end;
end;

procedure TMainForm.TextEditMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if ContextMenuItem.Checked then
begin
if Button = mbRight then
with (Sender as TControl).ClientToScreen(Point(X, Y)) do
ContextMenu.Popup(X, Y);
end else
begin
Exit;
end;
end;

procedure TMainForm.QuitItemClick(Sender: TObject);
begin
Close;
end;

procedure TMainForm.BufferItemClick(Sender: TObject);
begin
BufferForm.WindowState := wsNormal;
BufferForm.ClientHeight := 400;
BufferForm.ClientWidth := 600;
BufferForm.Show;
end;

procedure TMainForm.SortLinesItemClick(Sender: TObject);
var
t: TStringList;
begin
t:=TStringList.Create;
t.AddStrings(TextEdit.lines);
t.Sort;
TextEdit.Clear;
TextEdit.Lines.AddStrings(t);
TextEdit.SetFocus;
end;

procedure TMainForm.OpenPasteItemClick(Sender: TObject);
var
s: String;
TheMStream: TMemoryStream;
Zero: char;
begin
if LangForm.LangBox.ItemIndex = 0 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|All files (*.*)|*.*', ParamStr(1),
'Insert', s, True) then
begin
TheMStream := TMemoryStream.Create;
TheMStream.LoadFromFile(s);
TheMStream.Seek(0, soFromEnd);
Zero := #0;
TheMStream.write(Zero, 1);
TheMStream.Seek(0, soFromBeginning);
TextEdit.SetSelTextBuf(TheMStream.Memory);
TheMStream.Free;
end;
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|��� ����� (*.*)|*.*', ParamStr(1),
'�������� �� �����', s, True) then
begin
TheMStream := TMemoryStream.Create;
TheMStream.LoadFromFile(s);
TheMStream.Seek(0, soFromEnd);
Zero := #0;
TheMStream.write(Zero, 1);
TheMStream.Seek(0, soFromBeginning);
TextEdit.SetSelTextBuf(TheMStream.Memory);
TheMStream.Free;
end;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.RunItemClick(Sender: TObject);
begin
try
FileRun1.Execute;
except
end;
end;

procedure TMainForm.TimeDate2ItemClick(Sender: TObject);
begin
GetLocalTime(DT);
GetDateFormat(LOCALE_USER_DEFAULT,0,@DT,nil,s,sizeOf(s));
lstrcat(s,' ');
SendMessage(TextEdit.Handle, EM_REPLACESEL, 0, Longint(@s));
GetTimeFormat(LOCALE_USER_DEFAULT,0,@DT,nil,s,sizeOf(s));
SendMessage(TextEdit.Handle, EM_REPLACESEL, 0, Longint(@s));
TextEdit.SetFocus;
end;

procedure TMainForm.OpenDlgCanClose(Sender: TObject;
var CanClose: Boolean);
begin
if not FileExists(OpenDlg.FileName) then
begin
if LangForm.LangBox.ItemIndex  = 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(PChar('File "' +
ExtractFileName(OpenDlg.FileName) + '" not found.'
+ #13 + 'Check file name and repeat attempt.'),
'Open',
mb_IconWarning + mb_OK);
CanClose := False;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(PChar('���� "' +
ExtractFileName(OpenDlg.FileName) + '" �� ������.'
+ #13 + '��������� ������������ ����� ����� � ��������� �������.'),
'�������� �����',
mb_IconWarning + mb_OK);
CanClose := False;
end;
end;
end;

procedure TMainForm.ZoomInItemClick(Sender: TObject);
begin
TextEdit.Font.Size := TextEdit.Font.Size + 1;
SizeBox.Value := SizeBox.Value + 1;
TextEdit.SetFocus;
end;

procedure TMainForm.ZoomOutItemClick(Sender: TObject);
begin
TextEdit.Font.Size := TextEdit.Font.Size - 1;
SizeBox.Value := SizeBox.Value - 1;
TextEdit.SetFocus;
end;

procedure TMainForm.UndoItemClick(Sender: TObject);
begin
with TextEdit do
if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
TextEdit.SetFocus;
end;

procedure TMainForm.PerformFileOpen(const AFileName: string);
begin
TextEdit.Lines.LoadFromFile(AFileName);
SetFileName(AFileName);
TextEdit.SetFocus;
end;

procedure TMainForm.SetFileName(const FileName: String);
begin
if LangForm.LangBox.ItemIndex  = 0 then
begin
if RegForm.InputCode.Text = '������� ��������� ������' then
begin
FFileName := FileName;
Caption := Format('%s - %s', [ExtractFileName(FileName), 'Notepad SE']);
Application.Title := 'Notepad SE';
MainForm.RegProItem.Visible := False;
MainForm.RegProItem.Enabled := False;
MainForm.sp54.Visible := False;
AboutForm.tx10.Caption := 'REGISTRATION COPY';
AboutForm.tx10.ForegroundColor := clGreen;
end else
begin
FFileName := FileName;
Caption := Format('%s - %s', [ExtractFileName(FileName), 'Notepad SE']);
Application.Title := 'Notepad SE';
MainForm.RegProItem.Visible := True;
MainForm.RegProItem.Enabled := True;
MainForm.sp54.Visible := True;
AboutForm.tx10.Caption := 'UNREGISTRATION COPY';
AboutForm.tx10.ForegroundColor := clRed;
RegForm.InputCode.Text := '';
end;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
if RegForm.InputCode.Text = '������� ��������� ������' then
begin
FFileName := FileName;
Caption := Format('%s - %s', [ExtractFileName(FileName), 'Notepad SE']);
Application.Title := 'Notepad SE';
MainForm.RegProItem.Visible := False;
MainForm.RegProItem.Enabled := False;
MainForm.sp54.Visible := False;
AboutForm.tx10.Caption := '������������������ �����';
AboutForm.tx10.ForegroundColor := clGreen;
end else
begin
FFileName := FileName;
Caption := Format('%s - %s', [ExtractFileName(FileName), 'Notepad SE']);
Application.Title := 'Notepad SE';
MainForm.RegProItem.Visible := True;
MainForm.RegProItem.Enabled := True;
MainForm.sp54.Visible := True;
AboutForm.tx10.Caption := '�������������������� �����';
AboutForm.tx10.ForegroundColor := clRed;
RegForm.InputCode.Text := '';
end;
end;
end;

procedure TMainForm.TreeViewCustomDrawItem(Sender: TCustomTreeView;
Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
if cdsSelected in State then
begin
Sender.Canvas.Font.Style := Sender.Canvas.Font.Style + [fsBold];
Sender.Canvas.Font.Size := Sender.Canvas.Font.Size + 1;
end;
end;

procedure TMainForm.NewLineUnderPrecedingItemClick(Sender: TObject);
begin
TextEdit.SetFocus;
end;

procedure TMainForm.ContextMenuItemClick(Sender: TObject);
begin
TextEdit.SetFocus;
end;

procedure TMainForm.CutItemClick(Sender: TObject);
begin
TextEdit.SetFocus;
end;

procedure TMainForm.PasteItemClick(Sender: TObject);
begin
TextEdit.SetFocus;
end;

procedure TMainForm.CopyItemClick(Sender: TObject);
begin
TextEdit.SetFocus;
end;

procedure TMainForm.DelItemClick(Sender: TObject);
begin
TextEdit.SetFocus;
end;

procedure TMainForm.TreeViewClick(Sender: TObject);
begin
TextEdit.SetFocus;
end;

procedure ShowPropertiesDialog(FName: string);
var
SExInfo: TSHELLEXECUTEINFO;
begin
ZeroMemory(Addr(SExInfo),SizeOf(SExInfo));
SExInfo.cbSize := SizeOf(SExInfo);
SExInfo.lpFile := PChar(FName);
SExInfo.lpVerb := 'properties';
SExInfo.fMask  := SEE_MASK_INVOKEIDLIST;
ShellExecuteEx(Addr(SExInfo));
end;

procedure TMainForm.PropertiesItemClick(Sender: TObject);
begin
try
if FFileName = sUntitled then
Exit else
ShowPropertiesDialog(FFileName);
except
end;
end;

procedure TMainForm.fr2MouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
if MainForm.FullScreenItem.Checked = False then
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;
end;

procedure TMainForm.RegProItemClick(Sender: TObject);
begin
try
if GetKeyState(VK_Control) < 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(PChar('������� ��������� ������'),
'Notepad SE Key',
mb_IconAsterisk + mb_OK);
end else
begin
RegForm.Position := poMainFormCenter;
RegForm.ShowModal;
TextEdit.SetFocus;
end;
except
end;
end;

procedure TMainForm.T2Timer(Sender: TObject);
begin
MainForm.T2.Enabled := False;
SetFileName(FFileName);
end;

procedure TMainForm.GNUinetProjectItemClick(Sender: TObject);
begin
ShellExecute(Handle, nil, 'http://www.gnu.org/philosophy/', nil, nil, Sw_ShowNormal);
TextEdit.SetFocus;
end;

procedure TMainForm.CopyNameToBufferItemClick(Sender: TObject);
begin
Clipboard.AsText := ExtractFileName(FFileName);
end;

procedure TMainForm.CopyPathNameToBufferItemClick(Sender: TObject);
begin
Clipboard.AsText := (FFileName);
end;

procedure CopyFilesToClipboard(FileList: string);
var 
DropFiles: PDropFiles;
hGlobal: THandle;
iLen: Integer;
begin
try
iLen := Length(FileList) + 2;
FileList := FileList + #0#0;
hGlobal := GlobalAlloc(GMEM_SHARE or GMEM_MOVEABLE or GMEM_ZEROINIT,
SizeOf(TDropFiles) + iLen);
if (hGlobal = 0) then raise Exception.Create('Could not allocate memory!');
begin
DropFiles := GlobalLock(hGlobal);
DropFiles^.pFiles := SizeOf(TDropFiles);
Move(FileList[1], (PChar(DropFiles) + SizeOf(TDropFiles))^, iLen);
GlobalUnlock(hGlobal);
Clipboard.SetAsHandle(CF_HDROP, hGlobal);
end;
except
end;
end;

procedure TMainForm.CopyExeItemClick(Sender: TObject);
begin
CopyFilesToClipboard(ParamStr(0));
TextEdit.SetFocus;
end;

procedure TMainForm.CopyFileItemClick(Sender: TObject);
begin
CopyFilesToClipboard(FFileName);
TextEdit.SetFocus;
end;

procedure TMainForm.DeleteFileItemClick(Sender: TObject);
var
SHF: TSHFileOpStruct;
SFrom, STo: string;
begin
if LangForm.LangBox.ItemIndex  = 0 then
begin
if Application.MessageBox(PChar('Delete file ' + #13 + #13 + '"' + FFileName + '"' +
#13 + #13 +
'to Recycle Bin?'),
'Delete', mb_IconQuestion + Mb_YesNo) = idYes then
begin
SFrom := FFileName + #0#0;
SFrom := AnsiReplaceStr(SFrom, ';', #0);
with SHF do
begin
Wnd := 0;
pFrom := PChar(SFrom);
pTo := PChar(STo);
fFlags := FOF_ALLOWUNDO;
wFunc := FO_DELETE;
end;
if SHFileOperation(SHF) <> 0
then if SHF.fAnyOperationsAborted then
end;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
if Application.MessageBox(PChar('������� ���� ' + #13 + #13 + '"' + FFileName + '"' +
#13 + #13 +
'� �������?'),
'������� ����', mb_IconQuestion + Mb_YesNo) = idYes then
begin
SFrom := FFileName + #0#0;
SFrom := AnsiReplaceStr(SFrom, ';', #0);
with SHF do
begin
Wnd := 0;
pFrom := PChar(SFrom);
pTo := PChar(STo);
fFlags := FOF_ALLOWUNDO;
wFunc := FO_DELETE;
end;
if SHFileOperation(SHF) <> 0
then if SHF.fAnyOperationsAborted then
end;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.LangItemClick(Sender: TObject);
begin
LangForm.Position := poMainFormCenter;
LangForm.ShowModal;
TextEdit.SetFocus;
end;

procedure TMainForm.RusButtonClick(Sender: TObject);
begin
MainForm.SetFileName(FFileName);
SM := GetSystemMenu(Handle, True);
SM := GetSystemMenu(Handle, False);
InsertMenu(SM, Word(-1), Mf_Separator, Cherta, '');
InsertMenu(SM, Word(-2), Mf_ByPosition, About, '� ��������� Notepad SE...');
OpenDlg.Title := '�������';
MainForm.NewButton.Caption := '�����';
MainForm.OpenButton.Caption := '�������';
MainForm.SaveButton.Caption := '���������';
MainForm.PrintButton.Caption := '������';
MainForm.UndoButton.Caption := '��������';
MainForm.CutButton.Caption := '��������';
MainForm.CopyButton.Caption := '����������';
MainForm.PasteButton.Caption := '��������';
MainForm.DelButton.Caption := '�������';
MainForm.FindButton.Caption := '�����';
MainForm.ReplaceButton.Caption := '��������';
MainForm.SizeMaxButton.Caption := '���������';
MainForm.SizeMinButton.Caption := '���������';
MainForm.OptionsButton.Caption := '���������';
MainForm.SendButton.Caption := '�����';
MainForm.AboutButton.Caption := '� ���������';
MainForm.NewButton.Hint := '������� (Ctrl+N)';
MainForm.OpenButton.Hint := '������� (Ctrl+O)';
MainForm.SaveButton.Hint := '��������� (Ctrl+S)';
MainForm.PrintButton.Hint := '������ (Ctrl+P)';
MainForm.UndoButton.Hint := '������ ���������� ������������ ��������';
MainForm.CutButton.Hint := '�������� ����������� ��������� � ����� ������';
MainForm.CopyButton.Hint := '����������� ����������� ��������� � ����� ������';
MainForm.PasteButton.Hint := '������� � �������� ����������� ������ ������';
MainForm.DelButton.Hint := '�������� ����������� ���������';
MainForm.FindButton.Hint := '����� ����� (Ctrl+F)';
MainForm.ReplaceButton.Hint := '�������� ����� (Ctrl+H)';
MainForm.SizeMaxButton.Hint := '���������';
MainForm.SizeMinButton.Hint := '���������';
MainForm.OptionsButton.Hint := '��������� (Alt+Enter)';
MainForm.SendButton.Hint := '�������� ����� (Shift+F1)';
MainForm.AboutButton.Hint := '� ��������� (F1)';

MainForm.BoldButton.Caption := '������';
MainForm.ItalicButton.Caption := '������';
MainForm.UnderlineButton.Caption := '������������';
MainForm.StrikeOutButton.Caption := '�����������';
MainForm.DefaultButton.Caption := '�������';
MainForm.BoldButton.Hint := '������';
MainForm.ItalicButton.Hint := '������';
MainForm.UnderlineButton.Hint := '������������';
MainForm.StrikeOutButton.Hint := '�����������';
MainForm.DefaultButton.Hint := '�������';

MainForm.FileItem.Caption := '����';
MainForm.CreateItem.Caption := '�������...';
MainForm.OpenItem.Caption := '�������...';
MainForm.EditInMSWordItem.Caption := '������� � Microsoft Word';
MainForm.ResetOnLastSaveItem.Caption := '������������';
MainForm.ReloadFileItem.Caption := '������������� � �����';
MainForm.SaveItem.Caption := '���������';
MainForm.SaveAsItem.Caption := '��������� ���...';
MainForm.ImportFileItem.Caption := '������';
MainForm.ExportFileItem.Caption := '�������...';
MainForm.CopyFileItem.Caption := '����������';
MainForm.DeleteFileItem.Caption := '�������';
MainForm.RecycleBinItem.Caption := '�������';
MainForm.BufferItem.Caption := '����� ������';
MainForm.PageSetupItem.Caption := '��������� ��������...';
MainForm.PrintItem.Caption := '������...';
MainForm.InstallPrinterItem.Caption := '��������� ��������...';
MainForm.NewWinItem.Caption := '����� ����';
MainForm.CopyExeItem.Caption := '����������� Notepad.exe';
MainForm.PropertiesItem.Caption := '��������...';
MainForm.ExitItem.Caption := '�����';
MainForm.EditItem.Caption := '������';
MainForm.UndoItem.Caption := '��������';
MainForm.DontLastUndoItem.Caption := '������ �� ������';
MainForm.CutItem.Caption := '��������';
MainForm.CopyItem.Caption := '����������';
MainForm.PasteItem.Caption := '��������';
MainForm.DelItem.Caption := '�������';
MainForm.CutAllItem.Caption := '�������� ���';
MainForm.DeleteFirstLineItem.Caption := '������� ������ ������';
MainForm.DeleteActiveLineItem.Caption := '������� �������� ������';
MainForm.DeleteLastLineItem.Caption := '������� ��������� ������';
MainForm.CopyAndPasteItem.Caption := '���������� � ��������';
MainForm.ClearAllItem.Caption := '�������� ���';
MainForm.ClearBufferItem.Caption := '�������� ����� ������';
MainForm.FindItem.Caption := '�����...';
MainForm.FindNextItem.Caption := '����� �����...';
MainForm.ReplaceItem.Caption := '��������...';
MainForm.GotoLineItem.Caption := '�������...';
MainForm.InsertTabItem.Caption := '�������� Tab (������)';
MainForm.InsertSpaceItem.Caption := '�������� ������';
MainForm.DelTabItem.Caption := '������� ������ (������)';
MainForm.SelectAllItem.Caption := '�������� ���';
MainForm.RepBufferItem.Caption := '�������� � ������� ������';
MainForm.CopyPathNameToBufferItem.Caption := '���������� ���� � ��� �����';
MainForm.CopyNameToBufferItem.Caption := '���������� ��� �����';
MainForm.CopyDirPathToBufferItem.Caption := '���������� ���� � �����';
MainForm.ChangeAttrItem.Caption := '�������� ��������...';
MainForm.FormatItem.Caption := '������';
MainForm.FontItem.Caption := '�����...';
MainForm.FillTextFieldItem.Caption := '������� ����';
MainForm.ZoomInItem.Caption := '���������';
MainForm.ZoomOutItem.Caption := '���������';
MainForm.ResetScaleItem.Caption := '������������ �������...';
MainForm.NewLineUnderPrecedingItem.Caption := '��� ����������';
MainForm.WordWrapItem.Caption := '������� �����';
MainForm.DontSaveItem.Caption := '�� ���������';
MainForm.ContextMenuItem.Caption := '����������� ����';
MainForm.NewLinetem.Caption := '����� ������';
MainForm.NumberActiveLineItem.Caption := '����� ������';
MainForm.NumberWordsItem.Caption := '���������� ���� � ���������';
MainForm.EndSymbolItem.Caption := '������ ����� ������';
MainForm.BigTextItem.Caption := '���������';
MainForm.SmallTextItem.Caption := '��������';
MainForm.ScrollDownItem.Caption := '��������� ����';
MainForm.ScrollUpItem.Caption := '��������� �����';
MainForm.ReadOnlyItem.Caption := '������ ������';
MainForm.StatisticsItem.Caption := '����������...';
MainForm.ViewItem.Caption := '���';
MainForm.FullScreenItem.Caption := '������ �����';
MainForm.UserBarItem.Caption := '������ ������������';
MainForm.MainToolBarItem.Caption := '������ ������������';
MainForm.FormatToolBarItem.Caption := '������ ��������������';
MainForm.SortLinesItem.Caption := '����������� ������';
MainForm.StatusBarItem.Caption := '������ ���������';
MainForm.CodeItem.Caption := '���������';
MainForm.WINKOIItem.Caption := 'WIN � KOI';
MainForm.KOIWinItem.Caption := 'KOI � Win';
MainForm.WINDOSItem.Caption := 'WIN � DOS';
MainForm.DOSWINItem.Caption := 'DOS � WIN';
MainForm.ANSIKOI8Item.Caption := 'ANSI � KOI-8';
MainForm.KOI8ANSIItem.Caption := 'KOI-8 � ANSI';
MainForm.InsertProItem.Caption := '�������';
MainForm.OpenPasteItem.Caption := '�������� ��...';
MainForm.ClearPasteItem.Caption := '�������� � �������� ��...';
MainForm.InsertDirItem.Caption := '����������';
MainForm.InsertFullPathNameItem.Caption := '���� � ��� �����';
MainForm.InsertFileNameItem.Caption := '��� �����';
MainForm.InsertFullPathItem.Caption := '���� � �����';
MainForm.InsertClearBufItem.Caption := '�������� � ��������';
MainForm.TimeDate2Item.Caption := '���� � �����';
MainForm.AddTDItem.Caption := '�������������';
MainForm.DateItem.Caption := '����';
MainForm.TimeItem.Caption := '�����';
MainForm.TimeDateItem.Caption := '���� � ����� � ����� ������';
MainForm.AddTD2Item.Caption := '�������������';
MainForm.Date2Item.Caption := '����';
MainForm.Time2Item.Caption := '�����';
MainForm.EndLineItem.Caption := '� ����� ������';
MainForm.HomeLineItem.Caption := '� ������ ������';
MainForm.WinHeadItem.Caption := '��������� ����';
MainForm.ToolsItem.Caption := '�����������';
MainForm.RunItem.Caption := '���������';
MainForm.LangItem.Caption := '������� ����';
MainForm.SymTableItem.Caption := '������� ��������';
MainForm.WordPadItem.Caption := 'WordPad';
MainForm.KeyBrdItem.Caption := '����������';
MainForm.NumLockKeybdItem.Caption := 'NumLock ����������';
MainForm.RussianLayoutItem.Caption := '������� ���������';
MainForm.EnglishLayoutItem.Caption := '���������� ���������';
MainForm.KeyPressItem.Caption := 'Key Press';
MainForm.NumLockItem.Caption := 'Num Lock';
MainForm.CapsLockItem.Caption := 'Caps Lock';
MainForm.ScrollLockItem.Caption := 'Scroll Lock';
MainForm.SetupItem.Caption := '���������...';
MainForm.ShowWindowsMenuItem.Caption := '����';
MainForm.HelpItem.Caption := '������';
MainForm.SysInfoItem.Caption := '�������� � �������...';
MainForm.TipOnDayItem.Caption := '����� ���...';
MainForm.LicItem.Caption := '��������...';
MainForm.SendItem.Caption := '�������� �����';
MainForm.GNUinetProjectItem.Caption := '� ��������� ����������� �����������';
MainForm.RegProItem.Caption := '�����������...';
MainForm.HomePageItem.Caption := '�������� ��������...';
MainForm.AboutErrorItem.Caption := '�������� �� ������';
MainForm.SourseCodeItem.Caption := '�������� ���...';
MainForm.AboutItem.Caption := '� ��������� Notepad SE...';

MainForm.RestoreItem.Caption := '�������';
MainForm.QuitItem.Caption := '�����';

MainForm.Open2Item.Caption := '�������';
MainForm.EditInMSWord2Item.Caption := '������� � MS Word';
MainForm.OpenPaste2Item.Caption := '�������� ��...';
MainForm.ClearPaste2Item.Caption := '�������� � �������� ��...';
MainForm.Open2Item.Hint := '�������� ������������� ���������';
MainForm.EditInMSWord2Item.Hint := '������� ���������� ���������� ��������� � Microsoft Word';
MainForm.OpenPaste2Item.Hint := '�������� ���������� ������� ����� � ������� ������� �������';
MainForm.ClearPaste2Item.Hint := '�������� ������� ����� � ��������� � �������� ���������� ������� �����';

MainForm.Save2Item.Caption := '���������';
MainForm.SaveAs2Item.Caption := '��������� ���...';
MainForm.Undo2Item.Caption := '��������';
MainForm.Cut2Item.Caption := '��������';
MainForm.Copy2Item.Caption := '����������';
MainForm.Paste2Item.Caption := '��������';
MainForm.Del2Item.Caption := '�������';
MainForm.SelectAll2Item.Caption := '�������� ���';
MainForm.ScrollDown2Item.Caption := '��������� ����';
MainForm.ScrollUp2Item.Caption := '��������� �����';
MainForm.Print2Item.Caption := '������';
MainForm.KillMe1Item.Caption := '���� ����';
MainForm.KillMe2Item.Caption := '���� ����';
MainForm.Save2Item.Hint := '���������� ��������� ���������';
MainForm.SaveAs2Item.Hint := '���������� ��������� ��������� ��� ����� ������';
MainForm.Undo2Item.Hint := '������ ���������� ������������ ��������';
MainForm.Cut2Item.Hint := '�������� ����������� ��������� � ����� ������';
MainForm.Copy2Item.Hint := '����������� ����������� ��������� � ����� ������';
MainForm.Paste2Item.Hint := '������� � �������� ����������� ������ ������';
MainForm.Del2Item.Hint := '�������� ����������� ���������';
MainForm.SelectAll2Item.Hint := '��������� ���� ���� � ���������';
MainForm.ScrollDown2Item.Hint := '��������� ����';
MainForm.ScrollUp2Item.Hint := '��������� �����';
MainForm.Print2Item.Hint := '������ ��������� ���������';
MainForm.KillMe1Item.Hint := '���������� ������ ���������� ��� ���������� ��������� � ��������';
MainForm.KillMe2Item.Hint := '���������� ������ ���������� ��� ���������� ��������� � ��������';

MainForm.FileItem.Hint := '';
MainForm.CreateItem.Hint := '�������� ������ ���������';
MainForm.OpenItem.Hint := '�������� ������������� ���������';
MainForm.EditInMSWordItem.Hint := '������� ���������� ���������� ��������� � Microsoft Word';
MainForm.ResetOnLastSaveItem.Hint := '������� �������� � ���������� ������������ ���������';
MainForm.ReloadFileItem.Hint := '������������� ������� �������� ����';
MainForm.SaveItem.Hint := '���������� ��������� ���������';
MainForm.SaveAsItem.Hint := '���������� ��������� ��������� ��� ����� ������';
MainForm.ImportFileItem.Hint := '������������� ������������ ���� � ��������';
MainForm.ExportFileItem.Hint := '�������������� ������� �������� � ����';
MainForm.CopyFileItem.Hint := '���������� �������� ���� � ����� ������';
MainForm.DeleteFileItem.Hint := '������� �������� ���� � �������';
MainForm.RecycleBinItem.Hint := '������� �������';
MainForm.BufferItem.Hint := '�������� ����������� ������ ������';
MainForm.PageSetupItem.Hint := '��������� ���������� ��������';
MainForm.PrintItem.Hint := '������ ��������� ���������';
MainForm.InstallPrinterItem.Hint := '��������� ������ ��������';
MainForm.NewWinItem.Hint := '������� ����� �������� ���� Notepad SE';
MainForm.CopyExeItem.Hint := '����������� ����������� ���� Notepad SE � ����� ������';
MainForm.PropertiesItem.Hint := '���������� �������� ���������';
MainForm.ExitItem.Hint := '���������� ������';
MainForm.EditItem.Hint := '';
MainForm.UndoItem.Hint := '������ ���������� ������������ ��������';
MainForm.DontLastUndoItem.Hint := '������ �� ������ ���������� ��������� � ������';
MainForm.CutItem.Hint := '�������� ����������� ��������� � ����� ������';
MainForm.CopyItem.Hint := '����������� ����������� ��������� � ����� ������';
MainForm.PasteItem.Hint := '������� � �������� ����������� ������ ������';
MainForm.DelItem.Hint := '�������� ����������� ���������';
MainForm.CutAllItem.Hint := '�������� ���� ������� ����� � ����� ������';
MainForm.DeleteFirstLineItem.Hint := '������� ������ ������ � ������';
MainForm.DeleteActiveLineItem.Hint := '������� �������� ������ � ������';
MainForm.DeleteLastLineItem.Hint := '������� ��������� ������ � ������';
MainForm.CopyAndPasteItem.Hint := '���������� ���� ������� ����� � �������� � ��������';
MainForm.ClearAllItem.Hint := '�������� ����� � ���������';
MainForm.ClearBufferItem.Hint := '�������� ����� ������';
MainForm.FindItem.Hint := '����� ���������� ������� ������';
MainForm.FindNextItem.Hint := '������� ����� �� ���������� �������';
MainForm.ReplaceItem.Hint := '������ ������ ������ ������';
MainForm.GotoLineItem.Hint := '������� � ��������� ������';
MainForm.SelectAllItem.Hint := '��������� ���� ���� � ���������';
MainForm.RepBufferItem.Hint := '�������� ������� ����� � ��������� �� ����� ������������ � ������ ������';
MainForm.CopyPathNameToBufferItem.Hint := '���������� ������ ���� � ��� �������� ����� � ����� ������';
MainForm.CopyNameToBufferItem.Hint := '���������� ��� �������� ����� � ����� ������';
MainForm.CopyDirPathToBufferItem.Hint := '���������� ���� � �������� ����� � ����� ������';
MainForm.ChangeAttrItem.Hint := '�������� �������� �������� �����';

MainForm.FormatItem.Hint := '';
MainForm.FontItem.Hint := '�������� ����� ������';
MainForm.FillTextFieldItem.Hint := '����� ����� ������� ��� ���������';
MainForm.ZoomInItem.Hint := '��������� ������ ������ � ������ �� ���� �����';
MainForm.ZoomOutItem.Hint := '��������� ������ ������ � ������ �� ���� �����';
MainForm.ResetScaleItem.Hint := '������������ ������� ������ �� ���������';
MainForm.NewLineUnderPrecedingItem.Hint := '����� ������ � ������ ���������������� ��� ������';
MainForm.WordWrapItem.Hint := '������������ ������� ���� � ���������';
MainForm.DontSaveItem.Hint := '�� ��������� ���������� ����� ��� �������� ���������';
MainForm.ContextMenuItem.Hint := '���������� ����������� ���� Notepad SE';
MainForm.NewLinetem.Hint := '������� �� ����� ������ � ���������';
MainForm.NumberActiveLineItem.Hint := '�������� ����� �������� ������';
MainForm.NumberWordsItem.Hint := '���������� ���������� ����� � ������� ���������';
MainForm.EndSymbolItem.Hint := '��� �������� �� ����� ������ ��������� ����� � ����������';
MainForm.BigTextItem.Hint := '������� ������ ������ � ������� ��������';
MainForm.SmallTextItem.Hint := '������� ������ ������ � ������ ��������';
MainForm.ScrollDownItem.Hint := '��������� ����';
MainForm.ScrollUpItem.Hint := '��������� �����';
MainForm.ReadOnlyItem.Hint := '������ ������';
MainForm.StatisticsItem.Hint := '���������� ���������� ���������';
MainForm.ViewItem.Hint := '';
MainForm.FullScreenItem.Hint := '�������� ��������� � ������������� ������';
MainForm.UserBarItem.Hint := '���������� ������������ ���������������� ������';
MainForm.MainToolBarItem.Hint := '����������� ��� ������� ������ ������������';
MainForm.FormatToolBarItem.Hint := '����������� ��� ������� ������ ��������������';
MainForm.SortLinesItem.Hint := '������������� ��� ������ � ���������';
MainForm.WinHeadItem.Hint := '����������� ��� ������� ��������� ����';
MainForm.StatusBarItem.Hint := '����������� ��� ������� ������ �������';
MainForm.InsertProItem.Hint := '';
MainForm.OpenPasteItem.Hint := '�������� ���������� ������� ����� � ������� �������';
MainForm.ClearPasteItem.Hint := '�������� ������� ����� � ��������� � �������� ���������� ������� �����';
MainForm.InsertDirItem.Hint := '�������� ���������� ������� ����� � ������� ������� �������';
MainForm.InsertFullPathNameItem.Hint := '�������� ������ ���� � ��� ����� � ������� ������� �������';
MainForm.InsertFileNameItem.Hint := '�������� ��� ����� � ������� ������� �������';
MainForm.InsertFullPathItem.Hint := '�������� ������ ���� ����� � ������� ������� �������';
MainForm.InsertClearBufItem.Hint := '�������� � �������� ���������� ������ ������ � �������� ���';
MainForm.InsertTabItem.Hint := '�������� ���� ������ ���������';
MainForm.InsertSpaceItem.Hint := '�������� ������';
MainForm.DelTabItem.Hint := '������� ��������� ������';
MainForm.TimeDate2Item.Hint := '������� � ����� ������� ���� � ������� � ������� �������';
MainForm.AddTDItem.Hint := '�������������� ��������� ���� � �������';
MainForm.DateItem.Hint := '������� � ����� ������� ���� � ������� �������';
MainForm.TimeItem.Hint := '������� � ����� �������� ������� � ������� �������';
MainForm.TimeDateItem.Hint := '������� � ����� ������� ���� � ������� � ����� ������';
MainForm.AddTD2Item.Hint := '�������������� ��������� ���� � �������';
MainForm.Date2Item.Hint := '������� � ����� ������� ���� � ����� ������';
MainForm.Time2Item.Hint := '������� � ����� �������� ������� � ����� ������';
MainForm.EndLineItem.Hint := '������� � ����� ������� ������';
MainForm.HomeLineItem.Hint := '������� � ������ ������� ������';
MainForm.ToolsItem.Hint := '';
MainForm.RunItem.Hint := '��������� �������� ����������� ����������';
MainForm.LangItem.Hint := '������� ��������� ���������';
MainForm.SymTableItem.Hint := '������� ������� ��������';
MainForm.WordPadItem.Hint := '��������� ��������� �������� Microsoft WordPad';
MainForm.KeyBrdItem.Hint := '��������� �������� ����������';
MainForm.NumLockKeybdItem.Hint := '��������� NumLock ����������';
MainForm.RussianLayoutItem.Hint := '������������ ������� ���������';
MainForm.EnglishLayoutItem.Hint := '������������ ���������� ���������';
MainForm.KeyPressItem.Hint := '';
MainForm.NumLockItem.Hint := '';
MainForm.CapsLockItem.Hint := '';
MainForm.ScrollLockItem.Hint := '';
MainForm.SetupItem.Hint := '��������� ���������� ���������';
MainForm.HelpItem.Hint := '';
MainForm.SysInfoItem.Hint := '���������� ������� �������� � �������';
MainForm.TipOnDayItem.Hint := '������ �������� ������';
MainForm.LicItem.Hint := '��������� ������������ ����������';
MainForm.SendItem.Hint := '�������� ������ ������ ���������';
MainForm.GNUinetProjectItem.Hint := '���������� �� Open Source � � ������� GNU';
MainForm.RegProItem.Hint := '���������������� ������ ����� Notepad SE';
MainForm.HomePageItem.Hint := '������� �� web-���� �������';
MainForm.AboutErrorItem.Hint := '�������� ������ � ��������� ������';
MainForm.SourseCodeItem.Hint := '�������� �������� ��� Notepad SE';
MainForm.AboutItem.Hint := '����� �������� � ���������, �� ������ � ��������� ������';
//
FontForm.Caption := '�����';
FontForm.txt1.Caption := '���:';
FontForm.txt2.Caption := '������:';
FontForm.txt3.Caption := '����:';
FontForm.txt4.Caption := '�������� ���������';
FontForm.fr1.Caption := '�����:';
FontForm.fr2.Caption := '����������:';
FontForm.ch1.Caption := '������������';
FontForm.ch2.Caption := '�����������';
FontForm.ch3.Caption := '������';
FontForm.ch4.Caption := '������';
FontForm.ch5.Caption := '�������';
FontForm.OK.Caption := 'OK';
FontForm.Cancel.Caption := '������';
//
SetForm.Caption := '���������';
SetForm.tab1.Caption := '�����';
SetForm.tab2.Caption := '�������������';
SetForm.tab3.Caption := '�����';
SetForm.tab4.Caption := '���� ������';
SetForm.tab5.Caption := '������ �����';
SetForm.tab6.Caption := '��������������';
SetForm.ch1.Caption := '������������ "Drag and Drop"';
SetForm.ch2.Caption := '��������� ������ � Windows ��';
SetForm.ch3.Caption := '������ ������������';
SetForm.ch4.Caption := '��������� � ������ ������������';
SetForm.ch5.Caption := '��������� � ������ ���������';
SetForm.ch7.Caption := '������������ XP ���� (��������� ������������)';
SetForm.ch8.Caption := '������ ������ ������������';
SetForm.ch9.Caption := '������ ������ ���������';
SetForm.ch10.Caption := '��������� ���� �� ������ �����';
SetForm.ch11.Caption := '������ �������';
SetForm.ch12.Caption := '��������� ����������� ����';
SetForm.ch13.Caption := '������ ��������������';
SetForm.ch14.Caption := '��������� ���� � �������� ������';
SetForm.ch15.Caption := '�������������� ���� � �����';
SetForm.ch17.Caption := '������';
SetForm.ch18.Caption := '������������� �����';
SetForm.ch19.Caption := '������������� �����';
SetForm.tx1.Caption := '������� ���:';
SetForm.tx2.Caption := '�� ������� C���';
SetForm.tx3.Caption := '� ���� ����';
SetForm.tx4.Caption := '� ���� ���������';
SetForm.tx5.Caption := '� ������������';
SetForm.tx6.Caption := '� ���������';
SetForm.tx7.Caption := '��������� ��������� (.txt)';
SetForm.tx8.Caption := '����� ������������� (.ini)';
SetForm.tx9.Caption := '����� ������ (.dat)';
SetForm.tx10.Caption := '��������� ��������� (.txt)';
SetForm.tx11.Caption := '����� ������������� (.ini)';
SetForm.tx12.Caption := '����� ������ (.dat)';
SetForm.tx13.Caption := '��';
SetForm.tx14.Caption := '�� ������ ������������ �������������� ���������';
SetForm.tx15.Caption := '� ������������ ���������� �������.';
SetForm.tx16.Caption := '���� �� ��������� �������� �������� � ���������� �����';
SetForm.tx17.Caption := '��������������, ��� ����� ��������, ��� ���������� �����';
SetForm.tx18.Caption := '� ��������� ����� ����������� ������������� � �������� ';
SetForm.tx19.Caption := '�������� ������� (1000 �� = 1 ���.).';
SetForm.fr1.Caption := '��� �������� ���������:';
SetForm.fr2.Caption := '�������� ��� ��������� ��������� ���� HTML �������:';
SetForm.fr3.Caption := '��� ������� Notepad SE:';
SetForm.fr4.Caption := '��������:';
SetForm.fr5.Caption := '����� Notepad SE:';
SetForm.fr6.Caption := '��� �������� ������:';
SetForm.fr7.Caption := '��������� ���� ������ � Notepad SE:';
SetForm.fr8.Caption := '������� ���...';
SetForm.fr9.Caption := '��� ������������� ������:';
SetForm.fr10.Caption := '��� ������� Notepad SE:';
SetForm.fr11.Caption := '��� �������� �����:';
SetForm.fr12.Caption := '������������ �������������� ���������:';
SetForm.OK.Caption := 'OK';
SetForm.Cancel.Caption := '�������';
//
RegForm.Caption := 'Notepad - �����������';
RegForm.tx1.Caption := '���� ���:';
RegForm.tx2.Caption := '��� ��������������� ���:';
RegForm.ch1.Caption := '���������� ������ ��� �����';
RegForm.OK.Caption := 'OK';
RegForm.Cancel.Caption := '������';
//
LangForm.Caption := '�������� ����';
LangForm.txt1.Caption := '����:';
LangForm.OK.Caption := 'OK';
LangForm.Cancel.Caption := '������';
//
GoToForm.Caption := '������� �� ������';
GoToForm.txt1.Caption := '����� ������:';
GoToForm.OK.Caption := 'OK';
GoToForm.Cancel.Caption := '������';
//
AboutForm.Caption := '� ��������� "Notepad SE"';
AboutForm.tx1.Caption := 'Text Editor';
AboutForm.tx2.Caption := 'http://viacoding.mylivepage.ru/';
AboutForm.tx3.Caption := 'Notepad SE v 1.0';
AboutForm.tx4.Caption := '��� Windows 95/98/NT/2000/XP/Vista';
AboutForm.tx5.Caption := 'Copyright @2009 ������ ���� (aka ?���_�?)';
AboutForm.tx6.Caption := '�������� �������, �. ����������';
AboutForm.tx7.Caption := 'E-mail: GoodWinNix@mail.ru';
AboutForm.tx8.Caption := 'ICQ: 415660036';
AboutForm.tx9.Caption := 'E-mail: viacoding@mail.ru';
AboutForm.Cancel.Caption := '�������';
AboutForm.License.Clear;
AboutForm.License.Lines.Append('��������! ������ ����������� �������');
AboutForm.License.Lines.Append('������� �������� �� ��������� ������ �');
AboutForm.License.Lines.Append('�������������� ������������. ����������');
AboutForm.License.Lines.Append('��������������� ��� ���������������');
AboutForm.License.Lines.Append('������ ��������� ��� �� ����� ������');
AboutForm.License.Lines.Append('����������� � ��������� ���������������.');

LicForm.Caption := '������������ ����������';
LicForm.ch1.Caption := '���������� ��� �������';
LicForm.PrintText.Caption := '������';
LicForm.Cancel.Caption := '�������';

AttrForm.Caption := '��������';
AttrForm.fr1.Caption := '������� ����';
AttrForm.fr2.Caption := '��������';
AttrForm.ChReadOnly.Caption := '������ ������';
AttrForm.ChSystem.Caption := '���������';
AttrForm.ChArchive.Caption := '��������';
AttrForm.ChHidden.Caption := '�������';
AttrForm.OK.Caption := 'OK';
AttrForm.Cancel.Caption := '������';

TipForm.Caption := '����� ���';
TipForm.tx1.Caption := '� ������ �� ��, ���...';
TipForm.BackBt.Caption := '<< �����';
TipForm.NextBt.Caption := '������ >>';
TipForm.OK.Caption := '�������';

ModifyMenu(MainMenu.Handle, 8, mf_ByPosition or mf_Popup or mf_Help,
HelpItem.Handle, PChar(HelpItem.Caption));
end;

procedure TMainForm.EngButtonClick(Sender: TObject);
begin
MainForm.SetFileName(FFileName);
SM := GetSystemMenu(Handle, True);
SM := GetSystemMenu(Handle, False);
InsertMenu(SM, Word(-1), Mf_Separator, Cherta, '');
InsertMenu(SM, Word(-2), Mf_ByPosition, About, 'About Notepad SE...');
OpenDlg.Title := 'Open';
MainForm.NewButton.Caption := 'New';
MainForm.OpenButton.Caption := 'Open';
MainForm.SaveButton.Caption := 'Save';
MainForm.PrintButton.Caption := 'Print';
MainForm.UndoButton.Caption := 'Undo';
MainForm.CutButton.Caption := 'Cut';
MainForm.CopyButton.Caption := 'Copy';
MainForm.PasteButton.Caption := 'Paste';
MainForm.DelButton.Caption := 'Delete';
MainForm.FindButton.Caption := 'Find';
MainForm.ReplaceButton.Caption := 'Replace';
MainForm.SizeMaxButton.Caption := 'Shrink Font';
MainForm.SizeMinButton.Caption := 'Grow Font';
MainForm.OptionsButton.Caption := 'Preferences';
MainForm.SendButton.Caption := 'Send feedback';
MainForm.AboutButton.Caption := 'About';
MainForm.NewButton.Hint := 'Create (Ctrl+N)';
MainForm.OpenButton.Hint := 'Open (Ctrl+O)';
MainForm.SaveButton.Hint := 'Save (Ctrl+S)';
MainForm.PrintButton.Hint := 'Print (Ctrl+P)';
MainForm.UndoButton.Hint := 'Undo the last action';
MainForm.CutButton.Hint := 'Cut the selection and puts it on the Clipboard';
MainForm.CopyButton.Hint := 'Copy the selection and puts it on the Clipboard';
MainForm.PasteButton.Hint := 'Inserts Clipboard contents';
MainForm.DelButton.Hint := 'Delete the selection';
MainForm.FindButton.Hint := 'Find text (Ctrl+F)';
MainForm.ReplaceButton.Hint := 'Replace text (Ctrl+H)';
MainForm.SizeMaxButton.Hint := 'Shrink Font';
MainForm.SizeMinButton.Hint := 'Grow Font';
MainForm.OptionsButton.Hint := 'Preferences (Alt+Enter)';
MainForm.SendButton.Hint := 'Send feedback (Shift+F1)';
MainForm.AboutButton.Hint := 'About (F1)';

MainForm.BoldButton.Caption := 'Bold';
MainForm.ItalicButton.Caption := 'Italic';
MainForm.UnderlineButton.Caption := 'Underline';
MainForm.StrikeOutButton.Caption := 'Strike Out';
MainForm.DefaultButton.Caption := 'Default';
MainForm.BoldButton.Hint := 'Bold';
MainForm.ItalicButton.Hint := 'Italic';
MainForm.UnderlineButton.Hint := 'Underline';
MainForm.StrikeOutButton.Hint := 'Strike Out';
MainForm.DefaultButton.Hint := 'Default';

MainForm.FileItem.Caption := 'File';
MainForm.CreateItem.Caption := 'Create...';
MainForm.OpenItem.Caption := 'Open...';
MainForm.EditInMSWordItem.Caption := 'Edit in Microsoft Word';
MainForm.ResetOnLastSaveItem.Caption := 'Revert';
MainForm.ReloadFileItem.Caption := 'Reload';
MainForm.SaveItem.Caption := 'Save';
MainForm.SaveAsItem.Caption := 'Save As...';
MainForm.ImportFileItem.Caption := 'Import';
MainForm.ExportFileItem.Caption := 'Export...';
MainForm.CopyFileItem.Caption := 'Copy';
MainForm.DeleteFileItem.Caption := 'Delete';
MainForm.RecycleBinItem.Caption := 'Recycle Bin';
MainForm.BufferItem.Caption := 'Clipboard';
MainForm.PageSetupItem.Caption := 'Page Setup...';
MainForm.PrintItem.Caption := 'Print...';
MainForm.InstallPrinterItem.Caption := 'Installation of Printer...';
MainForm.NewWinItem.Caption := 'New Window';
MainForm.CopyExeItem.Caption := 'Copy Notepad SE binary file';
MainForm.PropertiesItem.Caption := 'Properties...';
MainForm.ExitItem.Caption := 'Exit';
MainForm.EditItem.Caption := 'Edit';
MainForm.UndoItem.Caption := 'Undo';
MainForm.DontLastUndoItem.Caption := 'Forbid on last change';
MainForm.CutItem.Caption := 'Cut';
MainForm.CopyItem.Caption := 'Copy';
MainForm.PasteItem.Caption := 'Paste';
MainForm.DelItem.Caption := 'Delete';
MainForm.CutAllItem.Caption := 'Cut all';
MainForm.DeleteFirstLineItem.Caption := 'Delete first Line';
MainForm.DeleteActiveLineItem.Caption := 'Delete Active Line';
MainForm.DeleteLastLineItem.Caption := 'Delete last Line';
MainForm.CopyAndPasteItem.Caption := 'Copy and Insert';
MainForm.ClearAllItem.Caption := 'Clear all';
MainForm.ClearBufferItem.Caption := 'Clear Clipboard';
MainForm.FindItem.Caption := 'Find...';
MainForm.FindNextItem.Caption := 'Find next...';
MainForm.ReplaceItem.Caption := 'Replace...';
MainForm.GotoLineItem.Caption := 'Go to Line...';
MainForm.SelectAllItem.Caption := 'Select All';
MainForm.RepBufferItem.Caption := 'Clipboard Text';
MainForm.CopyPathNameToBufferItem.Caption := 'Copy full path and name';
MainForm.CopyNameToBufferItem.Caption := 'Copy file name';
MainForm.CopyDirPathToBufferItem.Caption := 'Copy dir path';
MainForm.ChangeAttrItem.Caption := 'Attributes...';
MainForm.FormatItem.Caption := 'Format';
MainForm.FontItem.Caption := 'Font...';
MainForm.FillTextFieldItem.Caption := 'Background';
MainForm.ZoomInItem.Caption := 'Shrink Font';
MainForm.ZoomOutItem.Caption := 'Grow Font';
MainForm.ResetScaleItem.Caption := 'Reset Scale...';
MainForm.NewLineUnderPrecedingItem.Caption := 'Same Indentation';
MainForm.WordWrapItem.Caption := 'Word Wrap';
MainForm.DontSaveItem.Caption := 'Do not Save';
MainForm.ContextMenuItem.Caption := 'Context menu';
MainForm.NewLinetem.Caption := 'New Line';
MainForm.NumberActiveLineItem.Caption := 'Line Number';
MainForm.NumberWordsItem.Caption := 'Total Words';

MainForm.EndSymbolItem.Caption := 'End Line Symbol';
MainForm.BigTextItem.Caption := 'Capitals';
MainForm.SmallTextItem.Caption := 'Overline';
MainForm.ScrollDownItem.Caption := 'Scroll Down';
MainForm.ScrollUpItem.Caption := 'Scroll Up';
MainForm.ReadOnlyItem.Caption := 'Read Only';
MainForm.StatisticsItem.Caption := 'Statistics...';
MainForm.ViewItem.Caption := 'View';
MainForm.FullScreenItem.Caption := 'Full Screen';
MainForm.UserBarItem.Caption := 'User Bar';
MainForm.MainToolBarItem.Caption := 'Tool Bar';
MainForm.FormatToolBarItem.Caption := 'Format Bar';
MainForm.SortLinesItem.Caption := 'Sort Lines';
MainForm.WinHeadItem.Caption := 'Windows Heading';
MainForm.StatusBarItem.Caption := 'Status bar';
MainForm.CodeItem.Caption := 'Code';
MainForm.WINKOIItem.Caption := 'WIN to KOI';
MainForm.KOIWinItem.Caption := 'KOI to Win';
MainForm.WINDOSItem.Caption := 'WIN to DOS';
MainForm.DOSWINItem.Caption := 'DOS to WIN';
MainForm.ANSIKOI8Item.Caption := 'ANSI to KOI-8';
MainForm.KOI8ANSIItem.Caption := 'KOI-8 to ANSI';
MainForm.InsertProItem.Caption := 'Insert';
MainForm.OpenPasteItem.Caption := 'Insert...';
MainForm.ClearPasteItem.Caption := 'Clear and Insert...';
MainForm.InsertDirItem.Caption := 'Directory';
MainForm.InsertFullPathNameItem.Caption := 'Full path and name';
MainForm.InsertFileNameItem.Caption := 'File name';
MainForm.InsertFullPathItem.Caption := 'Dir path';
MainForm.InsertClearBufItem.Caption := 'Insert and Clear';
MainForm.InsertTabItem.Caption := 'Insert Tab (Retreat)';
MainForm.InsertSpaceItem.Caption := 'Insert Space';
MainForm.DelTabItem.Caption := 'Delete Symbol (Draw in)';
MainForm.TimeDate2Item.Caption := 'Date and Time';
MainForm.AddTDItem.Caption := 'Additional';
MainForm.DateItem.Caption := 'Date';
MainForm.TimeItem.Caption := 'Time';
MainForm.TimeDateItem.Caption := 'Date and Time in New Line';
MainForm.AddTD2Item.Caption := 'Additional';
MainForm.Date2Item.Caption := 'Date';
MainForm.Time2Item.Caption := 'Time';
MainForm.EndLineItem.Caption := 'End Line';
MainForm.HomeLineItem.Caption := 'Home Line';
MainForm.ToolsItem.Caption := 'Tools';
MainForm.RunItem.Caption := 'Run';
MainForm.LangItem.Caption := 'Language';
MainForm.SymTableItem.Caption := 'Symbols Table';
MainForm.WordPadItem.Caption := 'WordPad';
MainForm.KeyBrdItem.Caption := 'Keyboard';
MainForm.NumLockKeybdItem.Caption := 'NumLock Keyboard';
MainForm.RussianLayoutItem.Caption := 'Russian Layout';
MainForm.EnglishLayoutItem.Caption := 'English Layout';
MainForm.KeyPressItem.Caption := 'Key Press';
MainForm.NumLockItem.Caption := 'Num Lock';
MainForm.CapsLockItem.Caption := 'Caps Lock';
MainForm.ScrollLockItem.Caption := 'Scroll Lock';
MainForm.SetupItem.Caption := 'Preferences...';
MainForm.ShowWindowsMenuItem.Caption := 'Menu';
MainForm.HelpItem.Caption := 'Help';
MainForm.SysInfoItem.Caption := 'System Information...';
MainForm.TipOnDayItem.Caption := 'Tip of the Day';
MainForm.LicItem.Caption := 'License...';
MainForm.SendItem.Caption := 'Send feedback';
MainForm.GNUinetProjectItem.Caption := 'About Open Sourse';
MainForm.RegProItem.Caption := 'Registration...';
MainForm.HomePageItem.Caption := 'Notepad SE Home Page...';
MainForm.AboutErrorItem.Caption := 'Report a bug';
MainForm.SourseCodeItem.Caption := 'Source Code...';
MainForm.AboutItem.Caption := 'About Notepad SE...';

MainForm.RestoreItem.Caption := 'Open';
MainForm.QuitItem.Caption := 'Exit';

MainForm.Open2Item.Caption := 'Open';
MainForm.EditInMSWord2Item.Caption := 'Edit in MS Word';
MainForm.OpenPaste2Item.Caption := 'Insert...';
MainForm.ClearPaste2Item.Caption := 'Clear and Insert...';
MainForm.Open2Item.Hint := 'Open an existing document';
MainForm.EditInMSWord2Item.Hint := 'Edit text document in the Microsoft Word';
MainForm.OpenPaste2Item.Hint := 'Insert the contents of another file in the current cursor position';
MainForm.ClearPaste2Item.Hint := 'Clear all current text in the document and insert the contents of another file';

MainForm.Save2Item.Caption := 'Save';
MainForm.SaveAs2Item.Caption := 'Save As...';
MainForm.Undo2Item.Caption := 'Undo';
MainForm.Cut2Item.Caption := 'Cut';
MainForm.Copy2Item.Caption := 'Copy';
MainForm.Paste2Item.Caption := 'Paste';
MainForm.Del2Item.Caption := 'Delete';
MainForm.SelectAll2Item.Caption := 'Select all';
MainForm.ScrollDown2Item.Caption := 'Scroll Down';
MainForm.ScrollUp2Item.Caption := 'Scroll Up';
MainForm.Print2Item.Caption := 'Print';
MainForm.KillMe1Item.Caption := 'Kill Me';
MainForm.KillMe2Item.Caption := 'Kill Me';

MainForm.Save2Item.Hint := 'Save the document';
MainForm.SaveAs2Item.Hint := 'Save the document under a different name';
MainForm.Undo2Item.Hint := 'Undo the last action';
MainForm.Cut2Item.Hint := 'Cut the selection and puts it on the Clipboard';
MainForm.Copy2Item.Hint := 'Copy the selection and puts it on the Clipboard';
MainForm.Paste2Item.Hint := 'Inserts Clipboard contents';
MainForm.Del2Item.Hint := 'Delete the selection';
MainForm.SelectAll2Item.Hint := 'Select the entire document';
MainForm.ScrollDown2Item.Hint := 'Scroll Down';
MainForm.ScrollUp2Item.Hint := 'Scroll Up';
MainForm.Print2Item.Hint := 'Print the document';
MainForm.KillMe1Item.Hint := 'Shutdown application with out saving text and settings';
MainForm.KillMe2Item.Hint := 'Shutdown application with out saving text and settings';

MainForm.FileItem.Hint := '';
MainForm.CreateItem.Hint := 'Create a new document';
MainForm.OpenItem.Hint := 'Open an existing document';
MainForm.EditInMSWordItem.Hint := 'Edit text document in the Microsoft Word';
MainForm.ResetOnLastSaveItem.Hint := 'Revert the document to the last saved state';
MainForm.ReloadFileItem.Hint := 'Reload the current file';
MainForm.SaveItem.Hint := 'Save the document';
MainForm.SaveAsItem.Hint := 'Save the document under a different name';
MainForm.ImportFileItem.Hint := 'Import an existing file in the document';
MainForm.ExportFileItem.Hint := 'Export the current document in the file';
MainForm.CopyFileItem.Hint := 'Copy of current file to Clipboard';
MainForm.DeleteFileItem.Hint := 'Delete of current file to Recycle Bin';
MainForm.RecycleBinItem.Hint := 'Open the Recycle Bin';
MainForm.BufferItem.Hint := 'Preview of Clipboard';
MainForm.PageSetupItem.Hint := 'Change the printing options';
MainForm.PrintItem.Hint := 'Print the document';
MainForm.InstallPrinterItem.Hint := 'Install of new printers';
MainForm.NewWinItem.Hint := 'Create copy of current window Notepad SE';
MainForm.CopyExeItem.Hint := ' Copy executable Notepad SE file to Clipboard';
MainForm.PropertiesItem.Hint := 'Show properties of the document';
MainForm.ExitItem.Hint := 'Closed application';
MainForm.EditItem.Hint := '';
MainForm.UndoItem.Hint := 'Undo the last action';
MainForm.DontLastUndoItem.Hint := 'Forbid on last change in the text';
MainForm.CutItem.Hint := 'Cut the selection and puts it on the Clipboard';
MainForm.CopyItem.Hint := 'Copy the selection and puts it on the Clipboard';
MainForm.PasteItem.Hint := 'Inserts Clipboard contents';
MainForm.DelItem.Hint := 'Delete the selection';
MainForm.CutAllItem.Hint := 'Cuts all text and puts it on the Clipboard';
MainForm.DeleteFirstLineItem.Hint := 'Delete first line';
MainForm.DeleteActiveLineItem.Hint := 'Delete Active Line';
MainForm.DeleteLastLineItem.Hint := 'Delete last line';
MainForm.CopyAndPasteItem.Hint := 'Copyes all text and puts it in the document';
MainForm.ClearAllItem.Hint := 'Clear document';
MainForm.ClearBufferItem.Hint := 'Clear Clipboard';
MainForm.FindItem.Hint := 'Find the specified text';
MainForm.FindNextItem.Hint := 'Go to next specified text';
MainForm.ReplaceItem.Hint := 'Find the specified text with different text';
MainForm.GotoLineItem.Hint := 'Move the insertion point to a specific location';
MainForm.SelectAllItem.Hint := 'Select the entire document';
MainForm.RepBufferItem.Hint := 'Replace current text on contents text in the Clipboard';
MainForm.CopyPathNameToBufferItem.Hint := 'Copy full path and name the current file to Clipboard';
MainForm.CopyNameToBufferItem.Hint := 'Copy file name the current file to Clipboard';
MainForm.CopyDirPathToBufferItem.Hint := 'Copy dir path the current file to Clipboard';
MainForm.ChangeAttrItem.Hint := 'Change the attributes the current file';
MainForm.FormatItem.Hint := '';
MainForm.FontItem.Hint := 'Change fonts';
MainForm.FillTextFieldItem.Hint := 'Choose fill color for the document';
MainForm.ZoomInItem.Hint := 'Shrink font by one point';
MainForm.ZoomOutItem.Hint := 'Grow font by one point';
MainForm.ResetScaleItem.Hint := 'Reset font size by default';
MainForm.NewLineUnderPrecedingItem.Hint := 'New line in text at the first indentation';
MainForm.WordWrapItem.Hint := 'Use of word wrap in document';
MainForm.DontSaveItem.Hint := 'Do not saving changes on close document';
MainForm.ContextMenuItem.Hint := 'Show Notepad SE context menu ';
MainForm.NewLinetem.Hint := 'Go to the new line';
MainForm.NumberActiveLineItem.Hint := 'Show of the active line number';
MainForm.NumberWordsItem.Hint := 'Show total words in the current document';
MainForm.EndSymbolItem.Hint := 'On go to the new line insert dot over preceding';
MainForm.BigTextItem.Hint := 'Write text in document only at upper registry';
MainForm.SmallTextItem.Hint := 'Write text in document only at lower registry';
MainForm.ScrollDownItem.Hint := 'Scroll down';
MainForm.ScrollUpItem.Hint := 'Scroll up';
MainForm.ReadOnlyItem.Hint := 'Read only';
MainForm.StatisticsItem.Hint := 'Show statstics';
MainForm.ViewItem.Hint := '';
MainForm.FullScreenItem.Hint := 'View the document in the full screen mode';
MainForm.UserBarItem.Hint := 'Control showing of the user bar';
MainForm.MainToolBarItem.Hint := 'Show or hide of tool bar';
MainForm.FormatToolBarItem.Hint := 'Show or hide of format bar';
MainForm.SortLinesItem.Hint := 'Sorted all strings in the document';
MainForm.WinHeadItem.Hint := 'Show or hide of the window heading';
MainForm.StatusBarItem.Hint := 'Show or hide of status bar';
MainForm.InsertProItem.Hint := '';
MainForm.OpenPasteItem.Hint := 'Insert the contents of another file in the current cursor position';
MainForm.ClearPasteItem.Hint := 'Clear all current text in the document and insert the contents of another file';
MainForm.InsertDirItem.Hint := 'Insert the directory of another file in the current cursor position';
MainForm.InsertFullPathNameItem.Hint := 'Insert the full path and name in the current cursor position';
MainForm.InsertFileNameItem.Hint := 'Insert the file name in the current cursor position';
MainForm.InsertFullPathItem.Hint := 'Insert the file path in the current cursor position';
MainForm.InsertClearBufItem.Hint := 'Insert the contents of Clipboard and clear him';
MainForm.InsertTabItem.Hint := 'Insert one retreat tabulation';
MainForm.InsertSpaceItem.Hint := 'Insert Space';
MainForm.DelTabItem.Hint := 'Delete the last symbol';
MainForm.TimeDate2Item.Hint := 'Insert the date and time in the cursor position';
MainForm.AddTDItem.Hint := 'Additional parameters of date and time';
MainForm.DateItem.Hint := 'Insert the date in the cursor position';
MainForm.TimeItem.Hint := 'Insert the time in the cursor position';
MainForm.TimeDateItem.Hint := 'Insert the date and time in the new line';
MainForm.AddTD2Item.Hint := 'Additional parameters of date and time';
MainForm.Date2Item.Hint := 'Insert the date in the new line';
MainForm.Time2Item.Hint := 'Insert the time in the new line';
MainForm.EndLineItem.Hint := 'Go to the end of current line';
MainForm.HomeLineItem.Hint := 'Go to the home of current line';
MainForm.ToolsItem.Hint := '';
MainForm.RunItem.Hint := 'Run document of associated program';
MainForm.LangItem.Hint := 'Change user language interface';
MainForm.SymTableItem.Hint := 'Open of table symbols';
MainForm.WordPadItem.Hint := 'Run the text editor of Microsoft WordPad';
MainForm.KeyBrdItem.Hint := 'Run the screen keyboard';
MainForm.NumLockKeybdItem.Hint := 'Run the NumLock keyboard';
MainForm.RussianLayoutItem.Hint := 'Activated of russian keyboard';
MainForm.EnglishLayoutItem.Hint := 'Activated of english keyboard';
MainForm.KeyPressItem.Hint := '';
MainForm.NumLockItem.Hint := '';
MainForm.CapsLockItem.Hint := '';
MainForm.ScrollLockItem.Hint := '';
MainForm.SetupItem.Hint := 'Setup of parameters';
MainForm.HelpItem.Hint := '';
MainForm.SysInfoItem.Hint := 'Show the system information';
MainForm.TipOnDayItem.Hint := 'Read the tip of the day';
MainForm.LicItem.Hint := 'Read of the license agreement';
MainForm.SendItem.Hint := 'Send the letter to the author';
MainForm.GNUinetProjectItem.Hint := 'About Open Source and GNU project';
MainForm.RegProItem.Hint := 'Notepad SE registration';
MainForm.HomePageItem.Hint := 'Go to Notepad SE home page';
MainForm.AboutErrorItem.Hint := 'Write the report a bug to the author';
MainForm.SourseCodeItem.Hint := 'Give of Source Code of Notepad SE Project';
MainForm.AboutItem.Hint := 'Display program information, number version, and copyright';
//
FontForm.Caption := 'Font';
FontForm.txt1.Caption := 'Name:';
FontForm.txt2.Caption := 'Size:';
FontForm.txt3.Caption := 'Color:';
FontForm.txt4.Caption := 'Reset by default';
FontForm.fr1.Caption := 'Font:';
FontForm.fr2.Caption := 'Style:';
FontForm.ch1.Caption := 'Underline';
FontForm.ch2.Caption := 'Strike out';
FontForm.ch3.Caption := 'Bold';
FontForm.ch4.Caption := 'Italic';
FontForm.ch5.Caption := 'Default';
FontForm.OK.Caption := 'OK';
FontForm.Cancel.Caption := 'Cancel';
//
SetForm.Caption := 'Prefences';
SetForm.tab1.Caption := 'General';
SetForm.tab2.Caption := 'Additional';
SetForm.tab3.Caption := 'Shortcut';
SetForm.tab4.Caption := 'File association';
SetForm.tab5.Caption := 'Full Screen';
SetForm.tab6.Caption := 'Autosave';
SetForm.ch1.Caption := 'Drag and Drop';
SetForm.ch2.Caption := 'Run with Windows OS startup';
SetForm.ch3.Caption := 'User bar';
SetForm.ch4.Caption := 'Show hint in the user bar';
SetForm.ch5.Caption := 'Show hint in the status bar';
SetForm.ch7.Caption := 'Use of XP menu (you will need to restart the program)';
SetForm.ch8.Caption := 'Hide the user bar';
SetForm.ch9.Caption := 'Hide the status bar';
SetForm.ch10.Caption := 'Modal windows in the Task Bar';
SetForm.ch11.Caption := 'Always on Top';
SetForm.ch12.Caption := 'Input to Shell Context Menu';
SetForm.ch13.Caption := 'Hide Warning';
SetForm.ch14.Caption := 'Open file from last session';
SetForm.ch15.Caption := 'Minimize window to System Tray';
SetForm.ch17.Caption := 'Every';
SetForm.ch18.Caption := 'Full Screen Mode';
SetForm.ch19.Caption := 'Full Screen Mode';
SetForm.tx1.Caption := 'Input a Name:';
SetForm.tx2.Caption := 'Add to Desktop';
SetForm.tx3.Caption := 'Add to Start Menu';
SetForm.tx4.Caption := 'Add to Programs Menu';
SetForm.tx5.Caption := 'Add to Startup';
SetForm.tx6.Caption := 'Add to Favorite';
SetForm.tx7.Caption := 'Normal text files (.txt)';
SetForm.tx8.Caption := 'Initialization files (.ini)';
SetForm.tx9.Caption := 'Dates files (.dat)';
SetForm.tx10.Caption := 'Normal text files (.txt)';
SetForm.tx11.Caption := 'Initialization files (.ini)';
SetForm.tx12.Caption := 'Dates files (.dat)';
SetForm.tx13.Caption := '��';
SetForm.tx14.Caption := 'You can use the autosaving document in the set interval';
SetForm.tx15.Caption := 'time.';
SetForm.tx16.Caption := 'If you save the document unity in the drive and set option';
SetForm.tx17.Caption := 'of autosaving, it is will signify. what you changing text in';
SetForm.tx18.Caption := 'the document will be saving automatic in the set interval';
SetForm.tx19.Caption := 'time (1000 �� = 1 sec.).';
SetForm.fr1.Caption := 'On Editor Load:';
SetForm.fr2.Caption := 'Editor to view HTML sources:';
SetForm.fr3.Caption := 'On Notepad SE Start:';
SetForm.fr4.Caption := 'Charge:';
SetForm.fr5.Caption := 'Shortcut:';
SetForm.fr6.Caption := 'On Shortcut Creating:';
SetForm.fr7.Caption := 'Set file associations with Notepad SE:';
SetForm.fr8.Caption := 'Windows Notepad to...';
SetForm.fr9.Caption := 'On Full Screen Mode:';
SetForm.fr10.Caption := 'On Notepad SE run:';
SetForm.fr11.Caption := 'On file open:';
SetForm.fr12.Caption := 'Use of autosaving:';
SetForm.OK.Caption := 'OK';
SetForm.Cancel.Caption := 'Cancel';
//
RegForm.Caption := 'Notepad - registration';
RegForm.tx1.Caption := 'Your Name:';
RegForm.tx2.Caption := 'Your Code:';
RegForm.ch1.Caption := 'Show password on inputing words';
RegForm.OK.Caption := 'OK';
RegForm.Cancel.Caption := 'Cancel';
//
LangForm.Caption := 'Choose language';
LangForm.txt1.Caption := 'User Interface Language:';
LangForm.OK.Caption := 'OK';
LangForm.Cancel.Caption := 'Cancel';
//
GoToForm.Caption := 'Go to Line';
GoToForm.txt1.Caption := 'Line number:';
GoToForm.OK.Caption := 'OK';
GoToForm.Cancel.Caption := 'Cancel';
//
AboutForm.Caption := 'About "Notepad SE"';
AboutForm.tx1.Caption := 'Text Editor';
AboutForm.tx2.Caption := 'http://viacoding.mylivepage.ru/';
AboutForm.tx3.Caption := 'Notepad SE v 1.0';
AboutForm.tx4.Caption := 'for Windows 95/98/NT/2000/XP/Vista';
AboutForm.tx5.Caption := 'Copyright � 2009 Domani Oleh (aka ?���_�?)';
AboutForm.tx6.Caption := 'Perm Region, Chaykovskiy city';
AboutForm.tx7.Caption := 'E-mail: GoodWinNix@mail.ru';
AboutForm.tx8.Caption := 'ICQ: 415660036';
AboutForm.tx9.Caption := 'E-mail: viacoding@mail.ru';
AboutForm.Cancel.Caption := 'Close';
AboutForm.License.Clear;
AboutForm.License.Lines.Append('Attention! The given Software is protected');
AboutForm.License.Lines.Append('Laws on copyrights and international');
AboutForm.License.Lines.Append('Agreements. Illegal reproduction or');
AboutForm.License.Lines.Append('Distribution Given programs or her parts');
AboutForm.License.Lines.Append('Attracts civil and the criminal');
AboutForm.License.Lines.Append('liability');

LicForm.Caption := 'License agreement';
LicForm.ch1.Caption := 'Do Show at Startup program';
LicForm.PrintText.Caption := 'Print';
LicForm.Cancel.Caption := 'Cancel';

AttrForm.Caption := 'Attributes';
AttrForm.fr1.Caption := 'Current file';
AttrForm.fr2.Caption := 'Attributes';
AttrForm.ChReadOnly.Caption := 'Read Only';
AttrForm.ChSystem.Caption := 'System';
AttrForm.ChArchive.Caption := 'Archive';
AttrForm.ChHidden.Caption := 'Hidden';
AttrForm.OK.Caption := 'OK';
AttrForm.Cancel.Caption := 'Cancel';

TipForm.Caption := 'Tip of the Day';
TipForm.tx1.Caption := 'Do you want about know...';
TipForm.BackBt.Caption := '<< Previous';
TipForm.NextBt.Caption := 'Next >>';
TipForm.OK.Caption := 'Close';

ModifyMenu(MainMenu.Handle, 8, mf_ByPosition or mf_Popup or mf_Help,
HelpItem.Handle, PChar(HelpItem.Caption));
end;

procedure TMainForm.FindDlgFind(Sender: TObject);
var
SelPos,X,i:integer;
s,textE:string;
label 1;
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if frDown in FindDlg.Options then
TextEdit.SelStart:=TextEdit.SelStart+TextEdit.SelLength;
textE:=TextEdit.Text;
X:=TextEdit.SelStart+1;
if frDown in FindDlg.Options then
textE:=Copy(textE,X,Length(textE)-X+1) else
textE:=Copy(textE,0,X-1);
s:=FindDlg.FindText;
if frDown in FindDlg.Options then
begin
SelPos := Pos(s,textE);
if SelPos > 0 then begin
TextEdit.SelStart := SelPos + X - 2;
TextEdit.SelLength:=length(s);
end else
if LangForm.LangBox.ItemIndex = 0 then
Application.MessageBox(pchar('Text "' + FindDlg.FindText + '" not found.'),
'������� GNU',
mb_IconAsterisk + mb_OK);
if LangForm.LangBox.ItemIndex = 1 then
Application.MessageBox(pchar('����� "' + FindDlg.FindText + '" �� ������.'),
'������� GNU',
mb_IconAsterisk + mb_OK);
end else
begin
for i:=length(textE)-length(s) downto 1 do
if copy(textE,i,length(s))=s then begin
TextEdit.SelStart := i-1;
TextEdit.SelLength:=Length(s);
goto 1;
end;
if LangForm.LangBox.ItemIndex = 0 then
Application.MessageBox(pchar('Text "' + FindDlg.FindText + '" not found.'),
'������� GNU',
mb_IconAsterisk + mb_OK);
if LangForm.LangBox.ItemIndex = 1 then
Application.MessageBox(pchar('����� "' + FindDlg.FindText + '" �� ������.'),
'������� GNU',
mb_IconAsterisk + mb_OK);
1:
end;
end;

procedure TMainForm.ReloadFileItemClick(Sender: TObject);
begin
try
if LangForm.LangBox.ItemIndex = 0 then
begin
if FFileName = 'Untitled' then
begin
Exit
end else
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if Application.MessageBox('Do you want to reload the current file?',
'Reload',
mb_IconAsterisk + mb_YesNo) = idYes then
begin
PerformFileOpen(FFileName);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
FileRun1.FileName := FFileName;
end;
end;
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
if FFileName = 'Untitled' then
begin
Exit
end else
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if Application.MessageBox('�� ������� � ���, ��� ������ ������������� ������� ����?',
'������������ �����',
mb_IconAsterisk + mb_YesNo) = idYes then
begin
PerformFileOpen(FFileName);
TextEdit.Tag := 0;
ReadOnlyItem.Checked := False;
TextEdit.ReadOnly := False;
BigTextItem.Checked := False;
SmallTextItem.Checked := False;
FileRun1.FileName := FFileName;
end;
end;
end;
except
if LangForm.LangBox.ItemIndex = 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(PChar('Impossible reload the file "' + ExtractFileName(FFileName) + '".'
+ #13 + '' + #13 +
'May be the file was moving or removing.'),
'Error',
mb_IconError + mb_OK);
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(PChar('���������� ������������� ���� "' + ExtractFileName(FFileName) + '".'
+ #13 + '' + #13 +
'�������� ���� ��� ��������� ��� ������.'),
'������',
mb_IconError + mb_OK);
end;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.WinHeadItemClick(Sender: TObject);
begin
if WinHeadItem.Checked then
ShowProHeading else
HideProHeading;
end;

procedure TMainForm.ResetOnLastSaveItemClick(Sender: TObject);
begin
try
if LangForm.LangBox.ItemIndex = 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if Application.MessageBox('Revert file to last unsaved state?',
'Revert',
mb_IconAsterisk + mb_YesNo) = idYes then
begin
if FFileName = 'Untitled' then
begin
TextEdit.Clear;
TextEdit.Tag := 0;
FileRun1.FileName := FFileName;
ResetOnLastSaveItem.Enabled := False;
end else
begin
PerformFileOpen(FFileName);
TextEdit.Tag := 0;
FileRun1.FileName := FFileName;
ResetOnLastSaveItem.Enabled := False;
end;
end;
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if Application.MessageBox('������� � ���������� �������������� ���������?',
'������������',
mb_IconAsterisk + mb_YesNo) = idYes then
begin
if FFileName = 'Untitled' then
begin
TextEdit.Clear;
TextEdit.Tag := 0;
FileRun1.FileName := FFileName;
end else
begin
PerformFileOpen(FFileName);
TextEdit.Tag := 0;
FileRun1.FileName := FFileName;
end;
end;
end;
except
if LangForm.LangBox.ItemIndex = 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(PChar('Impossible reload the file "' + ExtractFileName(FFileName) + '".' +#13 +
'May be the file was moving or removing.'),
'Error',
mb_IconError + mb_OK);
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(PChar('���������� ������������� ���� "' + ExtractFileName(FFileName) + '".' +#13 +
'�������� ���� ��� ��������� ��� ������.'),
'������',
mb_IconError + mb_OK);
end;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.NumberActiveLineItemClick(Sender: TObject);
var
Y: LongInt;
begin
Y := TextEdit.Perform(EM_LINEFROMCHAR, TextEdit.SelStart, 0);
inc(Y);
if LangForm.LangBox.ItemIndex = 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(PChar('Active line number: ' + IntToStr(Y)),
'Notepad SE',
mb_IconAsterisk + mb_OK);
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox(PChar('����� �������� ������: ' + IntToStr(Y)),
'Notepad SE',
mb_IconAsterisk + mb_OK);
end;
TextEdit.SetFocus;
end;

procedure TMainForm.T3Timer(Sender: TObject);
begin
try
if FFileName = sUntitled then
Exit else
TextEdit.Lines.SaveToFile(FFileName);
TextEdit.Tag := 0;
except
end;
end;

procedure TMainForm.KillMe2ItemClick(Sender: TObject);
begin
PostMessage(FindWindow('', nil), wm_quit, 0, 0);
end;

function OpenSaveFileDialog(ParentHandle: THandle; const DefExt, Filter, InitialDir, Title: string; var FileName: string; IsOpenDialog: Boolean): Boolean;
var
ofn: TOpenFileName;
szFile: array[0..MAX_PATH] of Char;
begin
Result := False;
FillChar(ofn, SizeOf(TOpenFileName), 0);
with ofn do
begin
lStructSize := SizeOf(TOpenFileName);
hwndOwner := ParentHandle;
lpstrFile := szFile;
nMaxFile := SizeOf(szFile);
if (Title <> '') then
lpstrTitle := PChar(Title);
if (InitialDir <> '') then
lpstrInitialDir := PChar(InitialDir);
StrPCopy(lpstrFile, FileName);
lpstrFilter := PChar(CharReplace(Filter, '|', #0)+#0#0);
if DefExt <> '' then
lpstrDefExt := PChar(DefExt);
end;
if IsOpenDialog then
begin
if GetOpenFileName(ofn) then
begin
Result := True;
FileName := StrPas(szFile);
end;
end else
begin
if GetSaveFileName(ofn) then
begin
Result := True;
FileName := StrPas(szFile);
end;
end
end;

procedure TMainForm.ClearPasteItemClick(Sender: TObject);
var
s: String;
TheMStream: TMemoryStream;
Zero: char;
begin
if LangForm.LangBox.ItemIndex = 0 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|All files (*.*)|*.*', ParamStr(1),
'Insert', s, True) then
begin
MainForm.TextEdit.Clear;
TheMStream := TMemoryStream.Create;
TheMStream.LoadFromFile(s);
TheMStream.Seek(0, soFromEnd);
Zero := #0;
TheMStream.write(Zero, 1);
TheMStream.Seek(0, soFromBeginning);
TextEdit.SetSelTextBuf(TheMStream.Memory);
TheMStream.Free;
end;
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|��� ����� (*.*)|*.*', ParamStr(1),
'�������� �� �����', s, True) then
begin
MainForm.TextEdit.Clear;
TheMStream := TMemoryStream.Create;
TheMStream.LoadFromFile(s);
TheMStream.Seek(0, soFromEnd);
Zero := #0;
TheMStream.write(Zero, 1);
TheMStream.Seek(0, soFromBeginning);
TextEdit.SetSelTextBuf(TheMStream.Memory);
TheMStream.Free;
end;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.WordPadItemClick(Sender: TObject);
begin
ShellExecute(Handle, nil, 'WordPad.exe', nil,nil, Sw_ShowNormal);
TextEdit.SetFocus;
end;

procedure TMainForm.FontsBoxChange(Sender: TObject);
begin
TextEdit.Font.Name := FontsBox.Text;
TextEdit.SetFocus;
end;

procedure TMainForm.SizeBoxChange(Sender: TObject);
begin
try
TextEdit.Font.Size := SizeBox.Value;
FontForm.SizeBox.Value := SizeBox.Value;
TextEdit.SetFocus;
except
end;
end;

procedure TMainForm.ColorBoxChange(Sender: TObject);
begin
TextEdit.Font.Color := ColorBox.Selected;
FontForm.ColorBox.Selected := ColorBox.Selected;
TextEdit.SetFocus;
end;

procedure TMainForm.BoldButtonClick(Sender: TObject);
begin
try
FontForm.ch3.Checked := True;
TextEdit.SetFocus;
except
end;
try
FontForm.OKClick(Self);
except
end;
FontsBox.Text := TextEdit.Font.Name;
end;

procedure TMainForm.ItalicButtonClick(Sender: TObject);
begin
try
FontForm.ch4.Checked := True;
TextEdit.SetFocus;
except
end;
try
FontForm.OKClick(Self);
except
end;
FontsBox.Text := TextEdit.Font.Name;
end;

procedure TMainForm.UnderlineButtonClick(Sender: TObject);
begin
try
FontForm.ch1.Checked := not FontForm.ch1.Checked;
TextEdit.SetFocus;
except
end;
try
FontForm.OKClick(Self);
except
end;
FontsBox.Text := TextEdit.Font.Name;
end;

procedure TMainForm.StrikeOutButtonClick(Sender: TObject);
begin
try
FontForm.ch2.Checked := not FontForm.ch2.Checked;
TextEdit.SetFocus;
except
end;
try
FontForm.OKClick(Self);
except
end;
FontsBox.Text := TextEdit.Font.Name;
end;

procedure TMainForm.DefaultButtonClick(Sender: TObject);
begin
try
FontForm.ch5.Checked := True;
TextEdit.SetFocus;
except
end;
try
FontForm.OKClick(Self);
except
end;
FontsBox.Text := TextEdit.Font.Name;
end;

procedure TMainForm.MainToolBarItemClick(Sender: TObject);
begin
if MainToolBarItem.Checked then
ToolBar.Visible := True else
ToolBar.Visible := False;
TextEdit.SetFocus;
end;

procedure TMainForm.FormatToolBarItemClick(Sender: TObject);
begin
if FormatToolBarItem.Checked then
ToolBar2.Visible := True else
ToolBar2.Visible := False;
TextEdit.SetFocus;
end;

procedure TMainForm.ColorBoxCloseUp(Sender: TObject);
begin
TextEdit.SetFocus;
end;

procedure TMainForm.FontsBoxCloseUp(Sender: TObject);
begin
TextEdit.SetFocus;
end;

procedure TMainForm.TimeItemClick(Sender: TObject);
begin
GetLocalTime(DT);
GetTimeFormat(LOCALE_USER_DEFAULT,0,@DT,nil,s,sizeOf(s));
SendMessage(TextEdit.Handle, EM_REPLACESEL, 0, Longint(@s));
TextEdit.SetFocus;
end;

procedure TMainForm.DateItemClick(Sender: TObject);
begin
GetLocalTime(DT);
GetDateFormat(LOCALE_USER_DEFAULT,0,@DT,nil,s,sizeOf(s));
SendMessage(TextEdit.Handle, EM_REPLACESEL, 0, Longint(@s));
TextEdit.SetFocus;
end;

procedure TMainForm.Date2ItemClick(Sender: TObject);
begin
TextEdit.Lines.Add(DateToStr(Now));
TextEdit.SetFocus;
end;

procedure TMainForm.Time2ItemClick(Sender: TObject);
begin
TextEdit.Lines.Add(TimeToStr(Now));
TextEdit.SetFocus;
end;

procedure TMainForm.RepBufferItemClick(Sender: TObject);
begin
if ClipBoard.AsText = '' then
begin
ShowMessage('Empty');
Exit;
end else
begin
TextEdit.Clear;
TextEdit.PasteFromClipboard;
end;
end;

procedure TMainForm.InsertTabItemClick(Sender: TObject);
begin
ClickKey(vk_Tab);
TextEdit.SetFocus;
end;

procedure TMainForm.DelTabItemClick(Sender: TObject);
begin
ClickKey(VK_BACK);
TextEdit.SetFocus;
end;

procedure TMainForm.NumLockKeybdItemClick(Sender: TObject);
begin
if NumLockKeybdItem.Checked then
NumBoardPanel.Show else
NumBoardPanel.Hide;
end;

procedure TMainForm.EndLineItemClick(Sender: TObject);
begin
ClickKey(VK_END);
TextEdit.SetFocus;
end;

procedure TMainForm.HomeLineItemClick(Sender: TObject);
begin
ClickKey(VK_HOME);
TextEdit.SetFocus;
end;

procedure TMainForm.SourseCodeItemClick(Sender: TObject);
begin
if LangForm.LangBox.ItemIndex = 0 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if Application.MessageBox(
'Copyright @2009 Domani Oleh (aka ?���_�?)' + #13 +
'======================================' + #13 + #13 + '' +
'If you want to give of Source Code of Notepad SE Project' + #13
+ '(archives with components library by wish user) and'
+ #13 + 'also all next new version then send e-mail to the author.' + #13 +
'' +  #13 + '======================================' +  #13 +
'' +  #13 +
'Send mail now?',
'Notepad SE',
mb_IconAsterisk + mb_YesNo) = idYes then
begin
ShellExecute(Handle, 'open',
'mailto:GoodWinNix@mail.ru?Subject=Notepad SE Project' +
'&Body=Hello, please send me the source code program. Thanks!',
'', '', SW_SHOW);
end;
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if Application.MessageBox(
'Copyright @2009 ������ ���� (aka ?���_�?)' + #13 +
'======================================' + #13 + #13 + '' +
'���� �� ������ �������� �������� ��� ������� (����� ' + #13
+ '� ������������ �� ������� ������������), � �����'
+ #13 + '��� ����������� ����� ������ ���������, ��' + #13 +
'��������� ����������� ������ ������.' + #13 +
'' +  #13 + '======================================' +  #13 +
'' +  #13 +
'��������� ������ ������?',
'Notepad SE',
mb_IconAsterisk + mb_YesNo) = idYes then
begin
ShellExecute(Handle, 'open',
'mailto:GoodWinNix@mail.ru?Subject=Notepad SE Project' +
'&Body=Hello, please send me the source code program. Thanks!',
'', '', SW_SHOW);
end;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.InsertSpaceItemClick(Sender: TObject);
begin
ClickKey(VK_SPACE);
TextEdit.SetFocus;
end;

procedure TMainForm.ExportFileItemClick(Sender: TObject);
var
s: String;
begin
try
if LangForm.LangBox.ItemIndex = 0 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*', 'Normal text files (*.txt)|*.txt|Notepad SE files (*.nse)|*.nse|All files (*.*)|*.*',
ParamStr(1), 'Export', s, False) then begin
TextEdit.Lines.SaveToFile(s);
end;
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*', '��������� ��������� (*.txt)|*.txt|����� ������� Notepad SE (*.nse)|*.nse|��� ����� (*.*)|*.*',
ParamStr(1), '�������', s, False) then begin
TextEdit.Lines.SaveToFile(s);
end;
end;
except
end;
s := '';
TextEdit.SetFocus;
end;

procedure TMainForm.AboutErrorItemClick(Sender: TObject);
begin
ShellExecute(Handle, 'open',
'mailto:GoodWinNix@mail.ru?Subject=Notepad SE Project - [Error]' +
'&Body=Error',
'', '', SW_SHOW);
TextEdit.SetFocus;
end;

procedure TMainForm.InsertClearBufItemClick(Sender: TObject);
begin
TextEdit.PasteFromClipboard;
Clipboard.Clear;
end;

procedure MyIDPro(MyID: PItemIDList);
var
im: IMalloc;
begin
if Succeeded(shlobj.SHGetMalloc(im)) then
begin
im.Free(MyID); {$IFDEF VER90}
im.Release; {$ENDIF}
end;
end;

procedure TMainForm.RecycleBinItemClick(Sender: TObject);
var
exInfo: TShellExecuteInfo;
begin
FillChar(exInfo, SizeOf(exInfo), 0);
with exInfo do
begin
cbSize := SizeOf(exInfo);
fMask := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_IDLIST;
Wnd := Handle;
nShow := SW_SHOWNORMAL;
lpVerb := 'open';
ShGetSpecialFolderLocation(Handle, CSIDL_BITBUCKET, PItemIDLIst(lpIDList));
end;
ShellExecuteEx(@exInfo);
MyIDPro(exinfo.lpIDList);
end;

procedure TMainForm.ChangeAttrItemClick(Sender: TObject);
var
Attributes, NewAttributes: Word;
begin
AttrForm.Position := poMainFormCenter;
if LangForm.LangBox.ItemIndex = 0 then
begin
AttrForm.Caption := 'Attributes ' + ' - ' + ExtractFileName(FFileName);
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
AttrForm.Caption := '�������� ' + ' - ' + ExtractFileName(FFileName);
end;

with AttrForm do
begin
PathNameEd.Text := FFileName;
PathEd.Text := ExtractFileName(FFileName);
DirParh.Text := ExtractFilePath(FFileName);
Attributes := FileGetAttr(PathNameEd.Text);
ChReadOnly.Checked := (Attributes and faReadOnly) = faReadOnly;
ChArchive.Checked := (Attributes and faArchive) = faArchive;
ChSystem.Checked := (Attributes and faSysFile) = faSysFile;
ChHidden.Checked := (Attributes and faHidden) = faHidden;

if ShowModal <> mrCancel then
begin
NewAttributes := Attributes;
if ChReadOnly.Checked then NewAttributes := NewAttributes or faReadOnly
else NewAttributes := NewAttributes and not faReadOnly;
if ChArchive.Checked then NewAttributes := NewAttributes or faArchive
else NewAttributes := NewAttributes and not faArchive;
if ChSystem.Checked then NewAttributes := NewAttributes or faSysFile
else NewAttributes := NewAttributes and not faSysFile;
if ChHidden.Checked then NewAttributes := NewAttributes or faHidden
else NewAttributes := NewAttributes and not faHidden;
if NewAttributes <> Attributes then
FileSetAttr(PathNameEd.Text, NewAttributes);
end;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.CopyDirPathToBufferItemClick(Sender: TObject);
begin
Clipboard.AsText := ExtractFileDir(FFileName);
end;

procedure TMainForm.ImportFileItemClick(Sender: TObject);
var
res: Integer;
s: String;
begin
try
OpenDlg.FileName := '';
if TextEdit.Tag = 0 then
begin
if LangForm.LangBox.ItemIndex  = 0 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'Normal text files (*.txt)|*.txt|Notepad SE files (*.nse)|*.nse|All files (*.*)|*.*',
ParamStr(1), 'Import', s, True) then begin
TextEdit.Lines.LoadFromFile(s);
SetFileName(sUntitled);
TextEdit.Tag := 0;
FileRun1.FileName := '';
end;
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'��������� ��������� (*.txt)|*.txt|����� ������� Notepad SE (*.nse)|*.nse|��� ����� (*.*)|*.*',
ParamStr(1), '������', s, True) then begin
TextEdit.Lines.LoadFromFile(s);
SetFileName(sUntitled);
TextEdit.Tag := 0;
FileRun1.FileName := '';
end;
end;
end else
begin
if LangForm.LangBox.ItemIndex  = 1 then
begin
Res := Application.MessageBox(PChar('��������� ��������� � "' + ExtractFileName(FFileName) + '"?'),
'Notepad SE',
mb_YesNoCancel + mb_IconQuestion);
if Res = idYes then
begin
MainForm.BringToFront;
MainForm.SaveItemClick(Sender);
if TextEdit.Tag = 0 then
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'��������� ��������� (*.txt)|*.txt|����� ������� Notepad SE (*.nse)|*.nse|��� ����� (*.*)|*.*',
ParamStr(1), '������', s, True) then begin
TextEdit.Lines.LoadFromFile(s);
TextEdit.Tag := 0;
end;
Exit;
end;
if TextEdit.Tag = 0 then
begin
TextEdit.Clear;
TextEdit.Lines.LoadFromFile(s);
TextEdit.Tag := 0;
end;
if Res = idNo then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'��������� ��������� (*.txt)|*.txt|����� ������� Notepad SE (*.nse)|*.nse|��� ����� (*.*)|*.*',
ParamStr(1), '������', s, True) then begin
TextEdit.Lines.LoadFromFile(s);
TextEdit.Tag := 0;
end;
end else
begin
exit;
end;
if Res = idCancel then Exit;
end;
if LangForm.LangBox.ItemIndex  = 0 then
begin
Res := Application.MessageBox(PChar('Save changes to "' + ExtractFileName(FFileName) + '"?'),
'Notepad SE',
mb_YesNoCancel + mb_IconQuestion);
if Res = idYes then
begin
MainForm.BringToFront;
MainForm.SaveItemClick(Sender);
if TextEdit.Tag = 0 then
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'Normal text files (*.txt)|*.txt|Notepad SE files (*.nse)|*.nse|All files (*.*)|*.*',
ParamStr(1), 'Import', s, True) then begin
TextEdit.Lines.LoadFromFile(s);
TextEdit.Tag := 0;
end;
Exit;
end;
if TextEdit.Tag = 0 then
begin
TextEdit.Clear;
TextEdit.Lines.LoadFromFile(s);
TextEdit.Tag := 0;
end;
if Res = idNo then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'Normal text files (*.txt)|*.txt|Notepad SE files (*.nse)|*.nse|All files (*.*)|*.*',
ParamStr(1), 'Import', s, True) then begin
TextEdit.Lines.LoadFromFile(s);
TextEdit.Tag := 0;
end;
end else
begin
exit;
end;
if Res = idCancel then Exit;
end;
end;
except
end;
end;

procedure TMainForm.WMMouseActivate(var Msg: TMessage);
begin
inherited;
if ContextMenuItem.Checked then
begin
if Msg.LParamHi = 516 then

end;
end;

function MenuCallback(Wnd: HWND; Msg: UINT; WParam: WPARAM;
LParam: LPARAM): LRESULT; stdcall;
var
ContextMenu2: IContextMenu2;
begin
try
case Msg of
WM_CREATE:
begin
ContextMenu2 := IContextMenu2(PCreateStruct(lParam).lpCreateParams);
SetWindowLong(Wnd, GWL_USERDATA, Longint(ContextMenu2));
Result := DefWindowProc(Wnd, Msg, wParam, lParam);
end;
WM_INITMENUPOPUP:
begin
ContextMenu2 := IContextMenu2(GetWindowLong(Wnd, GWL_USERDATA));
ContextMenu2.HandleMenuMsg(Msg, wParam, lParam);
Result := 0;
end;
WM_DRAWITEM, WM_MEASUREITEM:
begin
ContextMenu2 := IContextMenu2(GetWindowLong(Wnd, GWL_USERDATA));
ContextMenu2.HandleMenuMsg(Msg, wParam, lParam);
Result := 1;
end; else
Result := DefWindowProc(Wnd, Msg, wParam, lParam);
end;
except
end;
end;

function CreateMenuCallbackWnd(const ContextMenu: IContextMenu2): HWND;
const
IcmCallbackWnd = 'ICMCALLBACKWND';
var
WndClass: TWndClass;
begin
try
FillChar(WndClass, SizeOf(WndClass), #0);
WndClass.lpszClassName := PChar(IcmCallbackWnd);
WndClass.lpfnWndProc := @MenuCallback;
WndClass.hInstance := HInstance;
Windows.RegisterClass(WndClass);
Result := CreateWindow(IcmCallbackWnd, IcmCallbackWnd, WS_POPUPWINDOW, 0,
0, 0, 0, 0, 0, HInstance, Pointer(ContextMenu));
except
end;
end;

procedure GetProperties(Path: String; MousePoint: TPoint; WC: TWinControl);
var
CoInit, AResult: HRESULT;
CommonDir, FileName: String;
Desktop, ShellFolder: IShellFolder;
pchEaten, Attr: Cardinal;
PathPIDL: PItemIDList;
FilePIDL: array [0..1] of PItemIDList;
ShellContextMenu: HMenu;
ICMenu: IContextMenu;
ICMenu2: IContextMenu2;
PopupMenuResult: BOOL;
CMD: TCMInvokeCommandInfo;
M: IMAlloc;
ICmd: Integer;
CallbackWindow: HWND;
begin
try
ShellContextMenu := 0;
Attr := 0;
PathPIDL := nil;
CallbackWindow := 0;
CoInit := CoInitializeEx(nil, COINIT_MULTITHREADED);
try
CommonDir := ExtractFilePath(Path);
FileName := ExtractFileName(Path);
if SHGetDesktopFolder(Desktop) <> S_OK then
RaiseLastOSError;
if FileName = '' then
begin
if (SHGetSpecialFolderLocation(0, CSIDL_DRIVES, PathPIDL) <> S_OK) or
(Desktop.BindToObject(PathPIDL,  nil,  IID_IShellFolder,
Pointer(ShellFolder)) <> S_OK) then RaiseLastOSError;
ShellFolder.ParseDisplayName(WC.Handle, nil, StringToOleStr(CommonDir),
pchEaten, FilePIDL[0], Attr);
AResult := ShellFolder.GetUIObjectOf(WC.Handle, 1, FilePIDL[0],
IID_IContextMenu, nil, Pointer(ICMenu));
end else
begin
if (Desktop.ParseDisplayName(WC.Handle, nil, StringToOleStr(CommonDir),
pchEaten, PathPIDL, Attr) <> S_OK) or
(Desktop.BindToObject(PathPIDL, nil, IID_IShellFolder,
Pointer(ShellFolder)) <> S_OK) then RaiseLastOSError;
ShellFolder.ParseDisplayName(WC.Handle, nil, StringToOleStr(FileName),
pchEaten, FilePIDL[0], Attr);
AResult := ShellFolder.GetUIObjectOf(WC.Handle, 1, FilePIDL[0],
IID_IContextMenu, nil, Pointer(ICMenu));
end;
if Succeeded(AResult) then
begin
ICMenu2 := nil;
ShellContextMenu := CreatePopupMenu;
if Succeeded(ICMenu.QueryContextMenu(ShellContextMenu, 0,
1, $7FFF, CMF_EXPLORE)) and
Succeeded(ICMenu.QueryInterface(IContextMenu2, ICMenu2)) then
CallbackWindow := CreateMenuCallbackWnd(ICMenu2);
try
PopupMenuResult := TrackPopupMenu(ShellContextMenu, TPM_LEFTALIGN or TPM_LEFTBUTTON
or TPM_RIGHTBUTTON or TPM_RETURNCMD,
MousePoint.X, MousePoint.Y, 0, CallbackWindow, nil);
finally
ICMenu2 := nil;
end;
if PopupMenuResult then
begin
ICmd := LongInt(PopupMenuResult) - 1;
FillChar(CMD, SizeOf(CMD), #0);
with CMD do
begin
cbSize := SizeOf(CMD);
hWND := WC.Handle;
lpVerb := MakeIntResource(ICmd);
nShow := SW_SHOWNORMAL;
end;
AResult := ICMenu.InvokeCommand(CMD);
if AResult <> S_OK then RaiseLastOSError;
end;
end;
finally
if FilePIDL[0] <> nil then
begin
SHGetMAlloc(M);
if M <> nil then
M.Free(FilePIDL[0]);
M:=nil;
end;
if PathPIDL <> nil then
begin
SHGetMAlloc(M);
if M <> nil then
M.Free(PathPIDL);
M:=nil;
end;
if ShellContextMenu <>0 then
DestroyMenu(ShellContextMenu);
if CallbackWindow <> 0 then
DestroyWindow(CallbackWindow);
ICMenu := nil;
ShellFolder := nil;
Desktop := nil;
if CoInit = S_OK then CoUninitialize;
end;
except
end;
end;

procedure TMainForm.ShowWindowsMenuItemClick(Sender: TObject);
var
xy: TPoint;
begin
try
xy := ClientToScreen(Point(0, 0));
GetProperties(FFileName, xy, Self);
TextEdit.SetFocus;
except
end;
end;

procedure TMainForm.NumberWordsItemClick(Sender: TObject);
begin
Application.MessageBox(PChar(inttostr(WordCount(TextEdit.Text))),
'Notepad SE',
mb_IconAsterisk + mb_OK);
end;

procedure TMainForm.ChangeMessageBoxPosition(var Msg: TMessage);
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
x := MainForm.Left + ((MainForm.Width - w) div 2);
if x < 0 then
x := 0
else if x + w > Screen.Width then x := Screen.Width - w;
y := MainForm.Top + ((MainForm.Height - h) div 2);
if y < 0 then y := 0
else if y + h > Screen.Height then y := Screen.Height - h;
SetWindowPos(MBHWnd, 0, x, y, 0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;
end;

procedure TMainForm.NumBtClick(Sender: TObject);
begin
ClickKey(VK_NUMLOCK);
end;

procedure TMainForm.DevideBtClick(Sender: TObject);
begin
ClickKey(VK_DIVIDE);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;

procedure TMainForm.MultiplyBtClick(Sender: TObject);
begin
ClickKey(VK_MULTIPLY);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;

procedure TMainForm.SubtracyBtClick(Sender: TObject);
begin
ClickKey(VK_SUBTRACT);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;

procedure TMainForm.SevenBtClick(Sender: TObject);
begin
if GetKeyState(VK_Numlock) and 1 = 0 then
begin
ClickKey(VK_HOME);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end else
begin
ClickKey(VK_NUMPAD7);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;
end;

procedure TMainForm.EightBtClick(Sender: TObject);
begin
if GetKeyState(VK_Numlock) and 1 = 0 then
begin
ClickKey(VK_UP);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end else
begin
ClickKey(VK_NUMPAD8);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;
end;

procedure TMainForm.NineBtClick(Sender: TObject);
begin
if GetKeyState(VK_Numlock) and 1 = 0 then
begin
ClickKey(VK_PRIOR);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end else
begin
ClickKey(VK_NUMPAD9);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;
end;

procedure TMainForm.SixBtClick(Sender: TObject);
begin
if GetKeyState(VK_Numlock) and 1 = 0 then
begin
ClickKey(VK_RIGHT);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end else
begin
ClickKey(VK_NUMPAD6);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;
end;

procedure TMainForm.FiveBtClick(Sender: TObject);
begin
ClickKey(VK_NUMPAD5);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;

procedure TMainForm.FourBtClick(Sender: TObject);
begin
if GetKeyState(VK_Numlock) and 1 = 0 then
begin
ClickKey(VK_LEFT);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end else
begin
ClickKey(VK_NUMPAD4);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;
end;

procedure TMainForm.OneBtClick(Sender: TObject);
begin
if GetKeyState(VK_Numlock) and 1 = 0 then
begin
ClickKey(VK_END);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end else
begin
ClickKey(VK_NUMPAD1);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;
end;

procedure TMainForm.TwoBtClick(Sender: TObject);
begin
if GetKeyState(VK_Numlock) and 1 = 0 then
begin
ClickKey(VK_DOWN);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end else
begin
ClickKey(VK_NUMPAD2);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;
end;

procedure TMainForm.ThreeBtClick(Sender: TObject);
begin
if GetKeyState(VK_Numlock) and 1 = 0 then
begin
ClickKey(VK_NEXT);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end else
begin
ClickKey(VK_NUMPAD3);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;
end;

procedure TMainForm.ZeroBtClick(Sender: TObject);
begin
if GetKeyState(VK_Numlock) and 1 = 0 then
begin
ClickKey(VK_INSERT);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end else
begin
ClickKey(VK_NUMPAD0);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;
end;

procedure TMainForm.DecimalBtClick(Sender: TObject);
begin
if GetKeyState(VK_Numlock) and 1 = 0 then
begin
ClickKey(VK_DELETE);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end else
begin
ClickKey(VK_DECIMAL);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;
end;

procedure TMainForm.AddBtClick(Sender: TObject);
begin
ClickKey(VK_ADD);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;

procedure TMainForm.ReturnBtClick(Sender: TObject);
begin
ClickKey(VK_RETURN);
MainForm.TextEdit.Tag := 1;
MainForm.TextEdit.SetFocus;
end;

procedure TMainForm.NumBoardPanelMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
NumBoardPanel.Perform(Wm_SysCommand, $f012, 0);
end;

procedure TMainForm.NumBoardPanelDblClick(Sender: TObject);
begin
NumBoardPanel.Hide;
NumLockKeybdItem.Checked := False;
end;

procedure TMainForm.ResetScaleItemClick(Sender: TObject);
begin
TextEdit.Font.Size := 10;
SizeBox.Value := 10;
end;

procedure TMainForm.InsertFullPathNameItemClick(Sender: TObject);
var
s: String;
begin
if LangForm.LangBox.ItemIndex = 0 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|All files (*.*)|*.*', ParamStr(1),
'Insert', s, True) then
begin
TextEdit.SelText := s;
end;
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|��� ����� (*.*)|*.*', ParamStr(1),
'�������� �� �����', s, True) then
begin
TextEdit.SelText := s;
end;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.InsertFileNameItemClick(Sender: TObject);
var
s: String;
begin
if LangForm.LangBox.ItemIndex = 0 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|All files (*.*)|*.*', ParamStr(1),
'Insert', s, True) then
begin
TextEdit.SelText := ExtractFileName(s);
end;
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|��� ����� (*.*)|*.*', ParamStr(1),
'�������� �� �����', s, True) then
begin
TextEdit.SelText := ExtractFileName(s);
end;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.InsertFullPathItemClick(Sender: TObject);
var
s: String;
begin
if LangForm.LangBox.ItemIndex = 0 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|All files (*.*)|*.*', ParamStr(1),
'Insert', s, True) then
begin
TextEdit.SelText := ExtractFileDir(s);
end;
end;
if LangForm.LangBox.ItemIndex = 1 then
begin
if OpenSaveFileDialog(MainForm.Handle, '*.*',
'Notepad SE files (*.nse)|*.nse|Normal text files (*.txt)|*.txt|��� ����� (*.*)|*.*', ParamStr(1),
'�������� �� �����', s, True) then
begin
TextEdit.SelText := ExtractFileDir(s);
end;
end;
TextEdit.SetFocus;
end;

procedure TMainForm.T4Timer(Sender: TObject);
begin
try
T4.Enabled := False;
if LicForm.ch1.Checked then
begin
LicForm.Position := poMainFormCenter;
LicForm.ShowModal;
end;
T4.Free;
except
end;
end;

procedure TMainForm.TipOnDayItemClick(Sender: TObject);
begin
try
TipForm.Position := poMainFormCenter;
TipForm.ShowModal;
except
end;
end;

procedure TMainForm.EditInMSWordItemClick(Sender: TObject);
var
Unknown: IUnknown;
Result: HResult;
AppProgID: String;
App: Variant;
Rng: Variant;
begin
try
AppProgID := 'Word.Application';
Result :=
GetActiveObject(ProgIDToClassID(AppProgID),nil,Unknown);
if (Result = MK_E_UNAVAILABLE) then
App := CreateOleObject(AppProgID) else
begin
App := GetActiveOleObject(AppProgID);
end;
App.Visible := True;
App.Documents.Add();
App.Documents.Item(1).Activate;
App.ActiveDocument.Paragraphs.Add;
Rng :=  App.ActiveDocument.Paragraphs.Item(1).Range;
Rng.InsertAfter(TextEdit.Text);
App:=Unassigned;
except
end;
TextEdit.SetFocus;
end;

procedure TMainForm.DeleteLastLineItemClick(Sender: TObject);
begin
TextEdit.Lines.Delete(TextEdit.Lines.Count - 1);
end;

procedure TMainForm.DeleteActiveLineItemClick(Sender: TObject);
begin
if TextEdit.Lines.Count <> 0 then
TextEdit.Lines.Delete(TextEdit.CaretPos. Y) ;
end;

procedure TMainForm.HomePageItemClick(Sender: TObject);
begin
ShellExecute(Handle, nil, 'http://www.viacoding.mylivepage.ru/', nil,nil, Sw_ShowNormal);
end;

procedure TMainForm.ReplaceDlgFind(Sender: TObject);
begin
with Sender as TReplaceDialog do
while True do
begin
if TextEdit.SelText <> FindText then
FindDlgFind(Sender);
if TextEdit.SelLength = 0 then Break;
TextEdit.SelText:= ReplaceText;
if not (frReplaceAll in Options) then Break;
end;
end;

procedure TMainForm.ReplaceDlgReplace(Sender: TObject);
var
SelPos: Integer;
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if ReplaceDlg.Execute then
begin
SelPos := Pos(ReplaceDlg.FindText, TextEdit.Lines.Text);
if SelPos > 0 then
begin
TextEdit.SelStart := SelPos - 1;
TextEdit.SelLength := Length(ReplaceDlg.FindText);
TextEdit.SelText := ReplaceDlg.ReplaceText;
end else
begin
if LangForm.LangBox.ItemIndex = 0 then
Application.MessageBox(pchar('Text "' + FindDlg.FindText + '" not found.'),
'������� GNU',
mb_IconAsterisk + mb_OK);
if LangForm.LangBox.ItemIndex = 1 then
Application.MessageBox(pchar('����� "' + FindDlg.FindText + '" �� ������.'),
'������� GNU',
mb_IconAsterisk + mb_OK);
end;
end;
end;

procedure TMainForm.Mail1ItemClick(Sender: TObject);
begin
ShellExecute(Handle,'open',
'mailto:GoodWinNix@mail.ru?Subject=Notepad SE Project'+
'',
'','',SW_SHOW);
end;

procedure TMainForm.Mail2ItemClick(Sender: TObject);
begin
ShellExecute(Handle,'open',
'mailto:viacoding@mail.ru?Subject=Notepad SE Project'+
'',
'','',SW_SHOW);
end;

function ANSI2KOI8R(S: string): string;
var
Ansi_CODE, KOI8_CODE: string;
i: integer;
begin
KOI8_CODE := '���������������������������������������������������������������ї�';
ANSI_CODE := '������������������������������������������������������������������';
Result := S;
for i := 1 to Length(Result) do
if Pos(Result[i], ANSI_CODE) > 0 then
Result[i] := KOI8_CODE[Pos(Result[i], ANSI_CODE)];
end;

function KOI8ANSI(S: string): string;
var
Ansi_CODE, KOI8_CODE: string;
i: integer;
begin
KOI8_CODE := '������������������������������������������������������������������';
ANSI_CODE := '���������������������������������������������������������������ї�';
Result := S;
for i := 1 to Length(Result) do
if Pos(Result[i], ANSI_CODE) > 0 then
Result[i] := KOI8_CODE[Pos(Result[i], ANSI_CODE)];
end;

function WinToKoi(Str: string): string;
var
i, j, Index: Integer;
begin
Result := '';
for i := 1 to Length(Str) do
begin
Index := -1;
for j := Low(Win) to High(Win) do
if Win[j] = Str[i] then
begin
Index := j;
Break;
end;
if Index = -1 then
Result := Result + Str[i]
else
Result := Result + Koi[Index];
end;
end;

function KoiToWin(Str: string): string;
var
i, j, Index: Integer;
begin
Result := '';
for i := 1 to Length(Str) do
begin
Index := -1;
for j := Low(Win) to High(Win) do
if Koi[j] = Str[i] then
begin
Index := j;
Break;
end;
if Index = -1 then
Result := Result + Str[i]
else
Result := Result + Win[Index];
end;
end;

procedure TMainForm.WINKOIItemClick(Sender: TObject);
begin
TextEdit.Text := WinToKoi(TextEdit.Text);
end;

procedure TMainForm.KOIWinItemClick(Sender: TObject);
begin
TextEdit.Text := KoiToWin(TextEdit.Text);
end;

procedure TMainForm.WINDOSItemClick(Sender: TObject);
var
s:array [0..255] of char;
begin
CharToOem(PChar(TextEdit.Text), s);
TextEdit.Text:=s;
end;

procedure TMainForm.DOSWINItemClick(Sender: TObject);
var
s:array [0..255] of char;
begin
OemToChar(PChar(TextEdit.Text) , s);
TextEdit.Text:=s;
end;

procedure TMainForm.ANSIKOI8ItemClick(Sender: TObject);
begin
TextEdit.Text := ANSI2KOI8R(TextEdit.Text);
end;

procedure TMainForm.KOI8ANSIItemClick(Sender: TObject);
begin
TextEdit.Text := KOI8ANSI(TextEdit.Text);
end;

end.







