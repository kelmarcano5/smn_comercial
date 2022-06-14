INSERT INTO smn_comercial.smn_rel_centro_fac_linea
(
	smn_rel_centro_fac_linea_id,
	smn_centro_facturacion_id,
	smn_linea_comercial_id
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_centro_fac_linea},
	?,
	?
)
