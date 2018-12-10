unit un_RelProfessor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport, Vcl.StdCtrls;

type
  TfrmRelProfessor = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    Grupo_Aluno: TRLGroup;
    RLBand2: TRLBand;
    RLLabel3: TRLLabel;
    RLDBText1: TRLDBText;
    fdqRelAluno: TFDQuery;
    dsRelAluno: TDataSource;
    RLBand3: TRLBand;
    RLLabel4: TRLLabel;
    RLDBText2: TRLDBText;
    GroupBox1: TGroupBox;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProfessor: TfrmRelProfessor;

implementation

{$R *.dfm}

uses u_Dm;

procedure TfrmRelProfessor.Button1Click(Sender: TObject);
begin
  fdqRelAluno.Open;
  RLReport1.PreviewModal;
end;

procedure TfrmRelProfessor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
  frmRelProfessor := Nil;
end;

end.
