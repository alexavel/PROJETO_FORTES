unit u_Dm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.IBBase, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.Provider,
  Datasnap.DBClient, FireDAC.Comp.DataSet, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TDm = class(TDataModule)
    fdConexao: TFDConnection;
    fdDriverFB: TFDPhysFBDriverLink;
    fdqDisciplina: TFDQuery;
    cliDisciplina: TClientDataSet;
    dspDisciplina: TDataSetProvider;
    dsDisciplina: TDataSource;
    fdqDisciplinaDCP_ID: TIntegerField;
    fdqDisciplinaDCP_DESCRICAO: TStringField;
    fdqDisciplinaDCP_MEDIA: TCurrencyField;
    cliDisciplinaDCP_ID: TIntegerField;
    cliDisciplinaDCP_DESCRICAO: TStringField;
    cliDisciplinaDCP_MEDIA: TCurrencyField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    ExecCommando: TFDQuery;
    fdqNota: TFDQuery;
    cliNota: TClientDataSet;
    dspNota: TDataSetProvider;
    dsNota: TDataSource;
    fdqNotaTNT_ID: TIntegerField;
    fdqNotaTNT_DESCRICAO: TStringField;
    cliNotaTNT_ID: TIntegerField;
    cliNotaTNT_DESCRICAO: TStringField;
    fdqDocentes: TFDQuery;
    cliDocentes: TClientDataSet;
    dspDocentes: TDataSetProvider;
    dsDocentes: TDataSource;
    fdqDocentesPFR_ID: TIntegerField;
    fdqDocentesPFR_NOME: TStringField;
    fdqDocentesPFR_CPF: TStringField;
    fdqDocentesPFR_ENDERECO: TStringField;
    fdqDocentesPFR_NUMERO: TStringField;
    fdqDocentesPFR_COMPLEMENTO: TStringField;
    fdqDocentesPFR_BAIRRO: TStringField;
    fdqDocentesPFR_CIDADE: TStringField;
    fdqDocentesPFR_UF: TStringField;
    fdqDocentesPFR_CEP: TStringField;
    fdqDocentesPFR_DTNASCIMENTO: TDateField;
    fdqDocentesPFR_DTCADASTRO: TDateField;
    cliDocentesPFR_ID: TIntegerField;
    cliDocentesPFR_NOME: TStringField;
    cliDocentesPFR_CPF: TStringField;
    cliDocentesPFR_ENDERECO: TStringField;
    cliDocentesPFR_NUMERO: TStringField;
    cliDocentesPFR_COMPLEMENTO: TStringField;
    cliDocentesPFR_BAIRRO: TStringField;
    cliDocentesPFR_CIDADE: TStringField;
    cliDocentesPFR_UF: TStringField;
    cliDocentesPFR_CEP: TStringField;
    cliDocentesPFR_DTNASCIMENTO: TDateField;
    cliDocentesPFR_DTCADASTRO: TDateField;
    fdqDiscDet: TFDQuery;
    cliDiscDet: TClientDataSet;
    dspDiscDet: TDataSetProvider;
    dsDiscDet: TDataSource;
    fdqDiscDetDPD_ID: TIntegerField;
    fdqDiscDetDPD_IDDCP: TIntegerField;
    fdqDiscDetDPD_IDPFR: TIntegerField;
    fdqDiscDetDCP_ID: TIntegerField;
    fdqDiscDetDCP_DESCRICAO: TStringField;
    fdqDiscDetDCP_MEDIA: TCurrencyField;
    fdqDiscDetPFR_ID: TIntegerField;
    fdqDiscDetPFR_NOME: TStringField;
    fdqDiscDetPFR_CPF: TStringField;
    fdqDiscDetPFR_ENDERECO: TStringField;
    fdqDiscDetPFR_NUMERO: TStringField;
    fdqDiscDetPFR_COMPLEMENTO: TStringField;
    fdqDiscDetPFR_BAIRRO: TStringField;
    fdqDiscDetPFR_CIDADE: TStringField;
    fdqDiscDetPFR_UF: TStringField;
    fdqDiscDetPFR_CEP: TStringField;
    fdqDiscDetPFR_DTNASCIMENTO: TDateField;
    fdqDiscDetPFR_DTCADASTRO: TDateField;
    cliDiscDetDPD_ID: TIntegerField;
    cliDiscDetDPD_IDDCP: TIntegerField;
    cliDiscDetDPD_IDPFR: TIntegerField;
    cliDiscDetDCP_ID: TIntegerField;
    cliDiscDetDCP_DESCRICAO: TStringField;
    cliDiscDetDCP_MEDIA: TCurrencyField;
    cliDiscDetPFR_ID: TIntegerField;
    cliDiscDetPFR_NOME: TStringField;
    cliDiscDetPFR_CPF: TStringField;
    cliDiscDetPFR_ENDERECO: TStringField;
    cliDiscDetPFR_NUMERO: TStringField;
    cliDiscDetPFR_COMPLEMENTO: TStringField;
    cliDiscDetPFR_BAIRRO: TStringField;
    cliDiscDetPFR_CIDADE: TStringField;
    cliDiscDetPFR_UF: TStringField;
    cliDiscDetPFR_CEP: TStringField;
    cliDiscDetPFR_DTNASCIMENTO: TDateField;
    cliDiscDetPFR_DTCADASTRO: TDateField;
    GravaDiscDet: TFDQuery;
    fdqAluno: TFDQuery;
    cliAluno: TClientDataSet;
    dspAluno: TDataSetProvider;
    dsAluno: TDataSource;
    fdqAlunoALN_ID: TIntegerField;
    fdqAlunoALN_NOME: TStringField;
    fdqAlunoALN_NOMEPAI: TStringField;
    fdqAlunoALN_NOMEMAE: TStringField;
    fdqAlunoALN_CPF: TStringField;
    fdqAlunoALN_ENDERECO: TStringField;
    fdqAlunoALN_NUMERO: TStringField;
    fdqAlunoALN_COMPLEMENTO: TStringField;
    fdqAlunoALN_BAIRRO: TStringField;
    fdqAlunoALN_CIDADE: TStringField;
    fdqAlunoALN_UF: TStringField;
    fdqAlunoALN_CEP: TStringField;
    fdqAlunoALN_DTNASCIMENTO: TDateField;
    fdqAlunoALN_DTCADASTRO: TDateField;
    cliAlunoALN_ID: TIntegerField;
    cliAlunoALN_NOME: TStringField;
    cliAlunoALN_NOMEPAI: TStringField;
    cliAlunoALN_NOMEMAE: TStringField;
    cliAlunoALN_CPF: TStringField;
    cliAlunoALN_ENDERECO: TStringField;
    cliAlunoALN_NUMERO: TStringField;
    cliAlunoALN_COMPLEMENTO: TStringField;
    cliAlunoALN_BAIRRO: TStringField;
    cliAlunoALN_CIDADE: TStringField;
    cliAlunoALN_UF: TStringField;
    cliAlunoALN_CEP: TStringField;
    cliAlunoALN_DTNASCIMENTO: TDateField;
    cliAlunoALN_DTCADASTRO: TDateField;
    fdqAlnDisc: TFDQuery;
    cliAlnDisc: TClientDataSet;
    dspAlnDisc: TDataSetProvider;
    dsAlnDisc: TDataSource;
    fdqAlnDiscADC_ID: TIntegerField;
    fdqAlnDiscADC_IDDCP: TIntegerField;
    fdqAlnDiscADC_IDALN: TIntegerField;
    fdqAlnDiscDCP_ID: TIntegerField;
    fdqAlnDiscDCP_DESCRICAO: TStringField;
    fdqAlnDiscDCP_MEDIA: TCurrencyField;
    fdqAlnDiscALN_ID: TIntegerField;
    fdqAlnDiscALN_NOME: TStringField;
    fdqAlnDiscALN_NOMEPAI: TStringField;
    fdqAlnDiscALN_NOMEMAE: TStringField;
    fdqAlnDiscALN_CPF: TStringField;
    fdqAlnDiscALN_ENDERECO: TStringField;
    fdqAlnDiscALN_NUMERO: TStringField;
    fdqAlnDiscALN_COMPLEMENTO: TStringField;
    fdqAlnDiscALN_BAIRRO: TStringField;
    fdqAlnDiscALN_CIDADE: TStringField;
    fdqAlnDiscALN_UF: TStringField;
    fdqAlnDiscALN_CEP: TStringField;
    fdqAlnDiscALN_DTNASCIMENTO: TDateField;
    fdqAlnDiscALN_DTCADASTRO: TDateField;
    cliAlnDiscADC_ID: TIntegerField;
    cliAlnDiscADC_IDDCP: TIntegerField;
    cliAlnDiscADC_IDALN: TIntegerField;
    cliAlnDiscDCP_ID: TIntegerField;
    cliAlnDiscDCP_DESCRICAO: TStringField;
    cliAlnDiscDCP_MEDIA: TCurrencyField;
    cliAlnDiscALN_ID: TIntegerField;
    cliAlnDiscALN_NOME: TStringField;
    cliAlnDiscALN_NOMEPAI: TStringField;
    cliAlnDiscALN_NOMEMAE: TStringField;
    cliAlnDiscALN_CPF: TStringField;
    cliAlnDiscALN_ENDERECO: TStringField;
    cliAlnDiscALN_NUMERO: TStringField;
    cliAlnDiscALN_COMPLEMENTO: TStringField;
    cliAlnDiscALN_BAIRRO: TStringField;
    cliAlnDiscALN_CIDADE: TStringField;
    cliAlnDiscALN_UF: TStringField;
    cliAlnDiscALN_CEP: TStringField;
    cliAlnDiscALN_DTNASCIMENTO: TDateField;
    cliAlnDiscALN_DTCADASTRO: TDateField;
    GravaAlnDisc: TFDQuery;
    fdqNotas: TFDQuery;
    cliNotas: TClientDataSet;
    dspNotas: TDataSetProvider;
    dsNotas: TDataSource;
    fdqNotasNTA_ID: TIntegerField;
    fdqNotasNTA_IDALN: TIntegerField;
    fdqNotasNTA_IDDCP: TIntegerField;
    fdqNotasNTA_IDTNT: TIntegerField;
    fdqNotasNTA_PERIODO: TIntegerField;
    fdqNotasNTA_NOTA: TCurrencyField;
    fdqNotasDCP_ID: TIntegerField;
    fdqNotasDCP_DESCRICAO: TStringField;
    fdqNotasDCP_MEDIA: TCurrencyField;
    fdqNotasALN_ID: TIntegerField;
    fdqNotasALN_NOME: TStringField;
    fdqNotasALN_NOMEPAI: TStringField;
    fdqNotasALN_NOMEMAE: TStringField;
    fdqNotasALN_CPF: TStringField;
    fdqNotasALN_ENDERECO: TStringField;
    fdqNotasALN_NUMERO: TStringField;
    fdqNotasALN_COMPLEMENTO: TStringField;
    fdqNotasALN_BAIRRO: TStringField;
    fdqNotasALN_CIDADE: TStringField;
    fdqNotasALN_UF: TStringField;
    fdqNotasALN_CEP: TStringField;
    fdqNotasALN_DTNASCIMENTO: TDateField;
    fdqNotasALN_DTCADASTRO: TDateField;
    fdqNotasTNT_ID: TIntegerField;
    fdqNotasTNT_DESCRICAO: TStringField;
    cliNotasNTA_ID: TIntegerField;
    cliNotasNTA_IDALN: TIntegerField;
    cliNotasNTA_IDDCP: TIntegerField;
    cliNotasNTA_IDTNT: TIntegerField;
    cliNotasNTA_PERIODO: TIntegerField;
    cliNotasNTA_NOTA: TCurrencyField;
    cliNotasDCP_ID: TIntegerField;
    cliNotasDCP_DESCRICAO: TStringField;
    cliNotasDCP_MEDIA: TCurrencyField;
    cliNotasALN_ID: TIntegerField;
    cliNotasALN_NOME: TStringField;
    cliNotasALN_NOMEPAI: TStringField;
    cliNotasALN_NOMEMAE: TStringField;
    cliNotasALN_CPF: TStringField;
    cliNotasALN_ENDERECO: TStringField;
    cliNotasALN_NUMERO: TStringField;
    cliNotasALN_COMPLEMENTO: TStringField;
    cliNotasALN_BAIRRO: TStringField;
    cliNotasALN_CIDADE: TStringField;
    cliNotasALN_UF: TStringField;
    cliNotasALN_CEP: TStringField;
    cliNotasALN_DTNASCIMENTO: TDateField;
    cliNotasALN_DTCADASTRO: TDateField;
    cliNotasTNT_ID: TIntegerField;
    cliNotasTNT_DESCRICAO: TStringField;
    GravaNotas: TFDQuery;
    procedure fdConexaoBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

uses
  Vcl.Dialogs;

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

procedure TDm.DataModuleCreate(Sender: TObject);
begin
  fdConexao.DriverName := 'FB';
  with fdConexao do
  begin
    Params.Clear;
    Params.Values['DriverID'] := 'FB';
    Params.Values['protocol'] := 'local';
    Params.Values['Database'] := StringReplace(GetCurrentDir + '\BASE.FDB',
      'bin', 'banco', [rfReplaceAll, rfIgnoreCase]);
    Params.Values['User_name']  := 'sysdba';
    Params.Values['Password']   := 'masterkey';
    Params.Values['CharacterSet'] := 'ISO8859_1';
    Connected := True;
  end;
end;

procedure TDm.fdConexaoBeforeConnect(Sender: TObject);
Var
  wl_Path: String;
begin

    wl_Path := StringReplace(GetCurrentDir + '\BASE.FDB', 'bin', 'banco', [rfReplaceAll, rfIgnoreCase]);
    if Not FileExists(wl_Path) then
    begin
      MessageDlg(Format('A Base de Dados n�o foi encontrada', [TLinkObservers]), mtError, [mbOK], 0);
      Exit;

    end;
end;

end.
