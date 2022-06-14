select
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id,
	smn_comercial.smn_orden_servicio.smn_documento_id,
	smn_comercial.smn_orden_servicio.smn_prestador_servicio_rf,
	smn_comercial.smn_centro_facturacion.smn_entidades_rf,
	smn_comercial.smn_centro_facturacion.smn_sucursales_rf,
	smn_comercial.smn_centro_facturacion.smn_baremos_rf,
	smn_comercial.smn_cliente.smn_clase_auxiliar_rf,
	smn_comercial.smn_cliente.smn_auxiliar_rf,
	to_char(smn_comercial.smn_orden_servicio.ors_fecha_registro, 'YYYY-MM-DD') as ors_fecha_registro
from 
	smn_comercial.smn_orden_servicio
	inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_orden_servicio.smn_cliente_id
	inner join smn_comercial.smn_centro_facturacion on smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id = smn_comercial.smn_orden_servicio.smn_centro_facturacion_id
where 
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id = ${fld:id_orden_servicio}
	