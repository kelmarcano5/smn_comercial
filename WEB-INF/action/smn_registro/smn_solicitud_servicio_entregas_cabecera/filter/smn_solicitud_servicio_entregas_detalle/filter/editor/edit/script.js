//document.form1.smn_solicitud_servicio_entregas_cabecera_id_name.value='${fld:sec_origen_pl0@js}';
//document.form1.smn_solicitud_servicio_entregas_cabecera_id.value='${fld:smn_solicitud_servicio_entregas_cabecera_id@#,###,###}';
//document.form1.smn_catalogo_item_comercio_id.value='${fld:smn_catalogo_item_comercio_id@#,###,###}';
setComboValue('smn_unidad_medida_rf','${fld:smn_unidad_medida_rf}','form1');
document.form1.sed_cantidad.value='${fld:sed_cantidad@#,###,###}';
document.form1.sed_requirimientos.value='${fld:sed_requirimientos@js}';
document.form1.sed_precio_ml.value='${fld:sed_precio_ml@######000}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
document.form1.sed_precio_ma.value='${fld:sed_precio_ma@######000}';
document.form1.sed_monto_moneda_local.value='${fld:sed_monto_moneda_local@######000}';
document.form1.sed_monto_moneda_alterna.value='${fld:sed_monto_moneda_alterna@######000}';
document.form1.id.value='${fld:smn_solicitud_servicio_entregas_detalle_id@#######}';
setComboValue('smn_solicitud_servicio_entregas_cabecera_id','${fld:smn_solicitud_servicio_entregas_cabecera_id}','form1');
setComboValue('smn_catalogo_item_comercio_id','${fld:smn_catalogo_item_comercio_id}','form1');

document.form1.sed_tiempo_sug_preparacion.value='${fld:sed_tiempo_sug_preparacion@js}';

 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

