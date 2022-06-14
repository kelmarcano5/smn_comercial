INSERT INTO smn_comercial.smn_centro_facturacion
(
	smn_centro_facturacion_id,
	cfc_codigo,
	cfc_nombre,
	smn_entidades_rf,
	smn_sucursales_rf,
	smn_areas_servicios_rf,
	smn_unidades_servicios_rf,
	cfc_numero_identificacion,
	smn_almacen_rf,
	smn_centro_costo_rf,
	smn_caja_rf,
	cfc_control_fiscal_1,
	cfc_control_fiscal_2,
	cfc_vigencia,
	cfc_estatus,
	cfc_idioma,
	cfc_usuario,
	cfc_fecha_registro,
	cfc_hora,
	smn_baremos_rf,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf

)
VALUES
(
	${seq:currval@smn_comercial.seq_smn_centro_facturacion},
	${fld:cfc_codigo},
	${fld:cfc_nombre},
	${fld:smn_entidades_rf},
	case when ${fld:smn_sucursales_rf} is null then 0 else ${fld:smn_sucursales_rf} end,
	${fld:smn_areas_servicios_rf},
	${fld:smn_unidades_servicios_rf},
	${fld:cfc_numero_identificacion},
	${fld:smn_almacen_rf},
	${fld:smn_centro_costo_rf},
	${fld:smn_caja_rf},
	${fld:cfc_control_fiscal_1},
	${fld:cfc_control_fiscal_2},
	{d '${def:date}'},
	${fld:cfc_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${fld:smn_baremos_rf},
	${fld:smn_clase_auxiliar_rf},
	${fld:smn_auxiliar_rf}

)
