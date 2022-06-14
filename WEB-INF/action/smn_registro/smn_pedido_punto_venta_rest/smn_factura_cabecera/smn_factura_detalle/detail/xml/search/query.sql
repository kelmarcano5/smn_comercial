select
		smn_comercial.smn_factura_detalle.smn_factura_detalle_id,
	case
	when smn_comercial.smn_factura_detalle.fde_naturaleza='IT' then '${lbl:b_item}'
	when smn_comercial.smn_factura_detalle.fde_naturaleza='SE' then '${lbl:b_services}'
	when smn_comercial.smn_factura_detalle.fde_naturaleza='AF' then '${lbl:b_actfijo}'
	end as fde_naturaleza,
	smn_comercial.smn_factura_detalle.smn_factura_cabecera_id,
	smn_comercial.smn_factura_detalle.fde_cantidad,
	smn_comercial.smn_factura_detalle.fde_precio_ml,
	smn_comercial.smn_factura_detalle.fde_monto_ml,
	smn_base.smn_activo_fijo.acf_codigo ||' - '|| smn_base.smn_activo_fijo.acf_nombre as smn_activo_fijo_rf,
	smn_base.smn_servicios.svc_codigo ||''|| smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_base.smn_item.itm_codigo ||' - '|| smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_base.smn_monedas.mon_codigo ||' - '|| smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_base.smn_tasas_de_cambio.smn_monedas_id ||' - '||  smn_base.smn_monedas.mon_nombre as smn_tasa_rf,
		smn_comercial.smn_factura_detalle.fde_precio_ma,
	smn_comercial.smn_factura_detalle.fde_monto_ma,
	smn_comercial.smn_factura_detalle.fde_fecha_registro
	
from
	smn_comercial.smn_factura_detalle
	left outer join smn_base.smn_activo_fijo on smn_base.smn_activo_fijo.smn_afijo_id = smn_comercial.smn_factura_detalle.smn_activo_fijo_rf
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_factura_detalle.smn_item_rf
	left outer join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_factura_detalle.smn_servicios_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_factura_detalle.smn_moneda_rf
	left outer join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_monedas_id = smn_base.smn_monedas.smn_monedas_id

where
	smn_factura_detalle_id = ${fld:id}
