  program ApiRestHorse;

  {$APPTYPE CONSOLE}

  {$R *.res}

  uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  Controller.Cliente in 'Controller\Controller.Cliente.pas';

begin


    THorse.Listen(9000);
  end.
