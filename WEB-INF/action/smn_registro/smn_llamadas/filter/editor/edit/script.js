setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
setComboValue('smn_prospecto_id','${fld:smn_prospecto_id}','form1');
//setComboValue('smn_solicitud_afiliacion_id','${fld:smn_solicitud_afiliacion_id}','form1');
//document.form1.smn_solicitud_afiliacion_id.value='${fld:smn_solicitud_afiliacion_id@#,###,###}';
setComboValue('smn_tipo_documento_id','${fld:smn_tipo_documento_id}','form1');
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.lla_descripcion.value='${fld:lla_descripcion@js}';
setComboValue('smn_cita_id','${fld:smn_cita_id}','form1');
setComboValue('smn_orden_pedido_id','${fld:smn_orden_pedido_id}','form1');
//document.form1.smn_cita_id.value='${fld:smn_cita_id@#,###,###}';
//document.form1.smn_orden_pedido_id.value='${fld:smn_orden_pedido_id@#,###,###}';
setComboValue('smn_oferta_id','${fld:smn_oferta_id}','form1');
document.form1.smn_solicitud_servicio_entrega_rf.value='${fld:smn_solicitud_servicio_entrega_rf@#,###,###}';
setComboValue('smn_gestion_id','${fld:smn_gestion_id}','form1');
document.form1.lla_observacion.value='${fld:lla_observacion@js}';
setComboValue('lla_estatus','${fld:lla_estatus}','form1');
document.form1.id.value='${fld:smn_llamadas_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 var elemento = window.document.getElementById('smn_solicitud_afiliacion_id');
//elemento.innerHTML="";

// <rows>
// 	var id = "${fld:smn_solicitud_afiliacion_id}";
// 	var item = "${fld:item}";

// 	var fila ='<input name="smn_solicitud_afiliacion_id" id="smn_solicitud_afiliacion_id" type="checkbox" value="'+id+'" style="width:10px" checked>'+item+'<br>';
				
//     elemento.innerHTML += fila;

//     //setCheckboxValue('role_id','${fld:role_id}','form1');
	
// </rows>

