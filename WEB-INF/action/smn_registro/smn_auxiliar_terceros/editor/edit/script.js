setComboValue('smn_naturaleza_auxiliar_rf','${fld:smn_naturaleza_auxiliar_rf}','form1');
setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('aux_tipo_persona','${fld:aux_tipo_persona}','form1');
document.form1.aux_codigo.value='${fld:aux_codigo@js}';
document.form1.aux_descripcion.value='${fld:aux_descripcion@js}';
setComboValue('aux_sectores_economicos_rf','${fld:aux_sectores_economicos_rf}','form1');
document.form1.aux_denom_comercial.value='${fld:aux_denom_comercial@js}';
document.form1.aux_razon_social.value='${fld:aux_razon_social@js}';
document.form1.aux_representante_legal.value='${fld:aux_representante_legal@js}';
document.form1.aux_tipo_doc_oficial_rf.value='${fld:aux_tipo_doc_oficial_rf@#,###,###}';
document.form1.aux_num_doc_oficial.value='${fld:aux_num_doc_oficial@js}';
document.form1.aux_rif.value='${fld:aux_rif@js}';
setComboValue('aux_direccion_rf','${fld:aux_direccion_rf}','form1');
setComboValue('aux_comunidad_rf','${fld:aux_comunidad_rf}','form1');
setComboValue('aux_auxiliar_corporacion_rf','${fld:aux_auxiliar_corporacion_rf}','form1');
setComboValue('aux_auxiliar_unidad_negocio_rf','${fld:aux_auxiliar_unidad_negocio_rf}','form1');
document.form1.aux_benef_pago.value='${fld:aux_benef_pago@js}';
setComboValue('aux_cond_pago_rf','${fld:aux_cond_pago_rf}','form1');
setComboValue('aux_condicion_financiera_rf','${fld:aux_condicion_financiera_rf}','form1');
setComboValue('aux_cuenta_bancaria_rf','${fld:aux_cuenta_bancaria_rf}','form1');
setComboValue('aux_maneja_sucursal','${fld:aux_maneja_sucursal}','form1');
document.form1.aux_persona_contacto.value='${fld:aux_persona_contacto@js}';
document.form1.aux_observacion.value='${fld:aux_observacion@js}';
document.form1.id.value='${fld:smn_auxiliar_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.aux_codigo.disabled=true;
 

