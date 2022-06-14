setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.ors_numero.value='${fld:ors_numero@#,###,###}';
setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
document.form1.ors_descripcion.value='${fld:ors_descripcion@js}';
document.form1.ors_fecha_inicial.value='${fld:ors_fecha_inicial@dd-MM-yyyy}';
document.form1.ors_fecha_final.value='${fld:ors_fecha_final@dd-MM-yyyy}';
document.form1.ors_hora_inicial.value='${fld:ors_hora_inicial@js}';
document.form1.ors_hora_final.value='${fld:ors_hora_final@js}';
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
document.form1.ors_observacion.value='${fld:ors_observacion@js}';
setComboValue('ors_estatus','${fld:ors_estatus}','form1');
document.form1.id.value='${fld:smn_orden_servicio_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

setComboValue('smn_tipo_servicio_rf','${fld:smn_tipo_servicio_rf}','form1');
setComboValue('smn_centro_facturacion_id','${fld:smn_centro_facturacion_id}','form1');
 

