setComboValue('smn_linea_comercial_id','${fld:smn_linea_comercial_id}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('rli_estatus','${fld:rli_estatus}','form1');
document.form1.rli_vigencia.value='${fld:rli_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_rel_linea_comercial_item_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

