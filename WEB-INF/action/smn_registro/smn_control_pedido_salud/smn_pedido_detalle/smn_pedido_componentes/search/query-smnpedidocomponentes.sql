select
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
	end as pco_estatus_combo,
	smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id,
	smn_comercial.smn_pedido_componentes.smn_grupo_componente_rf,
	smn_comercial.smn_pedido_componentes.pco_cantidad,
	smn_base.smn_componentes.cmp_forma_calculo,
	smn_comercial.smn_pedido_componentes.pco_fecha_registro,
	prestador.aux_descripcion as smn_prestador_servicio_rf,
	smn_comercial.smn_pedido_componentes.pco_tipo_componente as tipo_componentes
	
from
	smn_comercial.smn_pedido_componentes
	inner join smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id = smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id
	left join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_comercial.smn_pedido_componentes.smn_componente_rf
	left join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_comercial.smn_pedido_componentes.smn_prestador_servicio_rf
	left join smn_base.smn_auxiliar prestador on prestador.smn_auxiliar_id = smn_base.smn_prestadores_servicios.prs_auxiliar
where
	smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id=${fld:id2}
