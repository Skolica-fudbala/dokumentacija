unit Unit14;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    Conn: TFDConnection;
    qryClanovi: TFDQuery;
    qryRoditelji: TFDQuery;
    qryDeca: TFDQuery;
    qryDodajDeteRoditelju: TFDQuery;
    qryClanoviBezRoditelja: TFDQuery;
    qryObrisiDeteRoditelju: TFDQuery;
    qryRoditeljaZaDete: TFDQuery;
    qryClanaPoID: TFDQuery;
    qryTreneri: TFDQuery;
    qryTipoviRoditeljaZaDete: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
