INSERT INTO smn_comercial.smn_prospecto
(
	smn_prospecto_id,
	pro_codigo,
	pro_descripcion,
	pro_email,
	pro_movil,
	pro_fijo,
	pro_referido,
	pro_estatus,
	pro_vigencia,
	pro_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_prospecto},
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
