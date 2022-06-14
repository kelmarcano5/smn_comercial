INSERT INTO smn_comercial.smn_afiliados
(
	smn_afiliados_id,
	afi_auxiliar_rf,
	afi_fecha_inicio,
	afi_fecha_final,
	afi_fecha_desafiliacion,
	smn_rol_id,
	smn_servicio_id,
	afi_estatus,
	afi_idioma,
	afi_usuario,
	afi_fecha_registro,
	afi_hora
)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_afiliados},
	${fld:afi_auxiliar_rf},
	${fld:afi_fecha_inicio},
	${fld:afi_fecha_final},
	${fld:afi_fecha_desafiliacion},
	${fld:smn_rol_id},
	${fld:smn_servicio_id},
	${fld:afi_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);

INSERT INTO smn_comercial.smn_control_cupo_afiliado
(
	smn_control_cupo_afiliado_id,
	smn_afiliados_id,
	cca_cupo,
	cca_reservas,
	cca_saldo,
	cca_estatus,
	cca_idioma,
	cca_usuario,
	cca_fecha_registro,
	cca_hora
)
VALUES
(
	${seq:nextval@smn_comercial.seq_smn_control_cupo_afiliado},
	${seq:currval@smn_comercial.seq_smn_afiliados},
	(select smn_base.smn_servicios.svc_frecuencia as cupo from smn_base.smn_servicios 
		inner join smn_base.smn_tipos_servicios on smn_base.smn_tipos_servicios.smn_tipos_servicios_id = smn_base.smn_servicios.smn_tipo_servicio_rf
			where smn_base.smn_servicios.smn_servicios_id=${fld:smn_servicio_id} and smn_base.smn_tipos_servicios.tsr_servicio_afiliacion='SI'),
	0,
	(select smn_base.smn_servicios.svc_frecuencia from smn_base.smn_servicios 
		inner join smn_base.smn_tipos_servicios on smn_base.smn_tipos_servicios.smn_tipos_servicios_id = smn_base.smn_servicios.smn_tipo_servicio_rf
			where smn_base.smn_servicios.smn_servicios_id=${fld:smn_servicio_id} and smn_base.smn_tipos_servicios.tsr_servicio_afiliacion='SI'),
	'RE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)

