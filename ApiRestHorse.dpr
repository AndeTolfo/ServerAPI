  program ApiRestHorse;

  {$APPTYPE CONSOLE}

  {$R *.res}

  uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  Controller.Cliente in 'Controller\Controller.Cliente.pas',
  Model.Cliente in 'Model\Model.Cliente.pas',
  Controller.Funcionario in 'Controller\Controller.Funcionario.pas',
  Model.Funcionario in 'Model\Model.Funcionario.pas',
  Model.Connection in 'Model\Model.Connection.pas',
  Unt_DM in 'Model\Unt_DM.pas' {DM: TDataModule};

begin
    Thorse.Use(Jhonson());
    Controller.Cliente.Register;
    Controller.Funcionario.Register;

    THorse.Listen(9000);
  end.
