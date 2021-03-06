unit model.entity.cidades;

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

  type Tcidades = class
  private
    { Private declarations }
    Fcidade_id          : Integer;
    Festado_id          : Integer;
    Fcidade_descricao   : String ;
    Fcidade_sigla       : String ;
    Fcidade_codigo_ibge  : String ;
  public
    { Public declarations }
    property cidade_id         : Integer read Fcidade_id          write Fcidade_id         ;
    property estado_id         : Integer read Festado_id          write Festado_id         ;
    property cidade_descricao  : String  read Fcidade_descricao   write Fcidade_descricao  ;
    property cidade_sigla      : String  read Fcidade_sigla       write Fcidade_sigla      ;
    property cidade_codigo_ibge: String  read Fcidade_codigo_ibge write Fcidade_codigo_ibge;
  end;

implementation

end.

