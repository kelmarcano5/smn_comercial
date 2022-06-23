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
    smn_salud.smn_ingresos.igs_fecha_ingreso AS fecha_ingreso,
    smn_comercial.smn_pedido_pagadores.ppa_numero_autorizacion AS nro_autorizacion,
    smn_caja.smn_dist_pago_detalle.dpd_monto_del_pago_ml AS monto_autorizado,
    smn_comercial.smn_factura_cabecera.fca_numero_control_fiscal AS control_fiscal,
    case 
        when paciente.aux_afiliacion='PA' then paciente.aux_nombres ||' - '|| paciente.aux_apellidos ||' C.I- '|| paciente.aux_num_doc_oficial 
        when paciente.aux_afiliacion='TI' then paciente.aux_nombres ||' - '|| paciente.aux_apellidos ||' C.I- '|| paciente.aux_num_doc_oficial 
        when paciente.aux_afiliacion='RE' then paciente.aux_nombres_relacionado ||' - '|| paciente.aux_apellido_relacionado ||' C.I- '|| paciente.aux_num_oficial_relacionado 
    end AS titular,
    smn_comercial.smn_factura_cabecera.fim_forma_pago AS forma_pago,
    case when smn_comercial.smn_factura_cabecera.fim_abonos_ml is null then 0 else smn_comercial.smn_factura_cabecera.fim_abonos_ml end AS fim_abonos_ml,
    case when smn_comercial.smn_factura_cabecera.fim_abonos_ma is null then 0 else smn_comercial.smn_factura_cabecera.fim_abonos_ma end AS fim_abonos_ma,
    smn_comercial.smn_factura_cabecera.fim_descripcion_pagador2,
    case when smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ml end AS pca_monto_descuento_ml,
        case when smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ma is null then 0 else smn_comercial.smn_pedido_cabecera.pca_monto_descuento_ma end AS pca_monto_descuento_ma,
    smn_caja.smn_dist_pago_detalle.dpd_nombre_pagador AS pagador_caja,
    smn_caja.smn_dist_pago_detalle.dpd_documento_pagador AS documento_caja,
    smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf AS num_ingreso,
    smn_comercial.smn_tipo_documentos_fact.tdf_nombre AS descrip_fact,
    case when smn_caja.smn_mov_caja_cabecera.mcc_monto_impuesto_ml is null then 0 else smn_caja.smn_mov_caja_cabecera.mcc_monto_impuesto_ml end AS mcc_monto_impuesto_ml,
    case when smn_caja.smn_mov_caja_cabecera.mcc_monto_impuesto_ma is null then 0 else smn_caja.smn_mov_caja_cabecera.mcc_monto_impuesto_ma end AS mcc_monto_impuesto_ma
FROM smn_comercial.smn_pedido_cabecera
    INNER JOIN smn_caja.smn_mov_caja_cabecera ON smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_mov_caja_cabecera_id
    LEFT JOIN smn_caja.smn_dist_pago_detalle ON smn_caja.smn_dist_pago_detalle.smn_mov_caja_cabecera_id = smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id
    LEFT JOIN smn_comercial.smn_pedido_pagadores ON smn_comercial.smn_pedido_pagadores.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id AND smn_comercial.smn_pedido_pagadores.smn_dist_pago_detalle_id = smn_caja.smn_dist_pago_detalle.smn_dist_pago_detalle_id
    LEFT JOIN smn_salud.smn_ingresos ON smn_comercial.smn_pedido_cabecera.smn_ingresos_rf = smn_salud.smn_ingresos.smn_ingresos_id
    LEFT JOIN smn_salud.smn_contratante ON smn_salud.smn_contratante.smn_contratante_id= smn_salud.smn_ingresos.smn_contratante_id
    LEFT JOIN smn_base.smn_prestadores_servicios ON smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_ingresos.smn_prestador_servicio_rf
    LEFT JOIN smn_base.smn_auxiliar AS medico ON medico.smn_auxiliar_id = smn_salud.smn_ingresos.smn_prestador_servicio_rf
    INNER JOIN smn_base.smn_auxiliar AS paciente ON paciente.smn_auxiliar_id = smn_comercial.smn_pedido_cabecera.smn_auxiliar_rf
    INNER JOIN smn_comercial.smn_rel_pedido_factura ON smn_comercial.smn_rel_pedido_factura.smn_pedido_cabecera_id = smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id
    LEFT JOIN smn_comercial.smn_factura_cabecera ON smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id = smn_comercial.smn_rel_pedido_factura.smn_factura_cabecera_id
    LEFT JOIN smn_salud.smn_afiliado_titular ON smn_salud.smn_afiliado_titular.smn_contratante_id= smn_salud.smn_ingresos.smn_contratante_id
    LEFT JOIN smn_base.smn_auxiliar AS titular ON titular.smn_auxiliar_id = smn_salud.smn_afiliado_titular.afi_auxiliar_rf
    INNER JOIN smn_base.smn_formas_pago ON smn_base.smn_formas_pago.smn_formas_pago_id = smn_caja.smn_dist_pago_detalle.smn_forma_pago_rf
    LEFT JOIN smn_comercial.smn_cliente ON smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_pedido_cabecera.smn_cliente_id
    LEFT JOIN smn_base.smn_auxiliar AS pagador ON pagador.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
    LEFT JOIN smn_base.smn_direccion ON smn_base.smn_direccion.smn_direccion_id = pagador.aux_direccion_rf
    INNER JOIN smn_comercial.smn_documento ON smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_factura_cabecera.smn_documento_id
    INNER JOIN smn_comercial.smn_tipo_documentos_fact ON smn_comercial.smn_tipo_documentos_fact.smn_tipo_documentos_fact_id = smn_comercial.smn_documento.smn_tipo_documentos_fact_id
WHERE
    smn_comercial.smn_pedido_cabecera.smn_pedido_cabecera_id = ${fld:id} --and smn_comercial.smn_pedido_pagadores.smn_dist_pago_detalle_id = ${fld:det_id}