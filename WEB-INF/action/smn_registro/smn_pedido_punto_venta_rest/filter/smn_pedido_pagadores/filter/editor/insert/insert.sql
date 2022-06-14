INSERT INTO smn_comercial.smn_pedido_pagadores
(
	smn_pedido_pagadores_id,
	smn_pedido_cabecera_id,
	smn_cliente_id,
	ppa_monto,
	ppa_idioma,
	ppa_usuario,
	ppa_fecha_registro,
	ppa_hora
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
	'${def:time}'
)
