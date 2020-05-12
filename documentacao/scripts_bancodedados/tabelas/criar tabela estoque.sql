CREATE TABLE estoque (
filial_ID            integer NOT NULL,
produto_ID           integer NOT NULL,
estoque_quantidade   numeric(15,6),
estoque_pendente     numeric(15,6),
CONSTRAINT PK_estoque PRIMARY KEY CLUSTERED 
(
	filial_ID, produto_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
);
GO

