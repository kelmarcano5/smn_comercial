INSERT INTO smn_comercial.smn_detalle_documento_titulo_imp
(
	smn_detalle_documento_titulo_imp_id,
	smn_documento_grp_titulo_imp_id,
	dgi_naturaleza,
	smn_servicios_rf,
	smn_item_rf,
	smn_componentes_rf,
	dgi_idioma,
	dgi_usuario,
	dgi_fecha_registro,
	dgi_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_detalle_documento_titulo_imp},
	${fld:smn_documento_grp_titulo_imp_id},
	${fld:dgi_naturaleza},
	${fld:smn_servicios_rf},
	${fld:smn_item_rf},
	${fld:smn_componentes_rf},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
