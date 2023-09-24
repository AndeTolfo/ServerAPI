unit Unt_DM;

interface

uses
  System.SysUtils, System.Classes, FIBDatabase, pFIBDatabase, FIBQuery, IniFiles,
  pFIBQuery,pFIBDataSet;

type
  TDM = class(TDataModule)
    DB: TpFIBDatabase;
    TransRead: TpFIBTransaction;
    QryGen: TpFIBQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    class function New: TDM;

    procedure ConectarDB;
    function GetNewTransaction: TpFIBTransaction;
    function GetNewQry : TpFIBDataSet;
  end;

var
  DM: TDM;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TDM.ConectarDB;
 var
  IniFile: TIniFile;
  CaminhoConfig, DataBase, Servidor: string;
  Porta : integer;
begin
    CaminhoConfig := ExtractFileDir(ParamStr(0))+ '/Config.ini';
    if not FileExists(CaminhoConfig) then
    begin
      // Crie o arquivo de configuração com valores padrão se não existir
      IniFile := TIniFile.Create(CaminhoConfig);
      try
      IniFile.WriteString('Conexao', 'Database', ExtractFileDir(ParamStr(0))+ '\DATABASE\DATABASE.FDB');
      IniFile.WriteString('Conexao', 'Servidor', 'localhost');
      IniFile.WriteInteger('Conexao', 'Porta', 3051);
       finally
      IniFile.Free;
      end;
    end;

    IniFile := TIniFile.Create(CaminhoConfig);
    try
      DataBase := IniFile.ReadString('Conexao','Database', DataBase);
      Servidor := IniFile.ReadString('Conexao','Servidor', Servidor);
      Porta := IniFile.ReadInteger('Conexao','Porta', Porta);
      try
       DB.UseLoginPrompt := False;
       DB.DBParams.Clear;
      with DB.ConnectParams do begin
         UserName := 'sups';
         Password := 'maps3880';
         RoleName := EmptyStr;
         CharSet := 'WIN1252';
      end;
       DB.DBName := DATABASE;
       DB.Open;
    if DB.Connected then TransRead.StartTransaction;
      except
       on E:Exception do begin
       raise Exception.Create('Ocorreu um Erro ao Conectar no DB!' + #13 + 'Erro: ' + E.Message);
      end;
      end;
    finally
    IniFile.Free;
  end;
end;

function TDM.GetNewQry: TpFIBDataSet;
begin
  try
    Result := TpFIBDataSet.Create(Nil);
    Result.Database := DB;
    Result.Transaction := TransRead;
  except
    on E:Exception do begin
      raise Exception.Create('Ocorreu um erro ao Instanciar uma Query' + #13 + 'Erro: ' + E.Message);
    end;
  end;
end;

function TDM.GetNewTransaction: TpFIBTransaction;
begin
  try
    Result := TpFIBTransaction.Create(nil);
    Result.DefaultDatabase := DB;
    Result.TRParams.Clear;
    Result.TRParams.Add('write');
    Result.TRParams.Add('nowait');
    Result.TRParams.Add('rec_version');
    Result.TRParams.Add('read_committed');
  except
    on E:Exception do begin
      raise Exception.Create('Ocorreu um Erro ao Instanciar uma Transação!' + #13 + 'Erro: ' + E.Message);
    end;
  end;
end;

class function TDM.New: TDM;
begin
  try
    Result := TDM.Create(nil);
  except
    on E:Exception do begin
      raise Exception.Create('Ocorreu um Erro ao Instanciar o DM!' + #13 + 'Erro: ' + E.Message);
    end;
  end;
end;

end.
