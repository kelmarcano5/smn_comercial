document.form1.smn_orden_servicio_id.value='${fld:smn_orden_servicio_id@#######}';
setComboValue('ocd_estatus','${fld:ocd_estatus}','form1');
document.form1.ocd_observacion.value='${fld:ocd_observacion@js}';
document.form1.id.value='${fld:smn_orden_cab_det_servicio_id@#######}';

document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

document.form1.ocd_fecha_inicio.value='${fld:ocd_fecha_inicio@dd-MM-yyyy}';
document.form1.ocd_fecha_culminacion.value='${fld:ocd_fecha_culminacion@dd-MM-yyyy}';
document.form1.ocd_horas_laboradas.value='${fld:ocd_horas_laboradas@#######}';

<rows>selectSmnServiciosId('${fld:smn_servicios_rf}','${fld:svc_descripcion}');</rows>


 

