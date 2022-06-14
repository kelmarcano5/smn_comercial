select
	smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id,
	smn_comercial.smn_factura_cabecera.fca_rif as fca_rif_pl0,
	smn_comercial.smn_cliente.smn_cliente_id,
	smn_comercial.smn_cliente.cli_nacional_ext as cli_nacional_ext_pl1,
select
where
	smn_comercial.smn_factura_pagadores.*
	smn_comercial.smn_factura_pagadores.*
from
	smn_comercial.smn_factura_cabecera,
	smn_comercial.smn_factura_cabecera,
	smn_comercial.smn_cliente,
	smn_comercial.smn_cliente,
	smn_comercial.smn_factura_pagadores
	smn_comercial.smn_factura_pagadores
where
	smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id=smn_comercial.smn_factura_pagadores.smn_factura_cabecera_id and
	smn_comercial.smn_cliente.smn_cliente_id=smn_comercial.smn_factura_pagadores.smn_cliente_id
	and
	smn_factura_pagadores_id = ${fld:id}
