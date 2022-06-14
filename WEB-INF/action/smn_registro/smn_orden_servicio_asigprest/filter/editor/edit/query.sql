select	
	*
from 
	smn_comercial.smn_orden_servicio
	--left join smn_comercial.smn_rel_cliente_usuario on smn_comercial.smn_rel_cliente_usuario.smn_cliente_id = smn_comercial.smn_orden_servicio.smn_cliente_id
    --left join smn_comercial.smn_rel_cliente_documento on smn_comercial.smn_rel_cliente_documento.smn_documento_id = smn_comercial.smn_orden_servicio.smn_documento_id

where 
	smn_orden_servicio_id = ${fld:id}


