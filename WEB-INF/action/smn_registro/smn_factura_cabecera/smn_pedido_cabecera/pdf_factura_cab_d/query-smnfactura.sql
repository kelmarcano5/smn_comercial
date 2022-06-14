select  
    smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
    paciente.aux_nombres || ' - ' || paciente.aux_apellidos as paciente,
    paciente.aux_rif as rif_paciente,
    pagador.aux_codigo || ' - ' || pagador.aux_descripcion as pagador,
    pagador.aux_rif as rif_pagador,
    smn_base.smn_direccion.dir_codigo || ' - ' || smn_base.smn_direccion.dir_descripcion as direccion_pagador,
    medico.aux_codigo || ' - ' || medico.aux_descripcion as medico,
        smn_salud.smn_ingresos.smn_ingresos_id,
    smn_comercial.smn_factura_cabecera.fca_numero_documento as nro_doc,
    smn_comercial.smn_factura_cabecera.fca_fecha_registro as fecha_documento,
    smn_comercial.smn_pedido_cabecera.pca_fecha_vencimiento as fecha_vencimiento,
    smn_salud.smn_ingresos.igs_fecha_registro as fecha_ingreso,
        smn_caja.smn_dist_pago_detalle.dpd_numero_autorizacion as nro_autorizacion,
    smn_caja.smn_dist_pago_detalle.dpd_monto_del_pago_ml as monto_autorizado,
    smn_comercial.smn_factura_cabecera.fca_numero_control_fiscal as control_fiscal 
    
from
    smn_comercial.smn_pedido_cabecera
    INNER JOIN 
        smn_caja.smn_mov_caja_cabecera on smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id =  smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id
    left JOIN 
        smn_salud.smn_ingresos on smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf = smn_salud.smn_ingresos.smn_ingresos_id
        left join 
                smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_ingresos.smn_contratante_id
    LEFT JOIN 
        smn_base.smn_auxiliar pagador on pagador.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf 
    left join 
        smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_ingresos.smn_prestador_servicio_rf
    LEFT JOIN 
        smn_base.smn_auxiliar medico on medico.smn_auxiliar_id = smn_salud.smn_ingresos.smn_prestador_servicio_rf
    LEFT JOIN 
        smn_base.smn_auxiliar paciente on paciente.smn_auxiliar_id = smn_salud.smn_ingresos.smn_auxiliar_rf
    LEFT JOIN
        smn_base.smn_direccion on smn_base.smn_direccion.smn_direccion_id = pagador.aux_direccion_rf 
    LEFT JOIN 
        smn_comercial.smn_rel_pedido_factura on  smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
   LEFT JOIN 
        smn_comercial.smn_factura_cabecera on smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id = smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id
    LEFT JOIN
        smn_caja.smn_dist_pago_detalle on smn_caja.smn_dist_pago_detalle.smn_mov_caja_cabecera_id = smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id
where
    smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = ${fld:id}