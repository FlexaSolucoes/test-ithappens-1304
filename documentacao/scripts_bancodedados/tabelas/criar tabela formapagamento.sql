CREATE TABLE formapagamento (
formapagamento_id        integer IDENTITY NOT NULL,
formapagamento_descricao varchar(50),
CONSTRAINT PK_formapagamento PRIMARY KEY CLUSTERED 
(
	formapagamento_ID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
);
GO
