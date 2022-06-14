document.form1.pro_codigo.value='${fld:pro_codigo@js}';
document.form1.pro_descripcion.value='${fld:pro_descripcion@js}';
document.form1.pro_email.value='${fld:pro_email@js}';
document.form1.pro_movil.value='${fld:pro_movil@js}';
document.form1.pro_fijo.value='${fld:pro_fijo@js}';
document.form1.pro_referido.value='${fld:pro_referido@js}';
setComboValue('pro_estatus','${fld:pro_estatus}','form1');
setComboValue('smn_direccion_rf','${fld:smn_direccion_rf}','form1');
document.form1.pro_vigencia.value='${fld:pro_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_prospecto_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

setComboValue('smn_tipo_contactos_rf','${fld:smn_tipo_contactos_rf}','form1');
document.form1.pro_descripcion_contacto.value='${fld:pro_descripcion_contacto@js}';

document.form1.pro_codigo.disabled=true;
 

