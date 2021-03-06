object DMServer: TDMServer
  OldCreateOrder = False
  Height = 308
  Width = 436
  object DSRestServer: TDSServer
    Left = 48
    Top = 16
  end
  object DSHTTPRestService: TDSHTTPService
    HttpPort = 8080
    OnFormatResult = DSHTTPRestServiceFormatResult
    Server = DSRestServer
    Filters = <>
    Left = 144
    Top = 16
  end
  object DSServerFilial: TDSServerClass
    OnGetClass = DSServerFilialGetClass
    Server = DSRestServer
    Left = 344
    Top = 16
  end
  object DSServerCidade: TDSServerClass
    OnGetClass = DSServerCidadeGetClass
    Server = DSRestServer
    Left = 40
    Top = 80
  end
  object DSServerCliente: TDSServerClass
    OnGetClass = DSServerClienteGetClass
    Server = DSRestServer
    Left = 144
    Top = 88
  end
  object DSServerEstado: TDSServerClass
    OnGetClass = DSServerEstadoGetClass
    Server = DSRestServer
    Left = 256
    Top = 88
  end
  object DSServerFormaPagamento: TDSServerClass
    OnGetClass = DSServerFormaPagamentoGetClass
    Server = DSRestServer
    Left = 32
    Top = 144
  end
  object DSServerGrupo_Produto: TDSServerClass
    OnGetClass = DSServerGrupo_ProdutoGetClass
    Server = DSRestServer
    Left = 144
    Top = 152
  end
  object DSServerPais: TDSServerClass
    OnGetClass = DSServerPaisGetClass
    Server = DSRestServer
    Left = 264
    Top = 152
  end
  object DSServerProduto: TDSServerClass
    OnGetClass = DSServerProdutoGetClass
    Server = DSRestServer
    Left = 24
    Top = 216
  end
  object DSServerMovimento: TDSServerClass
    OnGetClass = DSServerMovimentoGetClass
    Server = DSRestServer
    Left = 152
    Top = 224
  end
  object DSServerUsuario: TDSServerClass
    OnGetClass = DSServerUsuarioGetClass
    Server = DSRestServer
    Left = 256
    Top = 224
  end
  object DSServerPedido: TDSServerClass
    OnGetClass = DSServerPedidoGetClass
    Server = DSRestServer
    Left = 240
    Top = 16
  end
end
