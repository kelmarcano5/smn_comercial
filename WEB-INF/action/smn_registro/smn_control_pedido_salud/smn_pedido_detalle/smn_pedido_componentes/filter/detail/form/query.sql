select
	smn_comercial.smn_pedido_componentes.smn_mov_caja_detalle_id,
	smn_comercial.smn_pedido_componentes.smn_ingresos_rf,
	smn_comercial.smn_pedido_componentes.smn_grupo_componente_rf,
	smn_comercial.smn_pedido_componentes.pco_tipo_componente,
	smn_base.smn_componentes.cmp_descripcion as smn_componente_rf,
	smn_comercial.smn_pedido_componentes.pco_es_prestador_servicio,
	smn_comercial.smn_pedido_componentes.smn_clase_auxiliar_rf,
	smn_comercial.smn_pedido_componentes.smn_auxiliar_rf,
	smn_comercial.smn_pedido_componentes.smn_item_rf,
	smn_comercial.smn_pedido_componentes.smn_servicio_rf,
	smn_comercial.smn_pedido_componentes.smn_precio_ml_rf,
	smn_comercial.smn_pedido_componentes.pco_monto_ml,
	smn_comercial.smn_pedido_componentes.smn_moneda_rf,
	smn_comercial.smn_pedido_componentes.smn_tasa_rf,
	smn_comercial.smn_pedido_componentes.smn_precio_ma,
	smn_comercial.smn_pedido_componentes.smn_monto_ma,
	smn_comercial.smn_pedido_componentes.pco_imprime,
	smn_comercial.smn_pedido_componentes.smn_grupo_titulo_impresion_rf,
	smn_comercial.smn_pedido_componentes.smn_tipo_gasto_rf,
	smn_comercial.smn_pedido_componentes.smn_sub_tipo_gasto_rf,
	smn_comercial.smn_pedido_componentes.smn_pedido_componentes_id,
	smn_base.smn_componentes.cmp_codigo as codigo_comp,
	smn_base.smn_componentes.cmp_descripcion as descripcion_comp,
	smn_comercial.smn_pedido_componentes.smn_precio_ml_rf,
	smn_comercial.smn_pedido_componentes.pco_monto_ml as pco_monto_ml,
	smn_comercial.smn_pedido_componentes.smn_precio_ma,
	smn_comercial.smn_pedido_componentes.smn_monto_ma as smn_monto_ma,
	case
	when smn_comercial.smn_pedido_componentes.pco_estatus='GE' then '${lbl:b_generated}'
	when smn_comercial.smn_pedido_componentes.pco_estatus='PE' then '${lbl:b_pending}'
	when smn_comercial.smn_pedido_componentes.pco_estatus='PA' then '${lbl:b_paying}'
	end as pco_estatus,
	smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id,
	smn_comercial.smn_pedido_componentes.smn_grupo_componente_rf,
	smn_comercial.smn_pedido_componentes.pco_cantidad,
	smn_base.smn_componentes.cmp_forma_calculo,
	smn_comercial.smn_pedido_componentes.pco_fecha_registro,
	prestador.aux_descripcion as smn_prestador_servicio_rf,
	smn_comercial.smn_pedido_componentes.pco_tipo_componente as tipo_componentes,
	smn_comercial.smn_pedido_componentes.pco_naturaleza
	
from
	smn_comercial.smn_pedido_componentes
	inner join smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id = smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id
	left join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_pedido_componentes.smn_componente_rf
	left join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_comercial.smn_pedido_componentes.smn_prestador_servicio_rf
	left join smn_base.smn_auxiliar prestador on prestador.smn_auxiliar_id = smn_base.smn_prestadores_servicios.prs_auxiliar
where 
	smn_comercial.smn_pedido_componentes.smn_pedido_componentes_id =  ${fld:id}
