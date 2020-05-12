CREATE TABLE pedidoestoque (
pedido_ID            integer IDENTITY NOT NULL,
tipomovimento_id    integer  ,
filial_id            integer  ,
cliente_id           integer  ,
pedido_data          datetime ,
pedido_valoritens    numeric(15,6),
pedido_valordesconto numeric(15,6),
pedido_valortotal    numeric(15,6),
pedido_status        integer  , -- 0 -> Aberto, 1 -> Fechado, 2 -> cancelado
CONSTRAINT PK_pedidoestoque PRIMARY KEY CLUSTERED 
(
	pedido_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
);
GO
CREATE UNIQUE NONCLUSTERED INDEX id_pedidoestoque_000 ON pedidoestoque
(
	filial_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX id_pedidoestoque_001 ON pedidoestoque
(
	cliente_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX id_pedidoestoque_002 ON pedidoestoque
(
	filial_id, cliente_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX id_pedidoestoque_003 ON pedidoestoque
(
	tipomovimento_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX id_pedidoestoque_004 ON pedidoestoque
(
	filial_id, tipomovimento_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
CREATE NONCLUSTERED INDEX id_pedidoestoque_005 ON pedidoestoque
(
	filial_id, pedido_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO

