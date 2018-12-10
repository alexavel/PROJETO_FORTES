inherited frmTipoNota: TfrmTipoNota
  Caption = 'frmTipoNota'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgCrud: TPageControl
    inherited tabLista: TTabSheet
      inherited dbgGrid: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'TNT_ID'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TNT_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 500
            Visible = True
          end>
      end
    end
    inherited tabCrud: TTabSheet
      inherited grbDados: TGroupBox
        object TNT_DESCRICAO: TLabeledEdit
          Left = 120
          Top = 40
          Width = 465
          Height = 21
          EditLabel.Width = 46
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o'
          TabOrder = 1
        end
        object tnt_id: TLabeledEdit
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
    DataSet = Dm.cliNota
  end
end
