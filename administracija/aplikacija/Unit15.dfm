object formRoditelji: TformRoditelji
  Left = 0
  Top = 0
  Caption = 'Roditelji'
  ClientHeight = 646
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = menu
  OnShow = FormShow
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 113
    Width = 804
    Height = 481
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 800
    object TabSheet1: TTabSheet
      Caption = 'Forma'
      object Label1: TLabel
        Left = 25
        Top = 72
        Width = 20
        Height = 15
        Caption = 'Ime'
      end
      object Label2: TLabel
        Left = 25
        Top = 130
        Width = 42
        Height = 15
        Caption = 'Prezime'
      end
      object Label5: TLabel
        Left = 328
        Top = 16
        Width = 34
        Height = 21
        Caption = 'Deca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 25
        Top = 22
        Width = 11
        Height = 15
        Caption = 'ID'
      end
      object Label4: TLabel
        Left = 25
        Top = 183
        Width = 30
        Height = 15
        Caption = 'JMBG'
      end
      object Label7: TLabel
        Left = 25
        Top = 239
        Width = 67
        Height = 15
        Caption = 'Broj telefona'
      end
      object Label8: TLabel
        Left = 25
        Top = 337
        Width = 66
        Height = 15
        Caption = 'Email adresa'
      end
      object Label3: TLabel
        Left = 25
        Top = 289
        Width = 17
        Height = 15
        Caption = 'Pol'
      end
      object edtPrezime: TDBEdit
        Left = 25
        Top = 151
        Width = 240
        Height = 23
        DataField = 'prezime'
        DataSource = dtRoditelji
        TabOrder = 1
      end
      object edtIme: TDBEdit
        Left = 25
        Top = 93
        Width = 240
        Height = 23
        DataField = 'ime'
        DataSource = dtRoditelji
        TabOrder = 0
      end
      object DBNavigator1: TDBNavigator
        Left = 25
        Top = 396
        Width = 240
        Height = 25
        DataSource = dtRoditelji
        TabOrder = 2
        OnClick = DBNavigator1Click
      end
      object lbDeca: TListBox
        Left = 328
        Top = 86
        Width = 305
        Height = 256
        ItemHeight = 15
        TabOrder = 3
      end
      object cmdObrisiDete: TButton
        Left = 328
        Top = 348
        Width = 75
        Height = 25
        Caption = 'Obrisi'
        TabOrder = 4
        OnClick = cmdObrisiDeteClick
      end
      object cmdDodaj: TButton
        Left = 544
        Top = 42
        Width = 89
        Height = 25
        Caption = 'Dodaj'
        TabOrder = 5
        OnClick = cmdDodajClick
      end
      object cbDeca: TComboBox
        Left = 328
        Top = 43
        Width = 210
        Height = 23
        TabOrder = 6
        Text = 'Izaberite dete'
      end
      object edtId: TDBEdit
        Left = 25
        Top = 43
        Width = 240
        Height = 23
        Color = clBtnFace
        DataField = 'id'
        DataSource = dtRoditelji
        Enabled = False
        TabOrder = 7
      end
      object edtJMBG: TDBEdit
        Left = 25
        Top = 204
        Width = 240
        Height = 23
        DataField = 'jmbg'
        DataSource = dtRoditelji
        TabOrder = 8
      end
      object edtBrTelefona: TDBEdit
        Left = 25
        Top = 260
        Width = 240
        Height = 23
        DataField = 'br_telefona'
        DataSource = dtRoditelji
        TabOrder = 9
      end
      object edtEmail: TDBEdit
        Left = 25
        Top = 358
        Width = 240
        Height = 23
        DataField = 'email'
        DataSource = dtRoditelji
        TabOrder = 10
      end
      object DBComboBox1: TDBComboBox
        Left = 25
        Top = 310
        Width = 240
        Height = 23
        DataField = 'pol'
        DataSource = dtRoditelji
        Items.Strings = (
          'M'
          'Z')
        TabOrder = 11
      end
    end
    object Tabela: TTabSheet
      Caption = 'Tabela'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 796
        Height = 451
        Align = alClient
        DataSource = dtRoditelji
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ime'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'prezime'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'jmbg'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'br_telefona'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Width = 100
            Visible = True
          end>
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 113
    Align = alTop
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 800
    object lbSearch: TLabel
      Left = 21
      Top = 18
      Width = 42
      Height = 15
      Caption = 'Pretra'#382'i:'
    end
    object rdBtnPoImenu: TRadioButton
      Left = 21
      Top = 39
      Width = 137
      Height = 17
      Caption = 'Po imenu/prezimenu'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rdBtnPoJmbg: TRadioButton
      Left = 164
      Top = 40
      Width = 66
      Height = 17
      Caption = 'Po JMBG'
      TabOrder = 1
    end
    object edtSearchCriteria: TEdit
      Left = 21
      Top = 64
      Width = 209
      Height = 23
      ImeName = 'US'
      TabOrder = 2
      TextHint = 'Unesite krijetrijum pretrage'
    end
    object cmdPretrazi: TButton
      Left = 236
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Pretra'#382'i'
      TabOrder = 3
      OnClick = cmdPretraziClick
    end
    object cmdResetFilter: TButton
      Left = 317
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Resetuj filter'
      TabOrder = 4
      OnClick = cmdResetFilterClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 594
    Width = 804
    Height = 49
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 800
    DesignSize = (
      804
      49)
    object cmdZatvori: TButton
      Left = 684
      Top = 6
      Width = 80
      Height = 35
      Anchors = [akTop, akRight]
      Caption = 'Zatvori'
      TabOrder = 0
      OnClick = cmdZatvoriClick
      ExplicitLeft = 680
    end
  end
  object menu: TMainMenu
    Left = 600
    Top = 26
    object Clanovi1: TMenuItem
      Caption = #268'lanovi'
      object Forma1: TMenuItem
        Caption = 'Forma'
      end
    end
    object Roditelji: TMenuItem
      Caption = 'Roditelji'
      object Forma2: TMenuItem
        Caption = 'Forma'
      end
    end
  end
  object dtRoditelji: TDataSource
    DataSet = DM.qryRoditelji
    Left = 528
    Top = 24
  end
end
