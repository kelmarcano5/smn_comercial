select 
	smn_comercial.smn_pedido_cabecera.smn_documento_id as smn_documento_id,
	smn_comercial.smn_pedido_cabecera.smn_cliente_id as smn_cliente_rf,
	smn_comercial.smn_pedido_cabecera.pca_fecha_requerida as mdd_fecha_pago,
	smn_comercial.smn_pedido_cabecera.pca_numero_pedido as mdd_numero_documento,
	smn_comercial.smn_pedido_cabecera.smn_moneda_rf as smn_moneda_rf,
	smn_comercial.smn_pedido_cabecera.smn_centro_costo_rf,
	case 
		when smn_comercial.smn_pedido_detalle.smn_tasa_rf is null then 0 else smn_comercial.smn_pedido_detalle.smn_tasa_rf
	end as smn_tasa_rf,
	case 
		when smn_comercial.smn_pedido_detalle.pde_monto is null then 0 else smn_comercial.smn_pedido_detalle.pde_monto
	end as mdd_monto_ml,
	case 
		when smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna is null then 0 else smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna
	 end as mdd_monto_ma,
	case 
		when smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml is null then 0 else smn_comercial.smn_pedido_detalle.pde_cantidad_pedido*smn_comercial.smn_pedido_detalle.pde_monto
	end as mdd_saldo_ml,
	case 
		when smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma is null then 0 else smn_comercial.smn_pedido_detalle.pde_cantidad_pedido*smn_comercial.smn_pedido_detalle.pde_monto_moneda_alterna
	end as mdd_saldo_ma
 
from 
	smn_comercial.smn_pedido_detalle
	inner join smn_comercial.smn_pedido_cabecera on smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
where 
smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}