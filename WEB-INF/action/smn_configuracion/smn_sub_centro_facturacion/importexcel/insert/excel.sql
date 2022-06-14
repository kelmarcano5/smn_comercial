INSERT INTO smn_comercial.smn_sub_centro_facturacion
(
	smn_sub_centro_facturacion_id,
	smn_rol_id,
	smn_usuario_rf,
	smn_corporacion_rf,
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
