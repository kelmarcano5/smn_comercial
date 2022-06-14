document.form1.gpv_codigo.value='${fld:gpv_codigo@js}';
document.form1.gpv_descripcion.value='${fld:gpv_descripcion@js}';
setComboValue('gpv_estatus','${fld:gpv_estatus}','form1');
document.form1.gpv_vigencia.value='${fld:gpv_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_grupo_promotores_vendedores_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.gpv_codigo.disabled=true;
 

<rows>selectSmnRolId('${fld:smn_rol_id}','${fld:gpv_codigo}');</rows> 