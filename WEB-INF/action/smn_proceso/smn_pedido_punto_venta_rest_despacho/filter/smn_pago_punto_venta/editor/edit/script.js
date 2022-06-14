setComboValue('smn_pedido_cabecera_id','${fld:smn_pedido_cabecera_id}','form1');
document.form1.smn_mov_caja_cabecera_id.value='${fld:smn_mov_caja_cabecera_id@#,###,###}';
setComboValue('smn_pagador_clase_rf','${fld:smn_pagador_clase_rf}','form1');
setComboValue('smn_rel_punto_venta_pago_rf','${fld:smn_rel_punto_venta_pago_rf}','form1');
setComboValue('smn_forma_pago_rf','${fld:smn_forma_pago_rf}','form1');
document.form1.ppv_numero_documento_forma_pago.value='${fld:ppv_numero_documento_forma_pago@#,###,###}';
document.form1.ppv_numero_autorizacion.value='${fld:ppv_numero_autorizacion@#,###,###}';
document.form1.ppv_documento_identidad_pagador.value='${fld:ppv_documento_identidad_pagador@js}';
document.form1.ppv_nombre_pagador.value='${fld:ppv_nombre_pagador@js}';
document.form1.ppv_monto_pagar_ml.value='${fld:ppv_monto_pagar_ml@#,###,##0.00}';
document.form1.ppv_monto_pago_ml.value='${fld:ppv_monto_pago_ml@#,###,##0.00}';
document.form1.ppv_monto_devuelto_ml.value='${fld:ppv_monto_devuelto_ml@#,###,##0.00}';
document.form1.ppv_monto_pagar_ma.value='${fld:ppv_monto_pagar_ma@#,###,##0.00}';
document.form1.ppv_monto_pago_ma.value='${fld:ppv_monto_pago_ma@#,###,##0.00}';
document.form1.ppv_monto_devuelto_ma.value='${fld:ppv_monto_devuelto_ma@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.ppv_observacion.value='${fld:ppv_observacion@js}';
setComboValue('ppv_estatus','${fld:ppv_estatus}','form1');
document.form1.id.value='${fld:smn_pago_punto_venta_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

