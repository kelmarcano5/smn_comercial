setComboValue('sec_origen','${fld:sec_origen}','form1');
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('smn_cliente_rf','${fld:smn_cliente_rf}','form1');
setComboValue('smn_tipo_servicio_rf','${fld:smn_tipo_servicio_rf}','form1');
document.form1.sec_descripcion.value='${fld:sec_descripcion@js}';
//document.form1.sec_direccion_busqueda.value='${fld:sec_direccion_busqueda@js}';
//document.form1.sec_direccion_entrega.value='${fld:sec_direccion_entrega@js}';
document.form1.sec_fecha_solicitud.value='${fld:sec_fecha_solicitud@dd-MM-yyyy}';
document.form1.sec_hora_solicitud.value='${fld:sec_hora_solicitud@js}';
document.form1.sec_especificacion_servicio.value='${fld:sec_especificacion_servicio@js}';
document.form1.sec_observacion_servicio.value='${fld:sec_observacion_servicio@js}';
document.form1.sec_monto_ml.value='${fld:sec_monto_ml@######000}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.sec_monto_ma.value='${fld:sec_monto_ma@######000}';
setComboValue('smn_forma_pago_rf','${fld:smn_forma_pago_rf}','form1');
document.form1.sec_monto_pago_efectivo.value='${fld:sec_monto_pago_efectivo@######000}';
document.form1.sec_otras_instrucciones.value='${fld:sec_otras_instrucciones@js}';
setComboValue('sec_estatus_proceso','${fld:sec_estatus_proceso}','form1');
setComboValue('sec_estatus_financiera','${fld:sec_estatus_financiera}','form1');
document.form1.id.value='${fld:smn_solicitud_servicio_entregas_cabecera_id@#######}';

setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');

setComboValue('sec_direccion_busqueda','${fld:sec_direccion_busqueda}','form1');
setComboValue('sec_direccion_entrega','${fld:sec_direccion_entrega}','form1');

document.form1.sec_tiempo_sug_preparacion.value='${fld:sec_tiempo_sug_preparacion@js}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

