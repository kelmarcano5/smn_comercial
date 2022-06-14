UPDATE smn_comercial.smn_rel_pedido_fecha_entrega SET
	smn_pedido_detalle_id=${fld:smn_pedido_detalle_id},
	smn_rel_auxiliar_direccion=${fld:smn_rel_auxiliar_direccion},
	pfe_fecha_entrega=${fld:pfe_fecha_entrega},
	pfe_cantidad=${fld:pfe_cantidad},
	pfe_idioma='${def:locale}',
	pfe_usuario='${def:user}',
	pfe_fecha_registro={d '${def:date}'},
	pfe_hora='${def:time}'

WHERE
	smn_rel_pedido_fecha_entrega_id=${fld:id}

