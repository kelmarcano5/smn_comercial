INSERT INTO smn_comercial.smn_rel_grp_promotor_vendedor_rol
(
	smn_rel_grp_promotor_vendedor_rol_id,
	smn_grupo_promotores_vendedores_id,
	smn_rol_id
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_grp_promotor_vendedor_rol},
	?,
	?
)
