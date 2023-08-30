object DM: TDM
  Height = 480
  Width = 897
  object Conn: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Veljko\Desktop\administracija.db3'
      'LockingMode=Normal'
      'Synchronous=Normal'
      'DriverID=SQLite')
    Connected = True
    Left = 56
    Top = 56
  end
  object qryClanovi: TFDQuery
    Active = True
    Connection = Conn
    SQL.Strings = (
      'SELECT * FROM clanovi;')
    Left = 128
    Top = 64
  end
  object qryRoditelji: TFDQuery
    Active = True
    Connection = Conn
    SQL.Strings = (
      'SELECT * FROM roditelji;')
    Left = 128
    Top = 160
  end
  object qryDeca: TFDQuery
    Connection = Conn
    SQL.Strings = (
      
        'SELECT p.id, p.firstname, p.lastname FROM parents p INNER JOIN m' +
        'embers_parents mp ON mp.member_id = 1 WHERE p.id = mp.parent_id;')
    Left = 120
    Top = 256
  end
  object qryDodajDeteRoditelju: TFDQuery
    Connection = Conn
    SQL.Strings = (
      
        'SELECT p.id, p.firstname, p.lastname FROM parents p INNER JOIN m' +
        'embers_parents mp ON mp.member_id = 1 WHERE p.id = mp.parent_id;')
    Left = 232
    Top = 256
  end
  object qryClanoviBezRoditelja: TFDQuery
    Active = True
    ChangeAlertName = 'qryClanoviBezRoditelja'
    Connection = Conn
    SQL.Strings = (
      'SELECT * FROM clanovi;')
    Left = 240
    Top = 64
  end
  object qryObrisiDeteRoditelju: TFDQuery
    Connection = Conn
    SQL.Strings = (
      
        'SELECT p.id, p.firstname, p.lastname FROM parents p INNER JOIN m' +
        'embers_parents mp ON mp.member_id = 1 WHERE p.id = mp.parent_id;')
    Left = 360
    Top = 256
  end
  object qryRoditeljaZaDete: TFDQuery
    Connection = Conn
    SQL.Strings = (
      
        'SELECT p.id, p.firstname, p.lastname FROM parents p INNER JOIN m' +
        'embers_parents mp ON mp.member_id = 1 WHERE p.id = mp.parent_id;')
    Left = 240
    Top = 160
  end
  object qryClanaPoID: TFDQuery
    Active = True
    ChangeAlertName = 'qryClanoviBezRoditelja'
    Connection = Conn
    SQL.Strings = (
      'SELECT * FROM clanovi;')
    Left = 352
    Top = 64
  end
  object qryTreneri: TFDQuery
    Active = True
    Connection = Conn
    SQL.Strings = (
      'SELECT * FROM treneri;')
    Left = 112
    Top = 344
  end
  object qryTipoviRoditeljaZaDete: TFDQuery
    Connection = Conn
    SQL.Strings = (
      'SELECT DISTINCT(tip), roditelj_id FROM clanovi_roditelji;')
    Left = 376
    Top = 168
  end
end
