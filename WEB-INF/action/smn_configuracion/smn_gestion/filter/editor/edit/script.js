document.form1.ges_codigo.value='${fld:ges_codigo@js}';
document.form1.ges_descripcion.value='${fld:ges_descripcion@js}';
setComboValue('smn_accion_id','${fld:smn_accion_id}','form1');
setComboValue('ges_estatus','${fld:ges_estatus}','form1');
document.form1.ges_vigencia.value='${fld:ges_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_gestion_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.ges_codigo.disabled=true;
 

