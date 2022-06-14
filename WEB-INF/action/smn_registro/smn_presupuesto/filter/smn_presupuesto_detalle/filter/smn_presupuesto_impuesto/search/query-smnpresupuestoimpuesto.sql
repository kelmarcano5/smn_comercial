select
	smn_comercial.smn_presupuesto_impuesto.smn_presupuesto_detalle_id,
	smn_base.smn_servicios.svc_codigo||' - '|| smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_base.smn_item.itm_codigo ||' - '|| smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_base.smn_codigos_impuestos.imp_codigo ||' - '|| smn_base.smn_codigos_impuestos.imp_descripcion as smn_codigo_impuesto_id,
	smn_comercial.smn_presupuesto_impuesto.pim_base_imponible_ml,
	smn_comercial.smn_presupuesto_impuesto.pim_base_excenta_ml,
	smn_comercial.smn_presupuesto_impuesto.pim_monto_impuesto_ml,
	smn_comercial.smn_presupuesto_impuesto.pim_monto_sustraendo_ml,
	smn_comercial.smn_presupuesto_impuesto.pim_monto_neto_impuesto_ml,
	smn_comercial.smn_presupuesto_impuesto.pim_fecha_registro
from
	smn_comercial.smn_presupuesto_impuesto
	inner join smn_comercial.smn_presupuesto_detalle on smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id = smn_comercial.smn_presupuesto_impuesto.smn_presupuesto_detalle_id
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_presupuesto_impuesto.smn_servicios_rf
	inner join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_presupuesto_impuesto.smn_item_rf
	inner join smn_base.smn_codigos_impuestos on smn_base.smn_codigos_impuestos.smn_codigos_impuestos_id = smn_comercial.smn_presupuesto_impuesto.smn_codigo_impuesto_id
	--inner join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_comercial.smn_presupuesto_impuesto.smn_tasa_rf
	--inner join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_presupuesto_impuesto.smn_moneda_rf	
where 
	smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id = ${fld:id_pre_det}
order by 
	smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id desc