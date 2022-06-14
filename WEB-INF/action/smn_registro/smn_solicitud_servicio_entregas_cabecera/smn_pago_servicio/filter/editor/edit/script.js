setComboValue('smn_solicitud_servicio_entregas_cabecera_id','${fld:smn_solicitud_servicio_entregas_cabecera_id}','form1');
setComboValue('smn_forma_pago_rf','${fld:smn_forma_pago_rf}','form1');
setComboValue('smn_franquicia_rf','${fld:smn_franquicia_rf}','form1');
document.form1.pas_numero_tarjeta.value='${fld:pas_numero_tarjeta@############}';
document.form1.pas_codigo_seguridad.value='${fld:pas_codigo_seguridad@#,###,###}';
document.form1.pas_documento_identidad.value='${fld:pas_documento_identidad@########}';
document.form1.pas_nombre_pagador.value='${fld:pas_nombre_pagador@js}';
document.form1.pas_numero_autorizacion.value='${fld:pas_numero_autorizacion@#,###,###}';
document.form1.id.value='${fld:smn_pago_servicio_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

