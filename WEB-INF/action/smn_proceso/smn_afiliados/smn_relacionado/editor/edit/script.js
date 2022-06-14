document.form1.smn_afiliados_id.value='${fld:smn_afiliados_id@#,###,###}';
setComboValue('rel_auxiliar_rf','${fld:rel_auxiliar_rf}','form1');
document.form1.rel_fecha_inicio.value='${fld:rel_fecha_inicio@dd-MM-yyyy}';
document.form1.rel_fecha_final.value='${fld:rel_fecha_final@dd-MM-yyyy}';
document.form1.rel_fecha_desafiliado.value='${fld:rel_fecha_desafiliado@dd-MM-yyyy}';
setComboValue('rel_estatus','${fld:rel_estatus}','form1');
document.form1.id.value='${fld:smn_relacionado_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

