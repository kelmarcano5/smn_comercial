INSERT INTO smn_comercial.smn_rel_cliente_contacto
(
	smn_rel_cliente_contacto_id,
	smn_cliente_id,
	smn_contacto_rf
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_rel_cliente_contacto},
	${fld:smn_cliente_id},
	${fld:smn_contacto_rf}
)
