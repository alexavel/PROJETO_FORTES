unit Un_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList, Vcl.Menus, Vcl.ComCtrls,
  Vcl.ToolWin, System.Actions, Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan;

type
  TfrmPrincipal = class(TForm)
    mnPrincipal: TMainMenu;
    abelas1: TMenuItem;
    Cadastros1: TMenuItem;
    Notas1: TMenuItem;
    imgPrincipal: TImageList;
    atmPrincipal: TActionManager;
    actDisciplinas: TAction;
    Disciplinas1: TMenuItem;
    actSair: TAction;
    N1: TMenuItem;
    Sair1: TMenuItem;
    actNotas: TAction;
    iposdeAvaliaes1: TMenuItem;
    actProfessores: TAction;
    Professores1: TMenuItem;
    actAluno: TAction;
    Alunos1: TMenuItem;
    actRelAlunos: TAction;
    RelatriodeResultadosdeAlunos1: TMenuItem;
    actRelProfessor: TAction;
    Professores2: TMenuItem;
    procedure actDisciplinasExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actNotasExecute(Sender: TObject);
    procedure actProfessoresExecute(Sender: TObject);
    procedure actAlunoExecute(Sender: TObject);
    procedure actRelAlunosExecute(Sender: TObject);
    procedure actRelProfessorExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses u_Dm, un_CrudBase, Un_Disciplina, Un_TiposNota, un_Professores, Un_Aluno,
  un_RelAlunos, un_RelProfessor;

procedure TfrmPrincipal.actAlunoExecute(Sender: TObject);
begin
  frmAluno := TfrmAluno.create(Self);
  frmAluno.showmodal;
end;

procedure TfrmPrincipal.actDisciplinasExecute(Sender: TObject);
begin
  frmDisciplina := TfrmDisciplina.Create(Self);
  frmDisciplina.ShowModal;
end;

procedure TfrmPrincipal.actNotasExecute(Sender: TObject);
begin
  frmTipoNota := tfrmTipoNota.Create(Self);
  frmTipoNota.showmodal;
end;

procedure TfrmPrincipal.actProfessoresExecute(Sender: TObject);
begin
   frmProfessores := TfrmProfessores.Create(Self);
   frmProfessores.ShowModal;
end;

procedure TfrmPrincipal.actRelAlunosExecute(Sender: TObject);
begin
  frmRelAlunos := TfrmRelAlunos.Create(Self);
  frmRelAlunos.ShowModal;
end;

procedure TfrmPrincipal.actRelProfessorExecute(Sender: TObject);
begin
   frmRelProfessor := TfrmRelProfessor.Create(Self);
   frmRelProfessor.ShowModal;
end;

procedure TfrmPrincipal.actSairExecute(Sender: TObject);
begin
 Dm.fdConexao.Close;
 Close;
end;

end.
