SELECT
	(select smn_comercial.smn_cliente.smn_cliente_id ||'-'|| smn_base.smn_auxiliar.aux_descripcion from smn_comercial.smn_cliente inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf where smn_comercial.smn_cliente.smn_cliente_id=${fld:smn_cliente_id}) as cliente,
	${fld:smn_cliente_id} as smn_cliente_id,
	${fld:entidad} as smn_entidades_rf,
	case when ${fld:sucursal} is null then 0 else ${fld:sucursal} end as smn_sucursales_rf,
	${fld:documento} as smn_documento_id,
	${fld:smn_centro_id} as smn_centro_id,
	smn_comercial.smn_pedido_cabecera.smn_documento_id,
	smn_comercial.smn_pedido_cabecera.smn_cliente_id,
	Sum(smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ml) as monto_ml,
	Sum(smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ml) as monto_imp_ml,
	Sum(smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml) as monto_desc_ml,
	Sum(smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ml) as monto_bonif_ml,
	Sum(smn_comercial.smn_pedido_cabecera.pca_monto_neto_ml) as monto_neto_ml,
	Sum(smn_comercial.smn_pedido_cabecera.pca_monto_pedido_ma) as monto_ma,
	Sum(smn_comercial.smn_pedido_cabecera.pca_monto_impuesto_ma) as monto_imp_ma,
	Sum(smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ma) as monto_desc_ma,
	Sum(smn_comercial.smn_pedido_cabecera.pca_monto_bonificacion_ma) as monto_bonif_ma,
	Sum(smn_comercial.smn_pedido_cabecera.pca_monto_neto_ma) as monto_neto_ma,
	smn_comercial.smn_pedido_cabecera.pca_estatus
FROM
	smn_comercial.smn_pedido_cabecera
where 
	smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id is not null AND smn_comercial.smn_pedido_cabecera.pca_estatus IN('PR')
	and smn_comercial.smn_pedido_cabecera.smn_entidad_rf=${fld:entidad}
	and smn_comercial.smn_pedido_cabecera.smn_sucursal_rf=${fld:sucursal}
	and smn_comercial.smn_pedido_cabecera.smn_documento_id=${fld:documento}
	and smn_comercial.smn_pedido_cabecera.smn_cliente_id=${fld:smn_cliente_id}
	and smn_comercial.smn_pedido_cabecera.smn_centro_facturacion_id=${fld:smn_centro_id}
	and smn_comercial.smn_pedido_cabecera.pca_fecha_requerida>=${fld:pca_fecha_registro_ini}
	and smn_comercial.smn_pedido_cabecera.pca_fecha_requerida<=${fld:pca_fecha_registro_fin}
GROUP BY
smn_comercial.smn_pedido_cabecera.smn_documento_id,
smn_comercial.smn_pedido_cabecera.smn_cliente_id,
smn_comercial.smn_pedido_cabecera.pca_estatus