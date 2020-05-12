select 
e.filial_id         ,
f.filial_descricao  ,
e.produto_id        ,
p.produto_descricao ,
e.estoque_quantidade   
from estoque e
left join filiais f on
f.filial_id = e.filial_id
left join produtos p on
p.produto_id = e.produto_id
where e.estoque_quantidade >=100
order by e.filial_id, e.produto_id

--OU

select 
e.filial_id         ,
f.filial_descricao  ,
e.produto_id        ,
p.produto_descricao ,
e.estoque_quantidade   
from estoque e
inner join filiais f on
f.filial_id = e.filial_id
inner join produtos p on
p.produto_id = e.produto_id
where e.estoque_quantidade >=100
order by e.filial_id, e.produto_id
