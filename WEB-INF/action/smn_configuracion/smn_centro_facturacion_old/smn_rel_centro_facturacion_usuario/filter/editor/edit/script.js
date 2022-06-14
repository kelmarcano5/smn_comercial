setComboValue('smn_centro_facturacion_id','${fld:smn_centro_facturacion_id}','form1');
setComboValue('smn_usuario_rf','${fld:smn_usuario_rf}','form1');
document.form1.rfu_vigencia.value='${fld:rfu_vigencia@dd-MM-yyyy}';
setComboValue('rfu_estatus','${fld:rfu_estatus}','form1');
document.form1.id.value='${fld:smn_rel_centro_facturacion_usuario_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

