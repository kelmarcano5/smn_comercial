INSERT INTO smn_comercial.smn_rel_pedido_fecha_entrega
(
	smn_rel_pedido_fecha_entrega_id,
	smn_pedido_detalle_id,
	smn_rel_auxiliar_direccion,
	pfe_fecha_entrega,
	pfe_cantidad,
	pfe_fecha_registro
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_pedido_fecha_entrega},
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
