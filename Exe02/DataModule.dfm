object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object Conn: TSQLConnection
    DriverName = 'Sqlite'
    Params.Strings = (
      'DriverUnit=Data.DbxSqlite'
      
        'DriverPackageLoader=TDBXSqliteDriverLoader,DBXSqliteDriver270.bp' +
        'l'
      
        'MetaDataPackageLoader=TDBXSqliteMetaDataCommandFactory,DbxSqlite' +
        'Driver270.bpl'
      'FailIfMissing=True'
      'Database=')
    Left = 32
    Top = 24
  end
  object Qry: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conn
    Left = 40
    Top = 88
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 88
  end
end
