INSERT INTO smn_comercial.smn_rel_cliente_cond_financiera
(
	smn_rel_cliente_cond_financiera_id,
	smn_cliente_id,
	smn_condicion_financiera_rf,
	rcc_estatus,
	rcc_vigencia,
	rcc_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_cliente_cond_financiera},
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
