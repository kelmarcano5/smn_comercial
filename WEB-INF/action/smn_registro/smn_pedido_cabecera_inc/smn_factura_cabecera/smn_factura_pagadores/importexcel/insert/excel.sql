INSERT INTO smn_comercial.smn_factura_pagadores
(
	smn_factura_pagadores_id,
	smn_factura_cabecera_id,
	smn_cliente_id,
	smn_monto_rf,
	fpa_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_factura_pagadores},
	?,
	?,
	?,
	{d '${def:date}'}
)
