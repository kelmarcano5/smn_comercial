INSERT INTO smn_comercial.smn_rel_cliente_area_interes
(
	smn_rel_cliente_area_interes_id,
	smn_cliente_id,
	smn_area_interes_id,
	rca_estatus,
	rca_vigencia,
	rca_idioma,
	rca_usuario,
	rca_fecha_registro,
	rca_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_cliente_area_interes},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
