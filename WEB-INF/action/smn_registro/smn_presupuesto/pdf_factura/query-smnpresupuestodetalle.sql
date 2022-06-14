select
	(select smn_comercial.smn_presupuesto.pre_numero_control from  smn_comercial.smn_presupuesto  where smn_comercial.smn_presupuesto.smn_presupuesto_id is not null  and smn_comercial.smn_presupuesto.smn_presupuesto_id=smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id  order by smn_comercial.smn_presupuesto.pre_numero_control ) as smn_presupuesto_id_combo,
	smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id,
	smn_base.smn_servicios.svc_codigo||' - '||smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	case 
		when smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='SE' THEN smn_base.smn_servicios.svc_codigo||' - '||smn_base.smn_servicios.svc_descripcion
		when smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf='IT' THEN (select smn_base.smn_item.itm_nombre from smn_base.smn_item where smn_base.smn_item.smn_item_id = smn_comercial.smn_presupuesto_detalle.smn_item_rf)
	end as smn_componentes_rf,
	smn_comercial.smn_presupuesto_detalle.prd_cantidad,
	smn_comercial.smn_presupuesto_detalle.prd_precio,
	smn_comercial.smn_presupuesto_detalle.smn_moneda_rf,
	smn_comercial.smn_presupuesto_detalle.prd_precio_ma,
	smn_comercial.smn_presupuesto_detalle.prd_moneda_alterna+smn_comercial.smn_presupuesto_detalle.prd_monto_incremento_ma as prd_moneda_alterna,
	smn_comercial.smn_presupuesto_detalle.prd_monto_moneda_local,
	smn_comercial.smn_presupuesto_detalle.prd_fecha_registro,
	smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id,
	smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf as tipo_comp,
	smn_base.smn_grupo_titulo_impresion.gti_descripcion as smn_grupo_titulo_impresion_rf,
	smn_base.smn_descuentos_retenciones.dyr_porcentaje_descuento,
	smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ma,
	smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ml,
	smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ma-smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ma as prd_monto_neto_ma,
	smn_comercial.smn_presupuesto_detalle.prd_monto_neto_ml-smn_comercial.smn_presupuesto_detalle.prd_monto_descuento_ml as prd_monto_neto_ml
from 
	smn_comercial.smn_presupuesto_detalle
	inner join smn_comercial.smn_presupuesto on smn_comercial.smn_presupuesto.smn_presupuesto_id = smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_presupuesto_detalle.smn_servicios_rf
	left outer join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_presupuesto_detalle.smn_componentes_rf
	left outer join smn_base.smn_grupo_titulo_impresion on smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id =  smn_base.smn_componentes.smn_grupo_titulo_impresion_rf
	left outer join smn_base.smn_descuentos_retenciones on smn_base.smn_descuentos_retenciones.smn_descuentos_retenciones_id = 
	smn_comercial.smn_presupuesto_detalle.smn_codigo_descuento_rf
where 
	smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id = ${fld:id} and smn_comercial.smn_presupuesto_detalle.smn_tipo_componentes_rf in('IT','SE') and smn_comercial.smn_presupuesto_detalle.prd_estatus<>'RZ'
order by smn_comercial.smn_presupuesto_detalle.smn_presupuesto_detalle_id desc