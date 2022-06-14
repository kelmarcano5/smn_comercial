UPDATE smn_comercial.smn_pedido_cabecera SET
	pca_estatus = 'PR',
	pca_estatus_pago='GE',
	smn_mov_caja_cabecera_id=${fld:smn_mov_caja_cabecera_id}

WHERE
	smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}

