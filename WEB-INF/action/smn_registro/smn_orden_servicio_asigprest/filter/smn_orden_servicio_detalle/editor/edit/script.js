document.form1.smn_orden_servicio_id.value='${fld:smn_orden_servicio_id@#,###,###}';
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_componentes_rf','${fld:smn_componentes_rf}','form1');
document.form1.osd_cantidad.value='${fld:osd_cantidad@#,###,##0.00}';
setComboValue('smn_tipo_componente','${fld:smn_tipo_componente}','form1');
setComboValue('smn_grupo_prestador_rf','${fld:smn_grupo_prestador_rf}','form1');
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
setComboValue('smn_nivel_estructura_rf','${fld:smn_nivel_estructura_rf}','form1');
setComboValue('osd_estatus','${fld:osd_estatus}','form1');
document.form1.id.value='${fld:smn_orden_servicio_detalle_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

