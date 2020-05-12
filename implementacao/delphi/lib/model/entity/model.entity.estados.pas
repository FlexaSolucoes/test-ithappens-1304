unit model.entity.estados;

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

  type Testados = class
  private
    { Private declarations }
    Festado_id          : Integer;
    Fpais_id            : Integer;
    Festado_descricao   : String ;
    Festado_sigla       : String ;
    Festado_codigo_ibge : String ;
  public
    { Public declarations }
    property estado_id         : Integer read Festado_id          write Festado_id         ;
    property pais_id           : Integer read Fpais_id            write Fpais_id           ;
    property estado_descricao  : String  read Festado_descricao   write Festado_descricao  ;
    property estado_sigla      : String  read Festado_sigla       write Festado_sigla      ;
    property estado_codigo_ibge: String  read Festado_codigo_ibge write Festado_codigo_ibge;
  end;

implementation

end.

