unit Un_Disciplina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, un_CrudBase, Data.DB, Vcl.ImgList,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ToolWin, Vcl.Mask;

type
  TfrmDisciplina = class(TfrmCrud)
    dcp_descricao: TLabeledEdit;
    dcp_media: TMaskEdit;
    Label2: TLabel;
    dcp_id: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDisciplina: TfrmDisciplina;

implementation

uses
  u_Dm;

{$R *.dfm}

procedure TfrmDisciplina.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela    := 'DISCIPLINA';
  SqlQuery  := Dm.fdqDisciplina ;
  Titulo    := 'Cadastro de Discriplinas';

end;

end.
