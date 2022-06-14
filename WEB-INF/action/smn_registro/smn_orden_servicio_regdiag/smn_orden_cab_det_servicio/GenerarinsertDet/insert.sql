INSERT INTO smn_comercial.smn_orden_servicio_detalle
(
	smn_orden_servicio_detalle_id,
	smn_orden_cab_det_servicio_id,
	smn_servicios_rf,
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
	osd_hora,
	smn_forma_calculo_rf,
	smn_visible_rf,
	cmp_porcentaje
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_orden_servicio_detalle},
	${fld:smn_orden_servicio_id},
	${fld:serv},
	${fld:comp_id},
	${fld:cant},
	${fld:tipo},
	${fld:prest},
	${fld:pres},
	(select smn_base.smn_item.smn_nivel_estructura_id from smn_base.smn_item where smn_base.smn_item.smn_item_id=${fld:item}),
	'GE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:forma},
	${fld:vis},
	${fld:por}
);

UPDATE smn_comercial.smn_rel_orden_servicio SET
	ocd_estatus='GE'
WHERE
	smn_orden_servicio_id=${fld:smn_orden_servicio_id};

-- UPDATE smn_comercial.smn_orden_cab_det_servicio SET
-- 	ocd_estatus='GE'
-- WHERE
-- 	smn_orden_cab_det_servicio_id=${fld:id_det};




