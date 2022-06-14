setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
document.form1.iic_descripcion.value='${fld:iic_descripcion@js}';
document.form1.id.value='${fld:smn_imagen_cliente_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

