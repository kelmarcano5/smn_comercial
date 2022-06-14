select 
    smn_comercial.smn_ingresos.smn_ingresos_id,
    smn_comercial.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id as smn_prestacion_servicio_medico_cabecera_id,
    smn_caja.smn_mov_caja_detalle.smn_mov_caja_detalle_id as smn_mov_caja_detalle_id,
    smn_comercial.smn_ingreso_movimiento.smn_ingresos_mov_id as smn_ingresos_mov_id,
    smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id as smn_mov_caja_cabecera_id,
    smn_comercial.smn_ingreso_movimiento.smn_unidades_servicios_rf as smn_unidades_servicios_rf,
		smn_seguridad.s_user.user_id  as smn_prestador_servicio_rf,
		case
        when smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id then smn_base.smn_componentes.cmp_tipo_componente
    end as psd_tipo_componentes,
		smn_base.smn_servicios_componentes.smn_servicios_id as smn_servicios_rf,
		smn_base.smn_servicios_componentes.smn_componentes_id as smn_componentes_rf,
    smn_comercial.smn_ingresos.smn_moneda_rf as smn_moneda_rf,
    smn_comercial.smn_ingreso_movimiento.inm_cantidad as psd_cantidad,
    smn_comercial.smn_ingreso_movimiento.inm_precio_ml as psd_precio_propuesto_ml,
    smn_comercial.smn_ingreso_movimiento.inm_cantidad * smn_comercial.smn_ingreso_movimiento.inm_precio_ml as psd_monto_propuesto_ml,
		smn_comercial.smn_ingresos.igs_fecha_registro
from smn_comercial.smn_ingresos
    inner join smn_comercial.smn_ingreso_movimiento on smn_comercial.smn_ingreso_movimiento.smn_ingreso_id = smn_comercial.smn_ingresos.smn_ingresos_id
    inner join smn_caja.smn_mov_caja_cabecera on smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf = smn_comercial.smn_ingresos.igs_num_ingreso
    inner join smn_caja.smn_mov_caja_detalle on smn_caja.smn_mov_caja_detalle.smn_mov_caja_cabecera_id = smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id
    inner join smn_comercial.smn_prestacion_servicio_medico_cabecera on 
    smn_comercial.smn_prestacion_servicio_medico_cabecera.smn_mov_caja_cabecera_id = smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id
		inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = smn_caja.smn_mov_caja_detalle.smn_id_rf
    inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id
		inner join smn_seguridad.s_user on smn_seguridad.s_user.userlogin = smn_comercial.smn_ingresos.igs_usuario

WHERE
    smn_comercial.smn_ingresos.smn_ingresos_id = ${fld:id_ingreso} and smn_caja.smn_mov_caja_cabecera.smn_estatus_cobro = 'PE' and 
        smn_base.smn_servicios_componentes.smn_servicios_id = smn_comercial.smn_ingreso_movimiento.smn_servicios_rf