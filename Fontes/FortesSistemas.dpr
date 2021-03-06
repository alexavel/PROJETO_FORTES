program FortesSistemas;

uses
  Vcl.Forms,
  Un_Principal in 'Un_Principal.pas' {frmPrincipal},
  u_Dm in 'u_Dm.pas' {Dm: TDataModule},
  un_CrudBase in 'Classes\un_CrudBase.pas' {frmCrud},
  Un_Disciplina in 'Un_Disciplina.pas' {frmDisciplina},
  Un_TiposNota in 'Un_TiposNota.pas' {frmTipoNota},
  un_Professores in 'un_Professores.pas' {frmProfessores},
  Un_Aluno in 'Un_Aluno.pas' {frmAluno},
  un_RelAlunos in 'un_RelAlunos.pas' {frmRelAlunos},
  un_RelProfessor in 'un_RelProfessor.pas' {frmRelProfessor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
