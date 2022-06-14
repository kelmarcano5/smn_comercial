INSERT INTO smn_comercial.smn_factura_cabecera
(
	smn_factura_cabecera_id,
	smn_documento_id,
	fca_numero_documento,
	smn_entidad_rf,
	smn_sucursal_rf,
	smn_control_serie_fiscal_id,
	fca_numero_control_fiscal,
	fca_rif,
	fca_monto_factura_ml,
	fca_monto_impuesto_ml,
	fca_monto_descuento_ml,
	fca_monto_bonificacion_ml,
	fca_monto_neto_ml,
	fca_monto_factura_ma,
	fca_monto_impuesto_ma,
	fca_monto_descuento_ma,
	fca_monto_bonificacion_ma,
	fca_monto_neto_ma,
	fca_estatus_financiero,
	fca_estatus_proceso,
	fca_idioma,
	fca_usuario,
	fca_fecha_registro,
	fca_hora,
	smn_cliente_id
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_factura_cabecera},
	${fld:smn_documento_id},
	${seq:nextval@smn_comercial.numero_factura},
	${fld:smn_entidades_rf},
	${fld:smn_sucursales_rf},
	(select cfd_numero_documento_fiscal_inicial from smn_comercial.smn_centro_facturacion
		inner join smn_comercial.smn_control_fiscal_documento on smn_comercial.smn_control_fiscal_documento.smn_control_fiscal_documento_id=smn_comercial.smn_centro_facturacion.cfc_control_fiscal_1 where
		 smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id=${fld:smn_centro_id}),
	(select cfd_ultimo_numero_fiscal_usado+1 from smn_comercial.smn_centro_facturacion
		inner join smn_comercial.smn_control_fiscal_documento on smn_comercial.smn_control_fiscal_documento.smn_control_fiscal_documento_id=smn_comercial.smn_centro_facturacion.cfc_control_fiscal_1
		where smn_comercial.smn_centro_facturacion.smn_centro_facturacion_id=${fld:smn_centro_id}),
	(select smn_base.smn_auxiliar.aux_rif from smn_comercial.smn_cliente
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf where smn_comercial.smn_cliente.smn_cliente_id=${fld:smn_cliente_id}),
	(case when ${fld:monto_ml} is null then 0 else ${fld:monto_ml} end),
	(case when ${fld:monto_imp_ml} is null then 0 else ${fld:monto_imp_ml} end),
	(case when ${fld:monto_desc_ml} is null then 0 else ${fld:monto_desc_ml} end),
	(case when ${fld:monto_bonif_ml} is null then 0 else ${fld:monto_bonif_ml} end),
	(case when ${fld:monto_ml} is null then 0 else ${fld:monto_ml} end),
	(case when ${fld:monto_ma} is null then 0 else ${fld:monto_ma} end),
	(case when ${fld:monto_imp_ma} is null then 0 else ${fld:monto_imp_ma} end),
	(case when ${fld:monto_desc_ma} is null then 0 else ${fld:monto_desc_ma} end),
	(case when ${fld:monto_bonif_ma} is null then 0 else ${fld:monto_bonif_ma} end),
	(case when ${fld:monto_ma} is null then 0 else ${fld:monto_ma} end),
	'PE',
	'RE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_cliente_id}
) RETURNING smn_factura_cabecera_id, ${fld:smn_documento_id} as smn_documento_id, ${fld:smn_entidades_rf} as smn_entidades_rf, ${fld:smn_sucursales_rf} as smn_sucursales_rf, ${fld:smn_cliente_id} as smn_cliente_id, ${fld:smn_centro_id} as smn_centro_id;

