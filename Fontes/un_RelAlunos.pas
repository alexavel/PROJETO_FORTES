unit un_RelAlunos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, RLReport, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmRelAlunos = class(TForm)
    rgRel: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    fdqRelAluno: TFDQuery;
    dsRelAluno: TDataSource;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    Grupo_Aluno: TRLGroup;
    RLBand2: TRLBand;
    RLLabel3: TRLLabel;
    RLDBText1: TRLDBText;
    RLLabel4: TRLLabel;
    RLDBText2: TRLDBText;
    Grupo_Disciplinas: TRLGroup;
    RLBand3: TRLBand;
    RLLabel5: TRLLabel;
    RLDBText3: TRLDBText;
    Grupo_Notas: TRLGroup;
    RLBand4: TRLBand;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel6: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText7: TRLDBText;
    fdqRelAlunoNTA_IDALN: TIntegerField;
    fdqRelAlunoNTA_IDDCP: TIntegerField;
    fdqRelAlunoNTA_IDTNT: TIntegerField;
    fdqRelAlunoALN_NOME: TStringField;
    fdqRelAlunoDCP_DESCRICAO: TStringField;
    fdqRelAlunoTNT_DESCRICAO: TStringField;
    fdqRelAlunoNTA_NOTA: TCurrencyField;
    fdqRelAlunoMEDIAALUNO: TBCDField;
    fdqRelAlunoSTATUS: TStringField;
    fdqRelAlunoDCP_MEDIA: TCurrencyField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAlunos: TfrmRelAlunos;

implementation

{$R *.dfm}

uses u_Dm;

procedure TfrmRelAlunos.Button1Click(Sender: TObject);
var
  wl_Script: string;
  wl_where: string;
begin

case rgRel.ItemIndex of
  0: wl_where := '';
  1: wl_where := ' where (SELECT AVG(nta_nota) FROM alunos_nota X where X.nta_idaln = NT.nta_idaln and x.nta_iddcp = NT.nta_iddcp ) >= dcp_media ';
  2: wl_where := ' where (SELECT AVG(nta_nota) FROM alunos_nota X where X.nta_idaln = NT.nta_idaln and x.nta_iddcp = NT.nta_iddcp ) < dcp_media ';
end;

  wl_Script := ' Select NT.nta_idaln, NT.nta_iddcp, NT.nta_idtnt, aln_Nome, dcp_descricao, tnt_descricao, nta_nota,                          '+
               ' (SELECT AVG(nta_nota) FROM alunos_nota X where X.nta_idaln = NT.nta_idaln and x.nta_iddcp = NT.nta_iddcp ) as MediaAluno,   '+
               ' Case '+
               '      when (SELECT AVG(nta_nota) FROM alunos_nota X where X.nta_idaln = NT.nta_idaln and x.nta_iddcp = NT.nta_iddcp ) >= dcp_media then ''APROVADO'' '+
               '      ELSE ''REPROVADO'' END as Status, dcp_media '+
               ' from alunos_nota as NT '+
               ' join alunos On aln_id = NT.nta_idaln '+
               ' join disciplina On dcp_id = NT.nta_iddcp '+
               ' join tipo_nota on tnt_id = NT.nta_idtnt '+
               wl_where+
               ' ORDER BY NT.nta_idaln, NT.nta_iddcp, NT.nta_idtnt ';
  with fdqRelAluno do
  begin
    Close;
    SQL.Text := wl_Script;
    Open;
    if IsEmpty then
    begin
      MessageDlg(Format(
        'N�o foram encontrado resultados para esta pesquisa', []), mtInformation, [mbOK], 0);
        Exit;
    end;
    RLReport1.PreviewModal;

  end;

end;

procedure TfrmRelAlunos.Button2Click(Sender: TObject);
begin
fdqRelAluno.Close;
Close;
end;

end.
