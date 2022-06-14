INSERT INTO smn_base.smn_rel_aux_sucursal
(
	smn_rel_aux_sucursal_id,
	smn_auxiliar_id,
	smn_auxiliar_sucursal_id
)
VALUES
(
	${seq:nextval@smn_base.seq_smn_rel_aux_sucursal},
	?,
	?
)
