SELECT case
	when smn_cobranzas.smn_saldo_cliente.smn_sucursal_rf is null then 0 else smn_cobranzas.smn_saldo_cliente.smn_sucursal_rf  end as smn_sucursal_rf,
	smn_cobranzas.smn_saldo_cliente.*
FROM
	smn_cobranzas.smn_saldo_cliente
WHERE
	smn_entidad_rf=(select smn_comercial.smn_pedido_cabecera.smn_entidad_rf from smn_comercial.smn_pedido_cabecera where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id})
	AND
	smn_cliente_rf=(select smn_comercial.smn_pedido_cabecera.smn_cliente_id from smn_comercial.smn_pedido_cabecera where smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id=${fld:smn_pedido_cabecera_id})
ORDER BY scl_fecha DESC
LIMIT 1