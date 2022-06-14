select
	smn_comercial.smn_pedido_desc_retenciones.smn_pedido_desc_retenciones_id,
	smn_comercial.smn_pedido_desc_retenciones.smn_pedido_detalle_id,
	smn_base.smn_descuentos_retenciones.dyr_codigo ||' - '|| smn_descuentos_retenciones.dyr_descripcion as  smn_descuentos_retenciones_rf,
	smn_comercial.smn_pedido_desc_retenciones.pim_monto_base_ml,
	smn_comercial.smn_pedido_desc_retenciones.pim_porcentaje_retencion,
	smn_comercial.smn_pedido_desc_retenciones.pim_monto_descuento_retencion,
	smn_base.smn_monedas.mon_codigo||' - '|| smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_base.smn_tasas_de_cambio.tca_tasa_cambio as smn_tasa_rf,
	smn_comercial.smn_pedido_desc_retenciones.pim_monto_descuento_ma,
	smn_comercial.smn_pedido_desc_retenciones.pim_fecha_registro
	
from
	smn_comercial.smn_pedido_desc_retenciones
	inner join smn_base.smn_descuentos_retenciones on smn_base.smn_descuentos_retenciones.smn_descuentos_retenciones_id = 	smn_comercial.smn_pedido_desc_retenciones.smn_descuentos_retenciones_rf
	inner join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_desc_retenciones.smn_moneda_rf
	inner join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = 	smn_comercial.smn_pedido_desc_retenciones.smn_tasa_rf

where
	smn_pedido_desc_retenciones_id = ${fld:id}
