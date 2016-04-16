program ServiceCardPrint;

uses
  Forms,
  fmMainForm in 'fmMainForm.pas' {mainform};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tmainform, mainform);
  Application.Run;
end.
