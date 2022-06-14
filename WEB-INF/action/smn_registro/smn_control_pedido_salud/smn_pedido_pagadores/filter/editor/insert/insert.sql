INSERT INTO smn_comercial.smn_pedido_pagadores
(
	smn_pedido_pagadores_id,
	smn_pedido_cabecera_id,
	smn_cliente_id,
	ppa_monto,
	ppa_idioma,
	ppa_usuario,
	ppa_fecha_registro,
	ppa_hora,
	smn_codigo_impuesto_rf,
	ppa_porcentaje,
	ppa_monto_impuesto_ml,
	ppa_monto_impuesto_ma
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_pedido_pagadores},
	${fld:smn_pedido_cabecera_id},
	${fld:smn_cliente_id},
	${fld:ppa_monto},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_codigo_impuesto_rf},
	${fld:ppa_porcentaje},
	${fld:ppa_monto_impuesto_ml},
	${fld:ppa_monto_impuesto_ma}
)