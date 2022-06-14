INSERT INTO smn_comercial.smn_rel_cliente_medio_pago
(
	smn_rel_cliente_medio_pago_id,
	smn_cliente_id,
	smn_medio_pago_rf
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_cliente_medio_pago},
	?,
	?
)
