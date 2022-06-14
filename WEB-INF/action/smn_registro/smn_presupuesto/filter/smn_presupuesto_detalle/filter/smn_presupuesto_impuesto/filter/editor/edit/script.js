document.form1.smn_presupuesto_detalle_id.value='${fld:smn_presupuesto_detalle_id@#,###,###}';
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_codigo_impuesto_id','${fld:smn_codigo_impuesto_id}','form1');
document.form1.pim_base_imponible_ml.value='${fld:pim_base_imponible_ml@#,###,##0.00}';
document.form1.pim_base_excenta_ml.value='${fld:pim_base_excenta_ml@#,###,##0.00}';
document.form1.pim_monto_impuesto_ml.value='${fld:pim_monto_impuesto_ml@#,###,##0.00}';
document.form1.pim_monto_sustraendo_ml.value='${fld:pim_monto_sustraendo_ml@#,###,##0.00}';
document.form1.pim_monto_neto_impuesto_ml.value='${fld:pim_monto_neto_impuesto_ml@#,###,##0.00}';
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.pim_base_imponible_ma.value='${fld:pim_base_imponible_ma@#,###,##0.00}';
document.form1.pim_base_excenta_ma.value='${fld:pim_base_excenta_ma@#,###,##0.00}';
document.form1.pim_monto_impuesto_ma.value='${fld:pim_monto_impuesto_ma@#,###,##0.00}';
document.form1.pim_monto_sustraendo_ma.value='${fld:pim_monto_sustraendo_ma@#,###,##0.00}';
document.form1.pim_monto_neto_impuesto_ma.value='${fld:pim_monto_neto_impuesto_ma@#,###,##0.00}';
document.form1.id.value='${fld:smn_presupuesto_impuesto_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

