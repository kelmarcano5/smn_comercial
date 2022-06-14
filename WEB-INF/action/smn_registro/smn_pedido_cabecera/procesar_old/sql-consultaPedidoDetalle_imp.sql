select 
SUM(smn_comercial.smn_pedido_detalle.pde_monto) as monto, 
SUM(smn_comercial.smn_pedido_detalle.pde_precio) as precio,
SUM(smn_comercial.smn_pedido_detalle.pde_cantidad_pedido) as cantidad,
SUM(smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna) as monto_ma, 
SUM(smn_comercial.smn_pedido_detalle.pde_precio_moneda_alterna) as precio_ma
from smn_comercial.smn_pedido_detalle
inner join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
where smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id} 