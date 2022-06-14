select
		smn_comercial.smn_rel_oferta_cliente.smn_rel_oferta_cliente_id,
	case
		when smn_comercial.smn_rel_oferta_cliente.roc_estatus_proceso='EN' then '${lbl:b_send}'
		when smn_comercial.smn_rel_oferta_cliente.roc_estatus_proceso='EP' then '${lbl:b_in_process}'
		when smn_comercial.smn_rel_oferta_cliente.roc_estatus_proceso='CE' then '${lbl:b_close}'
		when smn_comercial.smn_rel_oferta_cliente.roc_estatus_proceso='AP' then '${lbl:b_aprobated}'
	end as roc_estatus_proceso,
	smn_comercial.smn_oferta_cabecera.ofe_descripcion as smn_oferta_id,
	smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_comercial.smn_rel_oferta_cliente.roc_fecha_aprobacion,
	smn_comercial.smn_rel_oferta_cliente.roc_fecha_vigencia_desde,
	smn_comercial.smn_rel_oferta_cliente.roc_fecha_vigencia_hasta,
	smn_comercial.smn_rel_oferta_cliente.roc_fecha_cierre,
	smn_comercial.smn_rel_oferta_cliente.roc_fecha_registro	
	
from
	smn_comercial.smn_rel_oferta_cliente
	inner join smn_comercial.smn_oferta_cabecera on smn_comercial.smn_oferta_cabecera.smn_oferta_cabecera_id = smn_comercial.smn_rel_oferta_cliente.smn_oferta_id
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_rel_oferta_cliente.smn_cliente_id
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
where
	smn_comercial.smn_rel_oferta_cliente.smn_oferta_id=${fld:id2}

