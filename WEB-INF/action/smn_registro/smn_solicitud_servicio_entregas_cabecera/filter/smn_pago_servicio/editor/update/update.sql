UPDATE smn_comercial.smn_pago_servicio SET
	smn_solicitud_servicio_entregas_cabecera_id=${fld:smn_solicitud_servicio_entregas_cabecera_id},
	smn_forma_pago_rf=${fld:smn_forma_pago_rf},
	smn_franquicia_rf=${fld:smn_franquicia_rf},
	pas_numero_tarjeta=${fld:pas_numero_tarjeta},
	pas_codigo_seguridad=${fld:pas_codigo_seguridad},
	pas_documento_identidad=${fld:pas_documento_identidad},
	pas_nombre_pagador=${fld:pas_nombre_pagador},
	pas_numero_autorizacion=${fld:pas_numero_autorizacion},
	pass_idioma='${def:locale}',
	pas_usuario='${def:user}',
	pas_fecha_registro={d '${def:date}'},
	pas_hora='${def:time}'

WHERE
	smn_pago_servicio_id=${fld:id}

