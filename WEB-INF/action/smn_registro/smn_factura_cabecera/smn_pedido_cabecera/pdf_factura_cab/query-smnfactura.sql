SELECT DISTINCT
    smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
    paciente.aux_nombres || ' - ' || paciente.aux_apellidos AS paciente,
    paciente.aux_rif AS rif_paciente,
    pagador.aux_descripcion AS pagador,
    pagador.aux_rif AS rif_pagador,
    smn_base.smn_direccion.dir_descripcion AS direccion_pagador,
    medico.aux_descripcion AS medico,
    smn_salud.smn_ingresos.smn_ingresos_id,
    smn_comercial.smn_factura_cabecera.fca_numero_documento AS nro_doc,
    smn_comercial.smn_factura_cabecera.fca_fecha_registro AS fecha_documento,
    smn_comercial.smn_pedido_cabecera.pca_fecha_vencimiento AS fecha_vencimiento,
    smn_salud.smn_ingresos.igs_fecha_registro AS fecha_ingreso,
    smn_caja.smn_dist_pago_detalle.dpd_numero_autorizacion AS nro_autorizacion,
    smn_caja.smn_dist_pago_detalle.dpd_monto_del_pago_ml AS monto_autorizado,
    smn_comercial.smn_factura_cabecera.fca_numero_control_fiscal as control_fiscal,
    titular.aux_descripcion as titular,
    titular.aux_num_doc_oficial as cedula_titular   
FROM
    smn_comercial.smn_pedido_cabecera
    INNER JOIN smn_caja.smn_mov_caja_cabecera ON smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id
    LEFT JOIN smn_salud.smn_ingresos ON smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf = smn_salud.smn_ingresos.smn_ingresos_id
    LEFT JOIN smn_salud.smn_contratante ON smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_ingresos.smn_contratante_id
    LEFT JOIN smn_base.smn_auxiliar pagador ON pagador.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf
    LEFT JOIN smn_base.smn_prestadores_servicios ON smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_ingresos.smn_prestador_servicio_rf
    LEFT JOIN smn_base.smn_auxiliar medico ON medico.smn_auxiliar_id = smn_salud.smn_ingresos.smn_prestador_servicio_rf
    LEFT JOIN smn_base.smn_auxiliar paciente ON paciente.smn_auxiliar_id = smn_salud.smn_ingresos.smn_auxiliar_rf
    left JOIN smn_base.smn_direccion ON smn_base.smn_direccion.smn_direccion_id = pagador.aux_direccion_rf
    left JOIN smn_comercial.smn_rel_pedido_factura ON smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
    left JOIN smn_comercial.smn_factura_cabecera ON smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id = smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id
    left JOIN smn_caja.smn_dist_pago_detalle ON smn_caja.smn_dist_pago_detalle.smn_mov_caja_cabecera_id = smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id 
    left join smn_salud.smn_afiliado_titular on smn_salud.smn_afiliado_titular.smn_contratante_id = smn_salud.smn_ingresos.smn_contratante_id
    left join smn_base.smn_auxiliar titular on titular.smn_auxiliar_id =  smn_salud.smn_afiliado_titular.afi_auxiliar_rf
WHERE
    smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = ${fld:id}