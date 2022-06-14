setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('smn_grupo_titulo_impresion_rf','${fld:smn_grupo_titulo_impresion_rf}','form1');
document.form1.rdi_secuencia_impresion.value='${fld:rdi_secuencia_impresion@#,###,###}';
document.form1.id.value='${fld:smn_documento_grp_titulo_imp_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

