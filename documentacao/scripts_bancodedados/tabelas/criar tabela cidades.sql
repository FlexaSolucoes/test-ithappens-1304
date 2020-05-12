CREATE TABLE cidades (
cidade_ID           integer IDENTITY NOT NULL,
estado_id           integer not null         ,
cidade_descricao    varchar(100),
cidade_sigla        varchar(020),
cidade_codigo_ibge  varchar(020),
CONSTRAINT [PK_cidades] PRIMARY KEY CLUSTERED 
(
	[cidade_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
);
GO
CREATE UNIQUE NONCLUSTERED INDEX id_cidades_000 ON cidades
(
	cidade_codigo_ibge ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX id_cidades_001 ON cidades
(
	cidade_descricao ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

