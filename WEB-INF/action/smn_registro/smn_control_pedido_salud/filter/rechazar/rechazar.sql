DELETE FROM smn_cobranzas.smn_mov_documento_cob_detalle where smn_cobranzas.smn_mov_documento_cob_detalle.smn_mov_documento_cob_cab_id IN (select smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id from smn_cobranzas.smn_mov_documento_cob_cab where smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_doc_origen=(select fca_numero_documento from smn_comercial.smn_factura_cabecera where smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id=(select smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id from smn_comercial.smn_rel_pedido_factura where smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id=${fld:id})));

DELETE FROM smn_cobranzas.smn_mov_documento_cob_cab where smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_doc_origen=(select fca_numero_documento from smn_comercial.smn_factura_cabecera where smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id=(select smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id from smn_comercial.smn_rel_pedido_factura where smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id=${fld:id}));

delete from smn_comercial.smn_factura_impresion_detalle where smn_pedido_cabecera_id=${fld:id};

UPDATE smn_comercial.smn_factura_cabecera set 
	fca_monto_neto_ml=0,
	fca_monto_neto_ma=0,
	fca_monto_factura_ml=0,
	fca_monto_factura_ma=0,
	fca_monto_impuesto_ml=0,
	fca_monto_impuesto_ma=0,
	fca_monto_descuento_ml=0,
	fca_monto_descuento_ma=0,
	fca_estatus_financiero='AN',
	fca_estatus_proceso='AN',
	fca_fecha_anulacion={d '${def:date}'},
	fca_usuario_anulacion='${def:user}',
	fca_motivo_anulacion='Anulacion',
	smn_pedido_original=${fld:id}
where 
	smn_factura_cabecera_id=(select smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id from smn_comercial.smn_rel_pedido_factura where smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id=${fld:id});

delete from smn_comercial.smn_rel_pedido_factura where smn_pedido_cabecera_id=${fld:id};

UPDATE smn_comercial.smn_pedido_cabecera SET
	pca_estatus='PR'
WHERE
	smn_pedido_cabecera_id=${fld:id};
