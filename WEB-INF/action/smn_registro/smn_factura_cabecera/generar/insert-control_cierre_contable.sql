INSERT INTO smn_comercial.smn_control_cierre_contable
(
	smn_control_cierre_contable_id,
	smn_entidad_rf,
	smn_sucursal_rf,
	smn_documento_rf,
	smn_documento_id,
	ccc_fecha,
	ccc_numero_documento,
	ccc_monto_ml,
	ccc_monto_ma,
	smn_moneda_rf,
	smn_tasa,
	ccc_estatus,
	ccc_idioma,
	ccc_usuario,
	ccc_fecha_registro,
	ccc_hora 
)
VALUES
(
	nextval('smn_comercial.seq_smn_control_cierre_contable'), --smn_control_cierre_contable_id
	${fld:smn_entidad_rf}, --smn_entidad_rf
	${fld:smn_sucursal_rf}, --smn_sucursal_rf
	${fld:smn_documentos_generales_rf}, --smn_documento_rf
	${fld:smn_documento_id}, --smn_documento_id
	{d '${def:date}'}, --ccc_fecha
	(SELECT --ccc_numero_documento
		COUNT(ccc_numero_documento)+1
	 FROM
	 	smn_comercial.smn_control_cierre_contable
	),
	${fld:fca_monto_factura_ml}, --ccc_monto_ml
	${fld:fca_monto_factura_ma}, --ccc_monto_ma
	${fld:smn_moneda_rf}, --smn_moneda_rf
	${fld:smn_tasa}, --smn_tasa_rf
	'GE', --ccc_estatus
	'${def:locale}', --ccc_idioma
	'${def:user}', --ccc_usuario
	{d '${def:date}'}, --ccc_fecha_registro
	'${def:time}' --ccc_hora 
)

RETURNING smn_control_cierre_contable_id;