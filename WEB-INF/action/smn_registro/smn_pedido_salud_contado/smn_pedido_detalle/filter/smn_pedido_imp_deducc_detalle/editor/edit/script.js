setComboValue('smn_pedido_detalle_id','${fld:smn_pedido_detalle_id}','form1');
setComboValue('smn_codigos_impuestos_rf','${fld:smn_codigos_impuestos_rf}','form1');
document.form1.pid_porcentaje_impuesto.value='${fld:pid_porcentaje_impuesto@#,###,##0.00}';
document.form1.pid_monto_sustraendo.value='${fld:pid_monto_sustraendo@#,###,##0.00}';
document.form1.pid_monto_impuesto.value='${fld:pid_monto_impuesto@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.pid_monto_imp_moneda_alterna.value='${fld:pid_monto_imp_moneda_alterna@#,###,##0.00}';
document.form1.smn_descuentos_retenciones_rf.value='${fld:smn_descuentos_retenciones_rf@#,###,###}';
document.form1.pid_porcentaje_descuento_retencion.value='${fld:pid_porcentaje_descuento_retencion@#,###,##0.00}';
document.form1.pid_monto_descuento_retencion.value='${fld:pid_monto_descuento_retencion@#,###,##0.00}';
document.form1.pid_monto_desc_moneda_alterna.value='${fld:pid_monto_desc_moneda_alterna@#,###,##0.00}';
document.form1.id.value='${fld:smn_pedido_imp_deducc_detalle_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

