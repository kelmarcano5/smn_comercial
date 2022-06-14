document.form1.acc_codigo.value='${fld:acc_codigo@js}';
document.form1.acc_descripcion.value='${fld:acc_descripcion@js}';
setComboValue('acc_require_seguimiento','${fld:acc_require_seguimiento}','form1');
document.form1.acc_dias_seguimiento.value='${fld:acc_dias_seguimiento@#,###,###}';
setComboValue('acc_paso_rf','${fld:acc_paso_rf}','form1');
setComboValue('acc_estatus','${fld:acc_estatus}','form1');
document.form1.acc_vigencia.value='${fld:acc_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_accion_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.acc_codigo.disabled=true;
 

