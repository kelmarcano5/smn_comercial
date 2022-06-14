INSERT INTO smn_comercial.smn_rel_linea_comercial_servicio
(
	smn_rel_linea_comercial_servicio_id,
	smn_linea_comercial_id,
	smn_servicio_rf,
	rls_estatus,
	rls_vigencia,
	rls_idioma,
	rls_usuario,
	rls_fecha_registro,
	rls_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_linea_comercial_servicio},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
