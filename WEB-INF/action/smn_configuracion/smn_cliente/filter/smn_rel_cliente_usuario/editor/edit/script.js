setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
setComboValue('smn_usuario_rf','${fld:smn_usuario_rf}','form1');
document.form1.id.value='${fld:smn_rel_cliente_usuario_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

