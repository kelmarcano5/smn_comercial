select
	smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id as smn_factura_cabecera_id,
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id as smn_pedido_detalle_id,
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id,
	smn_comercial.smn_pedido_detalle.pde_naturaleza as fde_naturaleza,
	smn_comercial.smn_pedido_detalle.smn_servicios_rf as smn_servicios_rf,
	smn_comercial.smn_pedido_detalle.smn_item_rf as smn_item_rf,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada as fde_cantidad,
	smn_comercial.smn_pedido_detalle.pde_precio as fde_precio_ml,
	smn_comercial.smn_pedido_detalle.pde_monto as fde_monto_ml,
	smn_comercial.smn_pedido_detalle.smn_moneda_rf as smn_moneda_rf,
	smn_comercial.smn_pedido_detalle.pde_idioma,
	smn_comercial.smn_pedido_detalle.pde_usuario,
	smn_comercial.smn_pedido_detalle.pde_fecha_registro,
	smn_comercial.smn_pedido_detalle.pde_hora
from
	smn_comercial.smn_pedido_detalle
LEFT OUTER JOIN smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
LEFT OUTER JOIN smn_comercial.smn_factura_cabecera on smn_comercial.smn_factura_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
WHERE
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id = ${fld:smn_pedido_cabecera_id} AND
	smn_comercial.smn_pedido_detalle.smn_item_rf is not null
--AND pca_fecha_registro = '${def:date}'