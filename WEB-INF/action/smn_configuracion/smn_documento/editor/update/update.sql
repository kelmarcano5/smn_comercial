UPDATE smn_comercial.smn_documento SET
	smn_tipo_documentos_fact_id=${fld:smn_tipo_documentos_fact_id},
	smn_documentos_generales_rf=${fld:smn_documentos_generales_rf},
	dcf_codigo=${fld:dcf_codigo},
	dcf_descripcion=${fld:dcf_descripcion},
	dcf_tipo_movimiento=${fld:dcf_tipo_movimiento},
	dcf_req_vigencia=${fld:dcf_req_vigencia},
	dcf_req_fecha_vencimiento=${fld:dcf_req_fecha_vencimiento},
	dcf_gen_orden_despacho=${fld:dcf_gen_orden_despacho},
	smn_tipo_pedido_id=${fld:smn_tipo_pedido_id},
	dcf_req_vendedor=${fld:dcf_req_vendedor},
	dcf_req_tiempo_entrega=${fld:dcf_req_tiempo_entrega},
	dcf_usa_bonificaciones=${fld:dcf_usa_bonificaciones},
	dcf_usa_descuentos=${fld:dcf_usa_descuentos},
	dcf_moneda_alterna=${fld:dcf_moneda_alterna},
	dcf_selecciona_precio=${fld:dcf_selecciona_precio},
	dcf_usa_anexo=${fld:dcf_usa_anexo},
	dcf_vigencia={d '${def:date}'},
	dcf_estatus=${fld:dcf_estatus},
	dcf_idioma='${def:locale}',
	dcf_usuario='${def:user}',
	dcf_fecha_registro={d '${def:date}'},
	dcf_hora='${def:time}',
	dcf_genera_factura_pv=${fld:dcf_genera_factura_pv},
	dcf_entrega_por_orden=${fld:dcf_entrega_por_orden},
	tca_tipo_tasa=${fld:tca_tipo_tasa}

WHERE
	smn_documento_id=${fld:id}

