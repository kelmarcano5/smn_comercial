setComboValue('smn_centro_facturacion_id','${fld:smn_centro_facturacion_id}','form1');
document.form1.scf_codigo.value='${fld:scf_codigo@js}';
document.form1.scf_nombre.value='${fld:scf_nombre@js}';
setComboValue('scf_estatus','${fld:scf_estatus}','form1');
document.form1.scf_vigencia.value='${fld:scf_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_sub_centro_facturacion_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.scf_codigo.disabled=true;
 

