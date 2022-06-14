INSERT INTO smn_comercial.smn_envio_oferta
(
	smn_envio_oferta_id,
	smn_oferta_id,
	eof_fecha_envio,
	eof_fecha_cierre,
	smn_clasificacion_cliente_id,
	smn_clientes_area_interes_id,
	smn_tipo_contactos_rf,
	eof_descripcion,
	eof_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_envio_oferta},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
