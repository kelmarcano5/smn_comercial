UPDATE smn_base.smn_auxiliar SET
	smn_naturaleza_auxiliar_rf='3',
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	aux_tipo_persona=${fld:aux_tipo_persona},
	aux_codigo=${fld:aux_codigo},
	aux_descripcion=${fld:aux_descripcion},
	aux_sectores_economicos_rf=${fld:aux_sectores_economicos_rf},
	aux_denom_comercial=${fld:aux_denom_comercial},
	aux_razon_social=${fld:aux_razon_social},
	aux_representante_legal=${fld:aux_representante_legal},
	aux_tipo_doc_oficial_rf=${fld:aux_tipo_doc_oficial_rf},
	aux_num_doc_oficial=${fld:aux_num_doc_oficial},
	aux_rif=${fld:aux_rif},
	aux_direccion_rf=${fld:aux_direccion_rf},
	aux_comunidad_rf=${fld:aux_comunidad_rf},
	aux_auxiliar_corporacion_rf=${fld:aux_auxiliar_corporacion_rf},
	aux_auxiliar_unidad_negocio_rf=${fld:aux_auxiliar_unidad_negocio_rf},
	aux_benef_pago=${fld:aux_benef_pago},
	aux_cond_pago_rf=${fld:aux_cond_pago_rf},
	aux_condicion_financiera_rf=${fld:aux_condicion_financiera_rf},
	aux_cuenta_bancaria_rf=${fld:aux_cuenta_bancaria_rf},
	aux_maneja_sucursal=${fld:aux_maneja_sucursal},
	aux_persona_contacto=${fld:aux_persona_contacto},
	aux_observacion=${fld:aux_observacion},
	aux_idioma='${def:locale}',
	aux_usuario='${def:user}',
	aux_fecha_registro={d '${def:date}'},
	aux_hora='${def:time}'

WHERE
	smn_auxiliar_id=${fld:id}

