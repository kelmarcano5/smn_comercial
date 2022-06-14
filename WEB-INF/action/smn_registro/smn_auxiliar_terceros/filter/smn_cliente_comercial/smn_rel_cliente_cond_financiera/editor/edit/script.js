setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
setComboValue('smn_condicion_financiera_rf','${fld:smn_condicion_financiera_rf}','form1');
setComboValue('rcc_estatus','${fld:rcc_estatus}','form1');
document.form1.rcc_vigencia.value='${fld:rcc_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_rel_cliente_cond_financiera_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

