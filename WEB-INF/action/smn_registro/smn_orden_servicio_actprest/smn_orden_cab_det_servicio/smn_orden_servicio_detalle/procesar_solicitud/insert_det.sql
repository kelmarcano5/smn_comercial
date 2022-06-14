INSERT INTO smn_inventario.smn_despacho_detalle
(
	smn_despacho_detalle_id,
	smn_despacho_id,
	smn_caracteristica_item_id,
	dde_cantidad_solicitada,
	dde_costo_ml,
	dde_costo_ma,
	dde_estatus_transaccion,
	dde_idioma,
	dde_usuario,
	dde_fecha_registro,
	dde_hora
)
VALUES
(
	${seq:nextval@smn_inventario.seq_smn_despacho_detalle},
	(select last_value from smn_inventario.seq_smn_despacho),
	${fld:smn_item_rf},
	${fld:osd_cantidad},
	${fld:dde_costo_ml},
	${fld:dde_costo_ma},
	'RE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
