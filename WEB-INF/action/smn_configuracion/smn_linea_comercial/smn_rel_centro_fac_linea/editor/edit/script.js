setComboValue('smn_centro_facturacion_id','${fld:smn_centro_facturacion_id}','form1');
setComboValue('smn_linea_comercial_id','${fld:smn_linea_comercial_id}','form1');
document.form1.id.value='${fld:smn_rel_centro_fac_linea_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

