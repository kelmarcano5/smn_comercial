UPDATE smn_comercial.smn_centro_facturacion SET
	cfc_codigo=${fld:cfc_codigo},
	cfc_nombre=${fld:cfc_nombre},
	smn_entidades_rf=${fld:smn_entidades_rf},
	smn_sucursales_rf=${fld:smn_sucursales_rf},
	smn_areas_servicios_rf=${fld:smn_areas_servicios_rf},
	smn_unidades_servicios_rf=${fld:smn_unidades_servicios_rf},
	cfc_numero_identificacion=${fld:cfc_numero_identificacion},
	smn_almacen_rf=${fld:smn_almacen_rf},
	smn_centro_costo_rf=${fld:smn_centro_costo_rf},
	smn_caja_rf=${fld:smn_caja_rf},
	cfc_control_fiscal_1=${fld:cfc_control_fiscal_1},
	cfc_control_fiscal_2=${fld:cfc_control_fiscal_2},
	cfc_vigencia={d '${def:date}'},
	cfc_estatus=${fld:cfc_estatus},
	cfc_idioma='${def:locale}',
	cfc_usuario='${def:user}',
	cfc_fecha_registro={d '${def:date}'},
	cfc_hora='${def:time}',
	smn_baremos_rf=${fld:smn_baremos_rf},
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf}

WHERE
	smn_centro_facturacion_id=${fld:id}

