
select
		smn_comercial.smn_factura_pagadores.smn_factura_pagadores_id,
	smn_comercial.smn_factura_pagadores.smn_cliente_id,
	smn_comercial.smn_factura_pagadores.smn_monto_rf,
	smn_comercial.smn_factura_pagadores.fpa_fecha_registro
from
	smn_comercial.smn_factura_pagadores


where
	smn_factura_pagadores_id is not null
	and 	smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id=smn_comercial.smn_factura_pagadores.smn_factura_cabecera_id and
	smn_comercial.smn_cliente.smn_cliente_id=smn_comercial.smn_factura_pagadores.smn_cliente_id
	${filter}
order by
		smn_factura_pagadores_id
