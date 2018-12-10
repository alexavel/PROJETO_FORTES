unit un_CrudBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ImgList, Data.DB, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.Buttons,
  Vcl.Mask, System.DateUtils, FireDAC.Comp.Client, u_Dm, Vcl.Dialogs;

Const
  MD_Tab_Insert     = 0;
  MD_Tab_Alterar    = 1;
  MD_Tab_Gravar     = 2;
  MD_Tab_Consultar  = 3;
  MD_Tab_Excluir    = 4;
  MD_Tab_Off        = 5;

type
  TfrmCrud = class(TForm)
    pnTopo: TPanel;
    ToolBar1: TToolBar;
    pgCrud: TPageControl;
    tabLista: TTabSheet;
    tabCrud: TTabSheet;
    edt_Pesquisa: TEdit;
    Label1: TLabel;
    Button1: TButton;
    dbgGrid: TDBGrid;
    imgCrud: TImageList;
    dsCrud: TDataSource;
    btnConsultar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnGravar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnIncluir: TSpeedButton;
    actSair: TSpeedButton;
    btnCancelar: TSpeedButton;
    grbDados: TGroupBox;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirExecute(Sender: TObject);
    procedure btnAlterarExecute(Sender: TObject);
    procedure btnGravarExecute(Sender: TObject);
    procedure btnConsultarExecute(Sender: TObject);
    procedure btnExcluirExecute(Sender: TObject);
    procedure btnCancelarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgGridTitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
  private
    wpr_FildConsulta : String;
    wpr_SqlTemp : String;
    wpr_Gets : array of TComponent;
    wpr_GetsAtr : array of string;
    FTabela: String;
    FTitulo: String;
    FSqlQuery: Tfdquery;

    procedure AtivaBtn;
    procedure AtivaTela;
    procedure limpaGets;
    procedure povoaGets;
    procedure Gravar;
    function PegaInfo(pCampo: string; pDados: variant): Variant;
    procedure Excluir;
    procedure consulta(pCampo, pConsulta : String);
    { Private declarations }
  public
    { Public declarations }
    wp_ModoEdicao : Integer;
    function IIf(Expressao, ParteTRUE, ParteFALSE: Variant): Variant;
    property Tabela: String read FTabela write FTabela;
    property Titulo: String read FTitulo write FTitulo;
    property SqlQuery: Tfdquery read FSqlQuery write FSqlQuery;
  end;

var
  frmCrud: TfrmCrud;

implementation

{$R *.dfm}

procedure TfrmCrud.btnAlterarExecute(Sender: TObject);
begin
  wp_ModoEdicao := MD_Tab_Alterar;
  AtivaBtn;
  //TLabeledEdit( wpr_Gets[1] ).SetFocus;
end;

procedure TfrmCrud.btnCancelarExecute(Sender: TObject);
begin
  wp_ModoEdicao := MD_Tab_Off;
  AtivaBtn;
end;

procedure TfrmCrud.btnConsultarExecute(Sender: TObject);
begin
  wp_ModoEdicao := MD_Tab_Consultar;
  AtivaBtn;
end;

procedure TfrmCrud.btnExcluirExecute(Sender: TObject);
begin
  wp_ModoEdicao := MD_Tab_Excluir;
  AtivaBtn;
  Excluir;
end;

procedure TfrmCrud.btnGravarExecute(Sender: TObject);
begin
  Gravar;
end;

procedure TfrmCrud.btnIncluirExecute(Sender: TObject);
begin
  wp_ModoEdicao := MD_Tab_Insert;
  AtivaBtn;
  limpaGets;
  //TLabeledEdit( wpr_Gets[1] ).SetFocus;
end;

procedure TfrmCrud.Button1Click(Sender: TObject);
begin
  consulta(wpr_FildConsulta,edt_Pesquisa.Text)
end;

procedure TfrmCrud.dbgGridTitleClick(Column: TColumn);
begin
  wpr_FildConsulta := Column.FieldName;
  consulta(wpr_FildConsulta,edt_Pesquisa.Text)

end;

procedure TfrmCrud.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsCrud.DataSet.Close;
end;

procedure TfrmCrud.FormShow(Sender: TObject);
var
  I: Integer;
