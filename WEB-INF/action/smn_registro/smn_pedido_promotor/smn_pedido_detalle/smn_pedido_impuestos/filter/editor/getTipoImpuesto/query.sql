SELECT 
	smn_codigos_impuestos_id AS id,
	imp_codigo AS item 
FROM 
	smn_base.smn_codigos_impuestos 
WHERE 
	smn_base.smn_codigos_impuestos.smn_codigos_impuestos_id=${fld:id}