UPDATE smn_comercial.smn_factura_pagadores SET
	smn_factura_cabecera_id=${fld:smn_factura_cabecera_id},
	smn_cliente_id=${fld:smn_cliente_id},
	smn_monto_rf=${fld:smn_monto_rf},
	fpa_idioma='${def:locale}',
	fpa_usuario='${def:user}',
	fpa_fecha_registro={d '${def:date}'},
	fpa_hora='${def:time}'

WHERE
	smn_factura_pagadores_id=${fld:id}

