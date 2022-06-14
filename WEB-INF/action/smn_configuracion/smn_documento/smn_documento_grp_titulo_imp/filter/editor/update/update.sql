UPDATE smn_comercial.smn_documento_grp_titulo_imp SET
	smn_documento_id=${fld:smn_documento_id},
	smn_grupo_titulo_impresion_rf=${fld:smn_grupo_titulo_impresion_rf},
	rdi_secuencia_impresion=${fld:rdi_secuencia_impresion},
	rdi_idioma='${def:locale}',
	rdi_usuario='${def:user}',
	rdi_fecha_registro={d '${def:date}'},
	rdi_hora='${def:time}'

WHERE
	smn_documento_grp_titulo_imp_id=${fld:id}

