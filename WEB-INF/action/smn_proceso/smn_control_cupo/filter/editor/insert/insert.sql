INSERT INTO smn_comercial.smn_control_cupo
(
	smn_control_cupo_id,
	smn_evento_id,
	ccu_cupo,
	ccu_reservas,
	ccu_saldo,
	ccu_estatus,
	ccu_idioma,
	ccu_usuario,
	ccu_fecha_registro,
	ccu_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_control_cupo},
	${fld:smn_evento_id},
	${fld:ccu_cupo},
	${fld:ccu_reservas},
	${fld:ccu_saldo},
	${fld:ccu_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
