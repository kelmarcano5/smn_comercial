SELECT
	smn_base.smn_condicion_financiera.cfi_limite_credito
FROM
	smn_comercial.smn_cliente
INNER JOIN
	smn_base.smn_condicion_financiera ON smn_base.smn_condicion_financiera.smn_condicion_financiera_id=smn_comercial.smn_cliente.smn_condicion_financiera_rf
WHERE
	smn_comercial.smn_cliente.smn_cliente_id=(select smn_comercial.smn_pedido_cabecera.smn_cliente_id from smn_comercial.smn_pedido_cabecera where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id})