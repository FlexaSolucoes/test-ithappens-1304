program Pedido_vcl;

uses
  Vcl.Forms,
  uprincipal_vcl in 'uprincipal_vcl.pas' {frmprincipal_vcl},
  ufrmpedido in 'view\ufrmpedido.pas' {frmpedido},
  Model.Patterns.functions.config in '..\lib\model\patterns\Model.Patterns.functions.config.pas',
  Model.Patterns.functions in '..\lib\model\patterns\Model.Patterns.functions.pas',
  Model.Patterns.Servico in '..\lib\model\patterns\Model.Patterns.Servico.pas',
  Model.Patterns.types in '..\lib\model\patterns\Model.Patterns.types.pas',
  model.entity.cidades in '..\lib\model\entity\model.entity.cidades.pas',
  model.entity.clientes in '..\lib\model\entity\model.entity.clientes.pas',
  model.entity.estados in '..\lib\model\entity\model.entity.estados.pas',
  model.entity.estoque in '..\lib\model\entity\model.entity.estoque.pas',
  model.entity.filiais in '..\lib\model\entity\model.entity.filiais.pas',
  model.entity.formapagamento in '..\lib\model\entity\model.entity.formapagamento.pas',
  model.entity.grupo_produto in '..\lib\model\entity\model.entity.grupo_produto.pas',
  model.entity.itenspedido in '..\lib\model\entity\model.entity.itenspedido.pas',
  model.entity.paises in '..\lib\model\entity\model.entity.paises.pas',
  model.entity.pedido_pagamentos in '..\lib\model\entity\model.entity.pedido_pagamentos.pas',
  model.entity.pedidoestoque in '..\lib\model\entity\model.entity.pedidoestoque.pas',
  model.entity.produtos in '..\lib\model\entity\model.entity.produtos.pas',
  model.entity.tipo_movimento in '..\lib\model\entity\model.entity.tipo_movimento.pas',
  model.entity.usuarios in '..\lib\model\entity\model.entity.usuarios.pas',
  model.entity.retorno in '..\lib\model\entity\model.entity.retorno.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrmprincipal_vcl, frmprincipal_vcl);
  Application.CreateForm(Tfrmpedido, frmpedido);
  Application.Run;
end.
