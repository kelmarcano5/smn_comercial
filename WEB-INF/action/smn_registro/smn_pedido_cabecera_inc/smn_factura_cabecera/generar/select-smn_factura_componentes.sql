SELECT
	smn_componente_rf,
	smn_clase_auxiliar_rf,
	smn_moneda_rf,
	smn_auxiliar_rf,
	COUNT(smn_moneda_rf) AS cant_moneda,
	SUM(fco_monto_ml) AS fco_monto_ml,
	SUM(smn_monto_ma) AS smn_monto_ma
FROM
	smn_comercial.smn_factura_componentes
WHERE
	smn_factura_detalle_id = ${fld:smn_factura_detalle_id}
GROUP BY
	smn_componente_rf,smn_clase_auxiliar_rf,smn_auxiliar_rf,smn_moneda_rf
	