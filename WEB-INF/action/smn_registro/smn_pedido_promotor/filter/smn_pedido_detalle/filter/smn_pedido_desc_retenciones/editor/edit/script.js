document.form1.smn_pedido_detalle_id.value='${fld:smn_pedido_detalle_id@#######}';
setComboValue('smn_descuentos_retenciones_rf','${fld:smn_descuentos_retenciones_rf}','form1');
document.form1.pim_monto_base_ml.value=formatear_monto('${fld:pim_monto_base_ml@#,###,###0.00}');
document.form1.pim_porcentaje_retencion.value='${fld:pim_porcentaje_retencion@#,###,###0.00}';
document.form1.pim_monto_descuento_retencion.value=formatear_monto('${fld:pim_monto_descuento_retencion@#,###,###0.00}');
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.pim_monto_descuento_ma.value=formatear_monto('${fld:pim_monto_descuento_ma@#,###,###}');
document.form1.id.value='${fld:smn_pedido_desc_retenciones_id@#,###,###}';

document.form1.pim_monto_base_ma.value=formatear_monto('${fld:pim_monto_base_ma@#,###,###0.00}');
 
 document.form1.pim_cantidad.value='${fld:pim_cantidad@#,###,###}';
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 if ('${fld:smn_moneda_rf}' != "") {
	$('#tasap').show();
	$('#montobma').show();
	$('#montodma').show();
}else{
	$('#tasap').hide();
	$('#montobma').hide();
	$('#montodma').hide();
}

function formatear_monto(monto){
		var base = monto;
		base1 = base.replace('.','');
		base = base1.replace('.','');
		base1 = base.replace(',','.');
		
		return base1;
}