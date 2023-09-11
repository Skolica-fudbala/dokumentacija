unit odgovori;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.DateTimeCtrls, FMX.ListBox, FMX.Edit, FMX.Controls.Presentation,db;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    krajEdit: TDateEdit;
    Label4: TLabel;
    Button1: TButton;
    pitanjaComboBox: TComboBox;
    ProcesiComboBox: TComboBox;
    odgovorEdit: TEdit;
    procedure FormShow(Sender: TObject);
    procedure ProcesiComboBoxChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  i:integer;
  temp:string;
  temp2:string;
  idpi:string;
  idpr:string;
  idvr:string;
implementation

{$R *.fmx}

procedure TForm3.Button1Click(Sender: TObject);
begin
dbform.FDQuery1.SQL.Text := 'insert into odgovori(odgovor)values ('''+odgovoredit.text+''')';
dbform.FDQuery1.ExecSQL;

dbform.FDQuery1.SQL.Text := 'select * from odgovori where odgovor ='''+odgovoredit.text+'''';
dbform.FDQuery1.open;

idpr:=copy(ProcesiComboBox.Selected.Text,0,2);
idpi:=copy(PitanjaComboBox.Selected.Text,0,3);

if PitanjaComboBox.Selected.Text.contains('Redovna') then
begin
   idvr:='1'
end
else
begin
   idvr:='2';
end;

dbform.FDQuery2.SQL.Text := 'update kontrola set datum_kraja = '''+ krajedit.text+''', status = 1, id_odgovora =''' + dbform.FDQuery1.fieldbyname('id_odgovora').AsString +''' where id_procesa = '''+idpr+''' and id_pitanja = '''+idpi+''' and id_vrste='''+idvr+'''';
dbform.FDQuery2.ExecSQL;

dbform.FDQuery2.close;

odgovorEdit.Text:='';

end;

procedure TForm3.FormShow(Sender: TObject);
begin
dbform.FDQuery2.SQL.Text := 'SELECT * FROM procesi ';
dbform.FDQuery2.Open;

for I := 1 to dbform.FDQuery2.RecordCount do
begin
procesiComboBox.items.Add(dbform.FDQuery2.FieldByName('id_procesa').AsString + ' - ' +dbform.FDQuery2.FieldByName('proces').AsString);
dbform.FDQuery2.next;
end;

dbform.FDQuery2.close;
end;

procedure TForm3.ProcesiComboBoxChange(Sender: TObject);
begin
 PitanjaComboBox.Clear;
 temp:=copy(ProcesiComboBox.Selected.Text,0,2);

if temp.contains('1') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM kontrola WHERE id_procesa = 1 and status = 0 ';
dbform.FDQuery1.Open;

for I := 1 to dbform.FDQuery1.RecordCount do
begin

dbform.FDQuery2.SQL.Text := 'SELECT * FROM pitanja WHERE id_pitanja = '''+dbform.FDQuery1.fieldbyname('id_pitanja').asString+''' ';
dbform.FDQuery2.Open;

dbform.FDQuery3.SQL.Text := 'SELECT * FROM vrsta_kontrole WHERE id_vrste = '''+dbform.FDQuery1.fieldbyname('id_vrste').asString+''' ';
dbform.FDQuery3.Open;


temp2:= copy(dbform.FDQuery2.FieldByName('pitanje').AsString,5);
pitanjaComboBox.items.Add(dbform.FDQuery2.FieldByName('id_pitanja').AsString + '  -  ' +temp2 + '  -  ' + dbform.FDQuery3.FieldByName('vrsta').AsString );

dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

if temp.contains('2') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM kontrola WHERE id_procesa = 2 and status = 0';
dbform.FDQuery1.Open;

for I := 1 to dbform.FDQuery1.RecordCount do
begin

dbform.FDQuery2.SQL.Text := 'SELECT * FROM pitanja WHERE id_pitanja = '''+dbform.FDQuery1.fieldbyname('id_pitanja').asString+''' ';
dbform.FDQuery2.Open;

dbform.FDQuery3.SQL.Text := 'SELECT * FROM vrsta_kontrole WHERE id_vrste = '''+dbform.FDQuery1.fieldbyname('id_vrste').asString+''' ';
dbform.FDQuery3.Open;

temp2:= copy(dbform.FDQuery2.FieldByName('pitanje').AsString,5);

pitanjaComboBox.items.Add(dbform.FDQuery2.FieldByName('id_pitanja').AsString + '  -  ' +temp2 + '  -  ' + dbform.FDQuery3.FieldByName('vrsta').AsString );
dbform.FDQuery1.next;

end;
dbform.FDQuery1.close;
end;

if temp.contains('3') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM kontrola WHERE id_procesa = 3 and status = 0';
dbform.FDQuery1.Open;

for I := 1 to dbform.FDQuery1.RecordCount do
begin

dbform.FDQuery2.SQL.Text := 'SELECT * FROM pitanja WHERE id_pitanja = '''+dbform.FDQuery1.fieldbyname('id_pitanja').asString+''' ';
dbform.FDQuery2.Open;

dbform.FDQuery3.SQL.Text := 'SELECT * FROM vrsta_kontrole WHERE id_vrste = '''+dbform.FDQuery1.fieldbyname('id_vrste').asString+''' ';
dbform.FDQuery3.Open;

temp2:= copy(dbform.FDQuery2.FieldByName('pitanje').AsString,5);
pitanjaComboBox.items.Add(dbform.FDQuery2.FieldByName('id_pitanja').AsString + '  -  ' +temp2 + '  -  ' + dbform.FDQuery3.FieldByName('vrsta').AsString );

dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

if temp.contains('4') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM kontrola WHERE id_procesa = 4 and status = 0';
dbform.FDQuery1.Open;

for I := 1 to dbform.FDQuery1.RecordCount do
begin

dbform.FDQuery2.SQL.Text := 'SELECT * FROM pitanja WHERE id_pitanja = '''+dbform.FDQuery1.fieldbyname('id_pitanja').asString+''' ';
dbform.FDQuery2.Open;

dbform.FDQuery3.SQL.Text := 'SELECT * FROM vrsta_kontrole WHERE id_vrste = '''+dbform.FDQuery1.fieldbyname('id_vrste').asString+''' ';
dbform.FDQuery3.Open;

temp2:= copy(dbform.FDQuery2.FieldByName('pitanje').AsString,5);
pitanjaComboBox.items.Add(dbform.FDQuery2.FieldByName('id_pitanja').AsString + '  -  ' +temp2 + '  -  ' + dbform.FDQuery3.FieldByName('vrsta').AsString );

dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

if temp.contains('5') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM kontrola WHERE id_procesa = 5 and status = 0';
dbform.FDQuery1.Open;

for I := 1 to dbform.FDQuery1.RecordCount do
begin

dbform.FDQuery2.SQL.Text := 'SELECT * FROM pitanja WHERE id_pitanja = '''+dbform.FDQuery1.fieldbyname('id_pitanja').asString+''' ';
dbform.FDQuery2.Open;

dbform.FDQuery3.SQL.Text := 'SELECT * FROM vrsta_kontrole WHERE id_vrste = '''+dbform.FDQuery1.fieldbyname('id_vrste').asString+''' ';
dbform.FDQuery3.Open;

temp2:= copy(dbform.FDQuery2.FieldByName('pitanje').AsString,5);
pitanjaComboBox.items.Add(dbform.FDQuery2.FieldByName('id_pitanja').AsString + '  -  ' +temp2 + '  -  ' + dbform.FDQuery3.FieldByName('vrsta').AsString );

dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

if temp.contains('6') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM kontrola WHERE id_procesa = 6 and status = 0';
dbform.FDQuery1.Open;

for I := 1 to dbform.FDQuery1.RecordCount do
begin

dbform.FDQuery2.SQL.Text := 'SELECT * FROM pitanja WHERE id_pitanja = '''+dbform.FDQuery1.fieldbyname('id_pitanja').asString+''' ';
dbform.FDQuery2.Open;

dbform.FDQuery3.SQL.Text := 'SELECT * FROM vrsta_kontrole WHERE id_vrste = '''+dbform.FDQuery1.fieldbyname('id_vrste').asString+''' ';
dbform.FDQuery3.Open;

temp2:= copy(dbform.FDQuery2.FieldByName('pitanje').AsString,5);
pitanjaComboBox.items.Add(dbform.FDQuery2.FieldByName('id_pitanja').AsString + '  -  ' +temp2 + '  -  ' + dbform.FDQuery3.FieldByName('vrsta').AsString );

dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

if temp.contains('7') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM kontrola WHERE id_procesa = 7 and status = 0';
dbform.FDQuery1.Open;

for I := 1 to dbform.FDQuery1.RecordCount do
begin

dbform.FDQuery2.SQL.Text := 'SELECT * FROM pitanja WHERE id_pitanja = '''+dbform.FDQuery1.fieldbyname('id_pitanja').asString+''' ';
dbform.FDQuery2.Open;

dbform.FDQuery3.SQL.Text := 'SELECT * FROM vrsta_kontrole WHERE id_vrste = '''+dbform.FDQuery1.fieldbyname('id_vrste').asString+''' ';
dbform.FDQuery3.Open;

temp2:= copy(dbform.FDQuery2.FieldByName('pitanje').AsString,5);
pitanjaComboBox.items.Add(dbform.FDQuery2.FieldByName('id_pitanja').AsString + '  -  ' +temp2 + '  -  ' + dbform.FDQuery3.FieldByName('vrsta').AsString );

dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

if temp.contains('8') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM kontrola WHERE id_procesa = 8 and status = 0';
dbform.FDQuery1.Open;

for I := 1 to dbform.FDQuery1.RecordCount do
begin

dbform.FDQuery2.SQL.Text := 'SELECT * FROM pitanja WHERE id_pitanja = '''+dbform.FDQuery1.fieldbyname('id_pitanja').asString+''' ';
dbform.FDQuery2.Open;

dbform.FDQuery3.SQL.Text := 'SELECT * FROM vrsta_kontrole WHERE id_vrste = '''+dbform.FDQuery1.fieldbyname('id_vrste').asString+''' ';
dbform.FDQuery3.Open;

temp2:= copy(dbform.FDQuery2.FieldByName('pitanje').AsString,5);

pitanjaComboBox.items.Add(dbform.FDQuery2.FieldByName('id_pitanja').AsString + '  -  ' +temp2 + '  -  ' + dbform.FDQuery3.FieldByName('vrsta').AsString );
dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

end;

end.
