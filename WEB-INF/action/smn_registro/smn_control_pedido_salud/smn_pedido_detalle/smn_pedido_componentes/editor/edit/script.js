document.form1.smn_pedido_detalle_id.value='${fld:smn_pedido_detalle_id@#######}';
document.form1.smn_mov_caja_detalle_id.value='${fld:smn_mov_caja_detalle_id@#######}';
setComboValue('smn_ingresos_rf','${fld:smn_ingresos_rf}','form1');
setComboValue('smn_grupo_componente_rf','${fld:smn_grupo_componente_rf}','form1');
setComboValue('pco_tipo_componente','${fld:pco_tipo_componente}','form1');
setComboValue('smn_componente_rf','${fld:smn_componente_rf}','form1');
setComboValue('pco_es_prestador_servicio','${fld:pco_es_prestador_servicio}','form1');
setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
setComboValue('pco_naturaleza','${fld:pco_naturaleza}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_servicio_rf','${fld:smn_servicio_rf}','form1');
document.form1.pco_cantidad.value='${fld:pco_cantidad@#,###,###}';
document.form1.smn_precio_ml_rf.value='${fld:smn_precio_ml_rf@######0.00}';
replaceDecimal(document.form1.smn_precio_ml_rf);
document.form1.pco_monto_ml.value='${fld:pco_monto_ml@######0.00}';
replaceDecimal(document.form1.pco_monto_ml);
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.smn_precio_ma.value='${fld:smn_precio_ma@######0.00}';
replaceDecimal(document.form1.smn_precio_ma);
document.form1.smn_monto_ma.value='${fld:smn_monto_ma@######0.00}';
replaceDecimal(document.form1.smn_monto_ma);
setComboValue('pco_imprime','${fld:pco_imprime}','form1');
setComboValue('smn_grupo_titulo_impresion_rf','${fld:smn_grupo_titulo_impresion_rf}','form1');
setComboValue('smn_tipo_gasto_rf','${fld:smn_tipo_gasto_rf}','form1');
setComboValue('smn_sub_tipo_gasto_rf','${fld:smn_sub_tipo_gasto_rf}','form1');
setComboValue('pco_estatus','${fld:pco_estatus}','form1');
document.form1.id.value='${fld:smn_pedido_componentes_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

$('#smn_prestador_servicio_rf').val('${fld:smn_prestador_servicio_rf}').change();

document.getElementById("smn_pedido_detalle_id").disabled=true;
document.getElementById("smn_mov_caja_detalle_id").disabled=true;
document.getElementById("smn_ingresos_rf").disabled=true;
document.getElementById("smn_grupo_componente_rf").disabled=true;
document.getElementById("pco_tipo_componente").disabled=true;
document.getElementById("smn_componente_rf").disabled=true;
document.getElementById("pco_es_prestador_servicio").disabled=true;
document.getElementById("smn_clase_auxiliar_rf").disabled=true;
document.getElementById("smn_auxiliar_rf").disabled=true;
document.getElementById("pco_naturaleza").disabled=true;
document.getElementById("smn_item_rf").disabled=true;
document.getElementById("smn_servicio_rf").disabled=true;
document.getElementById("pco_cantidad").disabled=true;
document.getElementById("smn_precio_ml_rf").disabled=true;
document.getElementById("pco_monto_ml").disabled=true;
document.getElementById("smn_moneda_rf").disabled=true;
document.getElementById("smn_tasa_rf").disabled=true;
document.getElementById("smn_precio_ma").disabled=true;
document.getElementById("smn_monto_ma").disabled=true;
document.getElementById("pco_imprime").disabled=true;
document.getElementById("smn_grupo_titulo_impresion_rf").disabled=true;
document.getElementById("smn_tipo_gasto_rf").disabled=true;
document.getElementById("smn_sub_tipo_gasto_rf").disabled=true;
document.getElementById("pco_estatus").disabled=true;



 

