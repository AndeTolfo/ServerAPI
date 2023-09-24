unit Controller.Cliente;

interface
uses Horse, System.JSON, System.SysUtils;

procedure Register;

implementation

procedure Register;
begin
  THorse.Get('/Clientes',
  procedure(Req: THorseRequest; Res: THorseResponse)
  begin
  Res.Send('Listar Clientes');
  end);

  THorse.Post('/Clientes',
  procedure(Req: THorseRequest; Res: THorseResponse)
  begin
  Res.Send('Cadastrar Clientes');
  end);

  THorse.Delete('/Clientes',
  procedure(Req: THorseRequest; Res: THorseResponse)
  begin
  Res.Send('Deletar Clientes');
  end);


end;




end.
