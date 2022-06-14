setComboValue('smn_incrementos_rf','${fld:smn_incrementos_rf}','form1');
document.form1.id.value='${fld:smn_presupuesto_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

