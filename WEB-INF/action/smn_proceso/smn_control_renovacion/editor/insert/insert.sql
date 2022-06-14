INSERT INTO smn_comercial.smn_control_renovacion
(
	smn_control_renovacion_id,
	smn_afiliado_id,
	smn_pedido_id,
	crn_fecha_renovacion,
	crn_fecha_vigencia_hasta,
	crn_estatus,
	crn_idioma,
	crn_usuario,
	crn_fecha_registro,
	crn_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_control_renovacion},
	${fld:smn_afiliado_id},
	${fld:smn_pedido_id},
	${fld:crn_fecha_renovacion},
	${fld:crn_fecha_vigencia_hasta},
	${fld:crn_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
