setComboValue('smn_oferta_id','${fld:smn_oferta_id}','form1');
setComboValue('ofd_naturaleza','${fld:ofd_naturaleza}','form1');
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_activo_fijo_rf','${fld:smn_activo_fijo_rf}','form1');
document.form1.ofd_cantidad.value='${fld:ofd_cantidad@#,###,###}';
document.form1.ofd_precio.value='${fld:ofd_precio@#,###,##0.00}';
document.form1.ofd_monto_ml.value='${fld:ofd_monto_ml@#,###,##0.00}';
setComboValue('ofd_moneda_rf','${fld:ofd_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.ofd_precio_moneda_alterna.value='${fld:ofd_precio_moneda_alterna@#,###,##0.00}';
document.form1.ofd_monto_moneda_alterna.value='${fld:ofd_monto_moneda_alterna@#,###,##0.00}';
document.form1.id.value='${fld:smn_oferta_detalle_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

