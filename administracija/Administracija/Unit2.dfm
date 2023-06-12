object MembersForm: TMembersForm
  Left = 0
  Top = 0
  Caption = #268'lanovi'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object pnlSearch: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 107
    Align = alTop
    Caption = 'pnlSearch'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 624
    object lbSearch: TLabel
      Left = 24
      Top = 16
      Width = 42
      Height = 15
      Caption = 'Pretra'#382'i:'
    end
    object rdBtnByName: TRadioButton
      Left = 24
      Top = 37
      Width = 137
      Height = 17
      Caption = 'Po imenu/prezimenu'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rdBtnByJMBG: TRadioButton
      Left = 167
      Top = 37
      Width = 66
      Height = 17
      Caption = 'Po JMBG'
      TabOrder = 1
    end
    object edtSearchCriteria: TEdit
      Left = 24
      Top = 60
      Width = 209
      Height = 23
      ImeName = 'US'
      TabOrder = 2
      TextHint = 'Unesite krijetrijum pretrage'
    end
    object cmdSearch: TButton
      Left = 248
      Top = 59
      Width = 75
      Height = 25
      Caption = 'Pretra'#382'i'
      TabOrder = 3
      OnClick = cmdSearchClick
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 107
    Width = 628
    Height = 262
    Align = alClient
    Caption = 'pnlGrid'
    ShowCaption = False
    TabOrder = 1
    ExplicitWidth = 624
    ExplicitHeight = 261
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 626
      Height = 260
      Align = alClient
      DataSource = dsMembers
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
          Width = 32
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Ime (Srednje) Prezime'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JMBG'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Datum ro'#273'enja'
          Width = 120
          Visible = True
        end>
    end
  end
  object pnlControls: TPanel
    Left = 0
    Top = 369
    Width = 628
    Height = 73
    Align = alBottom
    Caption = 'pnlControls'
    ShowCaption = False
    TabOrder = 2
    ExplicitTop = 368
    ExplicitWidth = 624
    DesignSize = (
      628
      73)
    object cmdClose: TButton
      Left = 536
      Top = 24
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Zatvori'
      TabOrder = 0
      OnClick = cmdCloseClick
      ExplicitLeft = 532
    end
    object cmdUpdate: TButton
      Left = 448
      Top = 24
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Izmeni'
      TabOrder = 1
      OnClick = cmdUpdateClick
      ExplicitLeft = 444
    end
    object cmdCreate: TButton
      Left = 360
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Napravi'
      TabOrder = 2
      OnClick = cmdCreateClick
    end
  end
  object dsMembers: TDataSource
    DataSet = DM.QryMembersSelect
    Left = 560
    Top = 40
  end
end
