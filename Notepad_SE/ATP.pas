unit ATP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, XPPanel, XPGroupBox, XPButton, XPCheckBox;

type
  TAttrForm = class(TForm)
    fr1: TXPGroupBox;
    PathNameEd: TEdit;
    PathEd: TEdit;
    DirParh: TEdit;
    fr2: TXPGroupBox;
    ChReadOnly: TXPCheckBox;
    ChArchive: TXPCheckBox;
    ChSystem: TXPCheckBox;
    ChHidden: TXPCheckBox;
    OK: TXPButton;
    Cancel: TXPButton;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    SM: HWND;

  public

  end;

var
  AttrForm: TAttrForm;

implementation

uses NP, SP;

{$R *.dfm}

procedure TAttrForm.FormMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;

procedure TAttrForm.FormShow(Sender: TObject);
begin
if SetForm.ch10.Checked then
begin
SetWindowLong(AttrForm.Handle, GWL_EXSTYLE,
GetWindowLOng(AttrForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
end;

procedure TAttrForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
Cancel.OnClick(Self);
end;

procedure TAttrForm.FormDestroy(Sender: TObject);
begin
AttrForm.OnActivate := nil;
ChArchive.Free;
ChHidden.Free;
ChSystem.Free;
DirParh.Free;
PathNameEd.Free;
PathEd.Free;
Cancel.Free;
fr1.Free;
fr2.Free;
OK.Free;
end;

procedure TAttrForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Cancel.SetFocus;
end;

procedure TAttrForm.CancelClick(Sender: TObject);
begin
AttrForm.Close;
end;

procedure TAttrForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

end.
