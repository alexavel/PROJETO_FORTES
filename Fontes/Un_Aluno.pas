unit Un_Aluno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, un_CrudBase, Data.DB, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.Buttons, Vcl.ToolWin,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmAluno = class(TfrmCrud)
    Label2: TLabel;
    Label3: TLabel;
    ALN_ID: TLabeledEdit;
    ALN_NOME: TLabeledEdit;
    ALN_DTNASCIMENTO: TDateTimePicker;
    Label4: TLabel;
    pgDisciplinas: TPageControl;
    tabDisciplinas: TTabSheet;
    tabNotas: TTabSheet;
    grbDis: TGroupBox;
    cbxDisciplinas: TComboBox;
    btnInDiscliplina: TButton;
    dbgDisciplinas: TDBGrid;
    grbNotas: TGroupBox;
    cbxPeriodo: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    lbDisciplina: TLabel;
    Label8: TLabel;
    Button2: TButton;
    DBGrid1: TDBGrid;
    dcp_media: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIncluirExecute(Sender: TObject);
    procedure btnAlterarExecute(Sender: TObject);
    procedure btnExcluirExecute(Sender: TObject);
    procedure btnConsultarExecute(Sender: TObject);
    procedure btnInDiscliplinaClick(Sender: TObject);
    procedure dbgDisciplinasCellClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
  private
    procedure GridDisciplinas;
    procedure GridNotas;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAluno: TfrmAluno;

implementation

{$R *.dfm}

uses u_Dm;

procedure TfrmAluno.btnAlterarExecute(Sender: TObject);
begin
  inherited;
  GridDisciplinas;
end;

procedure TfrmAluno.btnConsultarExecute(Sender: TObject);
begin
  inherited;
  GridDisciplinas;
end;

procedure TfrmAluno.btnExcluirExecute(Sender: TObject);
begin
  inherited;
  GridDisciplinas;
end;

procedure TfrmAluno.btnIncluirExecute(Sender: TObject);
begin
  inherited;
  GridDisciplinas;
end;

procedure TfrmAluno.btnInDiscliplinaClick(Sender: TObject);
begin
  inherited;
  if cbxDisciplinas.ItemIndex > 0 then
      with Dm.GravaAlnDisc do
      begin
        Params[0].Value := (cbxDisciplinas.ItemIndex);
        Params[1].Value := dsCrud.DataSet.FieldByName('ALN_ID').AsString;
        ExecSQL;
      end;
      GridDisciplinas;
      cbxDisciplinas.ItemIndex := 0;


end;

procedure TfrmAluno.Button2Click(Sender: TObject);
begin
  inherited;

  if cbxPeriodo.ItemIndex > 0 then
      with Dm.GravaNotas do
      begin
        Params[0].Value := dbgDisciplinas.DataSource.DataSet.FieldByName('ADC_IDDCP').AsInteger;
        Params[1].Value := dsCrud.DataSet.FieldByName('ALN_ID').AsString;
        Params[2].Value := StringReplace(dcp_media.Text, ',', '.', [rfReplaceAll, rfIgnoreCase]);
        Params[3].Value := (cbxPeriodo.ItemIndex);
        ExecSQL;
      end;
      GridNotas;
      cbxPeriodo.ItemIndex := 0;

end;

procedure TfrmAluno.dbgDisciplinasCellClick(Column: TColumn);
begin
  inherited;
  lbDisciplina.Caption := dbgDisciplinas.DataSource.DataSet.FieldByName('DCP_DESCRICAO').AsString;
  GridNotas;
end;

procedure TfrmAluno.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela    := 'ALUNOS';
  SqlQuery  := Dm.fdqAluno ;
  Titulo    := 'Cadastro de Alunos';
end;

procedure TfrmAluno.FormShow(Sender: TObject);
begin
  inherited;
  cbxDisciplinas.Clear;
  with Dm.fdqDisciplina do
  begin
    Close;
    Open;
    if  not IsEmpty then
    begin
        cbxDisciplinas.Items.Add('Selecione uma disciplina ');
        while Not Eof do
        begin
          cbxDisciplinas.Items.Add(trim( FieldByName('DCP_ID').AsString)+'-'+trim( FieldByName('DCP_descricao').AsString));
          next;
        end;
        cbxDisciplinas.ItemIndex := 0;
    end;
  end;

  cbxPeriodo.Clear;
  with Dm.fdqNota do
  begin
    Close;
    Open;
    if  not IsEmpty then
    begin
        cbxPeriodo.Items.Add('Selecione o tipo de avaliação ');
        while Not Eof do
        begin
          cbxPeriodo.Items.Add(trim( FieldByName('TNT_ID').AsString)+'-'+trim( FieldByName('TNT_DESCRICAO').AsString));
          next;
        end;
        cbxPeriodo.ItemIndex := 0;
    end;
  end;
end;

procedure TfrmAluno.GridDisciplinas;
begin
  with Dm.cliAlnDisc do
  begin
    Close;
    Params[0].Value := IIf( wp_ModoEdicao <> MD_Tab_Insert, StrToIntDef( dsCrud.DataSet.FieldByName('ALN_ID').AsString,0),0) ;
    Active := True;
  end;
  grbDis.Enabled            := (wp_ModoEdicao = MD_Tab_Alterar ) ;
  pgDisciplinas.ActivePage  := tabDisciplinas;
  lbDisciplina.Caption      := dbgDisciplinas.DataSource.DataSet.FieldByName('DCP_DESCRICAO').AsString;
end;

procedure TfrmAluno.GridNotas;
begin
  with Dm.cliNotas do
  begin
      Close;
      Params[0].Value := IIf( wp_ModoEdicao <> MD_Tab_Insert, StrToIntDef( dsCrud.DataSet.FieldByName('ALN_ID').AsString,0),0) ;
      Params[1].Value := IIf( wp_ModoEdicao <> MD_Tab_Insert, StrToIntDef( dbgDisciplinas.datasource.DataSet.FieldByName('ADC_IDDCP').AsString,0),0) ;
      Active := True;
  end;
  grbNotas.Enabled :=  (wp_ModoEdicao = MD_Tab_Alterar ) ;
end;


end.
