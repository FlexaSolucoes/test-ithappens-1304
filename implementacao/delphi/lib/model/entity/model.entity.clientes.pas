unit model.entity.clientes;

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

  type Tclientes = class
  private
    { Private declarations }
    Fcliente_ID              : Integer;
    Fcliente_codigo          : Integer;
    Fcliente_nomerzsocial    : String ;
    Fcliente_apelidofantasia : String ;
    Fcliente_cnpjcpf         : String ;
    Fcliente_inscest_cic     : String ;
    Fcliente_email           : String ;
    Fcliente_endereco        : String ;
    Fcliente_bairro          : String ;
    Fcliente_endercomp       : String ;
    Fcliente_cidade_id       : Integer;
  public
    { Public declarations }
    property cliente_ID              : Integer read Fcliente_ID              write Fcliente_ID             ;
    property cliente_codigo          : Integer read Fcliente_codigo          write Fcliente_codigo         ;
    property cliente_nomerzsocial    : String  read Fcliente_nomerzsocial    write Fcliente_nomerzsocial   ;
    property cliente_apelidofantasia : String  read Fcliente_apelidofantasia write Fcliente_apelidofantasia;
    property cliente_cnpjcpf         : String  read Fcliente_cnpjcpf         write Fcliente_cnpjcpf        ;
    property cliente_inscest_cic     : String  read Fcliente_inscest_cic     write Fcliente_inscest_cic    ;
    property cliente_email           : String  read Fcliente_email           write Fcliente_email          ;
    property cliente_endereco        : String  read Fcliente_endereco        write Fcliente_endereco       ;
    property cliente_bairro          : String  read Fcliente_bairro          write Fcliente_bairro         ;
    property cliente_endercomp       : String  read Fcliente_endercomp       write Fcliente_endercomp      ;
    property cliente_cidade_id       : Integer read Fcliente_cidade_id       write Fcliente_cidade_id      ;
  end;

implementation

end.

