program internakontrola;

uses
  System.StartUpCopy,
  FMX.Forms,
  pocetna in 'pocetna.pas' {Form1},
  kontrola in 'kontrola.pas' {Form2},
  odgovori in 'odgovori.pas' {Form3},
  db in 'db.pas' {dbForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TdbForm, dbForm);
  Application.Run;
end.
