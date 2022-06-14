INSERT INTO smn_comercial.smn_factura_pagadores
(
	smn_factura_pagadores_id,
	smn_factura_cabecera_id,
	smn_cliente_id,
	smn_monto_rf,
	fpa_idioma,
	fpa_usuario,
	fpa_fecha_registro,
	fpa_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_factura_pagadores},
	${fld:smn_factura_cabecera_id},
	${fld:smn_cliente_id},
	${fld:smn_monto_rf},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
