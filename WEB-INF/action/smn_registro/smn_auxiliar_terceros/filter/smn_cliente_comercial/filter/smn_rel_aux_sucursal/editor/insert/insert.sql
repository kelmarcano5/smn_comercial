INSERT INTO smn_base.smn_rel_aux_sucursal
(
	smn_rel_aux_sucursal_id,
	smn_auxiliar_id,
	smn_auxiliar_sucursal_id
)
VALUES
(
	${seq:currval@smn_base.seq_smn_rel_aux_sucursal},
	${fld:smn_auxiliar_id},
	${fld:smn_auxiliar_sucursal_id}
)
