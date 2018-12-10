inherited frmDisciplina: TfrmDisciplina
  Caption = 'frmDisciplina'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgCrud: TPageControl
    inherited tabLista: TTabSheet
      inherited dbgGrid: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'DCP_ID'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DCP_DESCRICAO'
            Title.Caption = 'Descricao'
            Width = 500
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
    inherited tabCrud: TTabSheet
      inherited grbDados: TGroupBox
        object Label2: TLabel
          Left = 601
          Top = 25
          Width = 28
          Height = 13
          Caption = 'M'#233'dia'
        end
        object dcp_descricao: TLabeledEdit
          Left = 120
          Top = 40
          Width = 465
          Height = 21
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o'
          TabOrder = 1
        end
        object dcp_media: TMaskEdit
          Left = 600
          Top = 40
          Width = 69
          Height = 21
          TabOrder = 2
          Text = ''
        end
        object dcp_id: TLabeledEdit
          Left = 16
          Top = 40
          Width = 89
          Height = 21
          EditLabel.Width = 33
          EditLabel.Height = 13
          EditLabel.Caption = 'C'#243'digo'
          TabOrder = 0
        end
      end
    end
  end
  inherited dsCrud: TDataSource
    DataSet = Dm.cliDisciplina
  end
end
