setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
setComboValue('smn_contacto_rf','${fld:smn_contacto_rf}','form1');
document.form1.id.value='${fld:smn_rel_cliente_contacto_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

