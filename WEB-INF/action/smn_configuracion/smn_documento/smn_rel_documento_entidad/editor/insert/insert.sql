INSERT INTO smn_comercial.smn_rel_documento_entidad
(
	smn_rel_documento_entidad_id,
	smn_documento_id,
	smn_entidades_rf
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_rel_documento_entidad},
	${fld:smn_documento_id},
	${fld:smn_entidades_rf}
)
