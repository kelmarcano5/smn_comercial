document.form1.smn_pedido_detalle_id.value='${fld:smn_pedido_detalle_id@#,###,###}';
setComboValue('smn_codigos_impuestos_rf','${fld:smn_codigos_impuestos_rf}','form1');
document.form1.pim_monto_base_ml.value='${fld:pim_monto_base_ml@#,###,###}';
document.form1.pim_porcentaje_impuesto.value='${fld:pim_porcentaje_impuesto@#,###,###}';
document.form1.pim_monto_sustraendo.value='${fld:pim_monto_sustraendo@#,###,###}';
document.form1.pim_monto_impuesto.value='${fld:pim_monto_impuesto@#,###,###}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.pim_monto_impuesto_ma.value='${fld:pim_monto_impuesto_ma@#,###,###}';
document.form1.id.value='${fld:smn_pedido_impuestos_id@#,###,###}';
setComboValue('smn_tipo_impuesto_rf','${fld:smn_tipo_impuesto_rf}','form1');
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

