unit controller.filiais;

interface

uses
     System.SysUtils                     ,
     System.Classes                      ,
     System.Json                         ,
     System.Generics.Collections         ,
     DataSnap.DSProviderDataModuleAdapter,
     Datasnap.DSServer                   ,
     Datasnap.DSAuth                     ,
     REST.JSON                           ,
     Data.DB                             ,
     Model.Conexao.Firedac               ,
     Model.Patterns.Servico              ,
     Model.Patterns.functions            ,
     model.entity.filiais                ;

type
  TFilialController = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function Filial(id:Integer=0):TJSONValue;
    function updateFilial(Filial:TJSONObject):TJSONValue;
    function acceptFilial(Filial:TJSONObject):TJSONValue;
    function cancelFilial(id:Integer):TJSONValue;
  end;

var
  FilialController: TFilialController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TFilialController }

function TFilialController.acceptFilial(Filial: TJSONObject): TJSONValue;
var sSQL:String;
var f:model.entity.filiais.Tfiliais;
begin
     f:=TJSon.JsonToObject<model.entity.filiais.Tfiliais>(filial);
     sSQL:= 'insert into filais (            ';
     sSQL:= sSQL+ ' filial_codigo          , ';
     sSQL:= sSQL+ ' filial_descricao       , ';
     sSQL:= sSQL+ ' filial_cnpj            , ';
     sSQL:= sSQL+ ' filial_email           , ';
     sSQL:= sSQL+ ' filial_endereco        , ';
     sSQL:= sSQL+ ' filial_bairro          , ';
     sSQL:= sSQL+ ' filial_endercomp       , ';
     sSQL:= sSQL+ ' cidade_id              ) ';
     sSQL:= sSQL+ ' VALUES (                 ';
     sSQL:= sSQL+ ' '   + f.filial_codigo.ToString +   ' , ';
     sSQL:= sSQL+ ' ''' + f.filial_descricao       + ''' , ';
     sSQL:= sSQL+ ' ''' + f.filial_cnpj            + ''' , ';
     sSQL:= sSQL+ ' ''' + f.filial_email           + ''' , ';
     sSQL:= sSQL+ ' ''' + f.filial_endereco        + ''' , ';
     sSQL:= sSQL+ ' ''' + f.filial_bairro          + ''' , ';
     sSQL:= sSQL+ ' ''' + f.filial_endercomp       + ''' , ';
     sSQL:= sSQL+ ' '   + f.cidade_id.ToString     +   ' ) ';

     if TModelConexaoFiredac.GetInstance.ExecuteCommand(sSQL) then
     begin
          Result:=TJSONString.Create('Registro inserido com sucesso!');
     end
     else
     begin
          Result:=TJSONString.Create('Falha na inser��o do registro!');
     end;
end;

function TFilialController.cancelFilial(id: Integer): TJSONValue;
begin
     Result:=TJSONString.Create('N�o � possivel apagar o registro!');
end;

function TFilialController.Filial(id: Integer): TJSONValue;
var sSQL:String;
begin
     sSQL:=      'Select * from filiais ';
     if IsNotEmpty(id) then
     begin
          sSQL  := sSQL+'where filial_id = '+id.ToString;
     end;
     sSQL  := sSQL+'order by filial_descricao';
     Result:= TModelPatternsServico.GetInstance.DataSetToJsonArray(TModelConexaoFiredac.GetInstance.ExecuteSelect(sSQL));
end;

function TFilialController.updateFilial(Filial: TJSONObject): TJSONValue;
var sSQL:String;
var f:model.entity.filiais.Tfiliais;
begin
     f:=TJSon.JsonToObject<model.entity.filiais.Tfiliais>(filial);
     sSQL:= 'update filais set            ';
     sSQL:= sSQL+ ' filial_codigo          = '   + f.filial_codigo.ToString +   ' , ';
     sSQL:= sSQL+ ' filial_descricao       = ''' + f.filial_descricao       + ''' , ';
     sSQL:= sSQL+ ' filial_cnpj            = ''' + f.filial_cnpj            + ''' , ';
     sSQL:= sSQL+ ' filial_email           = ''' + f.filial_email           + ''' , ';
     sSQL:= sSQL+ ' filial_endereco        = ''' + f.filial_endereco        + ''' , ';
     sSQL:= sSQL+ ' filial_bairro          = ''' + f.filial_bairro          + ''' , ';
     sSQL:= sSQL+ ' filial_endercomp       = ''' + f.filial_endercomp       + ''' , ';
     sSQL:= sSQL+ ' cidade_id              = '   + f.cidade_id.ToString     +   ' ) ';
     sSQL:= sSQL+ ' where filial_id = ' +f.filial_id.ToString ;

     if TModelConexaoFiredac.GetInstance.ExecuteCommand(sSQL) then
     begin
          Result:=TJSONString.Create('Registro inserido com sucesso!');
     end
     else
     begin
          Result:=TJSONString.Create('Falha na inser��o do registro!');
     end;
end;

end.
