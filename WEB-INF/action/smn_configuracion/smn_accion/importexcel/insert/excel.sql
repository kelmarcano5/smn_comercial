INSERT INTO smn_comercial.smn_accion
(
	smn_accion_id,
	acc_codigo,
	acc_descripcion,
	acc_require_seguimiento,
	acc_dias_seguimiento,
	acc_paso_rf,
	acc_estatus,
	acc_vigencia,
	acc_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_accion},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
