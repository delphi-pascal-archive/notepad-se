program NotePad;

uses
  Forms,
  NP in 'NP.pas' {MainForm},
  GTP in 'GTP.pas' {GoToForm},
  AP in 'AP.pas' {AboutForm},
  SP in 'SP.pas' {SetForm},
  FP in 'FP.pas' {FontForm},
  LP in 'LP.pas' {LicForm},
  BP in 'BP.pas' {BufferForm},
  PRP in 'PRP.pas' {RegForm},
  CLP in 'CLP.pas' {LangForm},
  ATP in 'ATP.pas' {AttrForm},
  TTP in 'TTP.pas' {TipForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Notepad SE';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TTipForm, TipForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TSetForm, SetForm);
  Application.CreateForm(TGoToForm, GoToForm);
  Application.CreateForm(TFontForm, FontForm);
  Application.CreateForm(TLicForm, LicForm);
  Application.CreateForm(TBufferForm, BufferForm);
  Application.CreateForm(TRegForm, RegForm);
  Application.CreateForm(TLangForm, LangForm);
  Application.CreateForm(TAttrForm, AttrForm);
  Application.Run;
end.
