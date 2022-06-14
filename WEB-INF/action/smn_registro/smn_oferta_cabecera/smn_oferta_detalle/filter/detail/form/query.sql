select
	smn_base.smn_monedas.mon_nombre,
		smn_comercial.smn_oferta_detalle.smn_oferta_detalle_id,
	case
	when smn_comercial.smn_oferta_detalle.ofd_naturaleza='IT' then '${lbl:b_item}'
	when smn_comercial.smn_oferta_detalle.ofd_naturaleza='SE' then '${lbl:b_services}'
	when smn_comercial.smn_oferta_detalle.ofd_naturaleza='AF' then '${lbl:b_actfijo}'
	end as ofd_naturaleza,
	smn_comercial.smn_oferta_cabecera.ofe_descripcion as smn_oferta_id,
	smn_comercial.smn_oferta_detalle.ofd_cantidad,
	smn_comercial.smn_oferta_detalle.ofd_precio,
	smn_comercial.smn_oferta_detalle.ofd_monto_ml,
	smn_comercial.smn_oferta_detalle.ofd_precio_moneda_alterna,
	smn_comercial.smn_oferta_detalle.ofd_monto_moneda_alterna,
	smn_base.smn_activo_fijo.acf_codigo ||' - '|| smn_base.smn_activo_fijo.acf_nombre as smn_activo_fijo_rf,
	smn_base.smn_servicios.svc_codigo ||''|| smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_base.smn_item.itm_codigo ||' - '|| smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_base.smn_monedas.mon_codigo ||' - '|| smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_base.smn_tasas_de_cambio.smn_monedas_id ||' - '||  smn_base.smn_monedas.mon_nombre as smn_tasa_rf,
	smn_comercial.smn_oferta_detalle.ofd_fecha_registro
	
from
	smn_comercial.smn_oferta_detalle
	inner join smn_comercial.smn_oferta_cabecera on smn_comercial.smn_oferta_cabecera.smn_oferta_cabecera_id = smn_comercial.smn_oferta_detalle.smn_oferta_id
	left outer join smn_base.smn_activo_fijo on smn_base.smn_activo_fijo.smn_afijo_id = smn_comercial.smn_oferta_detalle.smn_activo_fijo_rf
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_oferta_detalle.smn_item_rf
	left outer join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_oferta_detalle.smn_servicios_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_oferta_detalle.ofd_moneda_rf
	left outer join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_monedas_id = smn_comercial.smn_oferta_detalle.ofd_moneda_rf

where
	smn_oferta_detalle_id = ${fld:id}
