unit model.entity.itenspedido;

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

  type Titenspedido = class
  private
    { Private declarations }
    Fitenspedido_id            : Integer;
    FPedido_id                 : Integer;
    Fitenspedido_seq           : Integer;
    Firoduto_id                : Integer;
    Fitenspedido_quantidade    : Double ;
    Fitenspedido_valorunitario : Double ;
    Fitenspedido_valordesconto : Double ;
    Fitenspedido_valortotal    : Double ;
    Fitenspedido_status        : Integer;
  public
  public
    { Public declarations }
    property itenspedido_id           : Integer read Fitenspedido_id            write Fitenspedido_id           ;
    property pedido_id                : Integer read Fpedido_id                 write Fpedido_id                ;
    property itenspedido_seq          : Integer read Fitenspedido_seq           write Fitenspedido_seq          ;
    property iroduto_id               : Integer read Firoduto_id                write Firoduto_id               ;
    property itenspedido_quantidade   : Double  read Fitenspedido_quantidade    write Fitenspedido_quantidade   ;
    property itenspedido_valorunitario: Double  read Fitenspedido_valorunitario write Fitenspedido_valorunitario;
    property itenspedido_valordesconto: Double  read Fitenspedido_valordesconto write Fitenspedido_valordesconto;
    property itenspedido_valortotal   : Double  read Fitenspedido_valortotal    write Fitenspedido_valortotal   ;
    property itenspedido_status       : Integer read Fitenspedido_status        write Fitenspedido_status       ;

  end;

implementation

end.

