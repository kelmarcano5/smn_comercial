SELECT
	smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_bruto_cob_ml,
	smn_cobranzas.smn_relacion_cobranza.rco_monto_bruto_cob_ma,
	smn_cobranzas.smn_relacion_cobranza.smn_moneda_rf,
	smn_cobranzas.smn_relacion_cobranza.smn_cliente_rf as smn_auxiliar_rf,
	smn_comercial.smn_pedido_detalle.smn_item_rf,
	smn_base.smn_item.smn_nivel_estructura_id,
	smn_comercial.smn_pedido_detalle.pde_cantidad_pedido,
	smn_cobranzas.smn_mov_documento_cob_cab.mdc_dias_vencidos,
	smn_cobranzas.smn_mov_documento_cob_cab.smn_promotor_rf,
	smn_cobranzas.smn_mov_documento_cob_cab.smn_rol_id,
	smn_cobranzas.smn_reglas_comisiones.smn_reglas_comisiones_id,
	smn_cobranzas.smn_reglas_comisiones.smn_documento_id,
	--smn_cobranzas.smn_reglas_comisiones.smn_auxiliar_rf,
	smn_cobranzas.smn_reglas_comisiones.rco_porcentaje,
	smn_cobranzas.smn_reglas_comisiones.rco_valor
FROM
	smn_cobranzas.smn_relacion_cobranza
	INNER JOIN 
	smn_cobranzas.smn_rel_cob_documento ON smn_cobranzas.smn_rel_cob_documento.smn_relacion_cobranza_id = smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id
	INNER JOIN 
	smn_cobranzas.smn_mov_documento_cob_cab ON smn_cobranzas.smn_rel_cob_documento.smn_mov_documento_cob_cab_id = smn_cobranzas.smn_mov_documento_cob_cab.smn_mov_documento_cob_cab_id
	INNER JOIN 
	smn_comercial.smn_pedido_cabecera ON smn_cobranzas.smn_mov_documento_cob_cab.smn_documento_rf = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
	INNER JOIN 
	smn_comercial.smn_pedido_detalle ON smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = smn_comercial.smn_pedido_detalle.smn_pedido_cabecera_id
	INNER JOIN 
	smn_base.smn_item ON smn_comercial.smn_pedido_detalle.smn_item_rf = smn_base.smn_item.smn_item_id
	INNER JOIN 
	smn_cobranzas.smn_documento ON smn_cobranzas.smn_mov_documento_cob_cab.smn_documento_id = smn_cobranzas.smn_documento.smn_documento_id
	INNER JOIN 
	smn_cobranzas.smn_reglas_comisiones ON smn_cobranzas.smn_mov_documento_cob_cab.smn_documento_id = smn_cobranzas.smn_reglas_comisiones.smn_documento_id 
										AND smn_cobranzas.smn_mov_documento_cob_cab.smn_promotor_rf = smn_cobranzas.smn_reglas_comisiones.smn_promotor_rf 
										AND smn_base.smn_item.smn_nivel_estructura_id = smn_cobranzas.smn_reglas_comisiones.smn_nivel_estructura_rf
										AND smn_cobranzas.smn_reglas_comisiones.smn_tipo_documento_id=smn_cobranzas.smn_documento.smn_tipo_documento_id
										OR smn_cobranzas.smn_reglas_comisiones.smn_auxiliar_rf=smn_cobranzas.smn_mov_documento_cob_cab.smn_cliente_rf
										OR smn_cobranzas.smn_reglas_comisiones.smn_rol_id=smn_cobranzas.smn_mov_documento_cob_cab.smn_rol_id
										OR smn_cobranzas.smn_reglas_comisiones.smn_vencimiento_rf=(SELECT smn_base.smn_vencimiento_detalle.smn_vencimiento_cabecera_id FROM smn_base.smn_vencimiento_detalle WHERE smn_base.smn_vencimiento_detalle.tvd_dias_desde>=smn_cobranzas.smn_mov_documento_cob_cab.mdc_dias_vencidos AND smn_base.smn_vencimiento_detalle.tvd_dias_hasta<=smn_cobranzas.smn_mov_documento_cob_cab.mdc_dias_vencidos)
WHERE
	smn_cobranzas.smn_relacion_cobranza.smn_relacion_cobranza_id=${fld:id}