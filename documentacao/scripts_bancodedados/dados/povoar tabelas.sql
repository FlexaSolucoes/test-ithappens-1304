insert into usuarios (usuario_descricao, usuario_cpf, usuario_email, usuario_senha) values ('MASTER', '11111111111', 'master@grupomatheus.com.br', '123456')
GO
insert into paises (pais_descricao, pais_sigla) values ('BRASIL', 'BRA')
GO
insert into estados (pais_id, estado_descricao, estado_sigla, estado_codigo_ibge) values (1, 'MARANHÃO', 'MA', 21)
GO
insert into cidades (estado_id, cidade_descricao, cidade_sigla, cidade_codigo_ibge) values (1, 'SÂO LUIS', 'SLZ', 2111300)
go
insert into filiais (filial_codigo, filial_descricao, filial_cnpj, filial_email, filial_endereco, filial_bairro, filial_endercomp, cidade_id)
values (1, 'FILIAL 001', '11111111000101', 'email@grupomatheus.com.br', 'Av. Daniel de Latouche', 'COHAMA', '',1)
go
insert into filiais (filial_codigo, filial_descricao, filial_cnpj, filial_email, filial_endereco, filial_bairro, filial_endercomp, cidade_id)
values (2, 'FILIAL 002', '22222222000202', 'email@grupomatheus.com.br', 'Av. Daniel de Latouche', 'COHAMA', '',1)
go
insert into filiais (filial_codigo, filial_descricao, filial_cnpj, filial_email, filial_endereco, filial_bairro, filial_endercomp, cidade_id)
values (3, 'FILIAL 003', '33333333000303', 'email@grupomatheus.com.br', 'Av. Daniel de Latouche', 'COHAMA', '',1)
go
insert into filiais (filial_codigo, filial_descricao, filial_cnpj, filial_email, filial_endereco, filial_bairro, filial_endercomp, cidade_id)
values (4, 'FILIAL 004', '44444444000404', 'email@grupomatheus.com.br', 'Av. Daniel de Latouche', 'COHAMA', '',1)
go
insert into filiais (filial_codigo, filial_descricao, filial_cnpj, filial_email, filial_endereco, filial_bairro, filial_endercomp, cidade_id)
values (5, 'FILIAL 005', '55555555000505', 'email@grupomatheus.com.br', 'Av. Daniel de Latouche', 'COHAMA', '',1)
go
insert into filiais (filial_codigo, filial_descricao, filial_cnpj, filial_email, filial_endereco, filial_bairro, filial_endercomp, cidade_id)
values (60, 'FILIAL 060', '60606060006060', 'email@grupomatheus.com.br', 'Av. Daniel de Latouche', 'COHAMA', '',1)
go
insert into clientes 
(cliente_nomerzsocial, cliente_apelidofantasia, cliente_cnpjcpf, cliente_inscest_cic, cliente_email, cliente_endereco, cliente_bairro, cliente_endercomp, cliente_cidade_id)
values ('RUY GUILHERME', 'RUY', '7115240391', '0000000000', 'ruyflexa@hotmail.com', 'RUA 0001', 'COHAFUMA', '', 1)
GO
insert into grupo_produto (grupo_descricao) VALUES ('GRUPO 001')
GO
insert into grupo_produto (grupo_descricao) VALUES ('GRUPO 002')
GO
insert into grupo_produto (grupo_descricao) VALUES ('GRUPO 003')
GO
insert into formapagamento (formapagamento_descricao ) values ('DINHEIRO')
GO
insert into formapagamento (formapagamento_descricao ) values ('CARTAO CREDITO')
GO
insert into formapagamento (formapagamento_descricao ) values ('CARTAO DEBITO')
GO
insert into tipomovimento (tipomovimento_descricao, tipo_movimento_entsai) values ('ENTRADA DE ESTOQUE', 0)
GO
insert into tipomovimento (tipomovimento_descricao, tipo_movimento_entsai) values ('SAIDA DE ESTOQUE', 1)

GO
declare @COD int
declare @GRU int

set @COD = 1;
set @GRU = 1;

while (@COD<=30)  
begin
     if (@COD>20)
	 begin
	      set @GRU = 3;
	 end
	 else
	 begin
	      if (@COD>10)
		  begin
               set @GRU = 2;
		  end;
	 end;
	 --select 'PRODUTO '+right('00000'+CONVERT(VARCHAR(20),@cod),6), right('00000'+CONVERT(VARCHAR(20),@cod),6), @GRU, @cod, @cod*10 
	 
	 insert into produtos ( produto_descricao, produto_codigobarras, grupo_id, produto_valorcusto, produto_valorvenda)
	 values ('PRODUTO '+CONVERT(VARCHAR(2),@cod), right('00000'+CONVERT(VARCHAR(20),@cod),6),@GRU, CONVERT(numeric(15,6),@cod),CONVERT(numeric(15,6),@cod)*10 )
	 
	 set @COD = @COD+1;
end;

select * from produtos

GO

insert into estoque (filial_ID, produto_ID, estoque_quantidade, estoque_pendente)
select filial_ID, produto_ID, 100, 0
from filiais, produtos
