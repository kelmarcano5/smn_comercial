setComboValue('smn_tipo_documento_id','${fld:smn_tipo_documento_id}','form1');
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
setComboValue('smn_rol_id','${fld:smn_rol_id}','form1');
setComboValue('smn_usuario_rf','${fld:smn_usuario_rf}','form1');
document.form1.met_fecha_desde.value='${fld:met_fecha_desde@dd-MM-yyyy}';
document.form1.met_fecha_hasta.value='${fld:met_fecha_hasta@dd-MM-yyyy}';
document.form1.met_dias_habiles.value='${fld:met_dias_habiles@#,###,###}';
document.form1.met_fecha_estadistica.value='${fld:met_fecha_estadistica@dd-MM-yyyy}';
document.form1.met_cantidad_diaria.value='${fld:met_cantidad_diaria@#,###,###}';
document.form1.met_cantidad_usuario.value='${fld:met_cantidad_usuario@#,###,###}';
setComboValue('met_estatus','${fld:met_estatus}','form1');
document.form1.id.value='${fld:smn_metas_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

