program Exercicio2;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {PrincipalEx2},
  DataModule in 'DataModule.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPrincipalEx2, PrincipalEx2);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
