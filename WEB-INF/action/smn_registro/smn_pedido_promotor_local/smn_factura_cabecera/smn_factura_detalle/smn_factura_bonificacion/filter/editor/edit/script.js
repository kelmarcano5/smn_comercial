document.form1.smn_factura_detalle_id_name.value='${fld:fde_naturaleza_pl0@js}';
document.form1.smn_factura_detalle_id.value='${fld:smn_factura_detalle_id@#,###,###}';
document.form1.smn_item_bonificar_rf.value='${fld:smn_item_bonificar_rf@#,###,###}';
document.form1.fbo_cantidad_origen.value='${fld:fbo_cantidad_origen@#,###,###}';
document.form1.fbo_cantidad_bonificar.value='${fld:fbo_cantidad_bonificar@#,###,###}';
document.form1.fbo_precio_original.value='${fld:fbo_precio_original@#,###,##0.00}';
document.form1.fbo_monto.value='${fld:fbo_monto@#,###,##0.00}';
document.form1.id.value='${fld:smn_factura_bonificacion_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

