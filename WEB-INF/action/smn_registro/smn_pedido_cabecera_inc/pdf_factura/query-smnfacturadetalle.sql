select
		smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	case
	when smn_comercial.smn_pedido_detalle.pde_naturaleza='IT' then smn_base.smn_item.itm_codigo ||' - '|| smn_base.smn_item.itm_nombre
	when smn_comercial.smn_pedido_detalle.pde_naturaleza='SE' then smn_base.smn_servicios.svc_codigo ||' - '|| smn_base.smn_servicios.svc_descripcion
	when smn_comercial.smn_pedido_detalle.pde_naturaleza='AF' then smn_base.smn_activo_fijo.acf_codigo ||' - '|| smn_base.smn_activo_fijo.acf_nombre
	end as descripcion_naturaleza,
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id,
	case
		when smn_comercial.smn_pedido_detalle.pde_naturaleza = 'IT' then 'Item'
		when smn_comercial.smn_pedido_detalle.pde_naturaleza = 'SE' then 'Servicio'
		when smn_comercial.smn_pedido_detalle.pde_naturaleza = 'AF' then 'Activos Fijos'
	end as pde_naturaleza,
	smn_comercial.smn_pedido_detalle.smn_mov_caja_cabecera_id,
	smn_comercial.smn_pedido_detalle.pde_cantidad_oferta,
	smn_comercial.smn_pedido_detalle.pde_cantidad_pedido,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada,
	smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna,
	smn_comercial.smn_pedido_detalle.pde_precio,
	smn_comercial.smn_pedido_detalle.pde_monto,
	smn_comercial.smn_pedido_detalle.smn_servicios_rf,
	smn_comercial.smn_pedido_detalle.smn_item_rf,
	smn_comercial.smn_pedido_detalle.pde_fecha_registro,
	smn_base.smn_monedas.mon_simbolo,
	smn_base.smn_tasas_de_cambio.tca_tasa_cambio
	
from
	smn_comercial.smn_pedido_detalle
	left outer join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_pedido_detalle.smn_servicios_rf
	left outer join smn_base.smn_item ON smn_base.smn_item.smn_item_id = smn_comercial.smn_pedido_detalle.smn_item_rf
	left outer join smn_base.smn_activo_fijo on smn_base.smn_activo_fijo.smn_afijo_id = smn_comercial.smn_pedido_detalle.smn_activo_fijo_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_detalle.smn_moneda_rf
	left outer join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_comercial.smn_pedido_detalle.smn_tasa_rf
where
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:id}
