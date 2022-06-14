SELECT DISTINCT cl.aux_razon_social as cliente,
    smn_comercial.smn_documento.dcf_descripcion as doc_descripcion,
    smn_comercial.smn_factura_cabecera.fca_numero_control_fiscal as control_fiscal,
    smn_comercial.smn_factura_cabecera.fca_rif as rif,
    smn_comercial.smn_factura_cabecera.smn_documento_id as nro_doc,
    smn_comercial.smn_factura_cabecera.fca_estatus_financiero,
    smn_comercial.smn_factura_cabecera.fca_fecha_registro as fecha_documento,
    smn_base.smn_direccion.dir_descripcion as direccion,
    smn_comercial.smn_factura_cabecera.fca_numero_documento
    
FROM
    smn_comercial.smn_factura_cabecera
    inner join smn_comercial.smn_cliente on smn_comercial.smn_cliente.smn_cliente_id = smn_comercial.smn_factura_cabecera.smn_cliente_id
    inner join smn_base.smn_auxiliar cl on cl.smn_auxiliar_id = smn_comercial.smn_cliente.smn_auxiliar_rf
        left join smn_base.smn_direccion ON smn_base.smn_direccion.smn_direccion_id = cl.aux_direccion_rf
    inner join smn_comercial.smn_documento on smn_comercial.smn_documento.smn_documento_id = smn_comercial.smn_factura_cabecera.smn_documento_id
WHERE
    smn_comercial.smn_factura_cabecera.smn_factura_cabecera_id = ${fld:id}