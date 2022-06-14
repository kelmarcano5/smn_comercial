document.form1.smn_factura_detalle_id.value='${fld:smn_factura_detalle_id@#,###,###}';
setComboValue('smn_grupo_componente_rf','${fld:smn_grupo_componente_rf}','form1');
setComboValue('smn_componente_rf','${fld:smn_componente_rf}','form1');
document.form1.smn_componente_rf.value='${fld:smn_componente_rf@#,###,###}';
setComboValue('fco_es_prestador_servicio','${fld:fco_es_prestador_servicio}','form1');
setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_servicio_rf','${fld:smn_servicio_rf}','form1');
setComboValue('fco_forma_calculo','${fld:fco_forma_calculo}','form1');
document.form1.fco_cantidad.value='${fld:fco_cantidad@#,###,###}';
document.form1.smn_precio_ml_rf.value='${fld:smn_precio_ml_rf@#,###,##0.00}';
document.form1.fco_monto_ml.value='${fld:fco_monto_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.smn_precio_ma.value='${fld:smn_precio_ma@#,###,##0.00}';
document.form1.smn_monto_ma.value='${fld:smn_monto_ma@#,###,##0.00}';
setComboValue('fco_imprime','${fld:fco_imprime}','form1');
setComboValue('smn_grupo_titulo_impresion_rf','${fld:smn_grupo_titulo_impresion_rf}','form1');
setComboValue('smn_tipo_gasto_rf','${fld:smn_tipo_gasto_rf}','form1');
setComboValue('smn_sub_tipo_gasto_rf','${fld:smn_sub_tipo_gasto_rf}','form1');
setComboValue('fco_estatus','${fld:fco_estatus}','form1');
document.form1.id.value='${fld:smn_factura_componente_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 //alert('${fld:smn_moneda_rf}');
if('${fld:smn_moneda_rf}' == '0' || '${fld:smn_moneda_rf}' == ""){

	document.getElementById('tasa').style.display='none';
	document.getElementById('precioma').style.display='none';
	document.getElementById('montoma').style.display='none';

}else{

	document.getElementById('tasa').style.display='';
	document.getElementById('precioma').style.display='';
	document.getElementById('montoma').style.display='';


}

