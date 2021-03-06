inherited frmAluno: TfrmAluno
  Caption = 'frmAluno'
  ClientHeight = 466
  OnCreate = FormCreate
  ExplicitWidth = 718
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 569
    Top = 129
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label3: TLabel [1]
    Left = 24
    Top = 173
    Width = 73
    Height = 13
    Caption = 'Dt. Nascimento'
  end
  inherited pgCrud: TPageControl
    Height = 377
    inherited tabLista: TTabSheet
      inherited dbgGrid: TDBGrid
        Height = 289
        Columns = <
          item
            Expanded = False
            FieldName = 'ALN_ID'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALN_NOME'
            Title.Caption = 'Nome do Aluno'
            Width = 500
            Visible = True
          end>
      end
    end
    inherited tabCrud: TTabSheet
      inherited grbDados: TGroupBox
        Height = 343
        object Label4: TLabel
          Left = 561
          Top = 21
          Width = 79
          Height = 13
          Caption = 'Dt. Nascimento'
        end
        object ALN_ID: TLabeledEdit
          Left = 16
          Top = 40
          Width = 89
          Height = 21
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo'
          TabOrder = 0
        end
        object ALN_NOME: TLabeledEdit
          Left = 120
          Top = 40
          Width = 425
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome do Aluno'
          TabOrder = 1
        end
        object ALN_DTNASCIMENTO: TDateTimePicker
          Left = 561
          Top = 40
          Width = 95
          Height = 21
          Date = 43443.547330983800000000
          Time = 43443.547330983800000000
          TabOrder = 2
        end
        object pgDisciplinas: TPageControl
          Left = 16
          Top = 82
          Width = 657
          Height = 255
          ActivePage = tabDisciplinas
          TabOrder = 3
          object tabDisciplinas: TTabSheet
            Caption = 'Disciplinas'
            ExplicitWidth = 645
            ExplicitHeight = 267
            object grbDis: TGroupBox
              Left = 3
              Top = 0
              Width = 643
              Height = 222
              Caption = 'Disciplinas'
              TabOrder = 0
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
                DataSource = Dm.dsAlnDisc
                TabOrder = 2
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnCellClick = dbgDisciplinasCellClick
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ADC_IDDCP'
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
          object tabNotas: TTabSheet
            Caption = 'Notas'
            ImageIndex = 1
            ExplicitWidth = 281
            ExplicitHeight = 165
            object grbNotas: TGroupBox
              Left = 3
              Top = 3
              Width = 638
              Height = 221
              TabOrder = 0
              object Label5: TLabel
                Left = 252
                Top = 5
                Width = 49
                Height = 13
                Caption = 'Periodo'
              end
              object Label6: TLabel
                Left = 12
                Top = 5
                Width = 43
                Height = 13
                Caption = 'Disciplina'
              end
              object lbDisciplina: TLabel
                Left = 12
                Top = 20
                Width = 234
                Height = 22
                AutoSize = False
                Caption = 'Disciplina'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -19
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label8: TLabel
                Left = 445
                Top = 5
                Width = 23
                Height = 13
                Caption = 'Nota'
              end
              object cbxPeriodo: TComboBox
                Left = 252
                Top = 20
                Width = 173
                Height = 22
                Style = csOwnerDrawFixed
                TabOrder = 0
              end
              object Button2: TButton
                Left = 551
                Top = 20
                Width = 75
                Height = 22
                Caption = 'Inserir'
                TabOrder = 1
                OnClick = Button2Click
              end
              object DBGrid1: TDBGrid
                Left = 12
                Top = 48
                Width = 615
                Height = 161
                DataSource = Dm.dsNotas
                TabOrder = 2
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'TNT_DESCRICAO'
                    Title.Caption = 'Descric'#227'o'
                    Width = 420
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NTA_NOTA'
                    Title.Caption = 'Nota'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DCP_MEDIA'
                    Title.Caption = 'Media'
                    Width = 73
                    Visible = True
                  end>
              end
              object dcp_media: TMaskEdit
                Tag = 999
                Left = 444
                Top = 20
                Width = 79
                Height = 22
                TabOrder = 3
                Text = ''
              end
            end
          end
        end
      end
    end
  end
  inherited dsCrud: TDataSource
    DataSet = Dm.cliAluno
  end
end
