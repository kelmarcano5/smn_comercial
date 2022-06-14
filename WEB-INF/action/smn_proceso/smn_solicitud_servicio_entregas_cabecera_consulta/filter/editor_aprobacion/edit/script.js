document.form1.documento.value='${fld:documento@js}';
document.form1.numero_documento.value='${fld:numero_documento@#######}';
document.form1.id.value='${fld:smn_solicitud_servicio_entregas_cabecera_id@#######}';

document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

