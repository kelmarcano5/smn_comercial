INSERT INTO smn_salud.smn_ruta_paciente(
       	smn_ruta_id,
        smn_clase_auxiliar_rf,
        smn_auxiliar_rf,
        rta_numero_documento_identidad,
        smn_entidad_rf,
        smn_sucursal_rf,
        smn_area_servicio_rf,
        smn_unidad_servicio_rf,
        rta_estatus,
        rta_secuencia,
        smn_serie_id,
        rta_ticket,
        rta_idioma,
        rta_usuario,
        rta_fecha_registro,
        rta_hora,
        smn_ingreso_id
    )
    VALUES
    (
        ${seq:nextval@smn_salud.seq_smn_ruta_paciente},
        (select smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id from smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.cla_codigo='PA' LIMIT 1),
        ${fld:smn_auxiliar_rf},
        (select smn_base.smn_auxiliar.aux_codigo from smn_base.smn_auxiliar where smn_clase_auxiliar_rf = (select smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id from smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.cla_codigo='PA' LIMIT 1) AND smn_base.smn_auxiliar.smn_auxiliar_id=${fld:smn_auxiliar_rf} limit 1),
        ${fld:smn_entidad_rf},
        0,
        ${fld:smn_area_servicio_rf},
    	(select smn_salud.smn_relacion_unidad_paso.smn_unidad_servicio_rf from smn_salud.smn_relacion_unidad_paso
        LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id
        where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf=${fld:smn_area_servicio_rf} and smn_salud.smn_series.sri_codigo='B' 
        and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=1 limit 1),
        'AT',
        (select smn_salud.smn_relacion_unidad_paso.rup_secuencia from smn_salud.smn_relacion_unidad_paso
        LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id
        where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf=${fld:smn_area_servicio_rf} and smn_salud.smn_series.sri_codigo='B' 
        and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=1 limit 1),
        'B',
        (select sri_ultimo_numero from smn_salud.smn_series where sri_codigo = 'B'),
       '${def:locale}',
        '${def:user}',
        {d '${def:date}'},
        '${def:time}',
        (select smn_salud.smn_ingresos.smn_ingresos_id from smn_salud.smn_ingresos where smn_salud.smn_ingresos.igs_doc_origen=${fld:pca_numero_pedido} limit 1)
);

INSERT INTO smn_salud.smn_ruta_paciente(

        smn_ruta_id,
        smn_clase_auxiliar_rf,
        smn_auxiliar_rf,
        rta_numero_documento_identidad,
        smn_entidad_rf,
        smn_sucursal_rf,
        smn_area_servicio_rf,
        smn_unidad_servicio_rf,
        rta_estatus,
        rta_secuencia,
        smn_serie_id,
        rta_ticket,
        rta_idioma,
        rta_usuario,
        rta_fecha_registro,
        rta_hora,
        smn_ingreso_id
    )
    VALUES
    (
        ${seq:nextval@smn_salud.seq_smn_ruta_paciente},
        (select smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id from smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.cla_codigo='PA' LIMIT 1),
        ${fld:smn_auxiliar_rf},
        (select smn_base.smn_auxiliar.aux_codigo from smn_base.smn_auxiliar where smn_clase_auxiliar_rf =  (select smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id from smn_base.smn_clase_auxiliar where smn_base.smn_clase_auxiliar.cla_codigo='PA' LIMIT 1) AND smn_base.smn_auxiliar.smn_auxiliar_id=${fld:smn_auxiliar_rf} limit 1),
        ${fld:smn_entidad_rf},
        0,
        ${fld:smn_area_servicio_rf},
        (select smn_salud.smn_relacion_unidad_paso.smn_unidad_servicio_rf from smn_salud.smn_relacion_unidad_paso
        LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id
        where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf=${fld:smn_area_servicio_rf} and smn_salud.smn_series.sri_codigo='B' 
        and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=2 limit 1),
        'PE',
        (select smn_salud.smn_relacion_unidad_paso.rup_secuencia from smn_salud.smn_relacion_unidad_paso
        LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id
        where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf=${fld:smn_area_servicio_rf} and smn_salud.smn_series.sri_codigo='B' 
        and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=2 limit 1),
        'B',
        (select sri_ultimo_numero from smn_salud.smn_series where sri_codigo = 'B'),
       '${def:locale}',
        '${def:user}',
        {d '${def:date}'},
        '${def:time}',
        (select smn_salud.smn_ingresos.smn_ingresos_id from smn_salud.smn_ingresos where smn_salud.smn_ingresos.igs_doc_origen=${fld:pca_numero_pedido} limit 1)
);