begin
  // Colunas que devem ser implementadas nos demais cruds
  {
  Tabela    := 'disciplina';
  Titulo    := 'Cadastro de Disciplinas';
  SqlQuery  := Dm.fdqDisciplina;
   }
  dsCrud.DataSet.Active := true;
  wp_ModoEdicao        := MD_Tab_Off;
  AtivaBtn;

  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[I].Tag <> 999 then
    begin

        if Self.Components[I].ClassType = TLabeledEdit Then
           begin
              SetLength(wpr_Gets,(length(wpr_Gets)+1));
              SetLength(wpr_GetsAtr,(length(wpr_GetsAtr)+1));
              wpr_Gets[length(wpr_Gets)-1]:= Self.Components[I];
              if ( pfInKey in dsCrud.DataSet.FieldByName( TLabeledEdit(Self.Components[I]).Name ).ProviderFlags ) then
                 wpr_GetsAtr[length(wpr_GetsAtr)-1]:= 'P'
              else  wpr_GetsAtr[length(wpr_GetsAtr)-1]:= 'C'  ;

           end;
        if Self.Components[I].ClassType = TMaskEdit Then
           begin
              SetLength(wpr_Gets,(length(wpr_Gets)+1));
              SetLength(wpr_GetsAtr,(length(wpr_GetsAtr)+1));
              wpr_Gets[length(wpr_Gets)-1]:= Self.Components[I];
           end;
        if Self.Components[I].ClassType = TDateTimePicker Then
           begin
              SetLength(wpr_Gets,(length(wpr_Gets)+1));
              SetLength(wpr_GetsAtr,(length(wpr_GetsAtr)+1));
              wpr_Gets[length(wpr_Gets)-1]:= Self.Components[I];
           end;

    end;

  end;
  frmCrud.Caption   := Titulo;
  pnTopo.Caption    := '  '+Titulo;
  wpr_SqlTemp       := FSqlQuery.SQL.Text;
  wpr_FildConsulta  := TLabeledEdit( wpr_gets[0] ).Name;
  consulta(wpr_FildConsulta,edt_Pesquisa.Text)
end;

procedure TfrmCrud.consulta(pCampo,pConsulta: String);
var
  wl_script: string;
begin
  dsCrud.DataSet.Active := False;
  wl_script :=  ' Select * From '+FTabela+' '+
                 IIf(pConsulta <> '',' Where '+pCampo+' = '+PegaInfo(pCampo,pConsulta),'')+' Order By '+pCampo;

  with FSqlQuery do
  begin
    Close;
    SQL.Text := wl_script;
    Open;
  end;
  dsCrud.DataSet.Active := True;

end;

procedure TfrmCrud.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCrud.AtivaBtn;
begin
  btnIncluir.Enabled    := (( wp_ModoEdicao = MD_Tab_Off ) or ( wp_ModoEdicao = MD_Tab_Gravar ));
  btnAlterar.Enabled    := ((( wp_ModoEdicao = MD_Tab_Off ) or ( wp_ModoEdicao = MD_Tab_Gravar )) and ( not dsCrud.DataSet.IsEmpty ));
  btnExcluir.Enabled    := ((( wp_ModoEdicao = MD_Tab_Off ) or ( wp_ModoEdicao = MD_Tab_Gravar )) and ( not dsCrud.DataSet.IsEmpty ));
  btnConsultar.Enabled  := (( wp_ModoEdicao = MD_Tab_Off ) and ( not dsCrud.DataSet.IsEmpty ));
  btnGravar.Enabled     := (( wp_ModoEdicao = MD_Tab_Insert ) or ( wp_ModoEdicao = MD_Tab_Alterar ));
  btnCancelar.Enabled   := (( wp_ModoEdicao = MD_Tab_Insert ) or ( wp_ModoEdicao = MD_Tab_Alterar ) or
                            ( wp_ModoEdicao = MD_Tab_Consultar ) or ( wp_ModoEdicao = MD_Tab_Excluir ));
  AtivaTela;
end;

procedure TfrmCrud.AtivaTela;
begin
  case wp_ModoEdicao of
    MD_Tab_Off:
    begin
      limpaGets;
      pgCrud.Pages[0].TabVisible := True ;
      pgCrud.Pages[1].TabVisible := False ;
      pgCrud.ActivePage := tabLista;
    end;

    MD_Tab_Insert, MD_Tab_Alterar, MD_Tab_Consultar, MD_Tab_Excluir :
    begin
      if wp_ModoEdicao = MD_Tab_Insert then limpaGets else povoaGets;
      pgCrud.Pages[0].TabVisible := False ;
      pgCrud.Pages[1].TabVisible := True ;
      pgCrud.ActivePage := tabCrud;
    end;
  end;
end;

procedure TfrmCrud.limpaGets;
var
  I: Integer;
