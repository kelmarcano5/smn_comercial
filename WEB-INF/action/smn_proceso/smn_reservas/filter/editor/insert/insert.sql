INSERT INTO smn_comercial.smn_reservas
(
	smn_reservas_id,
	smn_evento_id,
	smn_afiliado_id,
	res_cantidad,
	res_estatus,
	res_idioma,
	res_usuario,
	res_fecha_registro,
	res_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_reservas},
	${fld:smn_evento_id},
	${fld:smn_afiliado_id},
	${fld:res_cantidad},
	${fld:res_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);


