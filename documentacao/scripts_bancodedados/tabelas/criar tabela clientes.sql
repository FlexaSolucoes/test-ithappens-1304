CREATE TABLE clientes (
cliente_ID              integer IDENTITY NOT NULL,
cliente_nomerzsocial    varchar(100),
cliente_apelidofantasia varchar(100),
cliente_cnpjcpf         varchar(020),
cliente_inscest_cic     varchar(020),
cliente_email           varchar(100),
cliente_endereco        varchar(255),
cliente_bairro          varchar(050),
cliente_endercomp       varchar(255),
cliente_cidade_id       integer     ,
CONSTRAINT PK_clientes PRIMARY KEY CLUSTERED 
(
	cliente_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
);
GO
CREATE UNIQUE NONCLUSTERED INDEX id_clientes_000 ON clientes
(
	cliente_cnpjcpf ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX id_clientes_001 ON clientes
(
	cliente_nomerzsocial ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


