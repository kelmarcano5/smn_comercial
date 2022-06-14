INSERT INTO smn_comercial.smn_rel_detalle_ingrediente
(
	smn_rel_detalle_ingrediente_id,
	smn_pedido_detalle_id,
	smn_ingredientes_id
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_detalle_ingrediente},
	${seq:currval@smn_comercial.seq_smn_pedido_detalle},
	${fld:smn_ingredientes_id}
)
