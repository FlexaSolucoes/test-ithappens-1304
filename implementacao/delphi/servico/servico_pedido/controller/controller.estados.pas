unit controller.estados;

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
     model.entity.estados               ;

type
  TEstadoController = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function Estado(id:Integer=0):TJSONValue;
    function updateEstado(Estado:TJSONObject):TJSONValue;
    function acceptEstado(Estado:TJSONObject):TJSONValue;
    function cancelEstado(id:Integer):TJSONValue;
  end;

var
  EstadoController: TEstadoController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TEstadoController }

function TEstadoController.acceptEstado(Estado: TJSONObject): TJSONValue;
var sSQL:String;
var e:model.entity.estados.Testados;
begin
     e:=TJSon.JsonToObject<model.entity.estados.Testados>(estado);
     sSQL:= 'insert into estados (       ';
     sSQL:= sSQL+ ' pais_id          , ';
     sSQL:= sSQL+ ' estado_descricao   , ';
     sSQL:= sSQL+ ' estado_sigla       , ';
     sSQL:= sSQL+ ' estado_codigo_ibge ) ';
     sSQL:= sSQL+ ' VALUES ('             ;
     sSQL:= sSQL+ ' '   + e.pais_id.ToString    +   ' , ';
     sSQL:= sSQL+ ' ''' + e.estado_descricao   + ''' , ';
     sSQL:= sSQL+ ' ''' + e.estado_sigla       + ''' , ';
     sSQL:= sSQL+ ' ''' + e.estado_codigo_ibge + ''' ) ';

     if TModelConexaoFiredac.GetInstance.ExecuteCommand(sSQL) then
     begin
          Result:=TJSONString.Create('Registro inserido com sucesso!');
     end
     else
     begin
          Result:=TJSONString.Create('Falha na inser��o do registro!');
     end;
end;

function TEstadoController.cancelEstado(id: Integer): TJSONValue;
begin
     Result:=TJSONString.Create('N�o � possivel apagar o registro!');
end;

function TEstadoController.Estado(id: Integer): TJSONValue;
var sSQL:String;
begin
     sSQL:=      'Select * from estados ';
     if IsNotEmpty(id) then
     begin
          sSQL  := sSQL+'where estado_id = '+id.ToString;
     end;
     sSQL  := sSQL+'order by estado_descricao';

     Result:= TModelPatternsServico.GetInstance.DataSetToJsonArray(TModelConexaoFiredac.GetInstance.ExecuteSelect(sSQL));
end;

function TEstadoController.updateEstado(Estado: TJSONObject): TJSONValue;
var sSQL:String;
var e:model.entity.estados.Testados;
begin
     e:=TJSon.JsonToObject<model.entity.estados.Testados>(estado);
     sSQL:= 'update estados set ';
     sSQL:= sSQL+ ' pais_id          = '+   e.pais_id.ToString         + ' , ';
     sSQL:= sSQL+ ' estado_descricao   = '+ '''' + e.estado_descricao   + ''' , ';
     sSQL:= sSQL+ ' estado_sigla       = '+ '''' + e.estado_sigla       + ''' , ';
     sSQL:= sSQL+ ' estado_codigo_ibge = '+ '''' + e.estado_codigo_ibge + '''   ';
     sSQL:= sSQL+ ' where estado_id = '+ e.estado_id.ToString;

     if TModelConexaoFiredac.GetInstance.ExecuteCommand(sSQL) then
     begin
          Result:=TJSONString.Create('Registro alterado com sucesso!');
     end
     else
     begin
          Result:=TJSONString.Create('Falha na alte��o do registro!');
     end;
end;

end.
