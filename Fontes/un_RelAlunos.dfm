object frmRelAlunos: TfrmRelAlunos
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Resultados'
  ClientHeight = 127
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rgRel: TRadioGroup
    Left = 8
    Top = 8
    Width = 281
    Height = 105
    Caption = 'Pesquisa Avan'#231'ada'
    ItemIndex = 0
    Items.Strings = (
      'Todos Alunos'
      'Somente os Aprovados'
      'Somente os Reprovados')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 295
    Top = 12
    Width = 75
    Height = 25
    Caption = 'Gerar '
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 295
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 2
    OnClick = Button2Click
  end
  object RLReport1: TRLReport
    Left = 8
    Top = 135
    Width = 794
    Height = 1123
    DataSource = dsRelAluno
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 51
      BandType = btTitle
      object RLLabel1: TRLLabel
        Left = 3
        Top = 3
        Width = 214
        Height = 19
        Caption = 'FORTES INFORMATICA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 3
        Top = 19
        Width = 214
        Height = 16
        Caption = 'Relat'#243'rio de resultado escolar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Grupo_Aluno: TRLGroup
      Left = 38
      Top = 89
      Width = 718
      Height = 216
      DataFields = 'NTA_IDALN'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 37
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.FixedTop = True
        object RLLabel3: TRLLabel
          Left = 3
          Top = 3
          Width = 100
          Height = 15
          Caption = 'NOME DO ALUNO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 3
          Top = 19
          Width = 542
          Height = 15
          AutoSize = False
          DataField = 'ALN_NOME'
          DataSource = dsRelAluno
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLLabel4: TRLLabel
          Left = 583
          Top = 3
          Width = 73
          Height = 15
          Caption = 'RESULTADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText2: TRLDBText
          Left = 583
          Top = 19
          Width = 132
          Height = 15
          AutoSize = False
          DataField = 'STATUS'
          DataSource = dsRelAluno
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
      object Grupo_Disciplinas: TRLGroup
        Left = 0
        Top = 37
        Width = 718
        Height = 148
        DataFields = 'NTA_IDALN;NTA_IDDCP'
        object RLBand3: TRLBand
          Left = 0
          Top = 0
          Width = 718
          Height = 21
          BandType = btHeader
          object RLLabel5: TRLLabel
            Left = 99
            Top = 1
            Width = 67
            Height = 15
            Caption = 'DISCIPLINA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText3: TRLDBText
            Left = 172
            Top = 1
            Width = 173
            Height = 15
            AutoSize = False
            DataField = 'DCP_DESCRICAO'
            DataSource = dsRelAluno
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLLabel6: TRLLabel
            Left = 539
            Top = 2
            Width = 95
            Height = 15
            Alignment = taRightJustify
            Caption = 'M'#201'DIA ATINGIDA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText6: TRLDBText
            Left = 640
            Top = 2
            Width = 75
            Height = 15
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'MEDIAALUNO'
            DataSource = dsRelAluno
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
          object RLLabel7: TRLLabel
            Left = 351
            Top = 1
            Width = 114
            Height = 15
            Alignment = taRightJustify
            Caption = 'M'#201'DIA DISCIPLINA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLDBText7: TRLDBText
            Left = 471
            Top = 1
            Width = 48
            Height = 15
            AutoSize = False
            DataField = 'DCP_MEDIA'
            DataSource = dsRelAluno
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            Text = ''
          end
        end
        object Grupo_Notas: TRLGroup
          Left = 0
          Top = 21
          Width = 718
          Height = 80
          DataFields = 'NTA_IDALN;NTA_IDDCP;NTA_IDTNT'
          object RLBand4: TRLBand
            Left = 0
            Top = 0
            Width = 718
            Height = 25
            object RLDBText4: TRLDBText
              Left = 191
              Top = 2
              Width = 443
              Height = 15
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'TNT_DESCRICAO'
              DataSource = dsRelAluno
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
            object RLDBText5: TRLDBText
              Left = 640
              Top = 2
              Width = 75
              Height = 15
              Alignment = taRightJustify
              AutoSize = False
              DataField = 'NTA_NOTA'
              DataSource = dsRelAluno
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -12
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              Text = ''
            end
          end
        end
      end
    end
  end
  object fdqRelAluno: TFDQuery
    Active = True
    Connection = Dm.fdConexao
    SQL.Strings = (
      
        'Select NT.nta_idaln, NT.nta_iddcp, NT.nta_idtnt, aln_Nome, dcp_d' +
        'escricao, tnt_descricao, nta_nota,'
      
        '(SELECT AVG(nta_nota) FROM alunos_nota X where X.nta_idaln = NT.' +
        'nta_idaln and x.nta_iddcp = NT.nta_iddcp ) as MediaAluno,'
      'Case'
      
        '   when (SELECT AVG(nta_nota) FROM alunos_nota X where X.nta_ida' +
        'ln = NT.nta_idaln and x.nta_iddcp = NT.nta_iddcp ) >= dcp_media ' +
        'then '#39'APROVADO'#39
      '   ELSE '#39'REPROVADO'#39' END as Status, dcp_media'
      'from alunos_nota as NT'
      'join alunos On aln_id = NT.nta_idaln'
      'join disciplina On dcp_id = NT.nta_iddcp'
      'join tipo_nota on tnt_id = NT.nta_idtnt'
      'ORDER BY NT.nta_idaln, NT.nta_iddcp, NT.nta_idtnt')
    Left = 152
    object fdqRelAlunoNTA_IDALN: TIntegerField
      FieldName = 'NTA_IDALN'
      Origin = 'NTA_IDALN'
    end
    object fdqRelAlunoNTA_IDDCP: TIntegerField
      FieldName = 'NTA_IDDCP'
      Origin = 'NTA_IDDCP'
    end
    object fdqRelAlunoNTA_IDTNT: TIntegerField
      FieldName = 'NTA_IDTNT'
      Origin = 'NTA_IDTNT'
    end
    object fdqRelAlunoALN_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ALN_NOME'
      Origin = 'ALN_NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object fdqRelAlunoDCP_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DCP_DESCRICAO'
      Origin = 'DCP_DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object fdqRelAlunoTNT_DESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TNT_DESCRICAO'
      Origin = 'TNT_DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 15
    end
    object fdqRelAlunoNTA_NOTA: TCurrencyField
      FieldName = 'NTA_NOTA'
      Origin = 'NTA_NOTA'
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
    object fdqRelAlunoMEDIAALUNO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MEDIAALUNO'
      Origin = 'MEDIAALUNO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object fdqRelAlunoSTATUS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS'
      Origin = 'STATUS'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 9
    end
    object fdqRelAlunoDCP_MEDIA: TCurrencyField
      AutoGenerateValue = arDefault
      FieldName = 'DCP_MEDIA'
      Origin = 'DCP_MEDIA'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '##0.00'
      EditFormat = '##0.00'
    end
  end
  object dsRelAluno: TDataSource
    DataSet = fdqRelAluno
    Left = 248
    Top = 8
  end
end
