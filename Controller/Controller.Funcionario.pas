unit Controller.Funcionario;

interface
uses Horse, System.JSON, System.SysUtils, Model.Funcionario, System.Classes, FIBDatabase, pFIBDatabase, FIBQuery, IniFiles,
  pFIBQuery,pFIBDataSet, DataSet.Serialize, Data.DB,Horse.Utils.ClientIP;

procedure Register;
implementation

uses Unt_DM;

procedure ListarFuncionario(Req: THorseRequest; Res: THorseResponse);
var
  Func: TFuncionario;
  _Qry: TpFIBDataSet;
  erro: String;
  ArrayFuncionario: TJSONArray;
  Horario: TDateTime;
begin
  try
    Func := TFuncionario.Create;
  except
    Horario := Now; // Obter o hor�rio atual
    Writeln(FormatDateTime('yyyy-mm-dd hh:nn:ss', Horario) + ' - Erro ao conectar com o banco'); // Escrever no console com hor�rio
    res.Send('Erro ao conectar com o banco').Status(501);
    exit;
  end;

  try
    _Qry := Func.ListarFuncionario('', erro);
    ArrayFuncionario := _Qry.ToJsonArray();
    res.Send<TJSONArray>(ArrayFuncionario);

    Horario := Now; // Obter o hor�rio atual
    Writeln(FormatDateTime('yyyy-mm-dd hh:nn:ss', Horario) + ' - Requisi��o de Listar Funcionario recebida do IP ' + ClientIp(Req)); // Escrever no console com hor�rio
  finally
    _Qry.Free;
    Func.Free;
  end;
end;
procedure CadastrarFuncionario(Req: THorseRequest; Res: THorseResponse);
begin
   Res.Send('Cadastrar Funcionario');
end;
procedure DeletarFuncionario(Req: THorseRequest; Res: THorseResponse);
begin
   Res.Send('Deletar Funcionario');
end;

procedure Register;
begin
  THorse.Get('/Funcionario', ListarFuncionario);
  THorse.Post('/Funcionario', CadastrarFuncionario);
  THorse.Delete('/Funcionario', DeletarFuncionario);


end;




end.

