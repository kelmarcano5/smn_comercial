setComboValue('smn_presupuesto_id','${fld:smn_presupuesto_id}','form1');
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
document.form1.prd_cantidad.value='${fld:prd_cantidad@#,###,##0.00}';
document.form1.prd_precio.value='${fld:prd_precio@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.prd_precio_ma.value='${fld:prd_precio_ma@#,###,##0.00}';
document.form1.prd_monto_moneda_local.value='${fld:prd_monto_moneda_local@#,###,##0.00}';
document.form1.prd_moneda_alterna.value='${fld:prd_moneda_alterna@#,###,##0.00}';
document.form1.id.value='${fld:smn_presupuesto_detalle_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

