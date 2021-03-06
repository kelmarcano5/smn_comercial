INSERT INTO smn_comercial.smn_pago_servicio
(
	smn_pago_servicio_id,
	smn_solicitud_servicio_entregas_cabecera_id,
	smn_forma_pago_rf,
	smn_franquicia_rf,
	pas_numero_tarjeta,
	pas_codigo_seguridad,
	pas_documento_identidad,
	pas_nombre_pagador,
	pas_numero_autorizacion,
	pass_idioma,
	pas_usuario,
	pas_fecha_registro,
	pas_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_pago_servicio},
	${fld:smn_solicitud_servicio_entregas_cabecera_id},
	${fld:smn_forma_pago_rf},
	${fld:smn_franquicia_rf},
	${fld:pas_numero_tarjeta},
	${fld:pas_codigo_seguridad},
	${fld:pas_documento_identidad},
	${fld:pas_nombre_pagador},
	${fld:pas_numero_autorizacion},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
