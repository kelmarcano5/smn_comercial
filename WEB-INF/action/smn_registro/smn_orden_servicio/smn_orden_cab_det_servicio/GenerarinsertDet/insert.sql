INSERT INTO smn_comercial.smn_orden_servicio_detalle
(
	smn_orden_servicio_detalle_id,
	smn_orden_cab_det_servicio_id,
	smn_servicios_rf,
	smn_item_rf,
	smn_componentes_rf,
	osd_cantidad,
	smn_tipo_componente,
	smn_grupo_prestador_rf,
	smn_prestador_servicio_rf,
	smn_nivel_estructura_rf,
	osd_estatus,
	osd_idioma,
	osd_usuario,
	osd_fecha_registro,
	osd_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_orden_servicio_detalle},
	${fld:id_det},
	${fld:serv},
	${fld:item},
	${fld:comp_id},
	${fld:cant},
	'SE',
	${fld:prest},
	${fld:pres},
	${fld:nivel},
	'GE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);


UPDATE smn_comercial.smn_orden_cab_det_servicio SET
	ocd_fecha_registro={d '${def:date}'},
	ocd_hora='${def:time}',
	ocd_estatus='GE'
WHERE
	smn_orden_servicio_id=${fld:id_det};


