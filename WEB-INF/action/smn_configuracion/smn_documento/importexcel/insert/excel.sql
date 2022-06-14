INSERT INTO smn_comercial.smn_documento
(
	smn_documento_id,
	smn_tipo_documentos_fact_id,
	smn_documentos_generales_rf,
	dcf_codigo,
	dcf_descripcion,
	dcf_tipo_movimiento,
	dcf_req_vigencia,
	dcf_req_fecha_vencimiento,
	dcf_gen_orden_despacho,
	dcf_req_servicios,
	dcf_req_vendedor,
	dcf_req_tiempo_entrega,
	dcf_usa_bonificaciones,
	dcf_usa_descuentos,
	dcf_moneda_alterna,
	dcf_selecciona_precio,
	dcf_usa_anexo,
	dcf_vigencia,
	dcf_estatus,
	dcf_idioma,
	dcf_usuario,
	dcf_fecha_registro,
	dcf_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_documento},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)