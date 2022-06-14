select
		smn_comercial.smn_pedido_detalle.smn_pedido_detalle_id,
	case
	when smn_comercial.smn_pedido_detalle.pde_naturaleza='IT' then smn_base.smn_item.itm_nombre
	when smn_comercial.smn_pedido_detalle.pde_naturaleza='SE' then smn_base.smn_servicios.svc_descripcion
	when smn_comercial.smn_pedido_detalle.pde_naturaleza='AF' then smn_base.smn_activo_fijo.acf_nombre
	end as descripcion_naturaleza,
	smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id,
		case
		when smn_comercial.smn_pedido_detalle.pde_naturaleza='IT' then smn_base.smn_item.itm_codigo
		when smn_comercial.smn_pedido_detalle.pde_naturaleza='SE' then smn_base.smn_servicios.svc_codigo
		when smn_comercial.smn_pedido_detalle.pde_naturaleza='AF' then smn_base.smn_activo_fijo.acf_codigo
	end as codigo_descripcion,
	case
		when smn_comercial.smn_pedido_detalle.pde_naturaleza = 'IT' then 'Item'
		when smn_comercial.smn_pedido_detalle.pde_naturaleza = 'SE' then 'Servicio'
		when smn_comercial.smn_pedido_detalle.pde_naturaleza = 'AF' then 'Activos Fijos'
	end as pde_naturaleza,
	smn_comercial.smn_pedido_detalle.smn_mov_caja_cabecera_id,
	smn_comercial.smn_pedido_detalle.pde_cantidad_oferta,
	smn_comercial.smn_pedido_detalle.pde_cantidad_pedido,
	smn_comercial.smn_pedido_detalle.pde_cantidad_aprobada,
	smn_comercial.smn_pedido_detalle.pde_precio,
	case
		when smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna is null then 0 else smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna
	end as pde_monto_moneda_alterna,
	case
		when smn_comercial.smn_pedido_detalle.pde_monto is null then 0 else smn_comercial.smn_pedido_detalle.pde_monto
	end as pde_monto,
	smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ml,
	smn_comercial.smn_pedido_detalle.pde_monto_impuesto_ma,
	smn_comercial.smn_pedido_detalle.pde_descuento_ml,
	smn_comercial.smn_pedido_detalle.pde_monto_descuento_ma,
	smn_base.smn_servicios.svc_codigo as smn_servicios_rf,
	smn_base.smn_item.itm_codigo as smn_item_rf,
	smn_comercial.smn_pedido_detalle.pde_fecha_registro,
	smn_base.smn_monedas.mon_simbolo,
	smn_base.smn_tasas_de_cambio.tca_tasa_cambio,
	smn_comercial.smn_pedido_cabecera.pca_descripcion,
	smn_comercial.smn_pedido_detalle.smn_item_rf as item_id,
	case 
		when smn_comercial.smn_pedido_cabecera.smn_modulo_rf is null then 'CME' else smn_comercial.smn_pedido_cabecera.smn_modulo_rf
	end as modulo,
	smn_comercial.smn_pedido_detalle.smn_moneda_rf,
	smn_comercial.smn_pedido_detalle.smn_tasa_rf
from
	smn_comercial.smn_pedido_detalle
	left outer join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_comercial.smn_pedido_detalle.smn_servicios_rf
	left outer join smn_base.smn_item ON smn_base.smn_item.smn_item_id = smn_comercial.smn_pedido_detalle.smn_item_rf
	left outer join smn_base.smn_activo_fijo on smn_base.smn_activo_fijo.smn_afijo_id = smn_comercial.smn_pedido_detalle.smn_activo_fijo_rf
	left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_comercial.smn_pedido_detalle.smn_moneda_rf
	left outer join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id = smn_comercial.smn_pedido_detalle.smn_tasa_rf
	inner join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
where
	smn_pedido_detalle_id is not null 
	${filter}
order by
		smn_pedido_detalle_id
