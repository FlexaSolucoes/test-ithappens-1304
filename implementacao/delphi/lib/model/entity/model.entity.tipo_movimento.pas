unit model.entity.tipo_movimento;

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

  type Ttipo_movimento = class
  private
    { Private declarations }
    Ftipo_movimento_ID        : Integer;
    Ftipo_movimento_descricao : String ;
    Ftipo_movimento_entsai    : Integer;
  public
    { Public declarations }
    property tipo_movimento_ID        : Integer read Ftipo_movimento_ID        write Ftipo_movimento_ID       ;
    property tipo_movimento_descricao : String  read Ftipo_movimento_descricao write Ftipo_movimento_descricao;
    property tipo_movimento_entsai    : Integer read Ftipo_movimento_entsai    write Ftipo_movimento_entsai   ;
  end;

implementation

end.

