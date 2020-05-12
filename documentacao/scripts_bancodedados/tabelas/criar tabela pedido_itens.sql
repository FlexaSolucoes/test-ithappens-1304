CREATE TABLE itenspedido (
itenspedido_id            integer IDENTITY NOT NULL,
pedido_id                  integer  ,
itenspedido_seq           integer  ,
produto_id                 integer  ,
itenspedido_quantidade    numeric(15,6),
itenspedido_valorunitario numeric(15,6),
itenspedido_valordesconto numeric(15,6),
itenspedido_valortotal    numeric(15,6),
itenspedido_status        integer  , -- 0 -> Aberto, 1 -> Fechado, 2 -> cancelado
CONSTRAINT PK_itenspedido PRIMARY KEY CLUSTERED 
(
	itenspedido_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
);
GO
CREATE UNIQUE NONCLUSTERED INDEX id_itenspedido_000 ON itenspedido
(
	pedido_id, itenspedido_seq ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE UNIQUE NONCLUSTERED INDEX id_itenspedido_001 ON itenspedido
(
	produto_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
