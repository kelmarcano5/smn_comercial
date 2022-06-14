setComboValue('smn_catalogo_item_comercio_id','${fld:smn_catalogo_item_comercio_id}','form1');
document.form1.iic_descripcion.value='${fld:iic_descripcion@js}';
document.form1.id.value='${fld:smn_imagen_item_comercio_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

