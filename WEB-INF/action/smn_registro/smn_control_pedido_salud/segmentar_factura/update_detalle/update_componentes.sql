update smn_comercial.smn_pedido_componentes SET 
		smn_pedido_cabecera_id=(select last_value from smn_comercial.seq_smn_pedido_cabecera)
WHERE
	smn_pedido_detalle_id=${fld:id};

	

