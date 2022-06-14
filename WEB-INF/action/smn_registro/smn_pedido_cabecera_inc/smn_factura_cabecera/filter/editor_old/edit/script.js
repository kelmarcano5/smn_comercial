setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.fca_numero_documento_id.value='${fld:fca_numero_documento_id@#,###,###}';
setComboValue('smn_entidad_rf','${fld:smn_entidad_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
setComboValue('smn_pedido_cabecera_id','${fld:smn_pedido_cabecera_id}','form1');
setComboValue('smn_oferta_id','${fld:smn_oferta_id}','form1');
setComboValue('smn_caja_rf','${fld:smn_caja_rf}','form1');
setComboValue('smn_cliente_id','${fld:smn_cliente_id}','form1');
document.form1.smn_control_serie_fiscal_id.value='${fld:smn_control_serie_fiscal_id@#,###,###}';
document.form1.fca_numero_control_fiscal.value='${fld:fca_numero_control_fiscal@#,###,###}';
document.form1.fca_rif.value='${fld:fca_rif@js}';
document.form1.fca_direccion_fiscal.value='${fld:fca_direccion_fiscal@js}';
document.form1.fca_monto_factura_ml.value='${fld:fca_monto_factura_ml@#,###,##0.00}';
document.form1.fca_monto_impuesto_ml.value='${fld:fca_monto_impuesto_ml@#,###,##0.00}';
document.form1.fca_monto_descuento_ml.value='${fld:fca_monto_descuento_ml@#,###,##0.00}';
document.form1.fca_monto_bonificacion_ml.value='${fld:fca_monto_bonificacion_ml@#,###,##0.00}';
document.form1.fca_monto_neto_ml.value='${fld:fca_monto_neto_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.fca_monto_factura_ma.value='${fld:fca_monto_factura_ma@#,###,##0.00}';
document.form1.fca_monto_impuesto_ma.value='${fld:fca_monto_impuesto_ma@#,###,##0.00}';
document.form1.fca_monto_descuento_ma.value='${fld:fca_monto_descuento_ma@#,###,##0.00}';
document.form1.fca_monto_bonificacion_ma.value='${fld:fca_monto_bonificacion_ma@#,###,##0.00}';
document.form1.fca_monto_neto_ma.value='${fld:fca_monto_neto_ma@#,###,##0.00}';
setComboValue('fca_estatus_financiero','${fld:fca_estatus_financiero}','form1');
setComboValue('fca_estatus_proceso','${fld:fca_estatus_proceso}','form1');
document.form1.id.value='${fld:smn_factura_cabecera_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

