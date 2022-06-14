select
		smn_comercial.smn_pedido_componentes.smn_pedido_componentes_id,
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id,
	case
			when smn_comercial.smn_pedido_componentes.pco_tipo_componente='SE' then '${lbl:b_services}'
			when smn_comercial.smn_pedido_componentes.pco_tipo_componente='IT' then '${lbl:b_item}'
			when smn_comercial.smn_pedido_componentes.pco_tipo_componente='HO' then 'Honorarios'
	end as pco_tipo_componente,
	case
			when smn_comercial.smn_pedido_componentes.pco_naturaleza='SE' then '${lbl:b_services}'
			when smn_comercial.smn_pedido_componentes.pco_naturaleza='IT' then '${lbl:b_item}'
			when smn_comercial.smn_pedido_componentes.pco_naturaleza='HO' then 'Honorarios'
	end as pco_naturaleza,
	case
		when smn_comercial.smn_pedido_componentes.pco_estatus='GE' then '${lbl:b_generated}'
		when smn_comercial.smn_pedido_componentes.pco_estatus='PE' then '${lbl:b_pending}'
		when smn_comercial.smn_pedido_componentes.pco_estatus='PA' then '${lbl:b_paying}'
		when smn_comercial.smn_pedido_componentes.pco_estatus='AP' then 'Aprobado'
	end as pco_estatus,
	smn_comercial.smn_pedido_componentes.smn_mov_caja_detalle_id,
	smn_base.smn_grupo_componente.gco_descripcion as smn_grupo_componente_rf,
	smn_comercial.smn_pedido_componentes.pco_cantidad,
	smn_comercial.smn_pedido_componentes.smn_precio_ml_rf,
	smn_comercial.smn_pedido_componentes.pco_monto_ml,
	smn_comercial.smn_pedido_componentes.pco_fecha_registro,
	smn_base.smn_componentes.cmp_descripcion as smn_componente_rf,
	smn_comercial.smn_pedido_componentes.pco_es_prestador_servicio,
	smn_base.smn_clase_auxiliar.cla_nombre as smn_clase_auxiliar_rf,
	smn_base.smn_auxiliar.aux_descripcion as smn_auxiliar_rf,
	smn_base.smn_item.itm_nombre as smn_item_rf,
	tasa.mon_nombre as smn_tasa_rf,
	smn_base.smn_monedas.mon_nombre as smn_moneda_rf,
	smn_base.smn_grupo_titulo_impresion.gti_descripcion as smn_grupo_titulo_impresion_rf,
	smn_base.smn_sub_tipo_gasto.stg_descripcion as smn_sub_tipo_gasto_rf,
	smn_base.smn_tipo_gasto.tig_descripcion as smn_tipo_gasto_rf,
	case
		when smn_comercial.smn_pedido_componentes.pco_imprime='S' THEN 'Si'
		when smn_comercial.smn_pedido_componentes.pco_imprime='N' THEN 'No'
	end as pco_imprime,
	smn_comercial.smn_pedido_componentes.smn_precio_ma,
	smn_comercial.smn_pedido_componentes.smn_monto_ma,
	smn_base.smn_servicios.svc_descripcion as smn_servicio_rf
	
from
	smn_comercial.smn_pedido_componentes
	left outer join smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id = smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id
	left outer join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id =smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
	left outer join smn_base.smn_grupo_componente on smn_base.smn_grupo_componente.smn_grupo_componente_id = smn_comercial.smn_pedido_componentes.smn_grupo_componente_rf
	left outer join smn_comercial.smn_presupuesto on smn_comercial.smn_presupuesto.smn_presupuesto_id = smn_comercial.smn_pedido_cabecera.smn_oferta_id
	left outer join smn_comercial.smn_orden_servicio on smn_comercial.smn_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_presupuesto.smn_orden_servicio_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_pedido_componentes.smn_auxiliar_rf
	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_comercial.smn_pedido_componentes.smn_clase_auxiliar_rf
	left outer join smn_base.smn_item on smn_base.smn_item.smn_item_id = smn_comercial.smn_pedido_componentes.smn_item_rf
	left outer join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_pedido_componentes.smn_componente_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_componentes.smn_moneda_rf
	left outer join smn_base.smn_monedas tasa on tasa.smn_monedas_id = smn_comercial.smn_pedido_componentes.smn_moneda_rf
	left outer join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_monedas_id = tasa.smn_monedas_id
	left outer join smn_base.smn_tipo_gasto on smn_base.smn_tipo_gasto.smn_tipo_gasto_id = smn_comercial.smn_pedido_componentes.smn_tipo_gasto_rf
	left outer join smn_base.smn_sub_tipo_gasto on smn_base.smn_sub_tipo_gasto.smn_sub_tipo_gasto_id = smn_comercial.smn_pedido_componentes.smn_sub_tipo_gasto_rf
	left outer join smn_base.smn_grupo_titulo_impresion on smn_base.smn_grupo_titulo_impresion.smn_grupo_titulo_impresion_id = smn_comercial.smn_pedido_componentes.smn_grupo_titulo_impresion_rf
	left outer join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_pedido_componentes.smn_servicio_rf
where
	smn_pedido_componentes_id = ${fld:id}
