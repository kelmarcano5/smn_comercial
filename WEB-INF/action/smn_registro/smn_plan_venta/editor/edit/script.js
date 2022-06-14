setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
setComboValue('smn_area_servicio_rf','${fld:smn_area_servicio_rf}','form1');
setComboValue('smn_unidad_servicio_rf','${fld:smn_unidad_servicio_rf}','form1');
setComboValue('smn_almacen_rf','${fld:smn_almacen_rf}','form1');
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('smn_servicio_rf','${fld:smn_servicio_rf}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
document.form1.plv_semestre_rf.value='${fld:plv_semestre_rf@#,###,##0.00}';
document.form1.plv_trimestre_rf.value='${fld:plv_trimestre_rf@#,###,##0.00}';
document.form1.plv_mes_rf.value='${fld:plv_mes_rf@#,###,##0.00}';
document.form1.plv_semana_rf.value='${fld:plv_semana_rf@#,###,##0.00}';
// setComboValue('plv_semestre_rf','${fld:plv_semestre_rf}','form1');
// setComboValue('plv_trimestre_rf','${fld:plv_trimestre_rf}','form1');
// setComboValue('plv_mes_rf','${fld:plv_mes_rf}','form1');
// setComboValue('plv_semana_rf','${fld:plv_semana_rf}','form1');
document.form1.plv_fecha.value='${fld:plv_fecha@dd-MM-yyyy}';
document.form1.plv_cantidad_rf.value='${fld:plv_cantidad_rf@#,###,##0.00}';
document.form1.plv_precio_rf.value='${fld:plv_precio_rf@#,###,##0.00}';
document.form1.plv_monto_rf.value='${fld:plv_monto_rf@#,###,##0.00}';
document.form1.plv_precio_ma_rf.value='${fld:plv_precio_ma_rf@#,###,##0.00}';
//setComboValue('plv_precio_ma_rf','${fld:plv_precio_ma_rf}','form1');
document.form1.plv_monto_ma_rf.value='${fld:plv_monto_ma_rf@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.id.value='${fld:smn_plan_venta_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

