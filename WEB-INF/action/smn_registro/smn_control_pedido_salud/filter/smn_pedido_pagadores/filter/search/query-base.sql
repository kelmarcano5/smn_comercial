SELECT
	smn_comercial.smn_pedido_pagadores.smn_pedido_pagadores_id,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido || ' - ' || smn_comercial.smn_pedido_cabecera.pca_descripcion AS smn_pedido_cabecera_id,
	cl.aux_codigo || ' - ' || cl.aux_descripcion AS smn_cliente_id,
	aux.aux_codigo || ' - ' || aux.aux_descripcion AS smn_auxiliar_rf,
	smn_comercial.smn_pedido_pagadores.ppa_monto,
	smn_comercial.smn_pedido_pagadores.ppa_monto_ma,
	case
	when smn_comercial.smn_pedido_pagadores.ppa_estatus='PE' then 'Pendiente'
	when smn_comercial.smn_pedido_pagadores.ppa_estatus='PA' then 'Pagado'
	end as ppa_estatus,
	smn_comercial.smn_pedido_pagadores.ppa_fecha_registro
	
FROM
	smn_comercial.smn_pedido_pagadores
	inner join smn_comercial.smn_pedido_cabecera ON smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_pagadores.smn_pedido_cabecera_id
	inner join smn_comercial.smn_cliente ON smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_pagadores.smn_cliente_id
	left join smn_base.smn_auxiliar cl ON cl.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf 
	left join smn_base.smn_auxiliar aux on aux.smn_auxiliar_id = smn_comercial.smn_pedido_pagadores.smn_auxiliar_rf
where
	smn_comercial.smn_pedido_pagadores.smn_pedido_pagadores_id is not null
	${filter}
order by
		smn_pedido_pagadores_id
