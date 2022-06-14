setComboValue('smn_tipo_linea_comercial_id','${fld:smn_tipo_linea_comercial_id}','form1');
document.form1.lco_codigo.value='${fld:lco_codigo@js}';
document.form1.lco_nombre.value='${fld:lco_nombre@js}';
document.form1.lco_vigencia.value='${fld:lco_vigencia@dd-MM-yyyy}';
setComboValue('lco_estatus','${fld:lco_estatus}','form1');
document.form1.id.value='${fld:smn_linea_comercial_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.lco_codigo.disabled=true;
 

