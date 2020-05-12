unit model.entity.estoque;

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

  type Testoque = class
  private
    { Private declarations }
    Ffilial_ID            : Integer;
    Fproduto_ID           : Integer;
    Festoque_quantidade   : Double ;
    Festoque_pendente     : Double ;
  public
    { Public declarations }
    property filial_ID          : Integer read Ffilial_ID          write Ffilial_ID         ;
    property produto_ID         : Integer read Fproduto_ID         write Fproduto_ID        ;
    property estoque_quantidade : Double  read Festoque_quantidade write Festoque_quantidade;
    property estoque_pendente   : Double  read Festoque_pendente   write Festoque_pendente  ;
  end;

implementation

end.

