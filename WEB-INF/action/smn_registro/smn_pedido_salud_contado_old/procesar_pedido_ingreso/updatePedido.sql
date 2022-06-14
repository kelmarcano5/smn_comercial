UPDATE smn_comercial.smn_pedido_cabecera SET
	pca_estatus = 'PR',
	pca_estatus_pago='PA',
	smn_mov_caja_cabecera_id=${fld:smn_mov_caja_cabecera_id},
	smn_ingresos_rf=(select smn_salud.smn_ingresos.smn_ingresos_id from smn_salud.smn_ingresos where smn_salud.smn_ingresos.igs_doc_origen=(select smn_comercial.smn_pedido_cabecera.pca_numero_pedido from smn_comercial.smn_pedido_cabecera where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}) limit 1)

WHERE
	smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}

