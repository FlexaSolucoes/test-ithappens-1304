select 
pe.filial_id               , 
f.filial_codigo            ,
f.filial_descricao         ,
pe.pedido_ID               ,
pp.forma_pagamento_id      ,
fp.formapagamento_descricao
from pedidoestoque pe,
filiais f             ,
pedido_pagamentos pp ,
formapagamento    fp
where pe.pedido_ID = pp.pedido_id
and   pe.filial_id = f.filial_id
and   pp.forma_pagamento_id = fp.formapagamento_id
and   pe.pedido_status = 1 /*esta clausula filtra somente os pedidod fechados*/
order by 
f.filial_codigo            ,
pe.pedido_ID               ,
pp.forma_pagamento_id      

--ou

select 
pe.filial_id               , 
f.filial_codigo            ,
f.filial_descricao         ,
pe.pedido_ID               ,
pp.forma_pagamento_id      ,
fp.formapagamento_descricao
from pedidoestoque pe
inner join filiais f  on
   f.filial_id = pe.filial_id
inner join pedido_pagamentos pp on
   pp.pedido_id = pe.pedido_ID
inner join formapagamento    fp on
pp.forma_pagamento_id = fp.formapagamento_id
where pe.pedido_status = 1 /*esta clausula filtra somente os pedidod fechados*/
order by 
f.filial_codigo            ,
pe.pedido_ID               ,
pp.forma_pagamento_id      
