program ServiceCardPrint;

uses
  Forms,
  fmMainForm in '..\..\..\Users\frac\Downloads\Scard\SC\fmMainForm.pas' {mainform};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tmainform, mainform);
  Application.Run;
end.
