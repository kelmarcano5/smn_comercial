delete from smn_comercial.smn_factura_impresion_detalle where smn_pedido_cabecera_id=${fld:id};

delete from smn_comercial.smn_rel_pedido_factura where smn_pedido_cabecera_id=${fld:id};

UPDATE smn_comercial.smn_factura_cabecera SET
	fca_estatus_financiero='PE',
	fca_estatus_proceso='AN'
WHERE
	smn_factura_cabecera_id=(select smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id from smn_comercial.smn_rel_pedido_factura where smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id=${fld:id});

UPDATE smn_comercial.smn_pedido_cabecera SET
	pca_estatus='PR'
WHERE
	smn_pedido_cabecera_id=${fld:id};
