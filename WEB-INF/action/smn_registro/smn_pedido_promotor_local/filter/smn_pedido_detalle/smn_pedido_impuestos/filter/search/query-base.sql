select
	smn_comercial.smn_pedido_impuestos.smn_pedido_impuestos_id,
	smn_comercial.smn_pedido_impuestos.smn_pedido_detalle_id,
	smn_base.smn_codigos_impuestos.imp_codigo||' - '|| smn_base.smn_codigos_impuestos.imp_descripcion as smn_codigos_impuestos_rf,
	smn_comercial.smn_pedido_impuestos.pim_monto_base_ml,
	smn_comercial.smn_pedido_impuestos.pim_porcentaje_impuesto,
	smn_comercial.smn_pedido_impuestos.pim_monto_sustraendo,
	smn_comercial.smn_pedido_impuestos.pim_monto_impuesto,
	smn_base.smn_monedas.mon_codigo||' - '|| smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_base.smn_tasas_de_cambio.tca_tasa_cambio as smn_tasa_rf,
	smn_comercial.smn_pedido_impuestos.pim_monto_impuesto_ma,
	smn_comercial.smn_pedido_impuestos.pim_fecha_registro
	
from
	smn_comercial.smn_pedido_impuestos
	inner join smn_base.smn_codigos_impuestos on smn_base.smn_codigos_impuestos.smn_codigos_impuestos_id = smn_comercial.smn_pedido_impuestos.smn_codigos_impuestos_rf
	inner join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_impuestos.smn_moneda_rf
	inner join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_comercial.smn_pedido_impuestos.smn_tasa_rf

where
	smn_pedido_impuestos_id is not null
	${filter}
order by
		smn_pedido_impuestos_id
