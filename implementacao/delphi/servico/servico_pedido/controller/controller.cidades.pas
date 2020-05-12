unit controller.cidades;

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
     Model.Conexao.Firedac               ,
     Model.Patterns.Servico              ,
     Model.Patterns.functions            ,
     model.entity.cidades                ;

type
  TCidadeController = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function Cidade(id:Integer=0):TJSONValue;
    function updateCidade(Cidade:TJSONObject):TJSONValue;
    function acceptCidade(Cidade:TJSONObject):TJSONValue;
    function cancelCidade(id:Integer):TJSONValue;
  end;

var
  CidadeController: TCidadeController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TCidadeController }

function TCidadeController.acceptCidade(Cidade: TJSONObject): TJSONValue;
var sSQL:String;
var c:model.entity.cidades.Tcidades;
begin
     c:=TJSon.JsonToObject<model.entity.cidades.TCidades>(Cidade);
     sSQL:= 'insert into cidades (       ';
     sSQL:= sSQL+ ' estado_id          , ';
     sSQL:= sSQL+ ' cidade_descricao   , ';
     sSQL:= sSQL+ ' cidade_sigla       , ';
     sSQL:= sSQL+ ' cidade_codigo_ibge ) ';
     sSQL:= sSQL+ ' VALUES ('             ;
     sSQL:= sSQL+ ' '   + c.estado_id.ToString +   ' , ';
     sSQL:= sSQL+ ' ''' + c.cidade_descricao   + ''' , ';
     sSQL:= sSQL+ ' ''' + c.cidade_sigla       + ''' , ';
     sSQL:= sSQL+ ' ''' + c.cidade_codigo_ibge + ''' ) ';

     if TModelConexaoFiredac.GetInstance.ExecuteCommand(sSQL) then
     begin
          Result:=TJSONString.Create('Registro inserido com sucesso!');
     end
     else
     begin
          Result:=TJSONString.Create('Falha na inserção do registro!');
     end;
end;

function TCidadeController.cancelCidade(id: Integer): TJSONValue;
begin
     Result:=TJSONString.Create('Não é possivel apagar o registro!');
end;

function TCidadeController.Cidade(id: Integer): TJSONValue;
var sSQL:String;
begin
     sSQL:=      'Select * from cidades ';
     if IsNotEmpty(id) then
     begin
          sSQL  := sSQL+'where cidade_id = '+id.ToString;
     end;
     sSQL  := sSQL+'order by cidade_descricao';

     Result:= TModelPatternsServico.GetInstance.DataSetToJsonArray(TModelConexaoFiredac.GetInstance.ExecuteSelect(sSQL));
end;

function TCidadeController.updateCidade(Cidade: TJSONObject): TJSONValue;
var sSQL:String;
var c:model.entity.cidades.Tcidades;
begin
     c:=TJSon.JsonToObject<model.entity.cidades.Tcidades>(Cidade);
     sSQL:= 'update cidades set ';
     sSQL:= sSQL+ ' estado_id          = '+        c.estado_id.ToString + ' , ';
     sSQL:= sSQL+ ' cidade_descricao   = '+ '''' + c.cidade_descricao   + ''' , ';
     sSQL:= sSQL+ ' cidade_sigla       = '+ '''' + c.cidade_sigla       + ''' , ';
     sSQL:= sSQL+ ' cidade_codigo_ibge = '+ '''' + c.cidade_codigo_ibge + '''   ';
     sSQL:= sSQL+ ' where cidade_id = '   +        c.cidade_id.ToString          ;

     if TModelConexaoFiredac.GetInstance.ExecuteCommand(sSQL) then
     begin
          Result:=TJSONString.Create('Registro alterado com sucesso!');
     end
     else
     begin
          Result:=TJSONString.Create('Falha na alteção do registro!');
     end;
end;

end.
