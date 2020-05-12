CREATE TABLE produtos (
produto_ID           integer IDENTITY NOT NULL,
produto_descricao    varchar(100) ,
produto_codigobarras varchar(020) ,
grupo_id             integer      ,
produto_valorcusto   numeric(15,6),
produto_valorvenda   numeric(15,6),
CONSTRAINT PK_produto PRIMARY KEY CLUSTERED 
(
	produto_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
);
GO
CREATE UNIQUE NONCLUSTERED INDEX id_produto_000 ON produtos
(
	produto_codigobarras ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX id_produto_001 ON produtos
(
	produto_descricao ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

