document.form1.smn_factura_cabecera_id.value='${fld:smn_factura_cabecera_id@#,###,###}';
setComboValue('fde_naturaleza','${fld:fde_naturaleza}','form1');
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_activo_fijo_rf','${fld:smn_activo_fijo_rf}','form1');
document.form1.fde_cantidad.value='${fld:fde_cantidad@#,###,###}';
document.form1.fde_precio_ml.value='${fld:fde_precio_ml@#,###,###}';
document.form1.fde_monto_ml.value='${fld:fde_monto_ml@#,###,###}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.fde_precio_ma.value='${fld:fde_precio_ma@#,###,##0.00}';
document.form1.fde_monto_ma.value='${fld:fde_monto_ma@#,###,##0.00}';
document.form1.id.value='${fld:smn_factura_detalle_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

