setComboValue('smn_linea_comercial_id','${fld:smn_linea_comercial_id}','form1');
setComboValue('smn_servicio_rf','${fld:smn_servicio_rf}','form1');
setComboValue('rls_estatus','${fld:rls_estatus}','form1');
document.form1.rls_vigencia.value='${fld:rls_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_rel_linea_comercial_servicio_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

