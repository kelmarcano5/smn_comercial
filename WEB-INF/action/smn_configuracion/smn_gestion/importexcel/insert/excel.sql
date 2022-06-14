INSERT INTO smn_comercial.smn_gestion
(
	smn_gestion_id,
	ges_codigo,
	ges_descripcion,
	smn_accion_id,
	ges_estatus,
	ges_vigencia,
	ges_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_gestion},
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
