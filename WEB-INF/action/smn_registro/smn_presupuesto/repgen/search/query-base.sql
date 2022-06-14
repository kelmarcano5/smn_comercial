select
	${field},
	smn_comercial.smn_presupuesto.smn_presupuesto_id,
	smn_comercial.smn_documento.dcf_descripcion as smn_documento_id,
	smn_base.smn_entidades.ent_descripcion_corta as smn_entidades_rf,
	smn_base.smn_sucursales.suc_nombre as smn_sucursales_rf,
	smn_comercial.smn_estado_presupuesto.epr_descripcion as smn_estado_presupuesto_id,
	smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_rf,
	smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_base.smn_item.itm_nombre as smn_item_rf,
	smn_base.smn_servicios.svc_descripcion as smn_servicios_rf
from
	smn_comercial.smn_presupuesto
	inner join smn_comercial.smn_presupuesto_detalle on smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id = smn_comercial.smn_presupuesto.smn_presupuesto_id
	left outer join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_presupuesto.smn_documento_id
	left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_comercial.smn_presupuesto.smn_entidades_rf
	left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_comercial.smn_presupuesto.smn_sucursales_rf
	left outer join smn_comercial.smn_estado_presupuesto on smn_comercial.smn_estado_presupuesto.smn_estado_presupuesto_id = smn_comercial.smn_presupuesto.smn_estado_presupuesto_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_presupuesto.smn_auxiliar_rf 
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_presupuesto.smn_moneda_rf
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_presupuesto_detalle.smn_item_rf
	left outer join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_presupuesto_detalle.smn_servicios_rf
where
	smn_comercial.smn_presupuesto.smn_presupuesto_id is not null
	${filter}