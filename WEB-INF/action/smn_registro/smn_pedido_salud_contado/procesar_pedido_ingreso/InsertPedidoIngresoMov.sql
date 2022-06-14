INSERT INTO smn_salud.smn_ingreso_movimiento
(
	smn_ingresos_mov_id,
	smn_ingreso_id,
	smn_servicios_rf,
	smn_unidades_servicios_rf,
	smn_componente_rf,
	inm_cantidad,
	inm_precio_ml,
	inm_monto_ml,
	inm_precio_ma,
	inm_monto_ma,
	smn_moneda_rf,
	smn_tasa_rf,
	smn_grupo_prestador_servicio_rf,
	smn_prestador_servicio_rf,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	inm_tipo_orden,
	inm_estatus,
	inm_idioma,
	inm_usuario,
	inm_fecha_registro,
	inm_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_ingreso_movimiento},
	${fld:smn_ingresos_id},
	${fld:smn_servicios_rf},
	${fld:smn_unidades_servicios_rf},
	0,
	${fld:pde_cantidad_pedido},
	${fld:pde_precio},
	${fld:pde_monto},
	${fld:pde_precio_moneda_alterna},
	${fld:pde_monto_moneda_alterna},
	${fld:smn_moneda_rf},
	${fld:smn_tasa_rf},
	${fld:smn_grupo_prestador_rf},
	${fld:smn_prestador_servicio_rf},
	(select smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id from smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.cla_codigo='MD' LIMIT 1),
	0,
	'UR',
	'AC',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)

	