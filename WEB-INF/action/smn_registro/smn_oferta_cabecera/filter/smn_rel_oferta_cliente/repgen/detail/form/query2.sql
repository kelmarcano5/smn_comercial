select
		smn_comercial.smn_rel_oferta_cliente.smn_oferta_id,
	smn_comercial.smn_rel_oferta_cliente.smn_cliente_id,
	smn_comercial.smn_rel_oferta_cliente.roc_estatus_proceso,
	smn_comercial.smn_rel_oferta_cliente.roc_fecha_aprobacion,
	smn_comercial.smn_rel_oferta_cliente.roc_fecha_vigencia_desde,
	smn_comercial.smn_rel_oferta_cliente.roc_fecha_vigencia_hasta,
	smn_comercial.smn_rel_oferta_cliente.roc_fecha_cierre,
	smn_comercial.smn_rel_oferta_cliente.roc_fecha_registro
from
	smn_comercial.smn_rel_oferta_cliente 
where
	smn_comercial.smn_rel_oferta_cliente.smn_rel_oferta_cliente_id = ${fld:id}
