select 
	smn_comercial.smn_pedido_pagadores.smn_pedido_pagadores_id, 
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido ||' - '|| smn_comercial.smn_pedido_cabecera.pca_descripcion as smn_pedido_cabecera_id,
	smn_base.smn_auxiliar.aux_codigo ||' - '|| smn_base.smn_auxiliar.aux_descripcion as smn_cliente_id, 
	smn_comercial.smn_pedido_pagadores.ppa_monto, 
	smn_comercial.smn_pedido_pagadores.ppa_fecha_registro 
from smn_comercial.smn_pedido_pagadores
	left outer join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_pagadores.smn_pedido_cabecera_id
	left outer join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_pagadores.smn_cliente_id 
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
