INSERT INTO smn_base.smn_auxiliar
(
	smn_auxiliar_id,
	smn_naturaleza_auxiliar_rf,
	smn_clase_auxiliar_rf,
	aux_tipo_persona,
	aux_codigo,
	aux_descripcion,
	aux_apellidos,
	aux_nombres,
	aux_tipo_doc_oficial_rf,
	aux_num_doc_oficial,
	aux_rif,
	aux_sexo,
	aux_estado_civil,
	aux_fecha_nac,
	aux_lugar_nac,
	aux_direccion_rf,
	aux_nacionalidad_rf,
	aux_nacionalizado,
	aux_fecha_gaceta_nac,
	aux_num_gaceta,
	aux_afiliacion,
	aux_condicion_financiera_rf,
	aux_cuenta_bancaria_rf,
	aux_persona_contacto,
	aux_titular_rf,
	aux_observacion,
	aux_peso,
	aux_unidad_med_peso_rf,
	aux_estatura,
	aux_unidad_med_estatura_rf,
	aux_lateralidad,
	aux_talla_camisa,
	aux_unidad_med_camisa_rf,
	aux_talla_pantalon,
	aux_unidad_med_pantalon_rf,
	aux_talla_zapato,
	aux_unidad_med_zapato_rf,
	aux_talla_braga,
	aux_unidad_med_braga_rf,
	aux_talla_casco,
	aux_unidad_med_casco_rf,
	aux_idioma,
	aux_usuario,
	aux_fecha_registro,
	aux_hora
)
VALUES
(
	${seq:currval@smn_base.seq_smn_auxiliar},
	'1',
	${fld:smn_clase_auxiliar_rf},
	'PN',
	${fld:aux_codigo},
	CONCAT(${fld:aux_apellidos},',',${fld:aux_nombres}),
	${fld:aux_apellidos},
	${fld:aux_nombres},
	${fld:aux_tipo_doc_oficial_rf},
	${fld:aux_num_doc_oficial},
	${fld:aux_rif},
	${fld:aux_sexo},
	${fld:aux_estado_civil},
	${fld:aux_fecha_nac},
	${fld:aux_lugar_nac},
	${fld:aux_direccion_rf},
	${fld:aux_nacionalidad_rf},
	${fld:aux_nacionalizado},
	${fld:aux_fecha_gaceta_nac},
	${fld:aux_num_gaceta},
	${fld:aux_afiliacion},
	${fld:aux_condicion_financiera_rf},
	${fld:aux_cuenta_bancaria_rf},
	${fld:aux_persona_contacto},
	${fld:aux_titular_rf},
	${fld:aux_observacion},
	${fld:aux_peso},
	${fld:aux_unidad_med_peso_rf},
	${fld:aux_estatura},
	${fld:aux_unidad_med_estatura_rf},
	${fld:aux_lateralidad},
	${fld:aux_talla_camisa},
	${fld:aux_unidad_med_camisa_rf},
	${fld:aux_talla_pantalon},
	${fld:aux_unidad_med_pantalon_rf},
	${fld:aux_talla_zapato},
	${fld:aux_unidad_med_zapato_rf},
	${fld:aux_talla_braga},
	${fld:aux_unidad_med_braga_rf},
	${fld:aux_talla_casco},
	${fld:aux_unidad_med_casco_rf},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);

