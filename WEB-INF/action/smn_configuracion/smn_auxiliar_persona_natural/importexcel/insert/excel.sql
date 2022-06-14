INSERT INTO smn_base.smn_auxiliar
(
	smn_auxiliar_id,
	smn_clase_auxiliar_rf,
	aux_tipo_persona,
	aux_apellidos,
	aux_nombres,
	aux_tipo_doc_oficial_rf,
	aux_rif,
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
