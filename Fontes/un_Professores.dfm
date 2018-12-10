inherited frmProfessores: TfrmProfessores
  Caption = 'frmProfessores'
  ClientHeight = 475
  OnCreate = FormCreate
  ExplicitHeight = 514
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgCrud: TPageControl
    Height = 386
    ExplicitHeight = 386
    inherited tabLista: TTabSheet
      ExplicitHeight = 358
      inherited dbgGrid: TDBGrid
        Height = 298
        Columns = <
          item
            Expanded = False
            FieldName = 'PFR_ID'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PFR_NOME'
            Title.Caption = 'Nome do Professor'
            Width = 500
            Visible = True
          end>
      end
    end
    inherited tabCrud: TTabSheet
      ExplicitHeight = 358
      inherited grbDados: TGroupBox
        Height = 352
        ExplicitHeight = 352
        object Label2: TLabel
          Left = 561
          Top = 25
          Width = 19
          Height = 13
          Caption = 'CPF'
        end
        object Label3: TLabel
          Left = 16
          Top = 69
          Width = 73
          Height = 13
          Caption = 'Dt. Nascimento'
        end
        object PFR_ID: TLabeledEdit
          Left = 16
          Top = 40
          Width = 89
          Height = 21
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo'
          TabOrder = 0
        end
        object PFR_NOME: TLabeledEdit
          Left = 120
          Top = 40
          Width = 425
          Height = 21
          EditLabel.Width = 91
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome do Professor'
          TabOrder = 1
        end
        object PFR_CPF: TMaskEdit
          Left = 560
          Top = 40
          Width = 105
          Height = 21
          TabOrder = 2
          Text = ''
        end
        object PFR_DTNASCIMENTO: TDateTimePicker
          Left = 16
          Top = 88
          Width = 89
          Height = 21
          Date = 43443.547330983800000000
          Time = 43443.547330983800000000
          TabOrder = 3
        end
        object grbDis: TGroupBox
          Left = 15
          Top = 115
          Width = 650
          Height = 222
          Caption = 'Disciplinas'
          TabOrder = 4
          object cbxDisciplinas: TComboBox
            Left = 16
            Top = 24
            Width = 345
            Height = 22
            Style = csOwnerDrawFixed
            TabOrder = 0
          end
          object btnInDiscliplina: TButton
            Left = 375
            Top = 24
            Width = 75
            Height = 25
            Caption = 'Inserir'
            TabOrder = 1
            OnClick = btnInDiscliplinaClick
          end
          object dbgDisciplinas: TDBGrid
            Left = 16
            Top = 55
            Width = 617
            Height = 154
            DataSource = Dm.dsDiscDet
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'DPD_IDDCP'
                Title.Caption = 'C'#243'digo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DCP_DESCRICAO'
                Title.Caption = 'Disciplina'
                Width = 400
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DCP_MEDIA'
                Title.Caption = 'Media'
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited dsCrud: TDataSource
    DataSet = Dm.cliDocentes
  end
end
