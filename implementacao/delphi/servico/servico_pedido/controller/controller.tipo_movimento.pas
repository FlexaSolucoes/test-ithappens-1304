unit controller.tipo_movimento;

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
     model.entity.tipo_movimento         ;

{$METHODINFO ON}
type
  TTipoMovimentoController = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function tipo_pagamento(id:Integer=0):TJSONValue;
    function updatetipo_pagamento(tipo_movimento:TJSONObject):TJSONValue;
    function accepttipo_pagamento(tipo_movimento:TJSONObject):TJSONValue;
    function canceltipo_pagamento(id:Integer):TJSONValue;
  end;

var
  TipoMovimentoController: TTipoMovimentoController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TControlerTipoMovimento }

function TTipoMovimentoController.accepttipo_pagamento(
  tipo_movimento: TJSONObject): TJSONValue;
var sSQL:String;
var t:model.entity.tipo_movimento.Ttipo_movimento;
begin
     t:=TJSon.JsonToObject<model.entity.tipo_movimento.Ttipo_movimento>(tipo_movimento);
     sSQL:= 'insert into tipo_movimento (       ';
     sSQL:= sSQL+ ' tipo_movimento_descricao    ';
     sSQL:= sSQL+ ' VALUES ('             ;
     sSQL:= sSQL+ ' ''' + t.tipo_movimento_descricao   + ''' ) ';

     if TModelConexaoFiredac.GetInstance.ExecuteCommand(sSQL) then
     begin
          Result:=TJSONString.Create('Registro inserido com sucesso!');
     end
     else
     begin
          Result:=TJSONString.Create('Falha na inser��o do registro!');
     end;
end;

function TTipoMovimentoController.canceltipo_pagamento(id: Integer): TJSONValue;
begin
     Result:=TJSONString.Create('N�o � possivel apagar o registro!');
end;

function TTipoMovimentoController.tipo_pagamento(id: Integer): TJSONValue;
var sSQL:String;
begin
     sSQL:=      'Select * from tipo_movimento ';
     if IsNotEmpty(id) then
     begin
          sSQL  := sSQL+'where tipo_movimento_id = '+id.ToString;
     end;
     sSQL  := sSQL+'order by tipo_movimento_descricao';

     Result:= TModelPatternsServico.GetInstance.DataSetToJsonArray(TModelConexaoFiredac.GetInstance.ExecuteSelect(sSQL));
end;

function TTipoMovimentoController.updatetipo_pagamento(
  tipo_movimento: TJSONObject): TJSONValue;
var sSQL:String;
var t:model.entity.tipo_movimento.Ttipo_movimento;
begin
     t:=TJSon.JsonToObject<model.entity.tipo_movimento.Ttipo_movimento>(tipo_movimento);
     sSQL:= 'update tipo_movimento set ';
     sSQL:= sSQL+ ' tipo_movimento_descricao   = '+ '''' + t.tipo_movimento_descricao   + '''  ';
     sSQL:= sSQL+ ' where tipo_movimento_id = '+ t.tipo_movimento_id.ToString;

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
