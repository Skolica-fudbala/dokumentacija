program Project6;

uses
  Vcl.Forms,
  Unit13 in 'Unit13.pas' {formClanovi},
  Unit14 in 'Unit14.pas' {DM: TDataModule},
  Unit15 in 'Unit15.pas' {formRoditelji},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformClanovi, formClanovi);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TformRoditelji, formRoditelji);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
