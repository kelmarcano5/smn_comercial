INSERT INTO smn_comercial.smn_reservas
(
	smn_reservas_id,
	smn_evento_id,
	smn_afiliado_id,
	res_cantidad,
	res_estatus,
	res_idioma,
	res_usuario,
	res_fecha_registro,
	res_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_reservas},
	${fld:smn_evento_id},
	${fld:smn_afiliado_id},
	${fld:res_cantidad},
	${fld:res_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);

UPDATE smn_comercial.smn_control_cupo SET 
	smn_evento_id=${fld:smn_evento_id},
	ccu_reservas=${fld:res_cantidad},
	ccu_saldo=(select DISTINCT smn_comercial.smn_control_cupo.ccu_saldo from smn_comercial.smn_afiliados 
	inner join smn_comercial.smn_control_cupo on smn_comercial.smn_control_cupo.smn_evento_id=${fld:smn_evento_id})-${fld:res_cantidad}

WHERE
	smn_evento_id=${fld:smn_evento_id};

UPDATE smn_comercial.smn_control_cupo_afiliado SET 
	smn_afiliados_id=${fld:smn_afiliado_id},
	cca_reservas=${fld:res_cantidad},
	cca_saldo=(select DISTINCT smn_comercial.smn_control_cupo_afiliado.cca_saldo from smn_comercial.smn_afiliados 
	inner join smn_comercial.smn_control_cupo_afiliado on smn_comercial.smn_control_cupo_afiliado.smn_afiliados_id=${fld:smn_evento_id})-${fld:res_cantidad}

WHERE
	smn_afiliados_id=${fld:smn_afiliado_id}


