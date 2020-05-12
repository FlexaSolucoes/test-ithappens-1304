select pe.*, ip.*
from pedidoestoque pe, 
itenspedido ip
where pe.pedido_id = ip.pedido_id
and ip.produto_id = 7993
order by pe.pedido_id 

--ou 

select pe.*, ip.*
from pedidoestoque pe
inner join itenspedido ip on 
   pe.pedido_id = ip.pedido_id
where ip.produto_id = 7993
order by pe.pedido_id 

-- ou 

select 
pe.pedido_ID                  ,
pe.tipomovimento_id           , 
pe.filial_id                  , 
pe.cliente_id                 ,
pe.pedido_data                ,
pe.pedido_valoritens          ,
pe.pedido_valordesconto       ,
pe.pedido_valortotal          ,
pe.pedido_status              , 
ip.itenspedido_id             ,
ip.pedido_id                  ,
ip.itenspedido_seq            ,
ip.produto_id                 ,
ip.itenspedido_quantidade     ,
ip.itenspedido_valorunitario  ,
ip.itenspedido_valordesconto  ,
ip.itenspedido_valortotal     ,
ip.itenspedido_status         
from pedidoestoque pe, 
itenspedido ip
where pe.pedido_id = ip.pedido_id
and ip.produto_id = 7993
order by pe.pedido_id 

--ou 

select 
pe.pedido_ID                  ,
pe.tipomovimento_id           , 
pe.filial_id                  , 
pe.cliente_id                 ,
pe.pedido_data                ,
pe.pedido_valoritens          ,
pe.pedido_valordesconto       ,
pe.pedido_valortotal          ,
pe.pedido_status              , 
ip.itenspedido_id             ,
ip.pedido_id                  ,
ip.itenspedido_seq            ,
ip.produto_id                 ,
ip.itenspedido_quantidade     ,
ip.itenspedido_valorunitario  ,
ip.itenspedido_valordesconto  ,
ip.itenspedido_valortotal     ,
ip.itenspedido_status         
from pedidoestoque pe
inner join itenspedido ip on 
   pe.pedido_id = ip.pedido_id
where ip.produto_id = 7993
order by pe.pedido_id 
