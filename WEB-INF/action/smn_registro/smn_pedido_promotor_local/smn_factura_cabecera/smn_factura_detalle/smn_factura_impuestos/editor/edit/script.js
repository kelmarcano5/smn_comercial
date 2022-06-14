document.form1.smn_factura_detalle_id.value='${fld:smn_factura_detalle_id@#,###,###}';
setComboValue('smn_codigos_impuestos_rf','${fld:smn_codigos_impuestos_rf}','form1');
document.form1.fai_monto_base_ml.value='${fld:fai_monto_base_ml@#,###,##0.00}';
document.form1.fai_porcentaje_impuesto.value='${fld:fai_porcentaje_impuesto@#,###,##0.00}';
document.form1.fai_monto_sustraendo.value='${fld:fai_monto_sustraendo@#,###,##0.00}';
document.form1.fai_monto_impuesto_ml.value='${fld:fai_monto_impuesto_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.fai_monto_impuesto_ma.value='${fld:fai_monto_impuesto_ma@#,###,##0.00}';
document.form1.id.value='${fld:smn_factura_impuestos_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

