setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
document.form1.id.value='${fld:smn_rel_documento_entidad_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

