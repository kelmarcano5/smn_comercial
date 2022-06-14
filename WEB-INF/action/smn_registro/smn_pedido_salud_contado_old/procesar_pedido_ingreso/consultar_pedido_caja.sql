SELECT
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
	${fld:smn_mov_caja_cabecera_id} as smn_mov_caja_cabecera_id,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido
FROM
	smn_comercial.smn_pedido_cabecera 
WHERE
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = ${fld:smn_pedido_cabecera_id}