select 
smn_comercial.smn_pedido_cabecera.smn_documento_id as smn_documento_rf,
smn_comercial.smn_pedido_cabecera.smn_cliente_id as smn_cliente_rf,
smn_comercial.smn_pedido_cabecera.pca_fecha_requerida as mdc_fecha_documento,
smn_comercial.smn_pedido_cabecera.pca_fecha_vencimiento as mdc_fecha_vencimiento,
smn_comercial.smn_pedido_cabecera.pca_numero_pedido as mdc_numero_doc_origen,
smn_comercial.smn_pedido_cabecera.smn_moneda_rf as smn_moneda_rf,
smn_comercial.smn_pedido_cabecera.smn_entidad_rf as entidad,
case 
	when smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml
end as mdc_monto_ml,
case 
	when smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma
end as mdc_monto_ma,
case 
	when smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml
end as mdc_saldo_doc_ml,
case 
	when smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma
end as mdc_saldo_doc_ma,
smn_comercial.smn_pedido_cabecera.pca_vendedor as smn_promotor_rf,
EXTRACT(DAY FROM age(smn_comercial.smn_pedido_cabecera.pca_fecha_vencimiento, smn_comercial.smn_pedido_cabecera.pca_fecha_requerida)) AS dias_vencidos
from smn_comercial.smn_pedido_cabecera 
where 
smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id}