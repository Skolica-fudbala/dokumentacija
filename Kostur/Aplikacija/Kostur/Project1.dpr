program Project1;

uses
  Vcl.Forms,
  Kostur in 'Kostur.pas' {LogIn};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLogIn, LogIn);
  Application.Run;
end.
