INSERT INTO smn_impuestos.smn_impuestos
(
	smn_impuestos_id,
	smn_entidades_id,
	smn_auxiliar_sucursales_id,
	imp_documento_origen,
	imp_modulo_origen_id,
	smn_clase_auxiliar_id,
	smn_auxiliar_id,
	imp_rif,
	imp_numero_documento,
	imp_num_control_fiscal,
	imp_fecha,
	imp_base_imponible_porcentaje,
	imp_base_imponible_monto,
	imp_base_excenta,
	smn_codigo_impuesto_rf,
	imp_porcentaje,
 	imp_monto_impuesto,
  	imp_sustraendo,
  	imp_monto_neto_impuesto,
  	imp_descripcion,
  	imp_cantidad,
  	imp_estatus,
  	imp_idioma,
  	imp_usuario_id,
  	imp_fecha_registro,
  	imp_hora,
  	imp_control_final,
  	imp_num_factura_final,
  	smn_monedas_rf,
  	smn_tasa_cambio_rf,
  	imp_monto_neto_imp_ma
)
VALUES
(
	nextval('smn_impuestos.seq_smn_impuestos'), --smn_impuestos_id
	${fld:smn_entidad_rf}, --smn_entidades_id
	${fld:smn_sucursal_rf}, --smn_auxiliar_sucursales_id
	${fld:smn_documento_id}, --imp_documento_origen
	${fld:smn_modulo_rf}, --imp_modulo_origen_id
	${fld:smn_clase_auxiliar_rf}, --smn_clase_auxiliar_id
	${fld:smn_auxiliar_rf}, --smn_auxiliar_id
	${fld:fca_rif}, --imp_rif
	${fld:fca_numero_documento}, --imp_numero_documento
	${fld:fca_numero_control_fiscal}, --imp_num_control_fiscal
	${fld:fca_fecha_registro}, --imp_fecha
	${fld:imp_porcentaje_base}, --imp_base_imponible_porcentaje
	${fld:fid_monto_base_ml}, --imp_base_imponible_monto
	${fld:imp_base_excenta}, --imp_base_excenta
	${fld:smn_codigos_impuestos_rf}, --smn_codigo_impuesto_rf
	${fld:fid_porcentaje_impuesto}, --imp_porcentaje
 	${fld:fid_monto_impuesto}, --imp_monto_impuesto
  	${fld:fid_monto_sustraendo}, --imp_sustraendo
  	${fld:imp_monto_neto_impuesto}, --imp_monto_neto_impuesto
  	${fld:imp_descripcion}, --imp_descripcion
  	${fld:imp_cantidad}, --imp_cantidad
  	'RE', --imp_estatus
  	'${def:locale}', --imp_idioma
  	'${def:user}', --imp_usuario_id
  	{d '${def:date}'}, --imp_fecha_registro
  	'${def:time}', --imp_hora
  	${fld:fca_numero_control_fiscal}, --imp_control_final
  	${fld:fca_numero_documento_id}, --imp_num_factura_final
  	${fld:smn_moneda_rf_fid}, --smn_monedas_rf
  	${fld:smn_tasa_rf_fid}, --smn_tasa_cambio_rf
  	${fld:fid_monto_imp_moneda_alterna} --imp_monto_neto_imp_ma
)