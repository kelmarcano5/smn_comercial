document.form1.smn_pedido_detalle_id.value='${fld:smn_pedido_detalle_id@#,###,###}';
setComboValue('smn_descuentos_retenciones_rf','${fld:smn_descuentos_retenciones_rf}','form1');
document.form1.pim_monto_base_ml.value='${fld:pim_monto_base_ml@#,###,###}';
document.form1.pim_porcentaje_retencion.value='${fld:pim_porcentaje_retencion@#,###,###}';
document.form1.pim_monto_descuento_retencion.value='${fld:pim_monto_descuento_retencion@#,###,###}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.pim_monto_descuento_ma.value='${fld:pim_monto_descuento_ma@#,###,###}';
document.form1.id.value='${fld:smn_pedido_desc_retenciones_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

