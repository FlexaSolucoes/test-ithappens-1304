unit model.entity.pedidoestoque;

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
  ExtCtrls                            ,
  model.entity.itenspedido            ,
  model.entity.formapagamento         ;

  type Tpedidoestoque = class
  private
    { Private declarations }
    Fpedido_ID            : Integer;
    Ftipomovimento_id     : Integer;
    Ffilial_id            : Integer;
    Fcliente_id           : Integer;
    Fpedido_data          : String ;
    Fpedido_valoritens    : Double ;
    Fpedido_valordesconto : Double ;
    Fpedido_valortotal    : Double ;
    Fpedido_status        : Integer;
//    FItenspedido          : TObjectList<model.entity.itenspedido.Titenspedido>;
//    Fformapagamento       : TObjectList<model.entity.formapagamento.Tformapagamento>;
  public
    constructor create;
    destructor destroy;
  public
    { Public declarations }
    property pedido_ID            : Integer      read Fpedido_ID             write Fpedido_ID            ;
    property tipomovimento_id     : Integer      read Ftipomovimento_id      write Ftipomovimento_id     ;
    property filial_id            : Integer      read Ffilial_id             write Ffilial_id            ;
    property cliente_id           : Integer      read Fcliente_id            write Fcliente_id           ;
    property pedido_data          : String       read Fpedido_data           write Fpedido_data          ;
    property pedido_valoritens    : Double       read Fpedido_valoritens     write Fpedido_valoritens    ;
    property pedido_valordesconto : Double       read Fpedido_valordesconto  write Fpedido_valordesconto ;
    property pedido_valortotal    : Double       read Fpedido_valortotal     write Fpedido_valortotal    ;
    property pedido_status        : Integer      read Fpedido_status         write Fpedido_status        ;
//    property itenspedido          : TObjectList<model.entity.itenspedido.Titenspedido>       read FItenspedido   ;
//    property formapagamento       : TObjectList<model.entity.formapagamento.Tformapagamento> read Fformapagamento;
  end;

implementation

{ Tpedidoestoque }

constructor Tpedidoestoque.create;
begin
     inherited;
//     FItenspedido   :=TObjectList<model.entity.itenspedido.Titenspedido>.create;
//     fformapagamento:=TObjectList<model.entity.formapagamento.Tformapagamento>.create;
end;

destructor Tpedidoestoque.destroy;
begin
     inherited;
end;

end.

