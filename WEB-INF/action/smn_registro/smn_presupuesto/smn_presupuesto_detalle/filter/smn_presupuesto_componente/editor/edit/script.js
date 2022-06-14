document.form1.smn_presupuesto_detalle_id.value='${fld:smn_presupuesto_detalle_id@#,###,###}';
document.form1.smn_presupuesto_id.value='${fld:smn_presupuesto_id@#,###,###}';
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_tipos_componentes_rf','${fld:smn_tipos_componentes_rf}','form1');
setComboValue('smn_componentes_rf','${fld:smn_componentes_rf}','form1');
setComboValue('smn_grupo_prestador_rf','${fld:smn_grupo_prestador_rf}','form1');
setComboValue('smn_prestadores_servicios_rf','${fld:smn_prestadores_servicios_rf}','form1');
document.form1.prc_porcentaje_prestador.value='${fld:prc_porcentaje_prestador@#,###,###}';
setComboValue('prc_forma_calculo_rf','${fld:prc_forma_calculo_rf}','form1');
setComboValue('prc_visible_rf','${fld:prc_visible_rf}','form1');
document.form1.prc_cantidad.value='${fld:prc_cantidad@#,###,###}';
document.form1.prc_precio_ml.value='${fld:prc_precio_ml@#,###,##0.00}';
document.form1.prc_precio_ma.value='${fld:prc_precio_ma@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.prc_monto_ml.value='${fld:prc_monto_ml@#,###,##0.00}';
document.form1.prc_monto_ma.value='${fld:prc_monto_ma@#,###,##0.00}';
document.form1.prc_monto_impuesto_ml.value='${fld:prc_monto_impuesto_ml@#,###,##0.00}';
document.form1.prc_monto_impuesto_ma.value='${fld:prc_monto_impuesto_ma@#,###,##0.00}';
document.form1.prc_monto_descuento_ml.value='${fld:prc_monto_descuento_ml@#,###,##0.00}';
document.form1.prc_monto_descuento_ma.value='${fld:prc_monto_descuento_ma@#,###,##0.00}';
setComboValue('smn_incrementos_porcentaje_rf','${fld:smn_incrementos_porcentaje_rf}','form1');
document.form1.prc_monto_incremento_ml.value='${fld:prc_monto_incremento_ml@#,###,##0.00}';
document.form1.prc_monto_incremento_ma.value='${fld:prc_monto_incremento_ma@#,###,##0.00}';
document.form1.prc_monto_neto_ml.value='${fld:prc_monto_neto_ml@#,###,##0.00}';
document.form1.prc_monto_neto_ma.value='${fld:prc_monto_neto_ma@#,###,##0.00}';
document.form1.id.value='${fld:smn_presupuesto_componente_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

