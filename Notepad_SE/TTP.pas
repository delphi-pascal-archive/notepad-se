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
'Получить исходный код проекта "Notepad SE" может каждый. ' +
'Для этого нужно отправить на GoodWinNix@mail.ru письмо с ' +
'пометкой о высылке исходного кода.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
1: begin
NextBt.tag:=2;
TipText.Clear;
TipText.Text :=
'Клавиша Escape при полноэкранном режиме действует как восстановление окна ' +
'в обычный режим, а при обычном режиме окна действует как выход из редактора.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
2: begin
NextBt.tag:=3;
TipText.Clear;
TipText.Text :=
'Для того, чтобы получить регистрационный ключ продукта, нужно выбрать из меню ' +
'"Помощь" команду "Регистрация" с нажатой клавишей Ctrl. ' +
'Программа является freeware. Незарегистрированная версия продукта неограничевает функциональные ' +
'возможности. Регистрация просто предусмотрена (подобно программам IrfanView или Light Alloy).';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
3: begin
NextBt.tag:=4;
TipText.Clear;
TipText.Text :=
'Установите опцию "Открывать файл с прошлого сеанса" и при следующем запуске ' +
'Notepad SE откроет последний файл, с которым Вы работали. В некоторых случаях ' +
'это очень удобно.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
4: begin
NextBt.tag:=5;
TipText.Clear;
TipText.Text :=
'Для вставки текста в текущую позицию курсора существует горячие клавиши Ctrl+V, ' +
'более простая альтернатива такого же действия, это клавиша Insert. ' +
'Для того, чтобы узнать, готов ли текст к вставке из буфера обмена, можно посмотреть ' +
'в строке состояния Notepad SE на седьмую панель, если она имеет заголовок "Insert", то ' +
'текст готов, иначе "Empty" нет.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
5: begin
NextBt.tag:=6;
TipText.Clear;
TipText.Text :=
'В окне "Атрибуты" можно просмотреть, а также изменить атрибуты файла.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
6: begin
NextBt.tag:=7;
TipText.Clear;
TipText.Text :=
'В Notepad SE предусмотрено "Дерево главного меню", с которым очень удобно работать при ' +
'полноэкранном режиме. Для того, чтобы отобразить его, выберите из меню "Вид" ' +
'команду "Дерево меню" или нажмите горячие клавиши Ctrl+F11.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
7: begin
NextBt.tag:=8;
TipText.Clear;
TipText.Text :=
'В меню "Правка" выберите команду "Перейти...". ' +
'В поле "Переход на строку" введите номер строки, в которую требуется переместить курсор. ' +
'В строке состояния Notepad SE Вы всегда можете посмотреть в какой строке установлен курсор. ' +
'Если строка состояния скрыта, то для просмотра активной строки в тексте нажмите горячие клавиши ' +
'Shift+Alt+N.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
8: begin
NextBt.tag:=9;
TipText.Clear;
TipText.Text :=
'В Notepad SE предусмотрены опции выбора регистра ввода слов, "ПРОПИСНЫЕ" и "строчные", ' +
'соответственно только в ВЕРХНЕМ РЕГИСТРЕ или нижнем регистре. Если же ни первая, ни вторая ' +
'настройки не включены, регистр определятся пользователем при помощи клавиш клавиатуры ' +
'CAPS LOCK и Shift. При создании нового документа настройки сбрасываются по умолчанию.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
9: begin
NextBt.tag:=10;
TipText.Clear;
TipText.Text :=
'Изменение начертания и размера шрифта распространяется на весь текст документа. ' +
'Щелкните меню "Формат" и выберите пункт "Шрифт...". ' +
'Выберите необходимые значения в полях "Шрифт", "Начертание" и "Размер". ' +
'Пример того, как будет выглядеть выбранный шрифт, отображается в поле "Образец". ' +
'Выбрав шрифт, нажмите кнопку ОК.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
10: begin
NextBt.tag:=11;
TipText.Clear;
TipText.Text :=
'Все библиотеки стронних разработчиков использованные в программе несут в себе ' +
'только оформительный характер. При получении исходного кода Notepad SE без архива с ' +
'компонентами сторонних фирм, Вы можете обойтись и стандартной библиотекой VCL Delphi. ' +
'Но в этом случае Вам придется корректировать исходник самостоятельно, к примеру, вместо ' +
'флажков-переключателей TXPCheckBox использовать стандартные компоненты TCheckBox.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
11: begin
NextBt.tag:=12;
TipText.Clear;
TipText.Text :=
'Если Вы заметите какие - либо неточности или ошибки в этой программе, пожалуйста, сообщите ' +
'о них по адресу "GoodWinNix@mail.ru" или по ICQ: 415660036, и возможно в следующей версии ' +
'программы они будут устранены.';
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
