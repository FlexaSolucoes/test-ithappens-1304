unit model.entity.grupo_produto;

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

  type Tgrupo_produto = class
  private
    { Private declarations }
    Fgrupo_id        : Integer;
    Fgrupo_descricao : String ;
  public
    { Public declarations }
    property grupo_id         : Integer read Fgrupo_id         write Fgrupo_id        ;
    property grupo_descricao  : String  read Fgrupo_descricao  write Fgrupo_descricao ;
  end;

implementation

end.