begin
  for I := 0 to Length(wpr_Gets)-1 do
  begin
    if wpr_Gets[I].ClassType = TLabeledEdit then
    begin
       TLabeledEdit(wpr_Gets[I]).Clear;
       TLabeledEdit(wpr_Gets[I]).Enabled := (wpr_GetsAtr[I] <> 'P')
    end;
    if wpr_Gets[I].ClassType = TMaskEdit then
    begin
       TMaskEdit(wpr_Gets[I]).Clear;
       TMaskEdit(wpr_Gets[I]).Enabled := True;
    end;
    if wpr_Gets[I].ClassType = TDateTimePicker then
    begin
       TDateTimePicker(wpr_Gets[I]).Date := Now;
       TDateTimePicker(wpr_Gets[I]).Enabled := True;
    end;

  end;
end;

Procedure TfrmCrud.povoaGets;
var
  I: Integer;
begin
  for I := 0 to Length(wpr_Gets)-1 do
  begin
    if wpr_Gets[I].ClassType = TLabeledEdit then
    begin
       TLabeledEdit(wpr_Gets[I]).Clear;
       TLabeledEdit(wpr_Gets[I]).Text := dsCrud.DataSet.FieldByName( TLabeledEdit(wpr_Gets[I]).Name ).AsString;
       TLabeledEdit(wpr_Gets[I]).Enabled :=( ( wpr_GetsAtr[I] <> 'P') and
                                            ( wp_ModoEdicao <> MD_Tab_Consultar ) and
                                            ( wp_ModoEdicao <> MD_Tab_Excluir ) )
    end;
    if wpr_Gets[I].ClassType = TMaskEdit then
    begin
       TMaskEdit(wpr_Gets[I]).Clear;
       TMaskEdit(wpr_Gets[I]).Text := dsCrud.DataSet.FieldByName( TMaskEdit(wpr_Gets[I]).Name ).AsString;
       TMaskEdit(wpr_Gets[I]).Enabled :=( ( wp_ModoEdicao <> MD_Tab_Consultar ) and
                                          ( wp_ModoEdicao <> MD_Tab_Excluir ) )

    end;
    if wpr_Gets[I].ClassType = TDateTimePicker then
    begin
       TDateTimePicker(wpr_Gets[I]).Date := dsCrud.DataSet.FieldByName( TMaskEdit(wpr_Gets[I]).Name ).AsDateTime;
       TDateTimePicker(wpr_Gets[I]).Enabled :=( ( wp_ModoEdicao <> MD_Tab_Consultar ) and
                                          ( wp_ModoEdicao <> MD_Tab_Excluir ) )

    end;


  end;
end;

procedure TfrmCrud.Gravar;
var
  I: Integer;
  wl_Campos, wl_Sets, wl_Script : string;
begin

  for I := 0 to Length(wpr_Gets)-1 do
  begin
    if wpr_Gets[I].ClassType = TLabeledEdit then
    begin
       if wp_ModoEdicao = MD_Tab_Insert then
       begin
         wl_Campos := wl_Campos+TLabeledEdit(wpr_Gets[I]).Name+IIf( ( Length(wpr_Gets)-1 ) > I, ',','' );
         wl_Sets   := wl_Sets+PegaInfo( TLabeledEdit(wpr_Gets[I]).Name, TLabeledEdit(wpr_Gets[I]).Text )+
                           IIf( ( Length(wpr_Gets)-1 ) > I, ',','' );
       end else begin
         if I = 0 then
          begin
            wl_Campos := TLabeledEdit(wpr_Gets[I]).Name+' = '+PegaInfo( TLabeledEdit(wpr_Gets[I]).Name, TLabeledEdit(wpr_Gets[I]).Text )
          end else begin
            wl_Sets   := wl_Sets+TLabeledEdit(wpr_Gets[I]).Name+' = '+
                         PegaInfo( TLabeledEdit(wpr_Gets[I]).Name, TLabeledEdit(wpr_Gets[I]).Text )+
                         IIf( ( Length(wpr_Gets)-1 ) > I, ',','' );
          end;
       end;
    end;
    if wpr_Gets[I].ClassType = TMaskEdit then
    begin
       if wp_ModoEdicao = MD_Tab_Insert then
       begin
         wl_Campos := wl_Campos+TMaskEdit(wpr_Gets[I]).Name+IIf( ( Length(wpr_Gets)-1 ) > I, ',','' );
         wl_Sets   := wl_Sets+PegaInfo( TMaskEdit(wpr_Gets[I]).Name, TMaskEdit(wpr_Gets[I]).Text )+
                           IIf( ( Length(wpr_Gets)-1 ) > I, ',','' );
       end else begin
         wl_Sets   := wl_Sets+TMaskEdit(wpr_Gets[I]).Name+' = '+
                       PegaInfo( TMaskEdit(wpr_Gets[I]).Name, TMaskEdit(wpr_Gets[I]).Text )+
                       IIf( ( Length(wpr_Gets)-1 ) > I, ',','' );

       end;
    end;
    if wpr_Gets[I].ClassType = TDateTimePicker then
    begin
       if wp_ModoEdicao = MD_Tab_Insert then
       begin
         wl_Campos := wl_Campos+TDateTimePicker(wpr_Gets[I]).Name+IIf( ( Length(wpr_Gets)-1 ) > I, ',','' );
         wl_Sets   := wl_Sets+PegaInfo( TDateTimePicker(wpr_Gets[I]).Name, TDateTimePicker(wpr_Gets[I]).Date )+
                           IIf( ( Length(wpr_Gets)-1 ) > I, ',','' );
       end else begin
         wl_Sets   := wl_Sets+TDateTimePicker(wpr_Gets[I]).Name+' = '+
                       PegaInfo( TDateTimePicker(wpr_Gets[I]).Name, TDateTimePicker(wpr_Gets[I]).date )+
                       IIf( ( Length(wpr_Gets)-1 ) > I, ',','' );

       end;
    end;


  end;
 if wp_ModoEdicao = MD_Tab_Insert then
    wl_Script := 'insert into '+FTabela+'('+wl_Campos+') values ('+wl_Sets+')'
 Else     wl_Script := 'Update '+FTabela+' Set '+wl_Sets+' Where '+wl_Campos;

 try
   if MessageDlg(Format(
     ' Deseja '+IIf(wp_ModoEdicao = MD_Tab_Insert, 'Inserir Novo Registro? ', 'Alterar o Registro? ' ), []), mtWarning, [mbYes,mbCancel], 0) = mrYes Then
     Begin
       with Dm.execCommando do
       Begin
         Close;
         sql.text := wl_Script;
         ExecSQL;
       End;
       edt_Pesquisa.Clear;
       consulta(wpr_FildConsulta,edt_Pesquisa.Text);
       wp_ModoEdicao := MD_Tab_Off;
       AtivaBtn;
     End else btnCancelarExecute(Self);
 except on E : Exception do
    begin
    MessageDlg(Format(
      E.Message, []), mtError, [mbOK], 0)
    end;
 end;

