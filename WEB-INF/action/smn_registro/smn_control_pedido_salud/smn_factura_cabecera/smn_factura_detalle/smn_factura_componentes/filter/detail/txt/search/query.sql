select	
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id, 
	smn_comercial.smn_factura_detalle.fde_naturaleza as fde_naturaleza_pl0,
	case
		when smn_comercial.smn_factura_componentes.fco_es_prestador_servicio='SI' then '${lbl:b_yes}'
		when smn_comercial.smn_factura_componentes.fco_es_prestador_servicio='NO' then '${lbl:b_not}'
	end as fco_es_prestador_servicio,
	(select smn_base.smn_clase_auxiliar.cla_codigo||'-'||smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_comercial.smn_factura_componentes.smn_clase_auxiliar_rf) as smn_clase_auxiliar_rf,
	(select smn_base.smn_auxiliar.aux_codigo||'-'||smn_base.smn_auxiliar.aux_descripcion from  smn_base.smn_auxiliar where smn_base.smn_auxiliar.smn_auxiliar_id is not null  and smn_base.smn_auxiliar.smn_auxiliar_id=smn_comercial.smn_factura_componentes.smn_auxiliar_rf) as smn_auxiliar_rf,
	(select smn_base.smn_item.itm_codigo|| ' - ' || smn_base.smn_item.itm_nombre from  smn_base.smn_item where smn_base.smn_item.smn_item_id is not null  and smn_base.smn_item.smn_item_id=smn_comercial.smn_factura_componentes.smn_item_rf) as smn_item_rf,
	(select smn_base.smn_servicios.svc_codigo ||' - '|| smn_base.smn_servicios.svc_descripcion from  smn_base.smn_servicios where smn_base.smn_servicios.smn_servicios_id is not null  and smn_base.smn_servicios.smn_servicios_id=smn_comercial.smn_factura_componentes.smn_servicio_rf) as smn_servicio_rf,
	case
		when smn_comercial.smn_factura_componentes.fco_forma_calculo=IM then '${lbl:b_amount_money}'
		when smn_comercial.smn_factura_componentes.fco_forma_calculo=PO then '${lbl:b_percentage}'
	end as fco_forma_calculo,
	(select smn_base.smn_monedas.mon_codigo|| ' - ' || smn_base.smn_monedas.mon_nombre from  smn_base.smn_monedas where smn_base.smn_monedas.smn_monedas_id is not null  and smn_base.smn_monedas.smn_monedas_id=smn_comercial.smn_factura_componentes.smn_moneda_rf) as smn_moneda_rf,
	(select smn_base.smn_monedas.mon_codigo ||' - '|| smn_base.smn_monedas.mon_nombre from  smn_base.smn_tasas_de_cambio left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_base.smn_tasas_de_cambio.smn_monedas_id where smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id is not null  and smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id=smn_comercial.smn_factura_componentes.smn_tasa_rf) as smn_tasa_rf,
	case
		when smn_comercial.smn_factura_componentes.fco_imprime='SI' then '${lbl:b_yes}'
		when smn_comercial.smn_factura_componentes.fco_imprime='NO' then '${lbl:b_not}'
	end as fco_imprime,
	(select smn_base.smn_grupo_titulo_impresion.gti_codigo ||' - '|| smn_base.smn_grupo_titulo_impresion.gti_descripcion from  smn_base.smn_grupo_titulo_impresion where smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id  is not null  and smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id =smn_comercial.smn_factura_componentes.smn_grupo_titulo_impresion_rf) as smn_grupo_titulo_impresion_rf,
	case
		when smn_comercial.smn_factura_componentes.fco_estatus='GE' then '${lbl:b_generated}'
		when smn_comercial.smn_factura_componentes.fco_estatus='PE' then '${lbl:b_pending}'
		when smn_comercial.smn_factura_componentes.fco_estatus='PA' then '${lbl:b_paying}'
	end as fco_estatus,
	smn_comercial.smn_factura_componentes.*
from
	smn_comercial.smn_factura_detalle,
	smn_comercial.smn_factura_componentes 
where
	smn_comercial.smn_factura_detalle.smn_factura_detalle_id=smn_comercial.smn_factura_componentes.smn_factura_detalle_id 
 and 
	smn_factura_componente_id = ${fld:id}
