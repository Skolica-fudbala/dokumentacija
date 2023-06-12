object DM: TDM
  Height = 480
  Width = 640
  object Conn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Veljko\Documents\Administracija\administracija' +
        '.db3'
      'DriverID=SQLite')
    Connected = True
    Left = 80
    Top = 80
  end
  object QryMembersSelect: TFDQuery
    Connection = Conn
    Left = 168
    Top = 88
  end
  object QryParentsSelect: TFDQuery
    Connection = Conn
    Left = 176
    Top = 192
  end
  object QryMemberCreate: TFDQuery
    ChangeAlertName = 'QryMemberCreate'
    Connection = Conn
    Left = 280
    Top = 80
  end
  object QryParentCreate: TFDQuery
    Connection = Conn
    Left = 280
    Top = 200
  end
end