end;

procedure TfrmCrud.Excluir;
var
  I: Integer;
  wl_Campos, wl_Sets, wl_Script : string;
begin
 try
    wl_Campos := TLabeledEdit(wpr_Gets[0]).Name+' = '+PegaInfo( TLabeledEdit(wpr_Gets[0]).Name, TLabeledEdit(wpr_Gets[0]).Text );
    wl_Script := 'Delete from '+FTabela+' Where '+wl_Campos;
   if MessageDlg(Format(
     'Deseja Excluir?', []), mtWarning, [mbYes,mbCancel], 0) = mrYes Then
     Begin
       with Dm.execCommando do
       Begin
         Close;
         sql.text := wl_Script;
         ExecSQL;
       End;
       dsCrud.DataSet.Refresh;
       wp_ModoEdicao := MD_Tab_Off;
       AtivaBtn;
     End else btnCancelarExecute(Self);
 except on E : Exception do
    begin
    MessageDlg(Format(
      E.Message, []), mtError, [mbOK], 0)
    end;
 end;

end;

function TfrmCrud.PegaInfo( pCampo: string; pDados: variant ): Variant;
Var
  wl_Dados : variant;

begin
  wl_Dados := pDados;
  if ( pfInKey in dsCrud.DataSet.FieldByName( pcampo ).ProviderFlags ) and
     ( dscrud.DataSet.FieldByName(pcampo).DataType = TFieldType.ftInteger  ) and
     ( wp_ModoEdicao = MD_Tab_Insert ) then
     begin
      wl_Dados := '( Select coalesce( max('+pcampo+'),0)+1 From '+FTabela+' )'
     end else
  if ( dscrud.DataSet.FieldByName(pcampo).DataType = TFieldType.ftInteger  ) Then wl_Dados := pDados;


  if ( dscrud.DataSet.FieldByName(pcampo).DataType = TFieldType.ftString   ) Then wl_Dados := QuotedStr(pDados);
  if ( dscrud.DataSet.FieldByName(pcampo).DataType = TFieldType.ftCurrency ) Then wl_Dados := StringReplace(pDados, ',', '.', [rfReplaceAll, rfIgnoreCase]);
  if ( dscrud.DataSet.FieldByName(pcampo).DataType = TFieldType.ftDate )     Then wl_Dados := QuotedStr(formatdatetime('yyyy-mm-dd', pDados));


  Result := wl_Dados;
end;



function TfrmCrud.IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
 begin
   if Expressao then
      Result := ParteTRUE
   else
      Result := ParteFALSE;
 end;

end.
