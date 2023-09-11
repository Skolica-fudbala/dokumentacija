unit kontrola;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListBox, FMX.DateTimeCtrls,db;

type
  TForm2 = class(TForm)
    ProcesiComboBox: TComboBox;
    VrstaComboBox: TComboBox;
    PitanjaComboBox: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Label5: TLabel;
    PocetakDate: TDateEdit;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ProcesiComboBoxChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  I:integer;
  temp:string;
  temp2:string;
  idpr:String;
  idpi:string;
  idvr:string;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
begin
idpr:=copy(ProcesiComboBox.Selected.Text,0,2);
idpi:=copy(PitanjaComboBox.Selected.Text,0,3);
idvr:=copy(vrstaComboBox.Selected.Text,0,2);

dbform.FDQuery2.SQL.Text := 'insert into kontrola(id_procesa, id_pitanja, id_vrste, datum_pocetka) values('''+idpr+''','''+idpi+''','''+idvr+''','''+pocetakdate.Text+''')';
dbform.FDQuery2.ExecSQL;

showmessage('Uspesno poslato');
end;

procedure TForm2.FormShow(Sender: TObject);
begin
dbform.FDQuery2.SQL.Text := 'SELECT * FROM procesi ';
dbform.FDQuery2.Open;

for I := 1 to dbform.FDQuery2.RecordCount do
begin
procesiComboBox.items.Add(dbform.FDQuery2.FieldByName('id_procesa').AsString + ' - ' +dbform.FDQuery2.FieldByName('proces').AsString);
dbform.FDQuery2.next;
end;

dbform.FDQuery2.close;

dbform.FDQuery2.SQL.Text := 'SELECT * FROM vrsta_kontrole ';
dbform.FDQuery2.Open;

for I := 1 to dbform.FDQuery2.RecordCount do
begin
vrstaComboBox.items.Add(dbform.FDQuery2.FieldByName('id_vrste').AsString + ' - ' +dbform.FDQuery2.FieldByName('vrsta').AsString);
dbform.FDQuery2.next;
end;

dbform.FDQuery2.close;
end;

procedure TForm2.ProcesiComboBoxChange(Sender: TObject);
begin
PitanjaComboBox.Clear;
temp:=copy(ProcesiComboBox.Selected.Text,0,2);

if temp.contains('1') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM pitanja WHERE pitanje LIKE ''1%'' ';
dbform.FDQuery1.Open;

for I := 1 to dbform.FDQuery1.RecordCount do
begin
temp2:= copy(dbform.FDQuery1.FieldByName('pitanje').AsString,5);

pitanjaComboBox.items.Add(dbform.FDQuery1.FieldByName('id_pitanja').AsString + '  -  ' +temp2);
dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

if temp.contains('2') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM pitanja WHERE pitanje LIKE ''2%'' ';
dbform.FDQuery1.Open;
for I := 1 to dbform.FDQuery1.RecordCount do
begin
temp2:= copy(dbform.FDQuery1.FieldByName('pitanje').AsString,5);

pitanjaComboBox.items.Add(dbform.FDQuery1.FieldByName('id_pitanja').AsString + '  -  ' +temp2);
dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

if temp.contains('3') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM pitanja WHERE pitanje LIKE ''3%'' ';
dbform.FDQuery1.Open;
for I := 1 to dbform.FDQuery1.RecordCount do
begin
temp2:= copy(dbform.FDQuery1.FieldByName('pitanje').AsString,5);

pitanjaComboBox.items.Add(dbform.FDQuery1.FieldByName('id_pitanja').AsString + '  -  ' +temp2);
dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

if temp.contains('4') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM pitanja WHERE pitanje LIKE ''4%'' ';
dbform.FDQuery1.Open;
for I := 1 to dbform.FDQuery1.RecordCount do
begin
temp2:= copy(dbform.FDQuery1.FieldByName('pitanje').AsString,5);

pitanjaComboBox.items.Add(dbform.FDQuery1.FieldByName('id_pitanja').AsString + '  -  ' +temp2);
dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

if temp.contains('5') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM pitanja WHERE pitanje LIKE ''5%'' ';
dbform.FDQuery1.Open;
for I := 1 to dbform.FDQuery1.RecordCount do
begin
temp2:= copy(dbform.FDQuery1.FieldByName('pitanje').AsString,5);

pitanjaComboBox.items.Add(dbform.FDQuery1.FieldByName('id_pitanja').AsString + '  -  ' +temp2);
dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

if temp.contains('6') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM pitanja WHERE pitanje LIKE ''6%'' ';
dbform.FDQuery1.Open;
for I := 1 to dbform.FDQuery1.RecordCount do
begin
temp2:= copy(dbform.FDQuery1.FieldByName('pitanje').AsString,5);

pitanjaComboBox.items.Add(dbform.FDQuery1.FieldByName('id_pitanja').AsString + '  -  ' +temp2);
dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

if temp.contains('7') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM pitanja WHERE pitanje LIKE ''7%'' ';
dbform.FDQuery1.Open;
for I := 1 to dbform.FDQuery1.RecordCount do
begin
temp2:= copy(dbform.FDQuery1.FieldByName('pitanje').AsString,5);

pitanjaComboBox.items.Add(dbform.FDQuery1.FieldByName('id_pitanja').AsString + '  -  ' +temp2);
dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

if temp.contains('8') then
begin
dbform.FDQuery1.SQL.Text := 'SELECT * FROM pitanja WHERE pitanje LIKE ''8%'' ';
dbform.FDQuery1.Open;
for I := 1 to dbform.FDQuery1.RecordCount do
begin
temp2:= copy(dbform.FDQuery1.FieldByName('pitanje').AsString,5);

pitanjaComboBox.items.Add(dbform.FDQuery1.FieldByName('id_pitanja').AsString + '  -  ' +temp2);
dbform.FDQuery1.next;
end;
dbform.FDQuery1.close;
end;

end;

end.
