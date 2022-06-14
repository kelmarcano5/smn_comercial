UPDATE smn_comercial.smn_pedido_cabecera SET 
	pca_estatus='PR'

WHERE
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:id};