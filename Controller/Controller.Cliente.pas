unit Controller.Cliente;

interface
uses Horse, System.JSON, System.SysUtils;

procedure Register;
implementation

procedure ListarCliente(Req: THorseRequest; Res: THorseResponse);
begin
  Res.Send('Listar Cliente');
end;
procedure CadastrarCliente(Req: THorseRequest; Res: THorseResponse);
begin
   Res.Send('Cadastrar Cliente');
end;
procedure DeletarCliente(Req: THorseRequest; Res: THorseResponse);
begin
   Res.Send('Deletar Cliente');
end;

procedure Register;
begin
  THorse.Get('/Clientes', ListarCliente);
  THorse.Post('/Clientes', CadastrarCliente);
  THorse.Delete('/Clientes', DeletarCliente);


end;




end.
