/*Nesta consulta é validado todos os valores com os somatorios dos valores dos itens*/
select 
pe.filial_id            ,
pe.pedido_id            ,
ip.pedido_id            ,
pe.pedido_valoritens    ,
Sum(ip.itenspedido_quantidade*itenspedido_valorunitario) itenspedido_valoritens_total,
pe.pedido_valordesconto ,
Sum(ip.itenspedido_valordesconto) itenspedido_valordesconto_total,
pe.pedido_valortotal    ,
Sum(ip.itenspedido_valortotal) itenspedido_valortotal_total
from pedidoestoque pe ,
itenspedido ip
where pe.pedido_id = ip.pedido_id
group by 
pe.filial_id            ,
pe.pedido_id            ,
ip.pedido_id            ,
pe.pedido_valoritens    ,
pe.pedido_valordesconto ,
pe.pedido_valortotal    
having 
      pe.pedido_valoritens    = Sum(ip.itenspedido_quantidade*itenspedido_valorunitario)
and   pe.pedido_valordesconto = Sum(ip.itenspedido_valordesconto)
and   pe.pedido_valortotal    = Sum(itenspedido_valortotal)
order by 
pe.filial_id ,
pe.pedido_id 

-- ou

/*Nesta consulta é validado todos os valores com os somatorios dos valores dos itens*/
select 
pe.filial_id            ,
pe.pedido_id            ,
ip.pedido_id            ,
pe.pedido_valoritens    ,
Sum(ip.itenspedido_quantidade*itenspedido_valorunitario) itenspedido_valoritens_total,
pe.pedido_valordesconto ,
Sum(ip.itenspedido_valordesconto) itenspedido_valordesconto_total,
pe.pedido_valortotal    ,
Sum(ip.itenspedido_valortotal) itenspedido_valortotal_total
from pedidoestoque pe 
inner join itenspedido ip on 
     pe.pedido_id = ip.pedido_id
group by 
pe.filial_id            ,
pe.pedido_id            ,
ip.pedido_id            ,
pe.pedido_valoritens    ,
pe.pedido_valordesconto ,
pe.pedido_valortotal    
having 
      pe.pedido_valoritens    = Sum(ip.itenspedido_quantidade*itenspedido_valorunitario)
and   pe.pedido_valordesconto = Sum(ip.itenspedido_valordesconto)
and   pe.pedido_valortotal    = Sum(itenspedido_valortotal)
order by 
pe.filial_id ,
pe.pedido_id 

--ou
/*Nesta consulta é validado somente o valor total do pedido com o somatório do valor total do item*/
select 
pe.filial_id            ,
pe.pedido_id            ,
ip.pedido_id            ,
pe.pedido_valoritens    ,
Sum(ip.itenspedido_quantidade*itenspedido_valorunitario) itenspedido_valoritens_total,
pe.pedido_valordesconto ,
Sum(ip.itenspedido_valordesconto) itenspedido_valordesconto_total,
pe.pedido_valortotal    ,
Sum(ip.itenspedido_valortotal) itenspedido_valortotal_total
from pedidoestoque pe ,
itenspedido ip
where pe.pedido_id = ip.pedido_id
group by 
pe.filial_id            ,
pe.pedido_id            ,
ip.pedido_id            ,
pe.pedido_valoritens    ,
pe.pedido_valordesconto ,
pe.pedido_valortotal    
having 
   pe.pedido_valortotal    = Sum(itenspedido_valortotal)
order by 
pe.filial_id ,
pe.pedido_id 

-- ou

/*Nesta consulta é validado somente o valor total do pedido com o somatório do valor total do item*/
select 
pe.filial_id            ,
pe.pedido_id            ,
ip.pedido_id            ,
pe.pedido_valoritens    ,
Sum(ip.itenspedido_quantidade*itenspedido_valorunitario) itenspedido_valoritens_total,
pe.pedido_valordesconto ,
Sum(ip.itenspedido_valordesconto) itenspedido_valordesconto_total,
pe.pedido_valortotal    ,
Sum(ip.itenspedido_valortotal) itenspedido_valortotal_total
from pedidoestoque pe 
inner join itenspedido ip on 
     pe.pedido_id = ip.pedido_id
group by 
pe.filial_id            ,
pe.pedido_id            ,
ip.pedido_id            ,
pe.pedido_valoritens    ,
pe.pedido_valordesconto ,
pe.pedido_valortotal    
having 
  pe.pedido_valortotal    = Sum(itenspedido_valortotal)
order by 
pe.filial_id ,
pe.pedido_id 
