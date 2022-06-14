INSERT INTO smn_comercial.smn_rel_cliente_agenda
(
	smn_rel_cliente_agenda_id,
	smn_cliente_id,
	smn_agenda_rf
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_rel_cliente_agenda},
	${fld:smn_cliente_id},
	${fld:smn_agenda_rf}
)
