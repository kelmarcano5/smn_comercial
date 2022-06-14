document.form1.smn_evento_id.value='${fld:smn_evento_id@#,###,###}';
document.form1.ccu_cupo.value='${fld:ccu_cupo@#,###,###}';
document.form1.ccu_reservas.value='${fld:ccu_reservas@#,###,###}';
document.form1.ccu_saldo.value='${fld:ccu_saldo@#,###,###}';
setComboValue('ccu_estatus','${fld:ccu_estatus}','form1');
document.form1.id.value='${fld:smn_control_cupo_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

