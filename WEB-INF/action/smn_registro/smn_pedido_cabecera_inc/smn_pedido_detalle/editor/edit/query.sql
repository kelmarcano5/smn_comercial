select	
	*
from 
	smn_comercial.smn_pedido_detalle
	--	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_detalle.smn_moneda_rf
	--left outer join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_comercial.smn_pedido_detalle.smn_tasa_rf
where 
	smn_pedido_detalle_id = ${fld:id}


