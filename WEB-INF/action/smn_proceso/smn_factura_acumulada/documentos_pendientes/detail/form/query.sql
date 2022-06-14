select
	smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id,
	case
	when smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_proceso='RE' then '${lbl:b_registered}'
	when smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_proceso='AP' then '${lbl:b_approved}'
	when smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_proceso='AL' then '${lbl:b_applied}'
	end as mdc_estatus_proceso,
	case
	when smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_financiero='PE' then '${lbl:b_pending}'
	when smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_financiero='PA' then '${lbl:b_payed}'
	when smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_financiero='DV' then '${lbl:b_refunded}'
	end as mdc_estatus_financiero,
	smn_base.smn_modulos.mod_nombre AS smn_modulo_origen_rf,
	smn_base.smn_documentos_generales.dcg_descripcion AS smn_documento_rf,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_numero_doc_origen,
	smn_base.smn_auxiliar.aux_descripcion AS smn_cliente_rf,
	smn_base.smn_auxiliar.aux_descripcion AS cfc_nombre,
	smn_comercial.smn_cliente.smn_cliente_id AS smn_cliente_id,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_fecha_documento,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_fecha_vencimiento,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_monto_ml,
	smn_base.smn_monedas.mon_nombre AS smn_moneda_rf,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_monto_ma,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_saldo_doc_ml,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_saldo_doc_ma,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_proceso,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_estatus_financiero,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_fecha_registro
	
FROM 
	smn_cobranzas.smn_mov_documento_cob_cab
	INNER JOIN smn_base.smn_modulos ON smn_base.smn_modulos.smn_modulos_id = smn_cobranzas.smn_mov_documento_cob_cab.smn_modulo_origen_rf
	INNER JOIN smn_base.smn_documentos_generales ON smn_base.smn_documentos_generales.smn_documentos_generales_id = smn_cobranzas.smn_mov_documento_cob_cab.smn_documento_rf
	INNER JOIN smn_comercial.smn_cliente ON smn_comercial.smn_cliente.smn_cliente_id = smn_cobranzas.smn_mov_documento_cob_cab.smn_cliente_rf
	INNER JOIN smn_base.smn_auxiliar ON smn_base.smn_auxiliar.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
	LEFT OUTER JOIN smn_base.smn_monedas ON smn_base.smn_monedas.smn_monedas_id = smn_cobranzas.smn_mov_documento_cob_cab.smn_moneda_rf
where
	smn_mov_documento_cob_cab_id = ${fld:id}
