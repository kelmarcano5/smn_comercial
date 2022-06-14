INSERT INTO smn_comercial.smn_oferta_cabecera
(
	smn_oferta_cabecera_id,
	smn_documento_id,
	ofe_numero_documento,
	smn_entidad_rf,
	smn_sucursal_rf,
	ofe_fecha_desde,
	ofe_fecha_hasta,
	ofe_observaciones,
	ofe_estatus,
	ofe_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_oferta_cabecera},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
