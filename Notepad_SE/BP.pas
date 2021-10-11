unit BP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ClipBrd, StdCtrls, ComCtrls;

type
  TBufferForm = class(TForm)
    BufferText: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
  private

  public

  end;

var
  BufferForm: TBufferForm;

implementation

uses SP, NP, CLP;

{$R *.dfm}

procedure TBufferForm.FormShow(Sender: TObject);
begin
BufferForm.WindowState := wsNormal;
BufferForm.ClientHeight := 400;
BufferForm.ClientWidth := 600;
BufferText.PasteFromClipboard;
BufferText.ReadOnly := True;
if SetForm.ch10.Checked then
begin
SetWindowLong(BufferForm.Handle, GWL_EXSTYLE,
GetWindowLOng(BufferForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
if LangForm.LangBox.ItemIndex  = 0 then
begin
if ClipBoard.AsText = '' then
BufferForm.Text := 'Clipboard is empty' else
BufferForm.Text := 'Clipboard';
end;
if LangForm.LangBox.ItemIndex  = 1 then
begin
if ClipBoard.AsText = '' then
BufferForm.Text := 'Буфер обмена не содержит текст' else
BufferForm.Text := 'Буфер обмена';
end;
end;

procedure TBufferForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
BufferText.ReadOnly := False;
BufferText.Clear;
end;

procedure TBufferForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key= vk_Escape then
BufferForm.Close;
end;

end.
