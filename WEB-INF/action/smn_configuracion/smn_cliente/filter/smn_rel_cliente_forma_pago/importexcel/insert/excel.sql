INSERT INTO smn_comercial.smn_rel_cliente_forma_pago
(
	smn_rel_cliente_forma_pago_id,
	smn_cliente_id,
	smn_forma_pago_rf,
	rcf_estatus,
	rcf_vigencia,
	rcf_idioma,
	rcf_usuario,
	rcf_fecha_registro,
	rcf_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_cliente_forma_pago},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
