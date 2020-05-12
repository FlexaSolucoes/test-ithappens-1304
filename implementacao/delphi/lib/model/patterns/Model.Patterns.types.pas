unit Model.Patterns.types;

interface

    type TDatabaseType = (
                          tdbMSSQL   ,
                          tdbOracle  ,
                          tdbSQLLite ,
                          tdbMySQL   ,
                          tdbPostgree,
                          tdbFirebird);

    type TMensagemTipo = (
                          tmtNone    ,
                          tmtEnviada ,
                          tmtRecebida);

implementation

end.
