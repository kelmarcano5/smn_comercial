delete from smn_comercial.smn_ingreso_movimiento where smn_comercial.smn_ingreso_movimiento.smn_ingreso_id = ${fld:ingreso};

delete from smn_comercial.smn_prestacion_servicio_medico_detalle where smn_prestacion_servicio_medico_cabecera_id = (select smn_comercial.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id from smn_comercial.smn_prestacion_servicio_medico_cabecera
where smn_comercial.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id = ${fld:ingreso} limit 1);

delete from smn_comercial.smn_prestacion_servicio_medico_cabecera where smn_prestacion_servicio_medico_cabecera.smn_ingresos_id = ${fld:ingreso};

delete from smn_compras.smn_requisicion_detalle where smn_compras.smn_requisicion_detalle.smn_requisicion_cabecera_id = (select smn_compras.smn_requisicion_cabecera.smn_requisicion_cabecera_id from smn_compras.smn_requisicion_cabecera
where smn_compras.smn_requisicion_cabecera.igs_doc_origen = ${fld:id} limit 1);

delete from smn_compras.smn_requisicion_cabecera where smn_compras.smn_requisicion_cabecera.igs_doc_origen = ${fld:id};
	
update smn_comercial.smn_presupuesto set smn_estado_presupuesto_id = 1 where smn_comercial.smn_presupuesto.smn_presupuesto_id = ${fld:id};

UPDATE smn_comercial.smn_presupuesto_detalle SET prd_estatus='RE' WHERE smn_comercial.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id};






