select 
smn_comercial.smn_pedido_cabecera.smn_documento_id as smn_documento_id,
smn_comercial.smn_pedido_cabecera.smn_cliente_id as smn_cliente_rf,
smn_comercial.smn_pedido_cabecera.pca_fecha_requerida as mdc_fecha_documento,
smn_comercial.smn_pedido_cabecera.pca_fecha_vencimiento as mdc_fecha_vencimiento,
smn_comercial.smn_pedido_cabecera.pca_numero_pedido as mdc_numero_doc_origen,
fca.fca_numero_documento as mdd_numero_documento,
smn_comercial.smn_pedido_cabecera.smn_moneda_rf as smn_moneda_rf,
smn_comercial.smn_pedido_cabecera.smn_entidad_rf as entidad,
smn_comercial.smn_pedido_cabecera.smn_centro_costo_rf,
case 
		when smn_comercial.smn_pedido_cabecera.smn_tasa_rf is null then 0 else smn_comercial.smn_pedido_cabecera.smn_tasa_rf
	end as smn_tasa_rf,
case
when smn_comercial.smn_pedido_cabecera.smn_sucursal_rf is null then 0 else smn_comercial.smn_pedido_cabecera.smn_sucursal_rf end as sucursal,
case 
	when smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml
end as mdc_monto_ml,
case 
	when smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ma is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ma
end as mdc_monto_ma,
case 
	when smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml
end as mdc_saldo_doc_ml,
case 
	when smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma
end as mdc_saldo_doc_ma,
case 
	when smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml
end as mdc_descuento_ml,
case 
	when smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ma is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ma
end as mdc_descuento_ma,

case 
	when fca.fim_abonos_ml is null then 0 else fca.fim_abonos_ml
end as fim_abonos_ml,
case 
	when fca.fim_abonos_ma is null then 0 else fca.fim_abonos_ma
end as fim_abonos_ma,

smn_comercial.smn_pedido_cabecera.pca_vendedor as smn_promotor_rf,
EXTRACT(DAY FROM age(smn_comercial.smn_pedido_cabecera.pca_fecha_vencimiento, smn_comercial.smn_pedido_cabecera.pca_fecha_requerida)) AS dias_vencidos
from smn_comercial.smn_pedido_cabecera 
inner join smn_comercial.smn_rel_pedido_factura rpf on rpf.smn_pedido_cabecera_id=smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
inner join smn_comercial.smn_factura_cabecera fca on fca.smn_factura_cabecera_id=rpf.smn_factura_cabecera_id
where 
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}

