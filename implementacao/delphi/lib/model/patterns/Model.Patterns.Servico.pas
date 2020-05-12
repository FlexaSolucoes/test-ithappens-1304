unit Model.Patterns.Servico;

interface

uses
    System.sysUtils            ,
    System.Generics.Collections,
    System.Json                ,
    Data.DB                    ,
    Data.DBXPlatform           ,
    REST.JSON                  ;

type
    TModelPatternsServico = class
    strict protected
      class var FServico:TModelPatternsServico;
    private
       constructor CreatePrivate;
    public
       constructor Create;
       destructor Destroy;
       class function GetInstance:TModelPatternsServico;
       procedure FormatarJSON(const aIdCode: Integer; const aContent: String);
       function DataSetToJsonArray(DataSet:TDataSet) : TJsonArray;
       function ObjectToJsonValue(O:TObject):TJSONValue;
    end;

implementation

{ TModelConexaoSQLServer }

constructor TModelPatternsServico.Create;
begin
     raise Exception.Create('N�o � possivel criar um objeto de serv�o. Utilize TModelPatternsServico.GetInstance');
end;

constructor TModelPatternsServico.CreatePrivate;
begin
     inherited create;
end;

procedure TModelPatternsServico.FormatarJSON(const aIdCode: Integer; const aContent: String);
begin
     GetInvocationMetadata().ResponseCode := aIdCode;
     GetInvocationMetadata().ResponseContent := aContent;
end;

function TModelPatternsServico.DataSetToJsonArray(
  DataSet: TDataSet): TJsonArray;
var jObj:TJSONObject;
var i: Integer;
begin
     if Assigned(DataSet) then
     begin
          if not DataSet.Active then
          begin
               DataSet.Open;
          end;
          DataSet.first;
          Result:=TJSONArray.Create;
          while not DataSet.Eof do
          begin
               jObj:=TJSONObject.Create;
               for i := 0 to Pred(DataSet.FieldCount) do
               begin
                    jObj.AddPair(DataSet.Fields[i].FieldName,DataSet.Fields[i].AsString);
               end;
               Result.AddElement(jObj);
               DataSet.Next;
          end;
     end;
end;

destructor TModelPatternsServico.Destroy;
begin
  inherited;
end;

class function TModelPatternsServico.GetInstance: TModelPatternsServico;
begin
     if not Assigned(FServico) then
     begin
          FServico:=TModelPatternsServico.CreatePrivate;
     end;
     Result:=FServico;
end;

function TModelPatternsServico.ObjectToJsonValue(O:TObject): TJSONValue;
begin
     Result:=TJson.ObjectToJsonObject(O);
end;

end.
