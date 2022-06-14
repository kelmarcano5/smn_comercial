document.form1.numero_documento.value='${fld:numero_documento@#######}';
document.form1.id.value='${fld:numero_documento@#######}';
document.form1.pde_observaciones.value='${fld:pde_observaciones@js}';

document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

