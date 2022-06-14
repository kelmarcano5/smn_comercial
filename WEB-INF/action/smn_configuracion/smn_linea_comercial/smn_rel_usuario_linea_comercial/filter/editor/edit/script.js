setComboValue('smn_linea_comercial_id','${fld:smn_linea_comercial_id}','form1');
setComboValue('smn_usuario_rf','${fld:smn_usuario_rf}','form1');
setComboValue('rlu_estatus','${fld:rlu_estatus}','form1');
document.form1.rlu_vigencia.value='${fld:rlu_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_rel_usuario_linea_comercial_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

