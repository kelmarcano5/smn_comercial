setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
document.form1.cca_descripcion.value='${fld:cca_descripcion@js}';
document.form1.id.value='${fld:smn_imagen_auxiliar_id@#######}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

