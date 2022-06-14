select
		smn_comercial.smn_pedido_componentes.smn_pedido_componentes_id,
	smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	case
			when smn_comercial.smn_pedido_componentes.pco_naturaleza='SS' then '${lbl:b_services}'
			when smn_comercial.smn_pedido_componentes.pco_naturaleza='IT' then '${lbl:b_item}'
			when smn_comercial.smn_pedido_componentes.pco_naturaleza='HO' then 'Honorarios'
	end as pde_naturaleza,
	case
		when smn_comercial.smn_pedido_componentes.pco_estatus='GE' then '${lbl:b_generated}'
		when smn_comercial.smn_pedido_componentes.pco_estatus='PE' then '${lbl:b_pending}'
		when smn_comercial.smn_pedido_componentes.pco_estatus='PA' then '${lbl:b_paying}'
		when smn_comercial.smn_pedido_componentes.pco_estatus='AP' then 'Aprobado'
	end as pco_estatus,
	smn_comercial.smn_pedido_componentes.smn_mov_caja_detalle_id,
	smn_base.smn_auxiliar.aux_codigo as smn_ingresos_rf,
	smn_base.smn_grupo_componente.gco_descripcion as smn_grupo_componente_rf,
	smn_comercial.smn_pedido_componentes.pco_cantidad,
	smn_comercial.smn_pedido_componentes.smn_precio_ml_rf,
	smn_comercial.smn_pedido_componentes.pco_monto_ml,
	smn_comercial.smn_pedido_componentes.pco_fecha_registro
	
from
	smn_comercial.smn_pedido_componentes
	left outer join smn_comercial.smn_pedido_detalle on smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id = smn_comercial.smn_pedido_componentes.smn_pedido_detalle_id
	left outer join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id =smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
	left outer join smn_base.smn_grupo_componente on smn_base.smn_grupo_componente.smn_grupo_componente_id = smn_comercial.smn_pedido_componentes.smn_grupo_componente_rf
	left outer join smn_salud.smn_ingresos on smn_salud.smn_ingresos.smn_ingresos_id = smn_comercial.smn_pedido_componentes.smn_ingresos_rf
	left outer join smn_comercial.smn_presupuesto on smn_comercial.smn_presupuesto.smn_presupuesto_id = smn_comercial.smn_pedido_cabecera.smn_oferta_id
	left outer join smn_comercial.smn_orden_servicio on smn_comercial.smn_orden_servicio.smn_orden_servicio_id = smn_comercial.smn_presupuesto.smn_orden_servicio_id
	left outer join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_ingresos.smn_auxiliar_rf
where
	smn_pedido_componentes_id is not null
	${filter}
order by
		smn_pedido_componentes_id
