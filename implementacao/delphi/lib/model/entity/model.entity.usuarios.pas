unit model.entity.usuarios;

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

  type TUsuarios = class
  private
    { Private declarations }
    Fusuario_id          : Integer;
    Fusuario_descricao   : String ;
    Fusuario_cpf         : String ;
    Fusuario_email       : String ;
    Fusuario_senha       : String ;
  public
    { Public declarations }
    property usuario_id       : Integer read Fusuario_id        write Fusuario_id       ;
    property usuario_descricao: String  read Fusuario_descricao write Fusuario_descricao;
    property usuario_cpf      : String  read Fusuario_cpf       write Fusuario_cpf      ;
    property usuario_email    : String  read Fusuario_email     write Fusuario_email    ;
    property usuario_senha    : String  read Fusuario_senha     write Fusuario_senha    ;
  end;

implementation

end.

