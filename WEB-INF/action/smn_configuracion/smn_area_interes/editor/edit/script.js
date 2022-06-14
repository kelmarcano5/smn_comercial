document.form1.ari_codigo.value='${fld:ari_codigo@js}';
document.form1.ari_descripcion.value='${fld:ari_descripcion@js}';
document.form1.ari_vigencia.value='${fld:ari_vigencia@dd-MM-yyyy}';
setComboValue('ari_estatus','${fld:ari_estatus}','form1');
document.form1.id.value='${fld:smn_area_interes_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.ari_codigo.disabled=true;
 

