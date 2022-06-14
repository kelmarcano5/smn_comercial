setComboValue('smn_solicitud_servicio_entregas_detalle_id','${fld:smn_solicitud_servicio_entregas_detalle_id}','form1');
setComboValue('smn_ingredientes_id','${fld:smn_ingredientes_id}','form1');
document.form1.id.value='${fld:smn_rel_detalle_ingrediente_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

