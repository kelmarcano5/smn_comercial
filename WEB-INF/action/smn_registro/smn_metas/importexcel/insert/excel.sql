INSERT INTO smn_comercial.smn_metas
(
	smn_metas_id,
	smn_tipo_documento_id,
	smn_documento_id,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	smn_rol_id,
	smn_usuario_rf,
	met_fecha_desde,
	met_fecha_hasta,
	met_dias_habiles,
	met_fecha_estadistica,
	met_cantidad_diaria,
	met_cantidad_usuario,
	met_estatus,
	met_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_metas},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
