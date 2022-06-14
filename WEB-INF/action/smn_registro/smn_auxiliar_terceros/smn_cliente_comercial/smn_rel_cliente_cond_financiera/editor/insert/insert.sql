INSERT INTO smn_comercial.smn_rel_cliente_cond_financiera
(
	smn_rel_cliente_cond_financiera_id,
	smn_cliente_id,
	smn_condicion_financiera_rf,
	rcc_estatus,
	rcc_vigencia,
	rcc_idioma,
	rcc_usuario,
	rcc_fecha_registro,
	rcc_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_rel_cliente_cond_financiera},
	${fld:smn_cliente_id},
	${fld:smn_condicion_financiera_rf},
	${fld:rcc_estatus},
	{d '${def:date}'},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
