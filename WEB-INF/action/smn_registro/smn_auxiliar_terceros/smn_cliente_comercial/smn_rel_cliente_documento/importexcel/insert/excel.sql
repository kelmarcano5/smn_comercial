INSERT INTO smn_comercial.smn_rel_cliente_documento
(
	smn_rel_cliente_documento_id,
	smn_documento_id,
	smn_cliente_id
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_cliente_documento},
	?,
	?
)
