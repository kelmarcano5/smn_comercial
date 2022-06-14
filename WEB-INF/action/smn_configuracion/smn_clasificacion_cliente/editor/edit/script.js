document.form1.ccl_codigo.value='${fld:ccl_codigo@js}';
document.form1.ccl_descripcion.value='${fld:ccl_descripcion@js}';
document.form1.ccl_vigencia.value='${fld:ccl_vigencia@dd-MM-yyyy}';
setComboValue('ccl_estatus','${fld:ccl_estatus}','form1');
document.form1.id.value='${fld:smn_clasificacion_cliente_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.ccl_codigo.disabled=true;
 

