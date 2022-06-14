document.form1.smn_orden_servicio_id_name.value='${fld:ors_descripcion_pl0@js}';
document.form1.smn_orden_servicio_id.value='${fld:smn_orden_servicio_id@#,###,###}';
setComboValue('ocd_estatus','${fld:ocd_estatus}','form1');
document.form1.ocd_observacion.value='${fld:ocd_observacion@js}';
document.form1.id.value='${fld:smn_orden_cab_det_servicio_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

