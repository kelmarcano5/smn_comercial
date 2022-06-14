select DISTINCT SUM(smn_comercial.smn_pedido_detalle.pde_precio) as precioml,
SUM(smn_comercial.smn_pedido_detalle.pde_monto) as montoml,
SUM(smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna) as monto_alterno
from 
	smn_comercial.smn_pedido_detalle
	inner join smn_comercial.smn_pedido_cabecera 
	on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
where 
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:id}