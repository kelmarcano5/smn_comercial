select
	${field},
	smn_comercial.smn_oferta_cabecera.smn_oferta_cabecera_id,
	case
	when smn_comercial.smn_oferta_cabecera.ofe_estatus='A' then '${lbl:b_open}'
	when smn_comercial.smn_oferta_cabecera.ofe_estatus='C' then '${lbl:b_close}'
	end as ofe_estatus,
	smn_comercial.smn_documento.dcf_codigo ||' - '|| smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_base.smn_entidades.ent_codigo ||' - '|| smn_base.smn_entidades.ent_descripcion_corta as smn_entidad_rf,
	smn_base.smn_sucursales.suc_codigo ||' - '|| smn_base.smn_sucursales.suc_nombre as smn_sucursal_rf,
	smn_comercial.smn_oferta_cabecera.ofe_numero_documento,
	smn_comercial.smn_oferta_cabecera.ofe_fecha_desde,
	smn_comercial.smn_oferta_cabecera.ofe_fecha_hasta,
	smn_comercial.smn_oferta_cabecera.ofe_observaciones,
	smn_comercial.smn_oferta_cabecera.ofe_descripcion,
	smn_comercial.smn_oferta_detalle.smn_oferta_detalle_id,
	smn_comercial.smn_oferta_cabecera.ofe_descripcion as smn_oferta_id,
	case
	when smn_comercial.smn_oferta_detalle.ofd_naturaleza='IT' then '${lbl:b_item}'
	when smn_comercial.smn_oferta_detalle.ofd_naturaleza='SE' then '${lbl:b_services}'
	when smn_comercial.smn_oferta_detalle.ofd_naturaleza='AF' then '${lbl:b_actfijo}'
	end as ofd_naturaleza,
	smn_base.smn_servicios.svc_codigo ||' - '|| smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_base.smn_item.itm_codigo ||' - '|| smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_comercial.smn_oferta_detalle.ofd_cantidad,
	smn_comercial.smn_oferta_detalle.ofd_precio,
	smn_comercial.smn_oferta_detalle.ofd_monto_ml,
	smn_base.smn_monedas.mon_nombre as ofd_moneda_rf,
	smn_comercial.smn_oferta_detalle.ofd_precio_moneda_alterna,
	smn_comercial.smn_oferta_detalle.ofd_monto_moneda_alterna,
	smn_comercial.smn_rel_oferta_cliente.smn_rel_oferta_cliente_id,
	case
		when smn_comercial.smn_rel_oferta_cliente.roc_estatus_proceso='EN' then '${lbl:b_send}'
		when smn_comercial.smn_rel_oferta_cliente.roc_estatus_proceso='EP' then '${lbl:b_in_process}'
		when smn_comercial.smn_rel_oferta_cliente.roc_estatus_proceso='CE' then '${lbl:b_close}'
		when smn_comercial.smn_rel_oferta_cliente.roc_estatus_proceso='AP' then '${lbl:b_aprobated}'
	end as roc_estatus_proceso,
	smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id,
	smn_comercial.smn_rel_oferta_cliente.roc_fecha_aprobacion,
	smn_comercial.smn_rel_oferta_cliente.roc_fecha_cierre
from
	smn_comercial.smn_oferta_cabecera
	left outer join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_oferta_cabecera.smn_documento_id
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_oferta_cabecera.smn_entidad_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_comercial.smn_oferta_cabecera.smn_sucursal_rf
	inner join smn_comercial.smn_oferta_detalle on smn_comercial.smn_oferta_cabecera.smn_oferta_cabecera_id = smn_comercial.smn_oferta_detalle.smn_oferta_id	
	inner join smn_comercial.smn_rel_oferta_cliente on smn_comercial.smn_oferta_cabecera.smn_oferta_cabecera_id = smn_comercial.smn_rel_oferta_cliente.smn_oferta_id
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_oferta_detalle.smn_item_rf
	left outer join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_oferta_detalle.smn_servicios_rf
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_rel_oferta_cliente.smn_cliente_id
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_oferta_detalle.ofd_moneda_rf
where
	smn_comercial.smn_oferta_cabecera.smn_oferta_cabecera_id is not null
	${filter}