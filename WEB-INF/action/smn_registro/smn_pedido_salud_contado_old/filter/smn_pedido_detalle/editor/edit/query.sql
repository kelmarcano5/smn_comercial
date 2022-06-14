select	
	*
from 
	smn_comercial.smn_pedido_detalle
	--inner join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = 	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
where 
	smn_pedido_detalle_id = ${fld:id}


