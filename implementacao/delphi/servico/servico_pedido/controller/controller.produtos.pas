unit controller.produtos;

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
     model.entity.produtos               ;

type
  TProdutoController = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function Produto(id:Integer=0):TJSONValue;
    function updateProduto(Produto:TJSONObject):TJSONValue;
    function acceptProduto(Produto:TJSONObject):TJSONValue;
    function cancelProduto(id:Integer):TJSONValue;
  end;

var
  ProdutoController: TProdutoController;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TProdutoController }

function TProdutoController.acceptProduto(Produto: TJSONObject): TJSONValue;
var sSQL:String;
var p:model.entity.produtos.Tprodutos;
begin
     p:=TJSon.JsonToObject<model.entity.produtos.Tprodutos>(produto);
     sSQL:= 'insert into produtos (         ';
     sSQL:= sSQL+ ' produto_descricao    , ';
     sSQL:= sSQL+ ' produto_codigobarras , ';
     sSQL:= sSQL+ ' grupo_id             , ';
     sSQL:= sSQL+ ' produto_valorcusto   , ';
     sSQL:= sSQL+ ' produto_valorvenda   ) ';
     sSQL:= sSQL+ ' VALUES ('             ;
     sSQL:= sSQL+ ' ''' + p.produto_descricao        + ''' , ';
     sSQL:= sSQL+ ' ''' + p.produto_codigobarras     + ''' , ';
     sSQL:= sSQL+ ' '   + p.grupo_id.ToString        + ''' , ';
     sSQL:= sSQL+ ' '   + FUnx(p.produto_valorcusto) + ''' , ';
     sSQL:= sSQL+ ' '   + FUnx(p.produto_valorvenda) + ''' ) ';

     if TModelConexaoFiredac.GetInstance.ExecuteCommand(sSQL) then
     begin
          Result:=TJSONString.Create('Registro inserido com sucesso!');
     end
     else
     begin
          Result:=TJSONString.Create('Falha na inserção do registro!');
     end;
end;

function TProdutoController.cancelProduto(id: Integer): TJSONValue;
begin
     Result:=TJSONString.Create('Não é possivel apagar o registro!');
end;

function TProdutoController.Produto(id: Integer): TJSONValue;
var sSQL:String;
begin
     sSQL:=      'Select * from produtos ';
     if IsNotEmpty(id) then
     begin
          sSQL  := sSQL+'where produto_id = '+id.ToString;
     end;
     sSQL  := sSQL+'order by produto_descricao';

     Result:= TModelPatternsServico.GetInstance.DataSetToJsonArray(TModelConexaoFiredac.GetInstance.ExecuteSelect(sSQL));
end;

function TProdutoController.updateProduto(Produto: TJSONObject): TJSONValue;
var sSQL:String;
var p:model.entity.produtos.Tprodutos;
begin
     p:=TJSon.JsonToObject<model.entity.produtos.Tprodutos>(produto);

     sSQL:= 'update produtos set ';
     sSQL:= sSQL+ ' produto_descricao    = ''' + p.produto_descricao        + ''' , ';
     sSQL:= sSQL+ ' produto_codigobarras = ''' + p.produto_codigobarras     + ''' , ';
     sSQL:= sSQL+ ' grupo_id             = '   + p.grupo_id.ToString        +   ' , ';
     sSQL:= sSQL+ ' produto_valorcusto   = '   + FUnx(p.produto_valorcusto) +   ' , ';
     sSQL:= sSQL+ ' produto_valorvenda   = '   + FUnx(p.produto_valorvenda) +   ')   ';

     sSQL:= sSQL+ ' where produto_id = '+ p.produto_id.ToString;

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
