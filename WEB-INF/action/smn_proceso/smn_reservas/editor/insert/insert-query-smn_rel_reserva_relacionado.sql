INSERT INTO smn_comercial.smn_rel_reserva_relacionado
(
	smn_rel_reserva_relacionado_id,
	smn_reservas_id,
	smn_relacionado_id
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_reserva_relacionado},
	${seq:currval@smn_comercial.seq_smn_reservas},
	${fld:smn_relacionado_id}
)
