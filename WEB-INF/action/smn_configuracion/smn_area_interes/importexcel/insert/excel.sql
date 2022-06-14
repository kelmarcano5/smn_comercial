INSERT INTO smn_comercial.smn_area_interes
(
	smn_area_interes_id,
	ari_codigo,
	ari_descripcion,
	ari_vigencia,
	ari_estatus,
	ari_idioma,
	ari_usuario,
	ari_fecha_registro,
	ari_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_area_interes},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
