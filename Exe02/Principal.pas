unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TPrincipalEx2 = class(TForm)
    Produto: TGroupBox;
    EdtNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EdtValor: TEdit;
    BtnIncProd: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EdtQtdDesc: TEdit;
    EdtValorDesc: TEdit;
    Button1: TButton;
    EdtCodDesc: TEdit;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    EdtProd: TEdit;
    EdtQtd: TEdit;
    Button2: TButton;
    LblValor: TLabel;
    lblNome: TLabel;
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure BtnIncProdClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    function IncProduto(NomeInc, ValorInc : String): Integer;
    function IncDesc(CodDescInc,QtdDescInc, ValorDescInc : String): Integer;
  public
    { Public declarations }
  end;

var
  PrincipalEx2: TPrincipalEx2;

implementation

{$R *.dfm}

uses DataModule;

procedure TPrincipalEx2.BtnIncProdClick(Sender: TObject);
begin
  ShowMessage('Código do Produto: ' + IntToStr( IncProduto(EdtNome.Text,EdtValor.Text)));
end;

procedure TPrincipalEx2.Button1Click(Sender: TObject);
begin
  ShowMessage('Código do Desconto: ' + IntToStr( IncDesc(EdtCodDesc.Text,EdtQtdDesc.Text, EdtValorDesc.Text)));
end;

procedure TPrincipalEx2.Button2Click(Sender: TObject);
Var
  Resultado,
  QtdFalta,
  ValorProd   : Double;
  Quantidade,
  I,IFaixa   : Integer;
  Qtdfaixa   : Array of Integer;
  ResFaixa,
  ValFaixa   : Array of Double;
begin
    Resultado := 0.0;

    dm.Qry.Active := false;
    dm.Qry.SQL.Clear;

    dm.Qry.SQL.Add('SELECT * FROM Produto');
    dm.Qry.SQL.Add('WHERE Codigo = :Codigo');
    dm.Qry.ParamByName('Codigo').Value := StrToInt(EdtProd.Text);
    dm.Qry.Active := True;

    LblNome.Caption := 'Nome: '+ dm.Qry.FieldByName('nome').AsString;
    ValorProd       := dm.Qry.FieldByName('valor').AsFloat;
    Quantidade      := StrToInt(EdtQtd.Text);

    Resultado := 0;

    dm.Qry.Active := false;
    dm.Qry.SQL.Clear;

    dm.Qry.SQL.Add('SELECT * FROM ProdutoDesconto');
    dm.Qry.SQL.Add('WHERE Codigo = :Codigo');
    dm.Qry.SQL.Add('ORDER BY codigo,quantidade');
    dm.Qry.ParamByName('Codigo').Value := StrToInt(EdtProd.Text);
    dm.Qry.Active := True;

    dm.Qry.First;
    I :=-1;
    while not dm.Qry.Eof do
    begin
      I := Length(QtdFaixa);
      SetLength(QtdFaixa,I+1);
      SetLength(ValFaixa,I+1);
      QtdFaixa[I] := dm.Qry.FieldByName('quantidade').AsInteger;
      ValFaixa[I] := dm.Qry.FieldByName('Valor').AsFloat;
      dm.qry.Next;
    end;
    QtdFalta := 0;
    if I = -1 then
    begin
      Resultado := quantidade * ValorProd;
    end else
    begin
      QtdFalta := Quantidade;

      for IFaixa := I Downto 0 do
        if QtdFalta > QtdFaixa[IFaixa] then
        begin
          Resultado :=Resultado + ( (QtdFalta-QtdFaixa[IFaixa]) * ValFaixa[IFaixa] );
          QtdFalta         := QtdFaixa[IFaixa];
        end;
      Resultado := Resultado + ( QtdFalta * ValorProd );


    end;

    LblValor.Caption := 'Valor Final: ' + FormatFloat('#,##0.00',Resultado);
end;

procedure TPrincipalEx2.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
   { Chr(8)  = Back Space
     Chr(46) = .
     Chr(44) = , }

  if  not ( Key in ['0'..'9', Chr(8), Chr(46), Chr(44), Chr(13)] ) then
    Key := #0
  else
    if  ( Key = Chr(46) ) and ( Pos( Key, TEdit(Sender).Text ) > 0 ) then
      Key := #0;

end;

function TPrincipalEx2.IncDesc(CodDescInc, QtdDescInc,
  ValorDescInc: String): Integer;
Var
  NovoId : Integer;
  ValorF : String;
begin
  if (CodDescInc = '') or (QtdDescInc ='') or (ValorDescInc ='') then
    exit;
  try
{      dm.Qry.Active := false;
      dm.Qry.SQL.Clear;

      dm.Qry.SQL.Add('SELECT * FROM Produto WHERE Codigo = :Codigo') ;
      dm.Qry.ParamByName('Codigo').Value := StrToInt(CodDescInc);
      dm.Qry.Active := True;
      dm.Qry.Open;
      if dm.Qry.RecordCount=0 then
      begin
        Result:=-1;
        exit
      end;
 }
      dm.Qry.Active := false;
      dm.Qry.SQL.Clear;

      dm.Qry.SQL.Add('INSERT INTO ProdutoDesconto ( Codigo, quantidade, Valor)');
      dm.Qry.SQL.Add(' VALUES(:Codigo, :quantidade, :Valor)');

      dm.Qry.ParamByName('Codigo').Value     := StrToInt(CodDescInc);
      dm.Qry.ParamByName('quantidade').Value := StrToInt(QtdDescInc);
      dm.Qry.ParamByName('Valor').Value      := StrToFloat(ValorDescInc);
      dm.Qry.ExecSQL;
  except on ex:exception do
  begin
      showmessage('Erro ao cadastrar Desconto: ' + ex.Message);
      exit;
  end;
  end;
  Result := NovoId;

end;

function TPrincipalEx2.IncProduto(NomeInc, ValorInc: String): Integer;
Var
  NovoId : Integer;
  ValorF : String;
begin
  if (NomeInc = '') or (ValorInc ='') then
    exit;
  NovoId := 0;
  try
      dm.Qry.Active := false;
      dm.Qry.SQL.Clear;

      dm.Qry.SQL.Add('SELECT * FROM Produto ORDER BY Codigo') ;
      dm.Qry.Active := True;
      dm.Qry.First;
      if dm.Qry.RecordCount=0 then
        NovoId := 1
      else begin
        while not dm.Qry.Eof do
        begin
          NovoId := dm.Qry.FieldByName('Codigo').AsInteger;
          dm.Qry.Next;
        end;

      end;
      NovoId := NovoId + 1;

      dm.Qry.Active := false;
      dm.Qry.SQL.Clear;

      dm.Qry.SQL.Add('INSERT INTO Produto ( Codigo, Nome, Valor) VALUES(:Codigo, :Nome, :Valor)');

      dm.Qry.ParamByName('Codigo').Value := NovoId;
      dm.Qry.ParamByName('Nome').Value   := NomeInc;

      ValorF := StringReplace(ValorInc, ',', '.', [rfReplaceAll]);

      dm.Qry.ParamByName('Valor').Value  := StrToFloat(ValorInc);
      dm.Qry.ExecSQL;
  except on ex:exception do
  begin
      showmessage('Erro ao cadastrar Produto: ' + ex.Message);
      exit;
  end;
  end;
  Result := NovoId;
end;

end.
