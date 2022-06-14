INSERT INTO smn_comercial.smn_pedido_pagadores
(
	smn_pedido_pagadores_id,
	smn_pedido_cabecera_id,
	smn_cliente_id,
	ppa_monto,
	ppa_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_pedido_pagadores},
	?,
	?,
	?,
	{d '${def:date}'}
)
