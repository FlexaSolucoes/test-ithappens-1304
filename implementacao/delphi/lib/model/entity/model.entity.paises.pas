unit model.entity.paises;

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

  type Tpaises = class
  private
    { Private declarations }
    Fpais_ID        : Integer;
    Fpais_descricao : String ;
    Fpais_sigla     : String ;
  public
    { Public declarations }
    property pais_ID          : Integer read Fpais_ID          write Fpais_ID        ;
    property pais_descricao   : String  read Fpais_descricao   write Fpais_descricao ;
    property pais_sigla       : String  read Fpais_sigla       write Fpais_sigla     ;
  end;

implementation

end.

