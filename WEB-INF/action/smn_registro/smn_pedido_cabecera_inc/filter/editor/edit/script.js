var smn_cliente_id = '${fld:smn_cliente_id}';
$('#smn_cliente_id').val(smn_cliente_id).change();

var smn_documento_id = '${fld:smn_documento_id}';
$('#smn_documento_id').val(smn_documento_id).change();
var pca_vendedor = '${fld:pca_vendedor}';
$('#pca_vendedor').val(pca_vendedor).change();

var smn_centro_costo_rf = '${fld:smn_centro_costo_rf}';
$('#smn_centro_costo_rf').val(smn_centro_costo_rf).change();

var condicion = '${fld:smn_condicion_financiera_rf}';
$('#smn_condicion_financiera_rf').val(condicion).change();

setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.pca_numero_pedido.value='${fld:pca_numero_pedido@#,###,###}';
document.form1.smn_mov_caja_cabecera_id.value='${fld:smn_mov_caja_cabecera_id@#,###,###}';
setComboValue('smn_oferta_id','${fld:smn_oferta_id}','form1');
setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
setComboValue('smn_usuario_rf','${fld:smn_usuario_rf}','form1');
document.form1.pca_descripcion.value='${fld:pca_descripcion@js}';
document.form1.pca_fecha_requerida.value='${fld:pca_fecha_requerida@dd-MM-yyyy}';
setComboValue('smn_entidad_rf','${fld:smn_entidad_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
setComboValue('smn_area_servicio_rf','${fld:smn_area_servicio_rf}','form1');
setComboValue('smn_unidad_servicio_rf','${fld:smn_unidad_servicio_rf}','form1');
setComboValue('smn_almacen_rf','${fld:smn_almacen_rf}','form1');
setComboValue('smn_centro_costo_rf','${fld:smn_centro_costo_rf}','form1');
setComboValue('smn_centro_facturacion_id','${fld:smn_centro_facturacion_id}','form1');
setComboValue('smn_tipo_linea_comercial_id','${fld:smn_tipo_linea_comercial_id}','form1');
setComboValue('smn_linea_comercial_id','${fld:smn_linea_comercial_id}','form1');
setComboValue('pca_estatus','${fld:pca_estatus}','form1');
document.form1.id.value='${fld:smn_pedido_cabecera_id@#######}';
document.form1.pca_fecha_vencimiento.value='${fld:pca_fecha_vencimiento@dd-MM-yyyy}'; 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");
setComboValue('pca_vendedor','${fld:pca_vendedor}','form1');

 
