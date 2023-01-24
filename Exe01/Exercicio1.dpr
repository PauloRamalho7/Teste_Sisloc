program Exercicio1;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Principal};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown   := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.
