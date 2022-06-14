INSERT INTO smn_comercial.smn_detalle_documento_titulo_imp
(
	smn_detalle_documento_titulo_imp_id,
	smn_documento_grp_titulo_imp_id,
	smn_item_servicio_rf,
	smn_id_rf,
	smn_componentes_rf,
	dgi_idioma,
	dgi_usuario,
	dgi_fecha_registro,
	dgi_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_detalle_documento_titulo_imp},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
