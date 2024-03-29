object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Treneri'
  ClientHeight = 578
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 113
    Align = alTop
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 768
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
    object rdBtnPoJMBG: TRadioButton
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
    end
    object cmdResetFilter: TButton
      Left = 317
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Resetuj filter'
      TabOrder = 4
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 113
    Width = 804
    Height = 416
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 768
    object TabSheet1: TTabSheet
      Caption = 'Forma'
      object Label1: TLabel
        Left = 17
        Top = 66
        Width = 20
        Height = 15
        Caption = 'Ime'
      end
      object Label2: TLabel
        Left = 17
        Top = 124
        Width = 42
        Height = 15
        Caption = 'Prezime'
      end
      object Label3: TLabel
        Left = 17
        Top = 180
        Width = 30
        Height = 15
        Caption = 'JMBG'
      end
      object Label4: TLabel
        Left = 17
        Top = 238
        Width = 79
        Height = 15
        Caption = 'Datum ro'#273'enja'
      end
      object Label11: TLabel
        Left = 17
        Top = 16
        Width = 11
        Height = 15
        Caption = 'ID'
      end
      object DBEdit1: TDBEdit
        Left = 17
        Top = 145
        Width = 240
        Height = 23
        DataField = 'prezime'
        DataSource = dsTreneri
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 17
        Top = 87
        Width = 240
        Height = 23
        DataField = 'ime'
        DataSource = dsTreneri
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 17
        Top = 259
        Width = 240
        Height = 23
        DataField = 'godina_rodjenja'
        DataSource = dsTreneri
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 17
        Top = 201
        Width = 240
        Height = 23
        DataField = 'jmbg'
        DataSource = dsTreneri
        TabOrder = 2
      end
      object DBNavigator1: TDBNavigator
        Left = 17
        Top = 332
        Width = 240
        Height = 25
        DataSource = dsTreneri
        TabOrder = 4
      end
      object DBCheckBox1: TDBCheckBox
        Left = 17
        Top = 298
        Width = 240
        Height = 17
        Caption = 'Sertfikat'
        DataField = 'sertifikat'
        DataSource = dsTreneri
        TabOrder = 5
      end
      object edtTreneriId: TDBEdit
        Left = 17
        Top = 37
        Width = 240
        Height = 23
        Color = clBtnFace
        DataField = 'id'
        DataSource = dsTreneri
        Enabled = False
        TabOrder = 6
      end
    end
    object Tabela: TTabSheet
      Caption = 'Tabela'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 764
        Height = 386
        Align = alClient
        DataSource = dsTreneri
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
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ime'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'prezime'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'jmbg'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'godina_rodjenja'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sertifikat'
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 529
    Width = 804
    Height = 49
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 768
    DesignSize = (
      804
      49)
    object cmdZatvori: TButton
      Left = 708
      Top = 6
      Width = 80
      Height = 35
      Anchors = [akTop, akRight]
      Caption = 'Zatvori'
      TabOrder = 0
      ExplicitLeft = 672
    end
  end
  object dsTreneri: TDataSource
    DataSet = DM.qryTreneri
    Left = 680
    Top = 40
  end
  object menu: TMainMenu
    Left = 596
    Top = 42
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
    object reneri1: TMenuItem
      Caption = 'Treneri'
      object Forma3: TMenuItem
        Caption = 'Forma'
      end
    end
  end
end
