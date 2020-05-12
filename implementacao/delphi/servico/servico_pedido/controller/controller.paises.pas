unit controller.paises;

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
     model.entity.Paises                 ;

type
  TPaisController = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function Pais(id:Integer=0):TJSONValue;
    function updatePais(Pais:TJSONObject):TJSONValue;
    function acceptPais(Pais:TJSONObject):TJSONValue;
    function cancelPais(id:Integer):TJSONValue;
  end;

var
  PaisController: TPaisController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TControlerPaises }

function TPaisController.acceptPais(Pais: TJSONObject): TJSONValue;
var sSQL:String;
var e:model.entity.paises.Tpaises;
begin
     e:=TJSon.JsonToObject<model.entity.paises.Tpaises>(pais);
     sSQL:= 'insert into paises (      ';
     sSQL:= sSQL+ ' pais_descricao   , ';
     sSQL:= sSQL+ ' pais_sigla       ) ';
     sSQL:= sSQL+ ' VALUES ('             ;
     sSQL:= sSQL+ ' ''' + e.pais_descricao   + ''' , ';
     sSQL:= sSQL+ ' ''' + e.pais_sigla       + ''' ) ';

     if TModelConexaoFiredac.GetInstance.ExecuteCommand(sSQL) then
     begin
          Result:=TJSONString.Create('Registro inserido com sucesso!');
     end
     else
     begin
          Result:=TJSONString.Create('Falha na inserção do registro!');
     end;
end;

function TPaisController.cancelPais(id: Integer): TJSONValue;
begin
     Result:=TJSONString.Create('Não é possivel apagar o registro!');
end;

function TPaisController.Pais(id: Integer): TJSONValue;
var sSQL:String;
begin
     sSQL:=      'Select * from paises ';
     if IsNotEmpty(id) then
     begin
          sSQL  := sSQL+'where pais_id = '+id.ToString;
     end;
     sSQL  := sSQL+'order by pais_descricao';

     Result:= TModelPatternsServico.GetInstance.DataSetToJsonArray(TModelConexaoFiredac.GetInstance.ExecuteSelect(sSQL));
end;

function TPaisController.updatePais(Pais: TJSONObject): TJSONValue;
var sSQL:String;
var e:model.entity.paises.Tpaises;
begin
     e:=TJSon.JsonToObject<model.entity.paises.Tpaises>(pais);
     sSQL:= 'update paises set ';
     sSQL:= sSQL+ ' pais_descricao   = '+ '''' + e.pais_descricao   + ''' , ';
     sSQL:= sSQL+ ' pais_sigla       = '+ '''' + e.pais_sigla       + '''   ';
     sSQL:= sSQL+ ' where pais_id = '+ e.pais_id.ToString;

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
