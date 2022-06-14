INSERT INTO smn_comercial.smn_rel_pedido_fecha_entrega
(
	smn_rel_pedido_fecha_entrega_id,
	smn_pedido_detalle_id,
	smn_rel_auxiliar_direccion,
	pfe_fecha_entrega,
	pfe_cantidad,
	pfe_idioma,
	pfe_usuario,
	pfe_fecha_registro,
	pfe_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_rel_pedido_fecha_entrega},
	${fld:smn_pedido_detalle_id},
	${fld:smn_rel_auxiliar_direccion},
	${fld:pfe_fecha_entrega},
	${fld:pfe_cantidad},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
