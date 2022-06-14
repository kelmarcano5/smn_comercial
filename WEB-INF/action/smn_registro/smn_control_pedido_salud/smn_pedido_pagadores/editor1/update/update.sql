UPDATE smn_comercial.smn_pedido_pagadores SET
	smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id},
	smn_cliente_id=${fld:smn_cliente_id},
	ppa_monto=${fld:ppa_monto},
	ppa_idioma='${def:locale}',
	ppa_usuario='${def:user}',
	ppa_fecha_registro={d '${def:date}'},
	ppa_hora='${def:time}'

WHERE
	smn_pedido_pagadores_id=${fld:id}

