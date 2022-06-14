SELECT
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido,
	smn_base.smn_servicios.svc_descripcion AS servicio,
	smn_comercial.smn_pedido_detalle.pde_monto,
	smn_comercial.smn_pedido_detalle.pde_precio_moneda_alterna,
	smn_base.smn_tasas_de_cambio.tca_descripcion,
	paciente.aux_descripcion as paciente,
	smn_salud.smn_ingresos.igs_num_ingreso,
	smn_comercial.smn_pedido_detalle.pde_fecha_requerida 
FROM
	smn_comercial.smn_pedido_detalle
	INNER JOIN smn_comercial.smn_pedido_cabecera ON smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
	INNER JOIN smn_comercial.smn_cliente ON smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
	INNER JOIN smn_base.smn_auxiliar cliente ON cliente.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	INNER JOIN smn_base.smn_auxiliar paciente ON paciente.smn_auxiliar_id = smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf
	LEFT JOIN smn_caja.smn_mov_caja_cabecera ON smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id
	LEFT JOIN smn_salud.smn_ingresos ON smn_salud.smn_ingresos.igs_num_ingreso = smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf
	INNER JOIN smn_base.smn_entidades ON smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_pedido_cabecera.smn_entidad_rf
	LEFT JOIN smn_base.smn_sucursales ON smn_base.smn_sucursales.smn_sucursales_id = smn_comercial.smn_pedido_cabecera.smn_sucursal_rf
	LEFT JOIN smn_base.smn_monedas ON smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_cabecera.smn_moneda_rf
	INNER JOIN smn_base.smn_servicios ON smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_pedido_detalle.smn_servicios_rf
	INNER JOIN smn_base.smn_tasas_de_cambio ON smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_comercial.smn_pedido_detalle.smn_tasa_rf 
WHERE
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id IS NOT NULL and smn_comercial.smn_pedido_cabecera.pca_estatus IN('PR')
	AND smn_comercial.smn_pedido_cabecera.smn_entidad_rf = ${fld:entidad} 
	--AND smn_comercial.smn_pedido_cabecera.smn_sucursal_rf=${fld:sucursal} 
	and smn_comercial.smn_pedido_cabecera.smn_documento_id=${fld:documento}
	AND smn_comercial.smn_pedido_cabecera.smn_centro_facturacion_id = ${fld:smn_centro_id}
	AND smn_comercial.smn_pedido_cabecera.smn_cliente_id = ${fld:smn_cliente_id} 
	AND smn_comercial.smn_pedido_cabecera.pca_fecha_requerida >= ${fld:pca_fecha_registro_ini} 
	AND smn_comercial.smn_pedido_cabecera.pca_fecha_requerida <= ${fld:pca_fecha_registro_fin}
	--and smn_comercial.smn_pedido_detalle.pde_estatus = 'NP'  AND smn_comercial.smn_pedido_cabecera.pca_estatus='PR'
ORDER BY 
	paciente.smn_auxiliar_id, smn_comercial.smn_pedido_cabecera.pca_numero_pedido ASC


