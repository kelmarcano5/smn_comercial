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
	fca_direccion_fiscal,
	fca_monto_factura_ml,
	fca_monto_impuesto_ml,
	fca_monto_descuento_ml,
	fca_monto_bonificacion_ml,
	fca_monto_neto_ml,
	smn_moneda_rf,
	smn_tasa_rf,
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
	${fld:documento},
	${seq:nextval@smn_comercial.numero_factura},
	${fld:entidad},
	${fld:sucursal},
	(select cfd_numero_documento_fiscal_inicial from smn_comercial.smn_control_fiscal_documento where smn_comercial.smn_control_fiscal_documento.smn_documento_id=${fld:documento} limit 1),
	${fld:rif},
	(select smn_base.smn_direccion.dir_descripcion as item from smn_base.smn_auxiliar inner join smn_base.smn_direccion on smn_base.smn_direccion.smn_direccion_id = smn_base.smn_auxiliar.aux_direccion_rf where smn_base.smn_auxiliar.smn_auxiliar_id=${fld:auxiliar}),
	${fld:monto},
	${fld:montoneto},
	${fld:pca_monto_descuento_ml},
	${fld:pca_monto_bonificacion_ml},
	${fld:pca_monto_neto_ml},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:pca_monto_neto_ma},
	${fld:pca_monto_impuesto_ma},
	${fld:pca_monto_descuento_ma},
	${fld:pca_monto_bonificacion_ma},
	${fld:pca_monto_neto_ma},
	'PE',
	'RE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:cliente}
);

INSERT INTO smn_comercial.smn_rel_pedido_factura
(
	smn_rel_pedido_factura_id,
	smn_pedido_cabecera_id,
	smn_factura_cabecera_id
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_pedido_factura},
	${fld:smn_pedido_cabecera_id},
	(select last_value from smn_comercial.seq_smn_factura_cabecera)
);

