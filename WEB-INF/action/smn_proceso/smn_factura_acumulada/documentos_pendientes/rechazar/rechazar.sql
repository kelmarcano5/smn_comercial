UPDATE smn_comercial.smn_pedido_detalle SET
	pde_estatus='NA'

WHERE
	smn_pedido_detalle_id=${fld:id};


UPDATE smn_comercial.smn_pedido_cabecera SET
	pca_estatus='NA'

WHERE
	smn_pedido_cabecera_id=(select smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id from smn_comercial.smn_pedido_detalle where smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id=${fld:id});


