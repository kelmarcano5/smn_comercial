INSERT INTO smn_comercial.smn_documento_grp_titulo_imp
(
	smn_documento_grp_titulo_imp_id,
	smn_documento_id,
	smn_grupo_titulo_impresion_rf,
	rdi_secuencia_impresion,
	rdi_idioma,
	rdi_usuario,
	rdi_fecha_registro,
	rdi_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_documento_grp_titulo_imp},
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
