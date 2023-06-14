﻿unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TMemberDetailsForm = class(TForm)
    PnlMember: TPanel;
    Label2: TLabel;
    edtDateOfBirth: TEdit;
    edtId: TEdit;
    edtFirstname: TEdit;
    edtJmbg: TEdit;
    edtLastname: TEdit;
    RdoExistingParent: TRadioButton;
    RdoNewParent: TRadioButton;
    Label1: TLabel;
    PnlNewParent: TPanel;
    Label3: TLabel;
    edtParentFirstname: TEdit;
    edtParentLastname: TEdit;
    edtParentJmbg: TEdit;
    edtParentTelNumber: TEdit;
    Edit1: TEdit;
    PnlExistingParent: TPanel;
    edtParentSearchCriteria: TEdit;
    cmdSearch: TButton;
    DBGrid1: TDBGrid;
    pnlParent: TPanel;
    dsParents: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure RdoExistingParentClick(Sender: TObject);
    procedure RdoNewParentClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemberDetailsForm: TMemberDetailsForm;

implementation

{$R *.dfm}

uses Unit1;

procedure TMemberDetailsForm.FormShow(Sender: TObject);
begin
  if (self.Caption = 'Član - Izmeni') then
    begin
      // When member is selected, fetch member details.
      with DM.QryMembersSelect do begin
        active := false;
        sql.Clear;
        sql.Text := 'SELECT * FROM members WHERE id = ' + self.Hint;
        active := true;
      end;

      edtId.Text := DM.QryMembersSelect.FieldByName('id').AsString;
      // Disable id field
      edtId.Enabled := false;
      edtId.Color := clBtnFace;

      edtFirstname.Text := DM.QryMembersSelect.FieldByName('firstname').AsString;
      edtLastname.Text := DM.QryMembersSelect.FieldByName('lastname').AsString;
      edtJMBG.Text := DM.QryMembersSelect.FieldByName('jmbg').AsString;
      edtDateOfBirth.Text := DM.QryMembersSelect.FieldByName('date_of_birth').AsString;

      with DM.QryParentsSelect do
        begin
          active := false;
          sql.Clear;
          sql.Text := 'SELECT * FROM parents';
          active := true;
        end;

      PnlExistingParent.Visible := true;
      PnlExistingParent.Top := 1;
      PnlExistingParent.TabOrder := 0;
      RdoExistingParent.Checked := true;
    end;

    if (self.Caption = 'Član - Dodaj') then
      begin
        PnlNewParent.Visible := true;
        PnlNewParent.Top := 1;
        PnlNewParent.TabOrder := 0;
        RdoNewParent.Checked := true;
      end;
end;

procedure TMemberDetailsForm.RdoExistingParentClick(Sender: TObject);
begin
  PnlExistingParent.Visible := true;
  PnlExistingParent.Top := 1;
  PnlNewParent.Visible := false;
end;

procedure TMemberDetailsForm.RdoNewParentClick(Sender: TObject);
begin
  PnlNewParent.Visible := true;
  PnlNewParent.Top := 1;
  PnlExistingParent.Visible := false;
end;

end.