unit Model.Conexao.Firedac;

interface

uses System.StrUtils              ,
     Model.Conexao.ConfiguracoesDB,
     Data.DB                      ,
     FireDAC.Comp.DataSet         ,
     FireDAC.DatS                 ,
     FireDAC.DApt                 ,
     FireDAC.DApt.Intf            ,
     FireDAC.Stan.Async           ,
     FireDAC.Stan.Intf            ,
     FireDAC.Stan.Option          ,
     FireDAC.Stan.Error           ,
     FireDAC.Stan.ExprFuncs       ,
     FireDAC.Stan.Def             ,
     FireDAC.Stan.Pool            ,
     FireDAC.Stan.Param           ,
     FireDAC.UI.Intf              ,
     FireDAC.VCLUI.Wait           ,
     FireDAC.Comp.UI              ,
     FireDAC.Comp.Client          ,
     FireDAC.Phys                 ,
     FireDAC.Phys.Intf            ,
     FireDAC.Phys.SQLiteDef       ,
     FireDAC.Phys.SQLite          ,
     FireDAC.Phys.FB              ,
     FireDAC.Phys.Oracle          ,
     FireDAC.Phys.OracleDef       ,
     FireDAC.Phys.MSSQL           ,
     FireDAC.Phys.MSSQLDef        ,
     FireDAC.Phys.ODBCBase        ,
     FireDAC.VCLUI.Script         ;

type
    TModelConexaoFiredac = class
    strict protected
      class var FDBConnection:TModelConexaoFiredac;
    private
       FDGUIxWaitCursor1      : TFDGUIxWaitCursor     ;
       FDPhysFBDriverLink1    : TFDPhysFBDriverLink   ;
       FDPhysMSSQLDriverLink1 : TFDPhysMSSQLDriverLink;
       FDPhysOracleDriverLink1: TFDPhysOracleDriverLink;
    private
       FConexao               : TFDConnection         ;
       FCommad                : TFDQuery              ;
       constructor CreatePrivate;
    public
       constructor Create;
       destructor Destroy;
       class function GetInstance:TModelConexaoFiredac;
       function ExecuteSelect(sSQL: String) : TFDQuery;
       function ExecuteCommand(sSQL: String) : Boolean ;
    end;

implementation

uses
    System.sysUtils;

{ TModelConexaoSQLServer }

constructor TModelConexaoFiredac.Create;
begin
     raise Exception.Create('N�o � possivel criar um objeto de conex�o. Utilize TDBConnection.GetInstance');
end;

constructor TModelConexaoFiredac.CreatePrivate;
var FCfg:TModelConexaoConfig;
begin
     inherited create;
     FCfg:=TModelConexaoConfig.New;

     FConexao:=TFDConnection.Create(nil);
     FConexao.Params.Values['DriverID'      ]:=FCfg.DriverID;
     FConexao.Params.Values['Database'      ]:=FCfg.Database;
     FConexao.Params.Values['Server'        ]:=FCfg.Server  ;
     FConexao.Params.Values['User_Name'     ]:=FCfg.UserName;
     FConexao.Params.Values['Password'      ]:=FCfg.Password;
//     FConexao.Params.Values['LoginTimeout'  ]:='30';

     FDPhysFBDriverLink1    := TFDPhysFBDriverLink    .Create(nil);
     FDPhysMSSQLDriverLink1 := TFDPhysMSSQLDriverLink .Create(nil);
     FDPhysOracleDriverLink1:= TFDPhysOracleDriverLink.Create(nil);
     FDGUIxWaitCursor1      := TFDGUIxWaitCursor      .Create(nil);
     FConexao.LoginPrompt   :=false;
     FConexao.Open;

     FreeAndNil(FCfg);

     FCommad   := TFDQuery.Create(nil);
     FCommad.Connection:=FConexao;
end;


destructor TModelConexaoFiredac.Destroy;
begin
     FreeAndNil(FDGUIxWaitCursor1);
     FreeAndNil(FConexao);
  inherited;
end;

function TModelConexaoFiredac.ExecuteCommand(sSQL: String): Boolean;
begin
     try
        FCommad.SQL.Clear;
        FCommad.SQL.Add(sSQL);
        FCommad.ExecSQL;
        Result:=true;
     except
        Result:=false;
     end;
end;

function TModelConexaoFiredac.ExecuteSelect(sSQL: String): TFDQuery;
begin
     FCommad.SQL.Clear;
     FCommad.Open(sSQL);
     Result:=FCommad;
end;

class function TModelConexaoFiredac.GetInstance: TModelConexaoFiredac;
begin
     if not Assigned(FDBConnection) then
     begin
          FDBCOnnection:=TModelConexaoFiredac.CreatePrivate;
     end;
     Result:=FDBConnection;
end;

end.
