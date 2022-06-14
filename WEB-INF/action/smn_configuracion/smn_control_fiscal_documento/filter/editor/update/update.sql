UPDATE smn_comercial.smn_control_fiscal_documento SET
	smn_documento_id=${fld:smn_documento_id},
	smn_proveedor_rf=${fld:smn_proveedor_rf},
	cfd_numero_documento_fiscal_inicial=${fld:cfd_numero_documento_fiscal_inicial},
	cfd_numero_documento_fiscal_final=${fld:cfd_numero_documento_fiscal_final},
	cfd_ultimo_numero_fiscal_usado=${fld:cfd_ultimo_numero_fiscal_usado},
	cfd_fecha_solicitud=${fld:cfd_fecha_solicitud},
	cfd_fecha_recepcion=${fld:cfd_fecha_recepcion},
	cfd_serie=${fld:cfd_serie},
	cfd_estatus=${fld:cfd_estatus},
	cfd_idioma='${def:locale}',
	cfd_usuario='${def:user}',
	cfd_fecha_registro={d '${def:date}'},
	cfd_hora='${def:time}'

WHERE
	smn_control_fiscal_documento_id=${fld:id}

