INSERT INTO smn_comercial.smn_rel_centro_fac_documento
(
	smn_rel_centro_fac_documento_id,
	smn_centro_facturacion_id,
	smn_documento_id
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_centro_fac_documento},
	?,
	?
)
