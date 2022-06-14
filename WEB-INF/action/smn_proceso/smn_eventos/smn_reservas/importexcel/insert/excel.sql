INSERT INTO smn_comercial.smn_reservas
(
	smn_reservas_id,
	smn_evento_id,
	smn_afiliado_id,
	smn_relacionado_id,
	res_cantidad,
	res_estatus,
	res_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_reservas},
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
