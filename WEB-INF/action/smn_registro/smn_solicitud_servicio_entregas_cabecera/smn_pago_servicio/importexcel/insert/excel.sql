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
	pas_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_pago_servicio},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
