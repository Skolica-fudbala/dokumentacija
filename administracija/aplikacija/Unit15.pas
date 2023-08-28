unit Unit15;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Unit14;

type
  TformRoditelji = class(TForm)
    menu: TMainMenu;
    Clanovi1: TMenuItem;
    Forma1: TMenuItem;
    Roditelji: TMenuItem;
    Forma2: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edtPrezime: TDBEdit;
    edtIme: TDBEdit;
    DBNavigator1: TDBNavigator;
    Tabela: TTabSheet;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    lbSearch: TLabel;
    rdBtnPoImenu: TRadioButton;
    rdBtnPoJmbg: TRadioButton;
    edtSearchCriteria: TEdit;
    cmdPretrazi: TButton;
    cmdResetFilter: TButton;
    Label5: TLabel;
    lbDeca: TListBox;
    dtRoditelji: TDataSource;
    cmdObrisiDete: TButton;
    Panel1: TPanel;
    cmdZatvori: TButton;
    Label6: TLabel;
    cmdDodaj: TButton;
    cbDeca: TComboBox;
    edtId: TDBEdit;
    edtJMBG: TDBEdit;
    Label4: TLabel;
    Label7: TLabel;
    edtBrTelefona: TDBEdit;
    Label8: TLabel;
    edtEmail: TDBEdit;
    procedure cmdZatvoriClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdDodajClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure cmdObrisiDeteClick(Sender: TObject);
    procedure cmdPrikaziDeteClick(Sender: TObject);
    procedure cmdPretraziClick(Sender: TObject);
    procedure cmdResetFilterClick(Sender: TObject);
    procedure osveziDecuBezDodatogRoditelja();
    procedure osveziRoditeljovuDecu();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRoditelji: TformRoditelji;

implementation

{$R *.dfm}

// Klikom na dugme pored Comboboxa koje dodeljuje roditelju novo dete
procedure TformRoditelji.cmdPretraziClick(Sender: TObject);
begin
  if (rdBtnPoImenu.Checked) then
    begin
      with DM.qryRoditelji do
        begin
          Active := false;
          Sql.Clear;
          Sql.Text := 'SELECT * FROM roditelji WHERE ime LIKE ' + quotedstr('%' + edtSearchCriteria.Text + '%') + ' OR prezime LIKE ' + quotedstr('%' + edtSearchCriteria.Text + '%');
          Active := true;
        end;
    end
    else if (rdBtnPoJMBG.Checked) then
     begin
      with DM.qryRoditelji do
        begin
          Active := false;
          Sql.Clear;
          Sql.Text := 'SELECT * FROM roditelji WHERE jmbg LIKE ' + quotedstr('%' + edtSearchCriteria.Text + '%');
          Active := true;
        end;
     end;
end;

procedure TformRoditelji.cmdPrikaziDeteClick(Sender: TObject);
begin
  ShowMessage(intToStr(NativeInt(lbDeca.Items.Objects[lbDeca.ItemIndex])));
end;

procedure TformRoditelji.cmdResetFilterClick(Sender: TObject);
begin
    with DM.qryRoditelji do
      begin
        Active := false;
        Sql.Clear;
        Sql.Text := 'SELECT * FROM roditelji';
        Active := true;
      end;
end;

procedure TformRoditelji.cmdDodajClick(Sender: TObject);
begin
  with DM.qryDodajDeteRoditelju do
    begin
      Active := False;
      Sql.Clear;
      Sql.Text := 'INSERT INTO clanovi_roditelji' +
      '(clan_id, roditelj_id) ' +
      'VALUES ' +
      '(:clan_id, :roditelj_id)';

      Params[0].AsString := intToStr(NativeInt(cbDeca.Items.Objects[cbDeca.ItemIndex]));
      Params[1].AsString := edtId.Text;

      ExecSQL;
    end;

    ShowMessage('Uspe�no ste dodali novo dete roditelju!');

    cbDeca.Text := '';
    cbDeca.Items.Clear;

    osveziRoditeljovuDecu();
    osveziDecuBezDodatogRoditelja();
end;

procedure TformRoditelji.cmdObrisiDeteClick(Sender: TObject);
begin
  with DM.qryObrisiDeteRoditelju do
    begin
      Active := false;
      Sql.Clear;
      Sql.Text := 'DELETE FROM clanovi_roditelji WHERE clan_id = :clan_id AND roditelj_id = :roditelj_id;';

      Params[0].AsString := intToStr(NativeInt(lbDeca.Items.Objects[lbDeca.ItemIndex]));
      Params[1].AsString := edtId.Text;

      ExecSQL;
    end;

  osveziRoditeljovuDecu(); // Osvezava listbox
  osveziDecuBezDodatogRoditelja(); // Osvezava combox

  ShowMessage('Uspe�no ste obrisali dete roditelju!');
end;

procedure TformRoditelji.cmdZatvoriClick(Sender: TObject);
begin
  self.Close;
end;

procedure TformRoditelji.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  osveziRoditeljovuDecu();
end;

procedure TformRoditelji.FormShow(Sender: TObject);
begin
    osveziDecuBezDodatogRoditelja();
    osveziRoditeljovuDecu();
end;

// Procedura koja osve�ava combobox sa decom kojima roditelj nije izabran.
procedure TformRoditelji.osveziDecuBezDodatogRoditelja();
begin
  cbDeca.Items.Clear;

   with DM.qryClanoviBezRoditelja do
    begin
      Active := false;
      sql.Clear;
      sql.Text := 'SELECT id, (ime || " " || prezime) AS ime FROM clanovi WHERE id NOT IN ( SELECT clan_id FROM clanovi_roditelji )';
      Active := true;
    end;

  while not DM.qryClanoviBezRoditelja.Eof do
    begin
      cbDeca.Items.AddObject(DM.qryClanoviBezRoditelja.FieldByName('ime').AsString, TObject(DM.qryClanoviBezRoditelja.FieldByName('id').AsInteger));

      DM.qryClanoviBezRoditelja.Next;
    end;
end;

// Procedura koja osvezava listbox sa decom roditelja.
procedure TformRoditelji.osveziRoditeljovuDecu();
begin
  lbDeca.Items.Clear;

  with DM.qryDeca do
    begin
      Active := false;
      sql.Clear;
      sql.Text := 'SELECT c.id, (c.ime || " " || c.prezime) AS ime ' +
        'FROM clanovi_roditelji cr ' +
        'INNER JOIN clanovi c ON cr.clan_id = c.id ' +
        'WHERE cr.roditelj_id = ' + edtId.Text;
      Active := true;
    end;

    while not DM.qryDeca.Eof do
      begin
        lbDeca.Items.AddObject(DM.qryDeca.FieldByName('ime').AsString, TObject(DM.qryDeca.FieldByName('id').AsInteger));

        DM.qryDeca.Next;
      end;
end;

end.
