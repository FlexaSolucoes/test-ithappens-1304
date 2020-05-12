program servico_pedido;

uses
  Vcl.Forms,
  ufrmprincipal in 'view\ufrmprincipal.pas' {frmpricipal},
  uDMServer in 'view\uDMServer.pas' {DMServer: TDataModule},
  controller.cidades in 'controller\controller.cidades.pas' {CidadeController: TDSServerModule},
  controller.clientes in 'controller\controller.clientes.pas' {ClienteController: TDSServerModule},
  controller.estados in 'controller\controller.estados.pas' {EstadoController: TDSServerModule},
  controller.filiais in 'controller\controller.filiais.pas' {FilialController: TDSServerModule},
  controller.formapagamento in 'controller\controller.formapagamento.pas' {FormaPagamentoController: TDSServerModule},
  controller.grupo_produto in 'controller\controller.grupo_produto.pas' {GrupoProdutoController: TDSServerModule},
  controller.paises in 'controller\controller.paises.pas' {PaisController: TDataModule},
  controller.produtos in 'controller\controller.produtos.pas' {ProdutoController: TDSServerModule},
  controller.tipo_movimento in 'controller\controller.tipo_movimento.pas' {TipoMovimentoController: TDSServerModule},
  controller.usuarios in 'controller\controller.usuarios.pas' {UsuarioController: TDSServerModule},
  Model.Conexao.ConfiguracoesDB in '..\..\lib\model\conexao\Model.Conexao.ConfiguracoesDB.pas',
  Model.Conexao.Firedac in '..\..\lib\model\conexao\Model.Conexao.Firedac.pas',
  Model.Patterns.functions.config in '..\..\lib\model\patterns\Model.Patterns.functions.config.pas',
  Model.Patterns.functions in '..\..\lib\model\patterns\Model.Patterns.functions.pas',
  Model.Patterns.Servico in '..\..\lib\model\patterns\Model.Patterns.Servico.pas',
  Model.Patterns.types in '..\..\lib\model\patterns\Model.Patterns.types.pas',
  model.entity.cidades in '..\..\lib\model\entity\model.entity.cidades.pas',
  model.entity.clientes in '..\..\lib\model\entity\model.entity.clientes.pas',
  model.entity.estados in '..\..\lib\model\entity\model.entity.estados.pas',
  model.entity.estoque in '..\..\lib\model\entity\model.entity.estoque.pas',
  model.entity.filiais in '..\..\lib\model\entity\model.entity.filiais.pas',
  model.entity.formapagamento in '..\..\lib\model\entity\model.entity.formapagamento.pas',
  model.entity.grupo_produto in '..\..\lib\model\entity\model.entity.grupo_produto.pas',
  model.entity.itenspedido in '..\..\lib\model\entity\model.entity.itenspedido.pas',
  model.entity.paises in '..\..\lib\model\entity\model.entity.paises.pas',
  model.entity.pedido_pagamentos in '..\..\lib\model\entity\model.entity.pedido_pagamentos.pas',
  model.entity.pedidoestoque in '..\..\lib\model\entity\model.entity.pedidoestoque.pas',
  model.entity.produtos in '..\..\lib\model\entity\model.entity.produtos.pas',
  model.entity.tipo_movimento in '..\..\lib\model\entity\model.entity.tipo_movimento.pas',
  model.entity.usuarios in '..\..\lib\model\entity\model.entity.usuarios.pas',
  controller.pedidoestoque in 'controller\controller.pedidoestoque.pas' {PedidoEstoqueController: TDataModule},
  model.entity.retorno in '..\..\lib\model\entity\model.entity.retorno.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrmpricipal, frmpricipal);
  Application.CreateForm(TDMServer, DMServer);
  Application.CreateForm(TCidadeController, CidadeController);
  Application.CreateForm(TClienteController, ClienteController);
  Application.CreateForm(TEstadoController, EstadoController);
  Application.CreateForm(TFilialController, FilialController);
  Application.CreateForm(TFormaPagamentoController, FormaPagamentoController);
  Application.CreateForm(TGrupoProdutoController, GrupoProdutoController);
  Application.CreateForm(TPaisController, PaisController);
  Application.CreateForm(TProdutoController, ProdutoController);
  Application.CreateForm(TTipoMovimentoController, TipoMovimentoController);
  Application.CreateForm(TUsuarioController, UsuarioController);
  Application.CreateForm(TPedidoEstoqueController, PedidoEstoqueController);
  Application.Run;
end.
