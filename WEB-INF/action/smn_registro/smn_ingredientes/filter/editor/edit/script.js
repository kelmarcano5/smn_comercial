setComboValue('smn_solicitud_servicio_entregas_detalle_id','${fld:smn_solicitud_servicio_entregas_detalle_id}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_unidad_medida_rf','${fld:smn_unidad_medida_rf}','form1');
document.form1.igs_cantidad.value='${fld:igs_cantidad@#,###,###}';
document.form1.igs_precio.value='${fld:igs_precio@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.igs_precio_ma.value='${fld:igs_precio_ma@#,###,##0.00}';
document.form1.igs_monto_moneda_local.value='${fld:igs_monto_moneda_local@#,###,##0.00}';
document.form1.igs_monto_moneda_alterna.value='${fld:igs_monto_moneda_alterna@#,###,##0.00}';
document.form1.id.value='${fld:smn_ingredientes_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

