setComboValue('smn_linea_comercial_id','${fld:smn_linea_comercial_id}','form1');
setComboValue('smn_activo_rf','${fld:smn_activo_rf}','form1');
setComboValue('rla_estatus','${fld:rla_estatus}','form1');
document.form1.rla_vigencia.value='${fld:rla_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_rel_linea_comercial_afijo_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

