object DM: TDM
  OldCreateOrder = False
  Height = 324
  Width = 382
  object DB: TpFIBDatabase
    DBName = 
      'C:\Users\ander\Documents\GitHub\Delphi\SistemaTolfo\Win32\Debug\' +
      'DataBase\DATABASE.FDB'
    DBParams.Strings = (
      'lc_ctype=WIN1252'
      'user_name=SUPS'
      'password=maps3880'
      'sql_role_name=')
    SQLDialect = 3
    Timeout = 0
    WaitForRestoreConnect = 0
    Left = 56
    Top = 40
  end
  object TransRead: TpFIBTransaction
    DefaultDatabase = DB
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 56
    Top = 104
  end
  object QryGen: TpFIBQuery
    Transaction = TransRead
    Database = DB
    Left = 120
    Top = 40
  end
end
