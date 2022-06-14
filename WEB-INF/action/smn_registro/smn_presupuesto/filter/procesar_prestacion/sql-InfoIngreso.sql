SELECT smn_comercial.smn_ingresos.*, smn_comercial.smn_documento.doc_codigo || ' - ' || smn_comercial.smn_documento.doc_nombre as descripcion_origen, (coalesce(smn_comercial.smn_contratante.smn_clase_auxiliar_rf,0)) as smn_clase_auxiliar_rf, (coalesce(smn_comercial.smn_contratante.smn_auxiliar_rf,0)) as auxiliar, (coalesce(smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id,0)) as smn_tasas_de_cambio_id 
FROM smn_comercial.smn_ingresos 
inner join smn_comercial.smn_documento on
smn_comercial.smn_ingresos.smn_documento_id = smn_comercial.smn_documento.smn_documento_id
left join smn_comercial.smn_contratante on
smn_comercial.smn_ingresos.smn_contratante_id = smn_comercial.smn_contratante.smn_contratante_id
left join smn_base.smn_tasas_de_cambio on
smn_comercial.smn_ingresos.smn_moneda_rf = smn_base.smn_tasas_de_cambio.smn_monedas_id
WHERE smn_ingresos_id = ${fld:id_ingreso}