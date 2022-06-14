INSERT INTO smn_comercial.smn_rel_cliente_usuario
(
	smn_rel_cliente_usuario_id,
	smn_cliente_id,
	smn_usuario_rf
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_cliente_usuario},
	?,
	?
)
