SELECT DISTINCT
	smn_comercial.smn_centro_facturacion.smn_baremos_rf,
	smn_base.smn_baremos_detalle.bad_precio_moneda_alterna,
 	smn_base.smn_baremos_detalle.bad_tipo_componente,
	smn_base.smn_baremos_detalle.smn_clase_auxiliar_rf,
 	smn_base.smn_baremos_detalle.smn_almacen_rf,
 	smn_base.smn_baremos_detalle.bad_cantidad,
	smn_base.smn_baremos_detalle.bad_tipo_componente,
	CASE
		WHEN smn_base.smn_baremos_detalle.bad_precio_moneda_local IS NULL OR smn_base.smn_baremos_detalle.bad_precio_moneda_local = 0 THEN smn_base.smn_baremos_detalle.bad_cantidad*smn_base.smn_baremos_detalle.bad_precio_moneda_alterna*(select smn_base.smn_tasas_de_cambio.tca_tasa_cambio from smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=CURRENT_DATE AND smn_base.smn_tasas_de_cambio.tca_tipo_tasa=(select smn_comercial.smn_documento.tca_tipo_tasa from smn_comercial.smn_documento where smn_comercial.smn_documento.smn_documento_id = (select smn_comercial.smn_orden_servicio.smn_documento_id from smn_comercial.smn_orden_servicio where smn_comercial.smn_orden_servicio.smn_orden_servicio_id=${fld:id_orden_servicio}))) else smn_base.smn_baremos_detalle.bad_precio_moneda_local END AS bad_precio_moneda_local,
 	smn_base.smn_baremos_detalle.bad_precio_moneda_alterna*smn_base.smn_baremos_detalle.bad_cantidad as prd_moneda_alterna,
 	smn_base.smn_baremos_detalle.smn_moneda_rf,
	smn_comercial.smn_orden_servicio.smn_prestador_servicio_rf,
	smn_base.smn_baremos_detalle.smn_servicios_rf,
	${fld:smn_presupuesto_id} as smn_presupuesto_id

FROM
  smn_comercial.smn_orden_cab_det_servicio 
	inner join smn_comercial.smn_orden_servicio on smn_comercial.smn_orden_servicio.smn_orden_servicio_id =  smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id
	inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_orden_servicio.smn_documento_id
	inner join smn_comercial.smn_rel_centro_fac_documento on smn_comercial.smn_rel_centro_fac_documento.smn_documento_id = smn_comercial.smn_orden_servicio.smn_documento_id
	INNER JOIN smn_comercial.smn_centro_facturacion ON smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id = smn_comercial.smn_rel_centro_fac_documento.smn_centro_facturacion_id
	inner join smn_comercial.smn_rel_orden_servicio on smn_comercial.smn_rel_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_orden_cab_det_servicio.smn_orden_servicio_id
	INNER JOIN smn_base.smn_baremos_detalle ON smn_comercial.smn_centro_facturacion.smn_baremos_rf = smn_base.smn_baremos_detalle.smn_baremos_id AND smn_comercial.smn_rel_orden_servicio.smn_servicios_rf = smn_base.smn_baremos_detalle.smn_servicios_rf
where 
	smn_comercial.smn_orden_servicio.smn_orden_servicio_id = ${fld:id_orden_servicio}