INSERT INTO smn_comercial.smn_rel_cliente_agenda
(
	smn_rel_cliente_agenda_id,
	smn_cliente_id,
	smn_agenda_rf
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_cliente_agenda},
	?,
	?
)
