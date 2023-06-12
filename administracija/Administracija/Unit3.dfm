object MemberDetailsForm: TMemberDetailsForm
  Left = 0
  Top = 0
  Caption = #268'lan'
  ClientHeight = 710
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object PnlMember: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 273
    Align = alTop
    Caption = 'PnlMember'
    ShowCaption = False
    TabOrder = 0
    ExplicitWidth = 625
    object Label2: TLabel
      Left = 25
      Top = 196
      Width = 101
      Height = 15
      Caption = 'Odaberite roditelja:'
    end
    object Label1: TLabel
      Left = 25
      Top = 16
      Width = 86
      Height = 21
      Caption = 'Izmeni '#269'lana'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtDateOfBirth: TEdit
      Left = 25
      Top = 165
      Width = 410
      Height = 23
      ImeName = 'US'
      TabOrder = 0
      TextHint = 'Datum ro'#273'enja'
    end
    object edtFirstname: TEdit
      Left = 25
      Top = 78
      Width = 410
      Height = 23
      ImeName = 'US'
      TabOrder = 1
      TextHint = 'Ime'
    end
    object edtJmbg: TEdit
      Left = 25
      Top = 136
      Width = 410
      Height = 23
      TabOrder = 2
      TextHint = 'JMBG'
    end
    object edtLastname: TEdit
      Left = 25
      Top = 107
      Width = 410
      Height = 23
      ImeName = 'US'
      TabOrder = 3
      TextHint = 'Prezime'
    end
    object edtId: TEdit
      Left = 25
      Top = 49
      Width = 410
      Height = 23
      Color = clWhite
      ImeName = 'US'
      CanUndoSelText = True
      TabOrder = 4
      TextHint = 'ID'
    end
    object RdoExistingParent: TRadioButton
      Left = 25
      Top = 217
      Width = 113
      Height = 17
      Caption = 'Postoja'#263'i roditelj'
      TabOrder = 5
      OnClick = RdoExistingParentClick
    end
    object RdoNewParent: TRadioButton
      Left = 25
      Top = 240
      Width = 113
      Height = 17
      Caption = 'Novi roditelj'
      TabOrder = 6
      OnClick = RdoNewParentClick
    end
  end
  object pnlParent: TPanel
    Left = 0
    Top = 273
    Width = 584
    Height = 248
    Align = alTop
    Caption = 'pnlParent'
    ShowCaption = False
    TabOrder = 1
    object PnlExistingParent: TPanel
      Left = 1
      Top = 1
      Width = 582
      Height = 377
      Align = alTop
      Caption = 'd'
      ShowCaption = False
      TabOrder = 0
      Visible = False
      ExplicitLeft = 2
      ExplicitTop = 6
      object edtParentSearchCriteria: TEdit
        Left = 24
        Top = 25
        Width = 449
        Height = 23
        ImeName = 'US'
        TabOrder = 0
        TextHint = 'Pretra'#382'i roditelja po: Ime / Prezime ili JMBG'
      end
      object cmdSearch: TButton
        Left = 488
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Pretra'#382'i'
        TabOrder = 1
      end
      object DBGrid1: TDBGrid
        Left = 24
        Top = 55
        Width = 539
        Height = 170
        DataSource = dsParents
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Width = 16
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'firstname'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'lastname'
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
            FieldName = 'tel_number'
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
    object PnlNewParent: TPanel
      Left = 1
      Top = 378
      Width = 582
      Height = 399
      Align = alTop
      Caption = 'PnlNewParent'
      Enabled = False
      ShowCaption = False
      TabOrder = 1
      Visible = False
      ExplicitTop = 1
      object Label3: TLabel
        Left = 33
        Top = 21
        Width = 158
        Height = 21
        Caption = 'Roditeljske informacije'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object edtParentFirstname: TEdit
        Left = 33
        Top = 56
        Width = 410
        Height = 23
        ImeName = 'US'
        TabOrder = 0
        TextHint = 'Ime roditelja'
      end
      object edtParentLastname: TEdit
        Left = 33
        Top = 85
        Width = 410
        Height = 23
        TabOrder = 1
        TextHint = 'Prezime roditelja'
      end
      object edtParentJmbg: TEdit
        Left = 33
        Top = 114
        Width = 410
        Height = 23
        TabOrder = 2
        TextHint = 'Jmbg roditelja'
      end
      object edtParentTelNumber: TEdit
        Left = 33
        Top = 143
        Width = 410
        Height = 23
        TabOrder = 3
        TextHint = 'Telefon roditelja'
      end
      object Edit1: TEdit
        Left = 33
        Top = 172
        Width = 410
        Height = 23
        ImeName = 'US'
        TabOrder = 4
        TextHint = 'Email roditelja'
      end
    end
  end
  object dsParents: TDataSource
    DataSet = DM.QryParentsSelect
    Left = 521
    Top = 50
  end
end
