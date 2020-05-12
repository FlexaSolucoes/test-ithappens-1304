CREATE TABLE grupo_produto (
grupo_ID        integer IDENTITY NOT NULL,
grupo_descricao varchar(100),
CONSTRAINT PK_grupo_produto PRIMARY KEY CLUSTERED 
(
	grupo_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
);
GO
CREATE NONCLUSTERED INDEX id_grupo_000 ON grupo_produto
(
	grupo_descricao ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

