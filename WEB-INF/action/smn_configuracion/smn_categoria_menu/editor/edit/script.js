document.form1.cam_codigo.value='${fld:cam_codigo@js}';
document.form1.cam_descripcion.value='${fld:cam_descripcion@js}';
setComboValue('cam_estatus','${fld:cam_estatus}','form1');
document.form1.cam_fecha_vigencia.value='${fld:cam_fecha_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_categoria_menu_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.cam_codigo.disabled=true;
 

