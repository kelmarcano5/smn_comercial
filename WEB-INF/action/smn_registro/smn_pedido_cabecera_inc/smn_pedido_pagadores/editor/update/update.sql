UPDATE smn_comercial.smn_pedido_pagadores SET
	smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id},
	smn_cliente_id=${fld:smn_cliente_id},
	ppa_monto=${fld:ppa_monto},
	ppa_idioma='${def:locale}',
	ppa_usuario='${def:user}',
	ppa_fecha_registro={d '${def:date}'},
	ppa_hora='${def:time}',
	smn_codigo_impuesto_rf=${fld:smn_codigo_impuesto_rf},
	ppa_porcentaje=${fld:ppa_porcentaje},
	ppa_monto_impuesto_ml=${fld:ppa_monto_impuesto_ml},
	ppa_monto_impuesto_ma=${fld:ppa_monto_impuesto_ma}

WHERE
	smn_pedido_pagadores_id=${fld:id}

