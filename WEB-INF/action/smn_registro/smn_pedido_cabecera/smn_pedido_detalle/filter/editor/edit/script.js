document.form1.smn_pedido_cabecera_id.value='${fld:smn_pedido_cabecera_id@#,###,###}';
setComboValue('pde_naturaleza','${fld:pde_naturaleza}','form1');
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_activo_fijo_rf','${fld:smn_activo_fijo_rf}','form1');
document.form1.pde_cantidad_oferta.value='${fld:pde_cantidad_oferta@#,###,###}';
document.form1.pde_cantidad_pedido.value='${fld:pde_cantidad_pedido@#,###,###}';
document.form1.pde_cantidad_aprobada.value='${fld:pde_cantidad_aprobada@#,###,###}';
document.form1.pde_precio.value='${fld:pde_precio@#,###,##0.00}';
document.form1.pde_monto.value='${fld:pde_monto@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.pde_precio_moneda_alterna.value='${fld:pde_precio_moneda_alterna@#,###,##0.00}';
document.form1.pde_monto_moneda_alterna.value='${fld:pde_monto_moneda_alterna@#,###,##0.00}';
document.form1.pde_especificaciones_pedido.value='${fld:pde_especificaciones_pedido@js}';
document.form1.pde_fecha_requerido.value='${fld:pde_fecha_requerido@dd-MM-yyyy}';
document.form1.pde_observaciones.value='${fld:pde_observaciones@js}';
document.form1.id.value='${fld:smn_pedido_detalle_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

