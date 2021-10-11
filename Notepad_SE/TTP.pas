unit TTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPButton, ExtCtrls, XPLabel, StdCtrls, IniFiles, rmBaseEdit,
  rmBtnEdit, rmComboBox, ComCtrls;

type
  TTipForm = class(TForm)
    TipText: TMemo;
    fr1: TPanel;
    tx1: TXPLabel;
    Logo: TImage;
    fr2: TPanel;
    OK: TXPButton;
    NextBt: TXPButton;
    tx2: TXPLabel;
    BackBt: TXPButton;
    FontsBox: TComboBoxEx;
    procedure NextBtClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure OKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BackBtClick(Sender: TObject);
    procedure FontsBoxChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    SM: HWND;

    Ini: TIniFile;

  public

  end;

var
  TipForm: TTipForm;

implementation

uses SP;

{$R *.dfm}

procedure TTipForm.NextBtClick(Sender: TObject);
begin
case NextBt.tag of
0: begin
NextBt.tag:=1;
TipText.Clear;
TipText.Text :=
'�������� �������� ��� ������� "Notepad SE" ����� ������. ' +
'��� ����� ����� ��������� �� GoodWinNix@mail.ru ������ � ' +
'�������� � ������� ��������� ����.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
1: begin
NextBt.tag:=2;
TipText.Clear;
TipText.Text :=
'������� Escape ��� ������������� ������ ��������� ��� �������������� ���� ' +
'� ������� �����, � ��� ������� ������ ���� ��������� ��� ����� �� ���������.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
2: begin
NextBt.tag:=3;
TipText.Clear;
TipText.Text :=
'��� ����, ����� �������� ��������������� ���� ��������, ����� ������� �� ���� ' +
'"������" ������� "�����������" � ������� �������� Ctrl. ' +
'��������� �������� freeware. �������������������� ������ �������� �������������� �������������� ' +
'�����������. ����������� ������ ������������� (������� ���������� IrfanView ��� Light Alloy).';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
3: begin
NextBt.tag:=4;
TipText.Clear;
TipText.Text :=
'���������� ����� "��������� ���� � �������� ������" � ��� ��������� ������� ' +
'Notepad SE ������� ��������� ����, � ������� �� ��������. � ��������� ������� ' +
'��� ����� ������.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
4: begin
NextBt.tag:=5;
TipText.Clear;
TipText.Text :=
'��� ������� ������ � ������� ������� ������� ���������� ������� ������� Ctrl+V, ' +
'����� ������� ������������ ������ �� ��������, ��� ������� Insert. ' +
'��� ����, ����� ������, ����� �� ����� � ������� �� ������ ������, ����� ���������� ' +
'� ������ ��������� Notepad SE �� ������� ������, ���� ��� ����� ��������� "Insert", �� ' +
'����� �����, ����� "Empty" ���.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
5: begin
NextBt.tag:=6;
TipText.Clear;
TipText.Text :=
'� ���� "��������" ����� �����������, � ����� �������� �������� �����.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
6: begin
NextBt.tag:=7;
TipText.Clear;
TipText.Text :=
'� Notepad SE ������������� "������ �������� ����", � ������� ����� ������ �������� ��� ' +
'������������� ������. ��� ����, ����� ���������� ���, �������� �� ���� "���" ' +
'������� "������ ����" ��� ������� ������� ������� Ctrl+F11.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
7: begin
NextBt.tag:=8;
TipText.Clear;
TipText.Text :=
'� ���� "������" �������� ������� "�������...". ' +
'� ���� "������� �� ������" ������� ����� ������, � ������� ��������� ����������� ������. ' +
'� ������ ��������� Notepad SE �� ������ ������ ���������� � ����� ������ ���������� ������. ' +
'���� ������ ��������� ������, �� ��� ��������� �������� ������ � ������ ������� ������� ������� ' +
'Shift+Alt+N.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
8: begin
NextBt.tag:=9;
TipText.Clear;
TipText.Text :=
'� Notepad SE ������������� ����� ������ �������� ����� ����, "���������" � "��������", ' +
'�������������� ������ � ������� �������� ��� ������ ��������. ���� �� �� ������, �� ������ ' +
'��������� �� ��������, ������� ����������� ������������� ��� ������ ������ ���������� ' +
'CAPS LOCK � Shift. ��� �������� ������ ��������� ��������� ������������ �� ���������.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
9: begin
NextBt.tag:=10;
TipText.Clear;
TipText.Text :=
'��������� ���������� � ������� ������ ���������������� �� ���� ����� ���������. ' +
'�������� ���� "������" � �������� ����� "�����...". ' +
'�������� ����������� �������� � ����� "�����", "����������" � "������". ' +
'������ ����, ��� ����� ��������� ��������� �����, ������������ � ���� "�������". ' +
'������ �����, ������� ������ ��.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
10: begin
NextBt.tag:=11;
TipText.Clear;
TipText.Text :=
'��� ���������� �������� ������������� �������������� � ��������� ����� � ���� ' +
'������ ������������� ��������. ��� ��������� ��������� ���� Notepad SE ��� ������ � ' +
'������������ ��������� ����, �� ������ �������� � ����������� ����������� VCL Delphi. ' +
'�� � ���� ������ ��� �������� �������������� �������� ��������������, � �������, ������ ' +
'�������-�������������� TXPCheckBox ������������ ����������� ���������� TCheckBox.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
11: begin
NextBt.tag:=12;
TipText.Clear;
TipText.Text :=
'���� �� �������� ����� - ���� ���������� ��� ������ � ���� ���������, ����������, �������� ' +
'� ��� �� ������ "GoodWinNix@mail.ru" ��� �� ICQ: 415660036, � �������� � ��������� ������ ' +
'��������� ��� ����� ���������.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
12: begin
NextBt.tag:=0;
NextBt.OnClick(Self);
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
end;
TipText.SetFocus;
end;

procedure TTipForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
TipText.SetFocus;
end;

procedure TTipForm.FormDestroy(Sender: TObject);
begin
TipForm.OnActivate := nil;
TipText.Free;
BackBt.Free;
NextBt.Free;
Logo.Free;
tx1.Free;
tx2.Free;
OK.Free;
end;

procedure TTipForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;

procedure TTipForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
TipForm.Close;
end;

procedure TTipForm.OKClick(Sender: TObject);
begin
TipForm.Close;
end;

procedure TTipForm.FormShow(Sender: TObject);
begin
NextBt.Tag := NextBt.Tag - 1;
NextBt.OnClick(Self);
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
TipText.Font.Size := StrToInt(FontsBox.Text);
if SetForm.ch10.Checked then
begin
SetWindowLong(TipForm.Handle, GWL_EXSTYLE,
GetWindowLOng(TipForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
FontsBox.Height := 17;
end;

procedure TTipForm.FormCreate(Sender: TObject);
begin
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
NextBt.Tag := Ini.ReadInteger('Tip window', 'Tip position', NextBt.Tag);
FontsBox.ItemIndex := Ini.ReadInteger('Tip window', 'Tip text size', FontsBox.ItemIndex);
except
end;
end;

procedure TTipForm.BackBtClick(Sender: TObject);
begin
if NextBt.Tag <= 1 then
begin
NextBt.Tag := 11;
NextBt.OnClick(Self);
end else
begin
NextBt.Tag := NextBt.Tag - 2;
NextBt.OnClick(Self);
end;
end;

procedure TTipForm.FontsBoxChange(Sender: TObject);
begin
TipText.Font.Size := StrToInt(FontsBox.Text);
end;

procedure TTipForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

end.
