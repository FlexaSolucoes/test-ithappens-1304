unit model.entity.pedido_pagamentos;

interface

uses
  System.SysUtils                     ,
  System.Classes                      ,
  System.Json                         ,
  System.Variants                     ,
  System.Generics.Collections         ,
  Generics.Collections                ,
  Graphics                            ,
  Controls                            ,
  StdCtrls                            ,
  Mask                                ,
  ExtCtrls                            ;

  type Tpedido_pagamentos = class
  private
    { Private declarations }
    Fpedido_pagamentos_id   : Integer;
    Fpedido_id              : Integer;
    Fforma_pagamento_id     : Integer;
    Fpedido_itens_valorpago : Double ;
  public
    { Public declarations }
    property pedido_pagamentos_id   : Integer read Fpedido_pagamentos_id   write Fpedido_pagamentos_id  ;
    property pedido_id              : Integer read Fpedido_id              write Fpedido_id             ;
    property forma_pagamento_id     : Integer read Fforma_pagamento_id     write Fforma_pagamento_id    ;
    property pedido_itens_valorpago : Double  read Fpedido_itens_valorpago write Fpedido_itens_valorpago;
  end;

implementation

end.

