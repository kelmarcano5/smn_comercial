UPDATE smn_comercial.smn_pedido_cabecera SET
	--pca_estatus='GE',
	pca_estatus_pago='PA',
	pca_tiempo_sug_preparacion=(select sum(cast(smn_comercial.smn_pedido_cabecera.pca_tiempo_sug_preparacion as integer)) from smn_comercial.smn_pedido_cabecera where
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:id2}),
	pca_idioma='${def:locale}',
	pca_usuario='${def:user}',
	pca_fecha_registro={d '${def:date}'},
	pca_hora='${def:time}'

WHERE
	smn_pedido_cabecera_id=${fld:id2}


	