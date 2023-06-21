﻿unit Kostur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TLogIn = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Button1: TButton;
    FDConnection1: TFDConnection;
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    FDTable1id: TFDAutoIncField;
    FDTable1proces: TWideMemoField;
    FDTable1ime: TWideMemoField;
    FDTable1prezime: TWideMemoField;
    FDTable1korisnickoIme: TWideMemoField;
    FDTable1lozinka: TWideMemoField;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogIn: TLogIn;

implementation

{$R *.dfm}

procedure TLogIn.Button1Click(Sender: TObject);
var found: boolean;
begin

  FDTable1.Open;


  begin
    FDTable1.First;

      while (not FDTable1.Eof) and (found = false) do
        begin
           if (FDTable1['korisnickoIme'] = Edit1.Text) and (FDTable1['lozinka'] = Edit2.Text) then
              begin
                  found := true;

                  ShowMessage('Zdravo, ' + Edit1.Text + '!' + sLineBreak + 'Uspešno ste ulogovani!' + sLineBreak + 'Vaš proces je: ' + FDTable1['proces']);

              end
            else
              FDTable1.Next;
        end;
  end;

        if found = false then
          ShowMessage('Pogrešno korisničko ime / lozinka!');
end;

end.
