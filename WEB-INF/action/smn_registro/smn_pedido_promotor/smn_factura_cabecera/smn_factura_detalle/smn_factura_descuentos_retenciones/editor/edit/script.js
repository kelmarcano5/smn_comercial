document.form1.smn_factura_detalle_id.value='${fld:smn_factura_detalle_id@#,###,###}';
setComboValue('smn_descuentos_retenciones_rf','${fld:smn_descuentos_retenciones_rf}','form1');
document.form1.fdr_monto_base_ml.value='${fld:fdr_monto_base_ml@#,###,##0.00}';
document.form1.fdr_porcentaje_descuento.value='${fld:fdr_porcentaje_descuento@#,###,##0.00}';
document.form1.fdr_monto_descuento_ml.value='${fld:fdr_monto_descuento_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.fdr_monto_descuento_ma.value='${fld:fdr_monto_descuento_ma@#,###,##0.00}';
document.form1.id.value='${fld:smn_factura_descuentos_retenciones_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

