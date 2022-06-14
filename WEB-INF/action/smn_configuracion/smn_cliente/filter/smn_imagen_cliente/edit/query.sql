select	
	smn_comercial.smn_imagen_cliente.smn_cliente_id,
	smn_comercial.smn_imagen_cliente.iic_descripcion,
	smn_comercial.smn_imagen_cliente.smn_imagen_cliente_id

from 
	smn_comercial.smn_imagen_cliente
where 
	smn_imagen_cliente_id = ${fld:id}


