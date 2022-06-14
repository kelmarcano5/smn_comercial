// document.form1.numero_documento.value='${fld:numero_documento@########}';
document.form1.id.value='${fld:numero_documento@########}';
// document.form1.ped_observaciones.value='${fld:ped_observaciones@js}';

document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

