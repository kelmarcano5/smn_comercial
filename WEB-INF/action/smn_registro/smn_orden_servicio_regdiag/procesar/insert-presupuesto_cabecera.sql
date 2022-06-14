INSERT INTO smn_comercial.smn_presupuesto
(
	smn_presupuesto_id,
	smn_documento_id,
	smn_entidades_rf,
	smn_sucursales_rf,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	smn_baremo_rf,
	pre_vigencia_hasta,
	smn_estado_presupuesto_id,
	pre_idioma,
	pre_usuario,
	pre_fecha_registro,
	pre_hora,
	smn_tabla_origen_rf,
	smn_documento_origen_rf,
	smn_orden_servicio_id

)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_presupuesto},
	${fld:smn_documento_id},
	${fld:smn_entidades_rf},
	${fld:smn_sucursales_rf},
	${fld:smn_clase_auxiliar_rf},
	${fld:smn_auxiliar_rf},
	${fld:smn_baremos_rf},
	{d '${def:date}'},
	1,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	'smn_orden_servicio',
	(select smn_comercial.smn_documento.smn_documento_id from smn_comercial.smn_documento where smn_comercial.smn_documento.dcf_codigo='PECO'),
	${fld:smn_orden_servicio_id}
) RETURNING smn_presupuesto_id;


