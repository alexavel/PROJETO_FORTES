unit Un_TiposNota;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, un_CrudBase, Data.DB, Vcl.ImgList,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ToolWin;

type
  TfrmTipoNota = class(TfrmCrud)
    TNT_DESCRICAO: TLabeledEdit;
    tnt_id: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoNota: TfrmTipoNota;

implementation

uses
  u_Dm;

{$R *.dfm}

procedure TfrmTipoNota.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela    := 'TIPO_NOTA';
  SqlQuery  := Dm.fdqNota ;
  Titulo    := 'Tabela de Avaliações';
end;

end.
