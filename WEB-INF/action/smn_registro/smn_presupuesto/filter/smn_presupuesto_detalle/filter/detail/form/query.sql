select
	(select smn_comercial.smn_presupuesto.smn_documento_id || ' - ' || smn_comercial.smn_presupuesto.pre_numero_control from  smn_comercial.smn_presupuesto  where smn_comercial.smn_presupuesto.smn_presupuesto_id is not null  and smn_comercial.smn_presupuesto.smn_presupuesto_id=smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id  order by smn_comercial.smn_presupuesto.pre_numero_control ) as smn_presupuesto_id_combo,
	(select smn_base.smn_servicios.svc_codigo || ' - ' || smn_base.smn_servicios.svc_descripcion from  smn_base.smn_servicios  where smn_base.smn_servicios.smn_servicios_id is not null  and smn_base.smn_servicios.smn_servicios_id=smn_comercial.smn_presupuesto_detalle.smn_servicios_rf  order by 1 ) as smn_servicios_rf_combo,
	(select smn_base.smn_monedas.mon_codigo || ' - ' || smn_base.smn_monedas.mon_nombre from  smn_base.smn_monedas  where smn_base.smn_monedas.smn_monedas_id is not null  and smn_base.smn_monedas.smn_monedas_id=smn_comercial.smn_presupuesto_detalle.smn_moneda_rf  order by smn_base.smn_monedas.mon_nombre ) as smn_moneda_rf_combo,
	smn_comercial.smn_presupuesto_detalle.*
from 
	smn_comercial.smn_presupuesto_detalle
where
	smn_presupuesto_detalle_id = ${fld:id}
