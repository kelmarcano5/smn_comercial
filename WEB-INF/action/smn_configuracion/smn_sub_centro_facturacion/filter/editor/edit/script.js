setComboValue('smn_rol_id','${fld:smn_rol_id}','form1');
setComboValue('smn_usuario_rf','${fld:smn_usuario_rf}','form1');
setComboValue('smn_corporacion_rf','${fld:smn_corporacion_rf}','form1');
setComboValue('scf_estatus','${fld:scf_estatus}','form1');
document.form1.scf_vigencia.value='${fld:scf_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_sub_centro_facturacion_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

