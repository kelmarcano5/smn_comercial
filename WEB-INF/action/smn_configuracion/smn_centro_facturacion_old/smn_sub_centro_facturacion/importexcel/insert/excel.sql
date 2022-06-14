INSERT INTO smn_comercial.smn_sub_centro_facturacion
(
	smn_sub_centro_facturacion_id,
	smn_centro_facturacion_id,
	scf_codigo,
	scf_nombre,
	scf_estatus,
	scf_vigencia,
	scf_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_sub_centro_facturacion},
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
