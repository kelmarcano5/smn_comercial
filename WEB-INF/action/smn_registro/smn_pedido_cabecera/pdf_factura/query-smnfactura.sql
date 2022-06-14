select  
    smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id,
    paciente.aux_nombres || ' - ' || paciente.aux_apellidos as paciente,
    paciente.aux_rif as rif_paciente,
    pagador.aux_nombres || ' - ' || pagador.aux_apellidos as pagador,
    pagador.aux_rif as rif_pagador,
    smn_base.smn_direccion.dir_codigo || ' - ' || smn_base.smn_direccion.dir_descripcion as direccion_pagador,
    medico.aux_nombres || ' - ' || medico.aux_apellidos as medico,
    smn_comercial.smn_factura_cabecera.fca_numero_documento as nro_doc,
    smn_comercial.smn_factura_cabecera.fca_fecha_registro as fecha_documento,
    smn_comercial.smn_pedido_cabecera.pca_fecha_vencimiento as fecha_vencimiento,
    smn_salud.smn_ingresos.igs_fecha_ingreso as fecha_ingreso,
    smn_caja.smn_dist_pago_detalle.dpd_numero_autorizacion as nro_autorizacion,
    smn_caja.smn_dist_pago_detalle.dpd_monto_del_pago_ml as monto_autorizado
    
from
    smn_comercial.smn_pedido_cabecera
    LEFT JOIN 
        smn_caja.smn_mov_caja_cabecera on smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id = smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id
    LEFT JOIN 
        smn_salud.smn_ingresos on smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf = smn_salud.smn_ingresos.smn_ingresos_id
    LEFT JOIN 
        smn_base.smn_auxiliar pagador on smn_salud.smn_ingresos.smn_contratante_id = pagador.smn_auxiliar_id
    LEFT JOIN 
        smn_base.smn_auxiliar medico on smn_salud.smn_ingresos.smn_prestador_servicio_rf = medico.smn_auxiliar_id
    LEFT JOIN 
        smn_base.smn_auxiliar paciente on smn_salud.smn_ingresos.smn_auxiliar_rf = paciente.smn_auxiliar_id
    LEFT JOIN
        smn_base.smn_direccion on pagador.aux_direccion_rf = smn_base.smn_direccion.smn_direccion_id
    LEFT JOIN 
        smn_comercial.smn_rel_pedido_factura on  smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
    LEFT JOIN 
        smn_comercial.smn_factura_cabecera on smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id = smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id
    LEFT JOIN
        smn_caja.smn_dist_pago_detalle on smn_caja.smn_dist_pago_detalle.smn_mov_caja_cabecera_id = smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id
where
    smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id = ${fld:id}