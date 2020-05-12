select 
f.filial_codigo     ,
f.filial_descricao  ,
e.produto_id        ,
p.produto_descricao ,
e.estoque_quantidade   
from filiais f
left join estoque e on
e.filial_id = f.filial_id
left join produtos p on
p.produto_id = e.produto_id
where f.filial_codigo = 60
and IsNull(e.estoque_quantidade,0) > 0
order by e.filial_id, e.produto_id

--OU

select 
f.filial_codigo     ,
f.filial_descricao  ,
e.produto_id        ,
p.produto_descricao ,
e.estoque_quantidade   
from filiais f
inner join estoque e on
e.filial_id = f.filial_id
inner join produtos p on
p.produto_id = e.produto_id
where f.filial_codigo = 60
and IsNull(e.estoque_quantidade,0) > 0
order by e.filial_id, e.produto_id
