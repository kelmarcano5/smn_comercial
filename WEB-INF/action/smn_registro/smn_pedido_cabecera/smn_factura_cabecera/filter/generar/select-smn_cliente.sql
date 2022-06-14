SELECT
	smn_auxiliar_rf,
	smn_clase_auxiliar_rf
FROM
	smn_comercial.smn_cliente
WHERE
	smn_cliente_id = ${fld:smn_cliente_id}