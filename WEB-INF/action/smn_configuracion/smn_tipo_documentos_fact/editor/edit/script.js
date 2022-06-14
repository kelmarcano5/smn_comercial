document.form1.tdf_codigo.value='${fld:tdf_codigo@js}';
document.form1.tdf_nombre.value='${fld:tdf_nombre@js}';
setComboValue('tdf_naturaleza','${fld:tdf_naturaleza}','form1');
document.form1.tdf_vigencia.value='${fld:tdf_vigencia@dd-MM-yyyy}';
setComboValue('tdf_estatus','${fld:tdf_estatus}','form1');
document.form1.id.value='${fld:smn_tipo_documentos_fact_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.tdf_codigo.disabled=true;
 

