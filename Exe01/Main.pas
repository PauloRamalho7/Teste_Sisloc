unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TPrincipal = class(TForm)
    EdtQtd: TEdit;
    BtnCalcular: TButton;
    LblResultado: TLabel;
    BtnZerar: TButton;
    LblQtd: TLabel;
    procedure EdtQtdKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure BtnCalcularClick(Sender: TObject);
    procedure BtnZerarClick(Sender: TObject);
  private
    { Private declarations }
    ValUnit1,
    ValUnit2,
    ValUnit3 : Double;
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

procedure TPrincipal.BtnCalcularClick(Sender: TObject);
Var
  Resultado : Double;
  QtdDVD    : Integer;
begin
  if EdtQtd.Text = '' then exit;
  QtdDVD    := StrToInt(EdtQtd.Text);
  Resultado := 0.0;

  { Unitário 1 ate 10 unidades
    Unitário 2 acima de 10 e menor que 20
    Unitário 3 Acima de 20
    Sempre a quantidade que ultrapassar}

  Resultado := QtdDVD * ValUnit1;

  if QtdDVD > 10 then
    Resultado := (10 * ValUnit1)+  ((QtdDVD-10) * ValUnit2);

  if QtdDVD > 20 then
    Resultado := (10 * ValUnit1)+ (10 * ValUnit2) + ((QtdDVD-20) * ValUnit3);

  LblResultado.Caption := 'Valor Calculado: ' + FormatFloat('#,##0.00',Resultado);
end;

procedure TPrincipal.BtnZerarClick(Sender: TObject);
begin
  EdtQtd.Text := '';
  LblResultado.Caption := 'Valor Calculado: ';
end;

procedure TPrincipal.EdtQtdKeyPress(Sender: TObject; var Key: Char);
begin
   { Chr(8) = Back Space }
  if  not ( Key in ['0'..'9', Chr(8)] ) then
    Key := #0;
end;

procedure TPrincipal.FormCreate(Sender: TObject);
begin
    {Setando valores unitários do DVD}
    ValUnit1 := 1.1;
    ValUnit2 := 1;
    ValUnit3 := 0.9;
end;

end.
