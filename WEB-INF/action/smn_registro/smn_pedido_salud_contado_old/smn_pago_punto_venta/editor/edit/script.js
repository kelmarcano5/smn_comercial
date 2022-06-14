var fp = '${fld:smn_forma_pago_rf}';
$('#smn_forma_pago_rf').val(fp).change();

if ('${fld:smn_moneda_rf}' != '') {
	var moneda = '${fld:smn_moneda_rf}';
	$('#smn_moneda_rf').val(moneda).change();
	var tasa = '${fld:smn_tasa_rf}';
	$('#smn_tasa_rf').val(tasa).change();

	$('#coin').show();
	$('#tasa').show();
	$('#mo_pagar').show();
	$('#mo_pago').show();
	$('#mo_devo').show();
	$('#monto_pagar').show();
	$('#monto_pago').show();
	$('#monto_vuelto').show();

}else{
	$('#coin').hide();
	$('#tasa').hide();
	$('#mo_pagar').hide();
	$('#mo_pago').hide();
	$('#mo_devo').hide();
	$('#monto_pagar').show();
	$('#monto_pago').show();
	$('#monto_vuelto').show();
}


var aux = '${fld:smn_auxiliar_rf}';
if (aux == '' || aux == 0)  {

}else{
	$('#smn_auxiliar_rf').val(aux).change();
}


var fp = '${fld:smn_forma_pago_rf}';
if (fp == '' || fp == 0)  {

}else{
	$('#smn_forma_pago_rf').val(fp).change();
}


var rfp = '${fld:smn_rel_punto_venta_pago_rf}';
if (rfp == '' || rfp == 0)  {

}else{
	$('#smn_rel_punto_venta_pago_rf').val(rfp).change();
}


var mon = '${fld:smn_moneda_rf}';
if (mon == '' || mon == 0)  {

}else{
	$('#smn_moneda_rf').val(mon).change();
}

var tasa = '${fld:smn_tasa_rf}';
if (tasa == '' || tasa == 0)  {

}else{
	$('#smn_tasa_rf').val(tasa).change();
}

var borig = '${fld:ppv_banco_origen}';
if (borig == '' || borig == 0)  {

}else{
	$('#ppv_banco_origen').val(borig).change();
}

var bdest = '${fld:ppv_banco_destino}';
if (bdest == '' || bdest == 0)  {

}else{
	$('#ppv_banco_destino').val(bdest).change();
}

var cuentb = '${fld:ppv_cuenta_bancaria}';
if (cuentb == '' || cuentb == 0)  {

}else{
	$('#ppv_cuenta_bancaria').val(cuentb).change();
}

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
document.form1.id.value='${fld:smn_pago_punto_venta_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

