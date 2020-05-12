unit model.entity.produtos;

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


  type Tprodutos = class
  private
    { Private declarations }
    fproduto_ID           : Integer;
    Fproduto_descricao    : String ;
    Fproduto_codigobarras : String ;
    Fgrupo_id             : Integer;
    Fproduto_valorcusto   : Double ;
    Fproduto_valorvenda   : Double ;
  public
    { Public declarations }
    property produto_ID           : Integer read Fproduto_ID            write Fproduto_ID          ;
    property produto_descricao    : String  read Fproduto_descricao     write Fproduto_descricao   ;
    property produto_codigobarras : String  read Fproduto_codigobarras  write Fproduto_codigobarras;
    property grupo_id             : Integer read Fgrupo_id              write Fgrupo_id            ;
    property produto_valorcusto   : Double  read Fproduto_valorcusto    write Fproduto_valorcusto  ;
    property produto_valorvenda   : Double  read Fproduto_valorvenda    write Fproduto_valorvenda  ;
  end;

implementation

end.

