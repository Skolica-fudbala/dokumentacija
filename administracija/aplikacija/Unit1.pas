unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, Unit14, Vcl.Menus;

type
  TForm1 = class(TForm)
    Panel2: TPanel;
    lbSearch: TLabel;
    rdBtnPoImenu: TRadioButton;
    rdBtnPoJMBG: TRadioButton;
    edtSearchCriteria: TEdit;
    cmdPretrazi: TButton;
    cmdResetFilter: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBCheckBox1: TDBCheckBox;
    edtTreneriId: TDBEdit;
    Tabela: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    cmdZatvori: TButton;
    dsTreneri: TDataSource;
    menu: TMainMenu;
    Clanovi1: TMenuItem;
    Forma1: TMenuItem;
    Roditelji: TMenuItem;
    Forma2: TMenuItem;
    reneri1: TMenuItem;
    Forma3: TMenuItem;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  with DM.qryTreneri do
    begin
      Active := false;
      Sql.Clear;
      Sql.Text := 'SELECT * FROM treneri';
      Active := true;
    end;
end;

end.
