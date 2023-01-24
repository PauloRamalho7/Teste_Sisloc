unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DbxSqlite, Data.FMTBcd,
  Datasnap.DBClient, Data.DB, Data.SqlExpr, Dialogs;

type
  TDM = class(TDataModule)
    Conn: TSQLConnection;
    Qry: TSQLQuery;
    ClientDataSet1: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
//  Conn.Params.Add('Database=full_path_to_your_database_file');
  Conn.Params.Values['Database'] := System.SysUtils.GetCurrentDir + '\DB\Exerc2.db';

  try
    // Establish the connection.
    Conn.Connected := true;
  except
    on E: EDatabaseError do
      ShowMessage('Exception raised with message' + E.Message);
  end;
end;

end.
