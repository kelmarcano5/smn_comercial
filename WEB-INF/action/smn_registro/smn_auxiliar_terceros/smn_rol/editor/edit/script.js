setComboValue('smn_usuario_rf','${fld:smn_usuario_rf}','form1');
setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
setComboValue('rol_tipo','${fld:rol_tipo}','form1');
setComboValue('smn_corporacion_rf','${fld:smn_corporacion_rf}','form1');
setComboValue('smn_entidad_rf','${fld:smn_entidad_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
setComboValue('smn_posicion_estructura_rf','${fld:smn_posicion_estructura_rf}','form1');
setComboValue('rol_estatus','${fld:rol_estatus}','form1');
document.form1.rol_vigencia.value='${fld:rol_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_rol_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

