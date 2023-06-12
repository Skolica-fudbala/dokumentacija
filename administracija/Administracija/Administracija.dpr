program Administracija;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {DM: TDataModule},
  Unit2 in 'Unit2.pas' {MembersForm},
  Unit3 in 'Unit3.pas' {MemberDetailsForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMembersForm, MembersForm);
  Application.CreateForm(TMemberDetailsForm, MemberDetailsForm);
  Application.Run;
end.
