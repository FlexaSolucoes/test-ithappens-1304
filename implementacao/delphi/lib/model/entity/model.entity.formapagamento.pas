unit model.entity.formapagamento;

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

  type Tformapagamento = class
  private
    { Private declarations }
    Fformapagamento_id        : Integer;
    Fformapagamento_descricao : String ;
  public
    { Public declarations }
    property formapagamento_id        : Integer read Fformapagamento_id        write Fformapagamento_id       ;
    property formapagamento_descricao : String  read Fformapagamento_descricao write Fformapagamento_descricao;
  end;

implementation

end.

