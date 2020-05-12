CREATE TABLE filiais (
filial_ID        integer IDENTITY NOT NULL,
filial_codigo    integer         ,
filial_descricao varchar(100),
filial_cnpj      varchar(020),
filial_email     varchar(100),
filial_endereço  varchar(255),
filial_bairro    varchar(050),
filial_endercomp varchar(255),
cidade_id integer     ,
CONSTRAINT PK_filiais PRIMARY KEY CLUSTERED 
(
	filial_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
);
GO
CREATE UNIQUE NONCLUSTERED INDEX id_filiais_000 ON filiais
(
	filial_cnpj ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX id_filiais_001 ON filiais
(
	filial_descricao ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO


