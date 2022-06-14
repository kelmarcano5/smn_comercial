INSERT INTO smn_comercial.smn_tipo_documentos_fact
(
	smn_tipo_documentos_fact_id,
	tdf_codigo,
	tdf_nombre,
	tdf_naturaleza,
	tdf_vigencia,
	tdf_estatus,
	tdf_idioma,
	tdf_usuario,
	tdf_fecha_registro,
	tdf_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_tipo_documentos_fact},
	?,
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
