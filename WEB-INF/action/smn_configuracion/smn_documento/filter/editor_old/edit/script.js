setComboValue('smn_tipo_documentos_fact_id','${fld:smn_tipo_documentos_fact_id}','form1');
setComboValue('smn_documentos_generales_rf','${fld:smn_documentos_generales_rf}','form1');
document.form1.dcf_codigo.value='${fld:dcf_codigo@js}';
document.form1.dcf_descripcion.value='${fld:dcf_descripcion@js}';
setComboValue('dcf_tipo_movimiento','${fld:dcf_tipo_movimiento}','form1');
setComboValue('dcf_req_vigencia','${fld:dcf_req_vigencia}','form1');
setComboValue('dcf_req_fecha_vencimiento','${fld:dcf_req_fecha_vencimiento}','form1');
setComboValue('dcf_gen_orden_despacho','${fld:dcf_gen_orden_despacho}','form1');
setComboValue('dcf_req_servicios','${fld:dcf_req_servicios}','form1');
setComboValue('dcf_req_vendedor','${fld:dcf_req_vendedor}','form1');
setComboValue('dcf_req_tiempo_entrega','${fld:dcf_req_tiempo_entrega}','form1');
setComboValue('dcf_usa_bonificaciones','${fld:dcf_usa_bonificaciones}','form1');
setComboValue('dcf_usa_descuentos','${fld:dcf_usa_descuentos}','form1');
setComboValue('dcf_moneda_alterna','${fld:dcf_moneda_alterna}','form1');
setComboValue('dcf_selecciona_precio','${fld:dcf_selecciona_precio}','form1');
setComboValue('dcf_usa_anexo','${fld:dcf_usa_anexo}','form1');
setComboValue('dcf_genera_factura_pv','${fld:dcf_genera_factura_pv}','form1');
document.form1.dcf_vigencia.value='${fld:dcf_vigencia@dd-MM-yyyy}';
setComboValue('dcf_estatus','${fld:dcf_estatus}','form1');
document.form1.id.value='${fld:smn_documento_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.dcf_codigo.disabled=true;
 

