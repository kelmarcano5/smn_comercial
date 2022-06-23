update smn_comercial.smn_pedido_pagadores SET
	smn_pedido_cabecera_id=(select last_value from smn_comercial.seq_smn_pedido_cabecera)
	where smn_comercial.smn_pedido_pagadores.smn_pedido_cabecera_id= ${fld:id_cab} and smn_comercial.smn_pedido_pagadores.ppa_numero_autorizacion=${fld:numaut}

