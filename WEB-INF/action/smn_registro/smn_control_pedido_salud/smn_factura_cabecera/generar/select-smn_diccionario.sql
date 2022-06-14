SELECT
	smn_diccionario_id
FROM
	smn_base.smn_diccionario
WHERE
	dic_esquema = 'smn_comercial'
AND
	(dic_tabla = 'smn_factura_componentes' OR dic_tabla = 'smn_factura_detalle')
AND
	dic_campo = ${fld:campo}