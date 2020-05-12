unit model.entity.retorno;

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

    type TRetorno = class
      retorno_id  : integer;
      retorno_cod : integer;
      retorno_msg : string ;
    end;

implementation

end.
