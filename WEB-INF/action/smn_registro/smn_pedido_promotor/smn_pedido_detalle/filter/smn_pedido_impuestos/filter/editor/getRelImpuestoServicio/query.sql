SELECT
	smn_base.smn_codigos_impuestos.smn_codigos_impuestos_id AS codigo_impuesto_id,
	smn_base.smn_codigos_impuestos.imp_codigo AS tipo_impuesto,
	smn_base.smn_codigos_impuestos.imp_codigo || ' - ' || smn_base.smn_codigos_impuestos.imp_descripcion AS item,
	smn_base.smn_codigos_impuestos.imp_porcentaje_calculo AS porccal,
	smn_base.smn_codigos_impuestos.imp_monto_sustraendo AS sustrae
FROM
	smn_base.smn_rel_serv_cod_impuesto
	INNER JOIN
	smn_base.smn_codigos_impuestos ON smn_base.smn_rel_serv_cod_impuesto.smn_codigos_impuestos_id = smn_base.smn_codigos_impuestos.smn_codigos_impuestos_id 
WHERE
	smn_base.smn_rel_serv_cod_impuesto.smn_servicios_id = ${fld:id}