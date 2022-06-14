INSERT INTO smn_comercial.smn_factura_complemento
(
	smn_factura_complemento_id,
	smn_factura_cabecera_id,
	smn_pedido_cabecera_id,
	smn_pedido_detalle_id,
	smn_item_rf,
	smn_servicios_rf,
	fco_monto_dif_camb_item_ml,
	fco_monto_dif_camb_impuesto_ml,
	fco_idioma,
	fco_usuario,
	fco_fecha_registro,
	fco_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_factura_complemento},
	${fld:smn_factura_cabecera_id},
	(select smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id from smn_comercial.smn_rel_pedido_factura where smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id = ${fld:smn_factura_cabecera_id} limit 1),
	0,
	0,
	0,
	${fld:fco_monto_dif_camb_item_ml},
	${fld:fco_monto_dif_camb_impuesto_ml},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);
