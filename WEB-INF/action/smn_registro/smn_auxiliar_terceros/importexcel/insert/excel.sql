INSERT INTO smn_base.smn_auxiliar
(
	smn_auxiliar_id,
	smn_clase_auxiliar_rf,
	aux_tipo_persona,
	aux_codigo,
	aux_descripcion,
	aux_rif,
	aux_direccion_rf,
	aux_fecha_registro
)
VALUES
(
	${seq:nextval@smn_base.seq_smn_auxiliar},
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
