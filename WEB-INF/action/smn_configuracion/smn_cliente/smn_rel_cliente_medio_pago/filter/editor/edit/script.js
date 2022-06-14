setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
setComboValue('smn_medio_pago_rf','${fld:smn_medio_pago_rf}','form1');
document.form1.id.value='${fld:smn_rel_cliente_medio_pago_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

