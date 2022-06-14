setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
setComboValue('smn_forma_pago_rf','${fld:smn_forma_pago_rf}','form1');
setComboValue('rcf_estatus','${fld:rcf_estatus}','form1');
document.form1.rcf_vigencia.value='${fld:rcf_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_rel_cliente_forma_pago_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

