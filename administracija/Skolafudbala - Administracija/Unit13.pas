unit Unit13;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCGrids, Vcl.ComCtrls, Vcl.Tabs, Vcl.Menus,
  Unit14, Unit15;

type
  TformClanovi = class(TForm)
    DBEdit1: TDBEdit;
    dsClanovi: TDataSource;
    DBNavigator1: TDBNavigator;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    dtRoditelj: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Tabela: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    cmdZatvori: TButton;
    menu: TMainMenu;
    Clanovi1: TMenuItem;
    Roditelji: TMenuItem;
    Panel2: TPanel;
    Forma1: TMenuItem;
    Forma2: TMenuItem;
    lbSearch: TLabel;
    rdBtnPoImenu: TRadioButton;
    rdBtnPoJMBG: TRadioButton;
    edtSearchCriteria: TEdit;
    cmdPretrazi: TButton;
    cmdResetFilter: TButton;
    DBCheckBox1: TDBCheckBox;
    Roditelj: TLabel;
    Label6: TLabel;
    edtId: TDBEdit;
    Label5: TLabel;
    edtIme: TDBEdit;
    edtPrezime: TDBEdit;
    Label7: TLabel;
    edtJMBG: TDBEdit;
    Label8: TLabel;
    edtBrTelefona: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    da: TDBEdit;
    edtClanId: TDBEdit;
    Label11: TLabel;
    procedure cmdZatvoriClick(Sender: TObject);
    procedure Forma2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure cmdPretraziClick(Sender: TObject);
    procedure cmdResetFilterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formClanovi: TformClanovi;

implementation

{$R *.dfm}


procedure TformClanovi.cmdPretraziClick(Sender: TObject);
begin
  if (rdBtnPoImenu.Checked) then
    begin
      with DM.qryClanovi do
        begin
          Active := false;
          Sql.Clear;
          Sql.Text := 'SELECT * FROM clanovi WHERE ime LIKE ' + quotedstr('%' + edtSearchCriteria.Text + '%') + ' OR prezime LIKE ' + quotedstr('%' + edtSearchCriteria.Text + '%');
          Active := true;
        end;
    end
    else if (rdBtnPoJMBG.Checked) then
     begin
      with DM.qryClanovi do
        begin
          Active := false;
          Sql.Clear;
          Sql.Text := 'SELECT * FROM clanovi WHERE jmbg LIKE ' + quotedstr('%' + edtSearchCriteria.Text + '%');
          Active := true;
        end;
     end;
end;

procedure TformClanovi.cmdResetFilterClick(Sender: TObject);
begin
  with DM.qryClanovi do
    begin
      Active := false;
      Sql.Clear;
      Sql.Text := 'SELECT * FROM clanovi';
      Active := true;
    end;
end;

procedure TformClanovi.cmdZatvoriClick(Sender: TObject);
begin
  self.Close;
end;

procedure TformClanovi.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  with DM.qryRoditeljaZaDete do
    begin
      Active := false;
      Sql.Clear;
      sql.Text := 'SELECT *' +
        'FROM roditelji r ' +
        'INNER JOIN clanovi_roditelji cr ON cr.roditelj_id = r.id ' +
        'WHERE cr.clan_id = ' + edtClanId.Text;
      Active := true;
    end;
end;

procedure TformClanovi.Forma2Click(Sender: TObject);
begin
  formRoditelji.Show;
end;

procedure TformClanovi.FormShow(Sender: TObject);
begin
  with DM.qryRoditeljaZaDete do
    begin
      Active := false;
      Sql.Clear;
      Sql.Text := 'SELECT *' +
        'FROM roditelji r ' +
        'INNER JOIN clanovi_roditelji cr ON cr.roditelj_id = r.id ' +
        'WHERE cr.clan_id = ' + edtClanId.Text;
      Active := true;
    end;
end;

end.
