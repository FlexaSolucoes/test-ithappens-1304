/*Consulta para sumarizar o total dos itens por pedido e que filtre apenas os pedidos no qual a soma total da quantidade de ítens de pedido seja maior que 10*/

select 
pe.filial_id            ,
pe.pedido_id            ,
ip.pedido_id            ,
Sum(ip.itenspedido_quantidade) itenspedido_quantidade_total
from pedidoestoque pe ,
itenspedido ip
where pe.pedido_id = ip.pedido_id
group by 
pe.filial_id            ,
pe.pedido_id            ,
ip.pedido_id            
having Sum(ip.itenspedido_quantidade) > 10
order by 
pe.filial_id ,
pe.pedido_id 

-- ou

select 
pe.filial_id            ,
pe.pedido_id            ,
ip.pedido_id            ,
Sum(ip.itenspedido_quantidade) itenspedido_quantidade_total
from pedidoestoque pe 
inner join itenspedido ip on 
     pe.pedido_id = ip.pedido_id
group by 
pe.filial_id            ,
pe.pedido_id            ,
ip.pedido_id            
having Sum(ip.itenspedido_quantidade) > 10
order by 
pe.filial_id ,
pe.pedido_id 
