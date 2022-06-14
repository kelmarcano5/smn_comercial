INSERT INTO smn_comercial.smn_factura_detalle
(
	smn_factura_detalle_id,
	smn_factura_cabecera_id,
	fde_naturaleza,
	smn_servicios_rf,
	smn_item_rf,
	fde_cantidad,
	fde_precio_ml,
	fde_monto_ml,
	smn_moneda_rf,
	fde_idioma,
	fde_usuario,
	fde_fecha_registro,
	fde_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_factura_detalle},
	(select last_value from smn_comercial.seq_smn_factura_cabecera),
	${fld:fde_naturaleza},
	${fld:smn_servicios_rf},
	${fld:smn_item_rf},
	${fld:fde_cantidad},
	${fld:fde_precio_ml},
	${fld:fde_monto_ml},
	${fld:smn_moneda_rf},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
RETURNING smn_factura_detalle_id as id_factura_detalle;
