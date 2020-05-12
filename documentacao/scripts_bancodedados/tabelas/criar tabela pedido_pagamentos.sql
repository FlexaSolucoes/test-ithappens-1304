CREATE TABLE pedido_pagamentos (
pedido_pagamentos_id       integer IDENTITY NOT NULL,
pedido_id                  integer  ,
forma_pagamento_id         integer  ,
pedido_itens_valorpago numeric(15,6),
CONSTRAINT PK_pedido_pagamentos PRIMARY KEY CLUSTERED 
(
	pedido_pagamentos_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
);
GO
CREATE UNIQUE NONCLUSTERED INDEX id_pedido_pagamentos_000 ON pedido_pagamentos
(
	pedido_id, forma_pagamento_id ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
