INSERT INTO smn_comercial.smn_rel_pedido_factura
(
	smn_rel_pedido_factura_id,
	smn_pedido_cabecera_id,
	smn_factura_cabecera_id
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_rel_pedido_factura},
	${fld:smn_pedido_cabecera_id},
	${fld:smn_factura_cabecera_id}
);