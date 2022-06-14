INSERT INTO smn_comercial.smn_rel_cliente_servicio
(
	smn_rel_cliente_servicio_id,
	smn_cliente_id,
	smn_servicio_rf
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_rel_cliente_servicio},
	${fld:smn_cliente_id},
	${fld:smn_servicio_rf}
)
