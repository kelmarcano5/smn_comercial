INSERT INTO smn_comercial.smn_control_cupo
(
	smn_control_cupo_id,
	smn_evento_id,
	ccu_cupo,
	ccu_reservas,
	ccu_saldo,
	ccu_estatus,
	ccu_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_control_cupo},
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
