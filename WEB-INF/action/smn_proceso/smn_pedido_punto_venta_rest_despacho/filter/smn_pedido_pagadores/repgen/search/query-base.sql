select
		smn_comercial.smn_pedido_pagadores.smn_pedido_pagadores_id,
	${field}
from
	smn_comercial.smn_pedido_pagadores
where
		smn_comercial.smn_pedido_pagadores.smn_pedido_pagadores_id is not null
	${filter}
	
	
