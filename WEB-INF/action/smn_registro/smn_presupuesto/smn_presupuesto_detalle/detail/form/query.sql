select
	smn_base.smn_monedas.mon_codigo || ' - ' || smn_base.smn_monedas.mon_nombre  as smn_moneda_rf_combo,
	smn_base.smn_servicios.svc_codigo || ' - ' || smn_base.smn_servicios.svc_descripcion as smn_servicios_rf_combo,
	smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id as smn_presupuesto_id_combo,
	monalt.mon_nombre ||' Valor de la Tasa=>'|| smn_base.smn_tasas_de_cambio.tca_tasa_cambio as smn_tasa_rf_combo,
	smn_comercial.smn_presupuesto_detalle.prd_precio,
	smn_comercial.smn_presupuesto_detalle.prd_cantidad,
	smn_comercial.smn_presupuesto_detalle.prd_precio_ma,
	smn_comercial.smn_presupuesto_detalle.prd_monto_moneda_local,
	smn_comercial.smn_presupuesto_detalle.prd_moneda_alterna
from 
	smn_comercial.smn_presupuesto_detalle
	left join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_presupuesto_detalle.smn_moneda_rf
	left join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_presupuesto_detalle.smn_servicios_rf
	left join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_comercial.smn_presupuesto_detalle.smn_tasa_rf
	left join smn_base.smn_monedas monalt on monalt.smn_monedas_id =  smn_base.smn_tasas_de_cambio.smn_monedas_id
where
	smn_presupuesto_detalle_id = ${fld:id}
